package com.vinbet.mobile.sys;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

import javax.management.MBeanServer;
import javax.management.MBeanServerFactory;
import javax.management.ObjectName;
import javax.management.modelmbean.RequiredModelMBean;

import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.NutConfig;
import org.nutz.mvc.Setup;

import com.sun.jdmk.comm.AuthInfo;
import com.sun.jdmk.comm.HtmlAdaptorServer;
import com.vinbet.mobile.service.portal.SystemServcieImpl;
import com.vinbet.mobile.sys.h2.H2Mem;
import com.vinbet.mobile.sys.hkc.HKCCache;
import com.vinbet.mobile.sys.jms.ActivityAboutListener;
import com.vinbet.mobile.sys.jms.BaseDataListener;
import com.vinbet.mobile.sys.jms.JmsClusterMgr;
import com.vinbet.mobile.sys.jms.UserActivityAboutListener;
import com.vinbet.mobile.timer.hkc.HkcHeartbeatTask;
import com.vinbet.mobile.timer.hkc.RateRequestTask;
import com.vinbet.mobile.timer.portal.CollectionInfoClearTask;
import com.vinbet.mobile.timer.portal.UserLoginFailedTask;
import com.vinbet.mobile.timer.portal.UserSendCodeCountTask;
import com.vinbet.mobile.timer.qxc.QxcHeartbeatTask;
import com.vinbet.mobile.timer.qxc.QxcSysConfigTimer;
import com.vinbet.mobile.timer.sport.BasketballFullTask;
import com.vinbet.mobile.timer.sport.BasketballMatchRealTask;
import com.vinbet.mobile.timer.sport.BasketballRatioDataTask;
import com.vinbet.mobile.timer.sport.FootballFullTask;
import com.vinbet.mobile.timer.sport.FootballMatchRealTask;
import com.vinbet.mobile.timer.sport.FootballRatioDataTask;
import com.vinbet.mobile.timer.sport.SportHeartbeatTask;
import com.vinbet.mobile.timer.ssc.SscHeartbeatTask;
import com.vinbet.mobile.timer.ssc.SscSysConfigTimer;
import com.vinbet.mobile.util.Constants;
import com.vinbet.mobile.util.HttpClientUtil;
import com.vinbet.mobile.util.MailUtil;
import com.vinbet.mobile.util.OrderRecorder;
import com.vinbet.mobile.util.jmx.JmxMonitor;
import com.vinbet.mobile.util.jmx.RequiredModelMBeanUtil;

public class SystemMrg implements Setup {

	private Log log = Logs.getLog(SystemMrg.class);

	// 创建一个AdaptorServer，这个类将决定MBean的管理界面
	HtmlAdaptorServer adapter = null;
	private ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(20, new ThreadFactory() {
		AtomicInteger threadNumber = new AtomicInteger(1);

		@Override
		public Thread newThread(Runnable runnable) {
			return new Thread(runnable, "ScheduledThreadPool" + "-" + threadNumber.getAndIncrement());
		}
	});

	public void init(NutConfig cfg) {
		loadCfg(cfg);
		initIce(cfg);
		initMailService(cfg);
		initH2();
		initConstant(cfg);
		initDatas(cfg);
		initJms(cfg);
		initTask(cfg);
		//intJmxAgent(cfg);
		log.info("系统启动成功!");
	}

	public void destroy(NutConfig cfg) {
		// 销毁JMX
		stopJmxAgent();
		// 销毁定时任务
		cancelTask(cfg);
		// 关闭HttpClient连接管理器
		HttpClientUtil.closeHttpClient();
		// 注单记录器销毁
		OrderRecorder.destory();
		// 销毁快捷支付自动审核线程池
		cfg.getIoc().get(FastPayOrderAutoCheck.class).getScheduler().shutdown();
		log.debug("系统关闭!");
	}

	private void initJms(NutConfig cfg) {
		JmsClusterMgr baseDataJmsCluster = cfg.getIoc().get(JmsClusterMgr.class, "baseDataJmsClusterMgr");
		log.info("\n初始化 活动中心【活动相关、用户活动相关、管理中心基础数据】jms 消费者监听开始！\n");
		ActivityAboutListener activityAboutListener = cfg.getIoc().get(ActivityAboutListener.class);
		baseDataJmsCluster.registClusterTopicListener(Constants.ACTIVITY_ABOUT, activityAboutListener);
		log.info("\n平台前端监听活动中心JMS队列【" + Constants.ACTIVITY_ABOUT + "】成功！！");
		UserActivityAboutListener userActivityAboutListener = cfg.getIoc().get(UserActivityAboutListener.class);
		baseDataJmsCluster.registClusterTopicListener(Constants.USER_ACTIVITY_ABOUT, userActivityAboutListener);
		log.info("\n平台前端监听活动中心JMS队列【" + Constants.USER_ACTIVITY_ABOUT + "】成功！！");
		BaseDataListener baseDataListener = cfg.getIoc().get(BaseDataListener.class);
		baseDataJmsCluster.registClusterTopicListener(Constants.MC_TOPIC_BASEDATA, baseDataListener);
		log.info("\n平台前端监听管理中心JMS队列【" + Constants.MC_TOPIC_BASEDATA + "】成功！！");
	}

