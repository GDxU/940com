package com.vinbet.mobile.service.portal;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;

import com.vinbet.mobile.entity.portal.Activity;
import com.vinbet.mobile.entity.portal.UserActivityInfo;
import com.vinbet.mobile.sys.AppCache;
import com.vinbet.mobile.sys.CEPUserCenterIceClient;
import com.vinbet.mobile.sys.PropertiesLoader;

/**
 * 系统初始化数据服务层
 * 
 */
@IocBean
public class SystemServcieImpl {
	@Inject
	private PropertiesLoader propertiesLoader;
	private Log log = Logs.getLog(SystemServcieImpl.class);
	@Inject
	private CEPUserCenterIceClient cEPUserCenterIceClient;
	@Inject
	private DictServiceImpl dictServiceImpl;
	@Inject
	private ActivityServiceImpl activityServiceImpl;

	public void getSessionId() {
		try {
			String appid = propertiesLoader.getTrim("vinbet.sys.appid");
			String pwd = propertiesLoader.getTrim("vinbet.sys.pwd");
			Document outDoc = DocumentHelper.createDocument();// 需要输出的xml节点
			Element rootElm = outDoc.addElement("req");
			Element recElm = rootElm.addElement("rec");
			recElm.addAttribute("appid", appid);// 应用id
			recElm.addAttribute("pwd", pwd);// 口令码
			recElm.addAttribute("st", "1");// 状态
			String xml = outDoc.asXML();
			String response = cEPUserCenterIceClient.configManagerZreocSrvIPrx("appAuthLogin", xml);
			if (response != null && !response.equals("")) {
				Document doc = DocumentHelper.parseText(response);
				Element root = doc.getRootElement();
				String resultCode = root.attributeValue("st");
				if (resultCode.equals(com.vinbet.mobile.util.Constants.SUCCESS)) {
					log.error("调用用户中心[appAuthLogin]请求报文>> " + xml + " 接口返回数据<< " + response);
					List<Element> childNodes = root.elements();
					if (childNodes.size() > 0) {
						Element reqElm = (Element) childNodes.get(0);
						String sessionid = reqElm.getText();
						AppCache.SafeSessionId = sessionid + ";";
					}
				}
			} else {
				log.error("调用用户中心[appAuthLogin]请求报文：" + xml + "接口返回数据:" + response);
			}
		} catch (DocumentException e) {
			log.error("获取安全访问sessionid异常！" + e);
		}
	}

	public boolean initCacheData() {
		boolean flag = false;
		try {
			// 获取安全访问sessionID放到内存中
			this.getSessionId();
			AppCache.initDict(dictServiceImpl.findAllDictList());// 将所有数据字典加载到内存中。
			AppCache.initInternationInfo(dictServiceImpl.findAllInternation());// 初始化国际化信息到内存中。
			AppCache.initSystemParm(dictServiceImpl.findAllSystemParmList());// 初始化系统参数到内存中。
			AppCache.initWalletCategoryMap(dictServiceImpl.findAllWalletCategoryList());// 初始化钱包类别数据
			AppCache.initNavigationAppList(dictServiceImpl.findAllNavigationAppList());// 初始化导航菜单
			AppCache.initEasyPayment(dictServiceImpl.findAllEasyPaymentList());// 获取系统易支付开户的各个支付宝帐号和银行帐号，构造为内存对象，供前端用户充值的时候系统随机分配给客户存款。
			AppCache.initPaymentPlat(dictServiceImpl.findAllPaymentPlatList());//获取支付平台数据
			// 初始化活动中心数据
			initActData();
			// 初始化被锁定的用户信息
			AppCache.readFreezeFile();
			flag = true;
		} catch (Exception e) {
			log.error("获取代理域名失败.", e);
		} finally {
			// loadAgentUrlLock.unlock();
		}
		return flag;
	}

	private void initActData() {
		// 获取活动中心初始化信息到内存中。
		List<Activity> activityList = activityServiceImpl.findActivityList();
		AppCache.initActivityList(activityList);// 初始化现有活动信息到内存中。
		List<UserActivityInfo> userActListTemp = null;
		List<UserActivityInfo> userActList = null;
		Map<String, List<UserActivityInfo>> userMapTemp = null;
		Map<String, Object> map = null;
		log.info("=======================================================================================================");
		log.info("初始化加载活动数据到内存，根据活动参与用户多少，可能需要花费一段时间，在本应用启动完毕之前不能同时启动其他前端集群节点（包括手机端），请耐心等待...");
		log.info("=======================================================================================================");
		if (activityList != null) {
			for (Activity activity : activityList) {
				log.info("开始从活动中心拉取游戏活动" + activity.getCurrActivityNo() + "(钱包" + activity.getWalletCategory() + "，活动标示" + activity.getActivityMark() + " ，扩展码" + activity.getExtMark() + ")的参与用户信息...");
				userMapTemp = AppCache.getGameMap().get(activity.getWalletCategory());
				if (userMapTemp == null) {
					userMapTemp = new ConcurrentHashMap<String, List<UserActivityInfo>>();
					AppCache.getGameMap().put(activity.getWalletCategory(), userMapTemp);
				}
				userActListTemp = userMapTemp.get(activity.getActivityMark() + "_" + activity.getExtMark());
				if (userActListTemp == null) {
					userActListTemp = new CopyOnWriteArrayList<UserActivityInfo>();
					userMapTemp.put(activity.getActivityMark() + "_" + activity.getExtMark(), userActListTemp);
				}

				map = activityServiceImpl.findGameListByWallet(activity, "1");
				userActList = (List<UserActivityInfo>) map.get("list");
				while (userActList != null && userActList.size() > 0) {
					log.info("添加游戏活动" + activity.getCurrActivityNo() + "的参与用户信息到内存,该批用户数为" + userActList.size());
					AppCache.addGameMap(userActListTemp, userActList); // 初始化现有游戏活动的参与用户信息到内存中。
					if (map.get("end") != null && "1".equals(map.get("end"))) {
						break;
					}
					map = activityServiceImpl.findGameListByWallet(activity, null);
					userActList = (List<UserActivityInfo>) map.get("list");
				}
				log.info("添加游戏活动" + activity.getCurrActivityNo() + "的参与用户信息到内存结束，继续进行其他的可能的游戏数据拉取");

			}
		}
		log.info("-------------------------------------------------------------------------------------------------------");
		log.info("初始化加载活动数据到内存结束！");
		log.info("-------------------------------------------------------------------------------------------------------");
	}
}