	/**
	 * 加载系统配置
	 * 
	 * @param cfg
	 */
	private void loadCfg(NutConfig cfg) {
		PropertiesLoader proxy = cfg.getIoc().get(PropertiesLoader.class);
		// 加载config文件夹下的所有property
		proxy.setPaths("com/vinbet/mobile/config");
	}

	/**
	 * 初始化常量数据
	 */
	private void initConstant(NutConfig cfg) {
		PropertiesLoader propertiesLoader = cfg.getIoc().get(PropertiesLoader.class);
		HKCCache.cacheCount = propertiesLoader.getInt("vinbet.hkc.cache.count");
		Constants.static_dynamic_enabled = propertiesLoader.getBoolean("vinbet.static.dynamic.enabled", false);
		Constants.static_url = propertiesLoader.getTrim("vinbet.static.url", "").replaceAll("\\\\", "");
		Constants.server_type = propertiesLoader.getInt("vinbet.mobile.serverType",0);
	}

	/**
	 * 初始化H2
	 */
	private void initH2() {
		H2Mem.init(100, 3);
	}

	/**
	 * 初始化的 ICE服务
	 */
	private void initIce(NutConfig cfg) {
		// Ice客户端-用户中心
		CEPUserCenterIceClient userCenterIceClient = cfg.getIoc().get(CEPUserCenterIceClient.class);
		userCenterIceClient.initCEPUserCenterClient();
		// Ice客户端-管理中心
		CEPMgrCenterClient cepMgrCenterClient = cfg.getIoc().get(CEPMgrCenterClient.class);
		cepMgrCenterClient.initCEPMgrCenterClient();
		// Ice客户端-活动中心
		CEPPromotionCenterClient cepPromotionCenterClient = cfg.getIoc().get(CEPPromotionCenterClient.class);
		cepPromotionCenterClient.initCEPPromotionCenterClient();

	}

	/**
	 * 初始化的邮件发送服务
	 */
	private void initMailService(NutConfig cfg) {
		// 邮件发送线程
		MailUtil mailUtil = cfg.getIoc().get(MailUtil.class);
		mailUtil.init();
	}

	/**
	 * 初始化定时任务
	 * 
	 * @param cfg
	 */
	private void initTask(NutConfig cfg) {
		// 平台相关
//		UserLoginFailedTask userLoginFailedTask = cfg.getIoc().get(UserLoginFailedTask.class);
//		scheduler.scheduleAtFixedRate(userLoginFailedTask, 60, 60, TimeUnit.SECONDS);
//
//		long oneDay = 24 * 60 * 60 * 1000;
//		long initDelay = getTimeMillis("00:00:00") - System.currentTimeMillis();
//		initDelay = initDelay > 0 ? initDelay : oneDay + initDelay;
//		UserSendCodeCountTask userSendCodeCountTask = cfg.getIoc().get(UserSendCodeCountTask.class);
//		scheduler.scheduleAtFixedRate(userSendCodeCountTask, initDelay, oneDay, TimeUnit.MILLISECONDS);
//
//		CollectionInfoClearTask collectionInfoClearTask = cfg.getIoc().get(CollectionInfoClearTask.class);
//		scheduler.scheduleAtFixedRate(collectionInfoClearTask, 5, 30, TimeUnit.MINUTES);
//
//		// 时时彩
		SscSysConfigTimer sscSysConfigTask = cfg.getIoc().get(SscSysConfigTimer.class);
		//scheduler.scheduleAtFixedRate(sscSysConfigTask, 5, 30, TimeUnit.SECONDS);
		SscHeartbeatTask sscHeartbeatTask = cfg.getIoc().get(SscHeartbeatTask.class);
		//scheduler.scheduleAtFixedRate(sscHeartbeatTask, 60, 1, TimeUnit.SECONDS);
//
//		// 香港彩
		RateRequestTask rateRequestTask = cfg.getIoc().get(RateRequestTask.class);
		//scheduler.scheduleWithFixedDelay(rateRequestTask, 5, 5, TimeUnit.SECONDS);
		HkcHeartbeatTask hkcHeartbeatTask = cfg.getIoc().get(HkcHeartbeatTask.class);
		//scheduler.scheduleAtFixedRate(hkcHeartbeatTask, 60, 1, TimeUnit.SECONDS);
//
//		// 七星彩
		QxcSysConfigTimer qxcSysConfigTask = cfg.getIoc().get(QxcSysConfigTimer.class);
		//scheduler.scheduleAtFixedRate(qxcSysConfigTask, 5, 3000, TimeUnit.SECONDS);
		QxcHeartbeatTask qxcHeartbeatTask = cfg.getIoc().get(QxcHeartbeatTask.class);
		//scheduler.scheduleAtFixedRate(qxcHeartbeatTask, 60, 1, TimeUnit.SECONDS);
//
//		// 体育投注 - 足球
		FootballFullTask footballFullTask = cfg.getIoc().get(FootballFullTask.class);
		scheduler.scheduleAtFixedRate(footballFullTask, 5, 2, TimeUnit.SECONDS);
		FootballMatchRealTask footballMatchRealTask = cfg.getIoc().get(FootballMatchRealTask.class);
		scheduler.scheduleAtFixedRate(footballMatchRealTask, 5, 2, TimeUnit.SECONDS);
		FootballRatioDataTask footballRatioDataTask = cfg.getIoc().get(FootballRatioDataTask.class);
		scheduler.scheduleAtFixedRate(footballRatioDataTask, 5, 2, TimeUnit.SECONDS);
		// 体育投注 - 篮球
		BasketballFullTask basketballFullTask = cfg.getIoc().get(BasketballFullTask.class);
		//scheduler.scheduleAtFixedRate(basketballFullTask, 5, 2, TimeUnit.SECONDS);
		BasketballMatchRealTask basketballMatchRealTask = cfg.getIoc().get(BasketballMatchRealTask.class);
		//scheduler.scheduleAtFixedRate(basketballMatchRealTask, 5, 2, TimeUnit.SECONDS);
		BasketballRatioDataTask basketballRatioDataTask = cfg.getIoc().get(BasketballRatioDataTask.class);
		//scheduler.scheduleAtFixedRate(basketballRatioDataTask, 5, 2, TimeUnit.SECONDS);
		// 体育心跳
		SportHeartbeatTask sportHeartbeatTask = cfg.getIoc().get(SportHeartbeatTask.class);
		//scheduler.scheduleAtFixedRate(sportHeartbeatTask, 60, 1, TimeUnit.SECONDS);

	}

	/**
	 * 获取指定时间对应的毫秒数
	 * 
	 * @param time
	 *            "HH:mm:ss"
	 * @return
	 */
	private static long getTimeMillis(String time) {
		try {
			DateFormat dateFormat = new SimpleDateFormat("yy-MM-dd HH:mm:ss");
			DateFormat dayFormat = new SimpleDateFormat("yy-MM-dd");
			Date curDate = dateFormat.parse(dayFormat.format(new Date()) + " " + time);
			return curDate.getTime();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return 0;
	}

	/**
	 * 销毁定时任务
	 */
	private void cancelTask(NutConfig cfg) {
		scheduler.shutdownNow();
	}

	/**
	 * 初始化JMX配置
	 */
	private void intJmxAgent(NutConfig cfg) {
		PropertiesLoader proxy = cfg.getIoc().get(PropertiesLoader.class);
		if (proxy.getTrim("jmx.agent.enable", "N").equalsIgnoreCase("Y")) {
			try {
				// 创建了一个MBeanServer，用来做MBean的容器
				MBeanServer server = MBeanServerFactory.createMBeanServer("vinbet");
				RequiredModelMBean requiredModelMBean = RequiredModelMBeanUtil.createModelBean(cfg.getIoc().get(JmxMonitor.class));
				server.registerMBean(requiredModelMBean, new ObjectName("vinbet:name=mobile"));// 域名:name=MBean名称
				adapter = new HtmlAdaptorServer();
				server.registerMBean(adapter, new ObjectName("vinbet:name=htmladapter"));
				AuthInfo login = new AuthInfo();
				login.setLogin(proxy.getTrim("jmx.authinfo.username", "root"));
				login.setPassword(proxy.getTrim("jmx.authinfo.password", "root"));
				adapter.addUserAuthenticationInfo(login);
				adapter.setPort(Integer.parseInt(proxy.getTrim("jmx.htmladaptor.port", "8888")));
				adapter.start();
			} catch (Exception e) {
				log.error("JMX Agent start failed", e);
			}
			log.info("Jmx Agent is running");
		}
	}

	/**
	 * 销毁JMX
	 */
	private void stopJmxAgent() {
		if (adapter != null) {
			adapter.stop();
		}
	}

	/**
	 * 将常用的数据加载到内存中。
	 */
	private void initDatas(NutConfig cfg) {
		SystemServcieImpl systemServcieImpl = cfg.getIoc().get(SystemServcieImpl.class);
		systemServcieImpl.initCacheData();
	}
}
