package com.vinbet.mobile.sys;

import com.cep.usercenter.zreocsrvi.BaseManagerZreocSrvIPrx;
import com.cep.usercenter.zreocsrvi.BaseManagerZreocSrvIPrxHelper;
import com.cep.usercenter.zreocsrvi.ConfigManagerZreocSrvIPrx;
import com.cep.usercenter.zreocsrvi.ConfigManagerZreocSrvIPrxHelper;
import com.cep.usercenter.zreocsrvi.MoneyManagerZreocSrvIPrx;
import com.cep.usercenter.zreocsrvi.MoneyManagerZreocSrvIPrxHelper;
import com.cep.usercenter.zreocsrvi.OtherTypeZreocSrvIPrx;
import com.cep.usercenter.zreocsrvi.OtherTypeZreocSrvIPrxHelper;
import com.esotericsoftware.reflectasm.MethodAccess;
import com.vinbet.mobile.service.portal.SystemServcieImpl;
import com.vinbet.mobile.util.Constants;
import com.vinbet.mobile.util.StringUtil;
import com.vinbet.mobile.zeroc.ConnectionParam;
import com.vinbet.mobile.zeroc.IceClient;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 连接用户中心ICE服务配置管理类。
 * 
 * <pre>
 * <功能详细描述>
 * </pre>
 * 
 * @author 晁佳鹏
 * @version [Ver 1.0]
 * @since 2015-3-10 下午3:45:26
 */
@IocBean
public class CEPUserCenterIceClient {
	// private static Logger logger = Logger.getLogger(CEPUserCenterIceClient.class.getName());
	private Log logger = Logs.getLog(CEPUserCenterIceClient.class);
	private ConnectionParam connParam;
	@Inject
	private PropertiesLoader propertiesLoader;
	private IceClient iceBaseManageClient;
	private IceClient iceMoneyManageClient;
	private IceClient iceConfigManageClient;
	private IceClient iceOtherTypeClient;
	private BaseManagerZreocSrvIPrx baseManagerZreocSrvIPrx;
	private MoneyManagerZreocSrvIPrx moneyManagerZreocSrvIPrx;
	private ConfigManagerZreocSrvIPrx configManagerZreocSrvIPrx;
	private OtherTypeZreocSrvIPrx otherTypeZreocSrvIPrx;
	private MethodAccess baseManagerMethodAccess;
	private MethodAccess moneyManagerMethodAccess;
	private MethodAccess configManagerMethodAccess;
	private MethodAccess otherTypeMethodAccess;
	@Inject
	private SystemServcieImpl systemServcieImpl;

	public void initCEPUserCenterClient() {
		this.initCEPUserCenterBaseClient();
		this.initCEPUserCenterMoneyClient();
		this.initCEPUserCenterConfigClient();
		this.initCEPUserCenterOtherTypeClient();
		this.baseManagerMethodAccess = MethodAccess.get(baseManagerZreocSrvIPrx.getClass());
		this.moneyManagerMethodAccess = MethodAccess.get(moneyManagerZreocSrvIPrx.getClass());
		this.configManagerMethodAccess = MethodAccess.get(configManagerZreocSrvIPrx.getClass());
		this.otherTypeMethodAccess = MethodAccess.get(otherTypeZreocSrvIPrx.getClass());
	}

	/*
	 * 初始化【用户中心(baseManage)ice
	 */
	public void initCEPUserCenterBaseClient() {
		int tryCount = 888;
		String cepUserCenterBaseIceIP = propertiesLoader.getTrim("cepusercenterIce.ip");// 从资源文件中获取用户中心ice服务IP地址。
		String cepUserCenterBaseIcePort = propertiesLoader.getTrim("cepusercenterIce.baseManage.tcpPort");// 从资源文件中获取用户中心ice服务端口地址。
		String cepUserCenterBaseIceObjkey = propertiesLoader.getTrim("cepusercenterIce.baseManage.objKey");// 和用户中心约定的秘钥
		logger.info("\n开始初始化【用户中心(baseManage)ice】ip:" + cepUserCenterBaseIceIP + ":" + cepUserCenterBaseIcePort + "的ICE客户端。。。。。。");
		this.connParam = new ConnectionParam();
		this.connParam.setClientCfgClassPath("com/vinbet/mobile/config/ice/IceCfg_UserCenter.client");
		// this.connParam.setConnType(ConnectionParam.SSL);//ssl方式访问。
		this.connParam.setConnType(ConnectionParam.TCP);// tcp方式访问。
		this.connParam.setPort(cepUserCenterBaseIcePort);// tcp的端口
		this.connParam.setTimeOut(Integer.parseInt(propertiesLoader.getTrim("cepusercenterIce.timeOut")));// 超时时间。
		Map<String, Class> prxHelperMap = new ConcurrentHashMap<String, Class>();
		prxHelperMap.put(cepUserCenterBaseIceObjkey, BaseManagerZreocSrvIPrxHelper.class);
		while (true) {
			try {
				tryCount--;
				this.connParam.setIp(cepUserCenterBaseIceIP);
				this.iceBaseManageClient = new IceClient();
				this.iceBaseManageClient.initClientPrxs(this.connParam, prxHelperMap);
				this.baseManagerZreocSrvIPrx = (BaseManagerZreocSrvIPrx) this.iceBaseManageClient.getPrxByKey(cepUserCenterBaseIceObjkey);
				this.iceBaseManageClient.setAvailable(true);
				logger.info("成功初始化【用户中心(baseManage)ice】ip:" + cepUserCenterBaseIceIP + ":" + cepUserCenterBaseIcePort + "的ICE客户端!");
				break;
			} catch (Exception e) {
				logger.error("客户端ICE连接服务端【用户中心(baseManage)ice】 " + cepUserCenterBaseIceIP + ":" + cepUserCenterBaseIcePort + " 出现异常 " + e.toString());
				if (tryCount <= 0) {
					logger.info("初始化【用户中心(baseManage)ice】ip:" + cepUserCenterBaseIceIP + ":" + cepUserCenterBaseIcePort + "的ICE客户端失败，系统将在下次调用前再次初始化!");
					break;
				} else {
					logger.error("重连失败，请检测网络和用户中心(baseManage)" + cepUserCenterBaseIceIP + ":" + cepUserCenterBaseIcePort + " 的ICE服务是否正常，继续重试...");
				}
				try {
					Thread.sleep(1000L * 2);
				} catch (Exception e2) {
				}
			}
		}
	}

	/*
	 * 初始化【用户中心(moneyManage)ice
	 */
	public void initCEPUserCenterMoneyClient() {
		int tryCount = 888;
		String cepUserCenterMoneyIceIP = propertiesLoader.getTrim("cepusercenterIce.ip");// 从资源文件中获取用户中心ice服务IP地址。
		String cepUserCenterMoneyIcePort = propertiesLoader.getTrim("cepusercenterIce.MoneyManage.tcpPort");// 从资源文件中获取用户中心ice服务端口地址。
		String cepUserCenterMoneyIceObjkey = propertiesLoader.getTrim("cepusercenterIce.MoneyManage.objKey");// 和用户中心约定的秘钥
		logger.info("\n开始初始化【用户中心(moneyManage)ice】ip:" + cepUserCenterMoneyIceIP + ":" + cepUserCenterMoneyIcePort + "的ICE客户端。。。。。。");
		this.connParam = new ConnectionParam();
		this.connParam.setClientCfgClassPath("com/vinbet/mobile/config/ice/IceCfg_UserCenter.client");
		// this.connParam.setConnType(ConnectionParam.SSL);//ssl方式访问。
		this.connParam.setConnType(ConnectionParam.TCP);// tcp方式访问。
		this.connParam.setPort(cepUserCenterMoneyIcePort);// tcp的端口
		this.connParam.setTimeOut(Integer.parseInt(propertiesLoader.getTrim("cepusercenterIce.timeOut")));// 超时时间。
		Map<String, Class> prxHelperMap = new ConcurrentHashMap<String, Class>();
		prxHelperMap.put(cepUserCenterMoneyIceObjkey, MoneyManagerZreocSrvIPrxHelper.class);
		while (true) {
			try {
				tryCount--;
				this.connParam.setIp(cepUserCenterMoneyIceIP);
				this.iceMoneyManageClient = new IceClient();
				this.iceMoneyManageClient.initClientPrxs(this.connParam, prxHelperMap);
				this.moneyManagerZreocSrvIPrx = (MoneyManagerZreocSrvIPrx) this.iceMoneyManageClient.getPrxByKey(cepUserCenterMoneyIceObjkey);
				this.iceMoneyManageClient.setAvailable(true);
				logger.info("成功初始化【用户中心(moneyManage)ice】ip:" + cepUserCenterMoneyIceIP + ":" + cepUserCenterMoneyIcePort + "的ICE客户端!");
				break;
			} catch (Exception e) {
				logger.error("客户端ICE连接服务端【用户中心(moneyManage)ice】 " + cepUserCenterMoneyIceIP + ":" + cepUserCenterMoneyIcePort + " 出现异常 " + e.toString());
				if (tryCount <= 0) {
					logger.info("初始化【用户中心(moneyManage)ice】ip:" + cepUserCenterMoneyIceIP + ":" + cepUserCenterMoneyIcePort + "的ICE客户端失败，系统将在下次调用前再次初始化!");
					break;
				} else {
					logger.error("重连失败，请检测网络和用户中心(moneyManage)" + cepUserCenterMoneyIceIP + ":" + cepUserCenterMoneyIcePort + " 的ICE服务是否正常，继续重试...");
				}
				try {
					Thread.sleep(1000L * 2);
				} catch (Exception e2) {
				}
			}
		}
	}

	/*
	 * 初始化【用户中心(configManage)ice
	 */
	public void initCEPUserCenterConfigClient() {
		int tryCount = 888;
		String cepUserCenterConfigIceIP = propertiesLoader.getTrim("cepusercenterIce.ip");// 从资源文件中获取用户中心ice服务IP地址。
		String cepUserCenterConfigIcePort = propertiesLoader.getTrim("cepusercenterIce.ConfigManage.tcpPort");// 从资源文件中获取用户中心ice服务端口地址。
		String cepUserCenterConfigIceObjkey = propertiesLoader.getTrim("cepusercenterIce.ConfigManage.objKey");// 和用户中心约定的秘钥
		logger.info("\n开始初始化【用户中心(ConfigManage)ice】ip:" + cepUserCenterConfigIceIP + ":" + cepUserCenterConfigIcePort + "的ICE客户端。。。。。。");
		this.connParam = new ConnectionParam();
		this.connParam.setClientCfgClassPath("com/vinbet/mobile/config/ice/IceCfg_UserCenter.client");
		// this.connParam.setConnType(ConnectionParam.SSL);//ssl方式访问。
		this.connParam.setConnType(ConnectionParam.TCP);// tcp方式访问。
		this.connParam.setPort(cepUserCenterConfigIcePort);// tcp的端口
		this.connParam.setTimeOut(Integer.parseInt(propertiesLoader.getTrim("cepusercenterIce.timeOut")));// 超时时间。
		Map<String, Class> prxHelperMap = new ConcurrentHashMap<String, Class>();
		prxHelperMap.put(cepUserCenterConfigIceObjkey, ConfigManagerZreocSrvIPrxHelper.class);
		while (true) {
			try {
				tryCount--;
				this.connParam.setIp(cepUserCenterConfigIceIP);
				this.iceConfigManageClient = new IceClient();
				this.iceConfigManageClient.initClientPrxs(this.connParam, prxHelperMap);
				this.configManagerZreocSrvIPrx = (ConfigManagerZreocSrvIPrx) this.iceConfigManageClient.getPrxByKey(cepUserCenterConfigIceObjkey);
				this.iceConfigManageClient.setAvailable(true);
				logger.info("成功初始化【用户中心(ConfigManage)ice】ip:" + cepUserCenterConfigIceIP + ":" + cepUserCenterConfigIcePort + "的ICE客户端!");
				break;
			} catch (Exception e) {
				logger.error("客户端ICE连接服务端【用户中心(ConfigManage)ice】 " + cepUserCenterConfigIceIP + ":" + cepUserCenterConfigIcePort + " 出现异常 " + e.toString());
				if (tryCount <= 0) {
					logger.info("初始化【用户中心(ConfigManage)ice】ip:" + cepUserCenterConfigIceIP + ":" + cepUserCenterConfigIcePort + "的ICE客户端失败，系统将在下次调用前再次初始化!");
					break;
				} else {
					logger.error("重连失败，请检测网络和用户中心(ConfigManage)" + cepUserCenterConfigIceIP + ":" + cepUserCenterConfigIcePort + " 的ICE服务是否正常，继续重试...");
				}
				try {
					Thread.sleep(1000L * 2);
				} catch (Exception e2) {
				}
			}
		}
	}

	/*
	 * 初始化【用户中心(otherType)ice
	 */
	public void initCEPUserCenterOtherTypeClient() {
		int tryCount = 888;
		String cepUserCenterOtherTypeIceIP = propertiesLoader.getTrim("cepusercenterIce.ip");// 从资源文件中获取用户中心ice服务IP地址。
		String cepUserCenterOtherTypeIcePort = propertiesLoader.getTrim("cepusercenterIce.OtherTypeManage.tcpPort");// 从资源文件中获取用户中心ice服务端口地址。
		String cepUserCenterOtherTypeIceObjkey = propertiesLoader.getTrim("cepusercenterIce.OtherTypeManage.objKey");// 和用户中心约定的秘钥
		logger.info("\n开始初始化【用户中心(OtherTypeManage)ice】ip:" + cepUserCenterOtherTypeIceIP + ":" + cepUserCenterOtherTypeIcePort + "的ICE客户端。。。。。。");
		this.connParam = new ConnectionParam();
		this.connParam.setClientCfgClassPath("com/vinbet/mobile/config/ice/IceCfg_UserCenter.client");
		// this.connParam.setConnType(ConnectionParam.SSL);//ssl方式访问。
		this.connParam.setConnType(ConnectionParam.TCP);// tcp方式访问。
		this.connParam.setPort(cepUserCenterOtherTypeIcePort);// tcp的端口
		this.connParam.setTimeOut(Integer.parseInt(propertiesLoader.getTrim("cepusercenterIce.timeOut")));// 超时时间。
		Map<String, Class> prxHelperMap = new ConcurrentHashMap<String, Class>();
		prxHelperMap.put(cepUserCenterOtherTypeIceObjkey, OtherTypeZreocSrvIPrxHelper.class);
		while (true) {
			try {
				tryCount--;
				this.connParam.setIp(cepUserCenterOtherTypeIceIP);
				this.iceOtherTypeClient = new IceClient();
				this.iceOtherTypeClient.initClientPrxs(this.connParam, prxHelperMap);
				this.otherTypeZreocSrvIPrx = (OtherTypeZreocSrvIPrx) this.iceOtherTypeClient.getPrxByKey(cepUserCenterOtherTypeIceObjkey);
				this.iceOtherTypeClient.setAvailable(true);
				logger.info("成功初始化【用户中心(OtherTypeManage)ice】ip:" + cepUserCenterOtherTypeIceIP + ":" + cepUserCenterOtherTypeIcePort + "的ICE客户端!");
				break;
			} catch (Exception e) {
				logger.error("客户端ICE连接服务端【用户中心(OtherTypeManage)ice】 " + cepUserCenterOtherTypeIceIP + ":" + cepUserCenterOtherTypeIcePort + " 出现异常 " + e.toString());
				if (tryCount <= 0) {
					logger.info("初始化【用户中心(OtherTypeManage)ice】ip:" + cepUserCenterOtherTypeIceIP + ":" + cepUserCenterOtherTypeIcePort + "的ICE客户端失败，系统将在下次调用前再次初始化!");
					break;
				} else {
					logger.error("重连失败，请检测网络和用户中心(OtherTypeManage)" + cepUserCenterOtherTypeIceIP + ":" + cepUserCenterOtherTypeIcePort + " 的ICE服务是否正常，继续重试...");
				}
				try {
					Thread.sleep(1000L * 2);
				} catch (Exception e2) {
				}
			}
		}
	}

	/**
	 * 销毁用户中心ICE客户端
	 */
	public void destroyCEPUserCenterClient() {
		this.iceBaseManageClient.destoryProxy();
		logger.info("\n平台前端销毁用户中心(baseManage)ICE客户端成功！");
		this.iceMoneyManageClient.destoryProxy();
		logger.info("\n平台前端销毁用户中心(moneyManage)ICE客户端成功！");
		this.iceConfigManageClient.destoryProxy();
		logger.info("\n平台前端销毁用户中心(configManage)ICE客户端成功！");
		this.iceOtherTypeClient.destoryProxy();
		logger.info("\n平台前端销毁用户中心(OtherType)ICE客户端成功！");
	}

	/**
	 * 调用用户中心用户非财务信息接口
	 * 
	 * @param methodName
	 *            方法名字：调用指定的方法
	 * @since 2015-3-10 下午16:13:57
	 */
	public String baseManagerZreocSrvIPrx(String methodName, String reqXml) {
		
		if (logger.isInfoEnabled()) {
			String req = replaceSensitiveXmlInfo(reqXml);
			logger.info("调用用户中心接口[" + methodName + "]，请求报文 >> " + req);
		}
		
		String respXml = "";
		// Method method =null;
		try {
//			if(this.iceBaseManageClient.isAvailable()){
				reqXml = AppCache.SafeSessionId + reqXml;
				respXml = (String) baseManagerMethodAccess.invoke(baseManagerZreocSrvIPrx, methodName, reqXml, null);// 这里使用第三方的ReflectASM反射，性能测试结果得出性能比JDK的传统反射高出15倍左右。
				// 如果sessionid失效，则更新sessionid后重新调用
				String resultCode = this.pauseXml(respXml);
				if (resultCode.equals(Constants.SESSIONID_LOST_EFFICACY)) {
					systemServcieImpl.getSessionId();
					if (reqXml.split(";").length > 1) {
						respXml = this.baseManagerZreocSrvIPrx(methodName, reqXml.split(";")[1]);
					}
				}
//			}
		} catch (Exception e) {
			if(logger.isErrorEnabled()){
				String req = replaceSensitiveXmlInfo(reqXml);
				logger.error("调用用户中心接口[" + methodName + "]异常"+e.toString()+"报文为"+req);
			}
			
//			if (e instanceof Ice.SocketException) {
//				synchronized (this.iceBaseManageClient) {
//					logger.error("平台前端ICE连接用户中心(baseManage)中断，正在试图重连...");
//					iceBaseManageClient.setAvailable(false);
//					this.initCEPUserCenterBaseClient();
//				}
//				// 重新调用服务
//				if (iceBaseManageClient.isAvailable()) {
//					// respXml= (String)method.invoke(baseManagerZreocSrvIPrx,reqXml);
//					respXml = (String) baseManagerMethodAccess.invoke(baseManagerZreocSrvIPrx, methodName, reqXml, null);
//					String resultCode = this.pauseXml(respXml);
//					if (resultCode.equals(Constants.SESSIONID_LOST_EFFICACY)) {
//						systemServcieImpl.getSessionId();
//						if (reqXml.split(";").length > 1) {
//							this.baseManagerZreocSrvIPrx(methodName, reqXml.split(";")[1]);
//						} else {
//							this.baseManagerZreocSrvIPrx(methodName, reqXml);
//						}
//					}
//				} else {
//					// 记录错误报文日志，不再处理此报文
//					logger.error("平台前端ICE连接用户中心(baseManage)中断，重试失败，放弃本次接口调用，本次要发送的报文为:" + reqXml, e);
//				}
//			} else if (e instanceof Ice.TimeoutException) {
//				logger.error("平台前端ICE连接用户中心(baseManage)操作超时，放弃本次接口调用，本次要发送的报文为:" + reqXml);
//			} else {
//				logger.error(e.getMessage(), e);
//			}
		}
		
		if (logger.isInfoEnabled()) {
			String resp = replaceSensitiveXmlInfo(respXml);
			logger.info("调用用户中心接口[" + methodName + "]，返回报文 << " + resp);
		}
		return respXml;
	}

	/**
	 * 调用用户中心用户财务信息接口
	 * 
	 * @param methodName
	 *            方法名字：调用指定的方法
	 * @since 2015-3-10 下午16:13:57
	 */
	public String moneyManagerZreocSrvIPrx(String methodName, String reqXml) {
		logger.info("调用用户中心接口[" + methodName + "]，请求报文 >> " + reqXml);
		String respXml = "";
		try {
//			if(this.iceMoneyManageClient.isAvailable()){
				// 这里使用第三方的ReflectASM反射，性能测试结果得出性能比JDK的传统反射高出15倍左右。
				reqXml = AppCache.SafeSessionId + reqXml;
				respXml = (String) moneyManagerMethodAccess.invoke(moneyManagerZreocSrvIPrx, methodName, reqXml, null);
				String resultCode = this.pauseXml(respXml);
				if (resultCode.equals(Constants.SESSIONID_LOST_EFFICACY)) {
					systemServcieImpl.getSessionId();
					if (reqXml.split(";").length > 1) {
						respXml = this.moneyManagerZreocSrvIPrx(methodName, reqXml.split(";")[1]);
					}
				}
//			}
		} catch (Exception e) {
			logger.error("调用用户中心接口[" + methodName + "]异常"+e.toString()+"报文为"+reqXml);
//			if (e instanceof Ice.SocketException) {
//				synchronized (this.iceMoneyManageClient) {
//					logger.error("平台前端ICE连接用户中心(moneyManage)中断，正在试图重连...");
//					iceMoneyManageClient.setAvailable(false);
//					this.initCEPUserCenterMoneyClient();
//				}
//				// 重新调用服务
//				if (iceMoneyManageClient.isAvailable()) {
//					respXml = (String) moneyManagerMethodAccess.invoke(moneyManagerZreocSrvIPrx, methodName, reqXml, null);
//					String resultCode = this.pauseXml(respXml);
//					if (resultCode.equals(Constants.SESSIONID_LOST_EFFICACY)) {
//						systemServcieImpl.getSessionId();
//						if (reqXml.split(";").length > 1) {
//							this.moneyManagerZreocSrvIPrx(methodName, reqXml.split(";")[1]);
//						} else {
//							this.moneyManagerZreocSrvIPrx(methodName, reqXml);
//						}
//					}
//				} else {
//					// 记录错误报文日志，不再处理此报文
//					logger.error("平台前端ICE连接用户中心(moneyManage)中断，重试失败，放弃本次接口调用，本次要发送的报文为:" + reqXml, e);
//				}
//			} else if (e instanceof Ice.TimeoutException) {
//				logger.error("平台前端ICE连接用户中心(moneyManage)操作超时，放弃本次接口调用，本次要发送的报文为:" + reqXml);
//			} else {
//				logger.error(e.getMessage(), e);
//			}
		}

		logger.info("调用用户中心接口[" + methodName + "]，返回报文 << " + respXml);
		return respXml;
	}

	/**
	 * 调用用户中心用户应用信息接口
	 * 
	 * @param methodName
	 *            方法名字：调用指定的方法
	 * @since 2015-4-10 下午16:13:57
	 */
	public String configManagerZreocSrvIPrx(String methodName, String reqXml) {
		logger.info("调用用户中心接口[" + methodName + "]，请求报文 >> " + reqXml);
		String respXml = "";
		try {
//			if(this.iceConfigManageClient.isAvailable()){
				// 这里使用第三方的ReflectASM反射，性能测试结果得出性能比JDK的传统反射高出15倍左右。
				respXml = (String) configManagerMethodAccess.invoke(configManagerZreocSrvIPrx, methodName, reqXml, null);
//			}
		} catch (Exception e) {
			logger.error("调用用户中心接口[" + methodName + "]异常"+e.toString()+"报文为"+reqXml);
//			if (e instanceof Ice.SocketException) {
//				synchronized (this.iceConfigManageClient) {
//					logger.error("平台前端ICE连接用户中心(ConfigManage)中断，正在试图重连...");
//					iceConfigManageClient.setAvailable(false);
//					this.initCEPUserCenterConfigClient();
//				}
//				// 重新调用服务
//				if (iceConfigManageClient.isAvailable()) {
//					respXml = (String) configManagerMethodAccess.invoke(configManagerZreocSrvIPrx, methodName, reqXml, null);
//				} else {
//					// 记录错误报文日志，不再处理此报文
//					logger.error("平台前端ICE连接用户中心(ConfigManage)中断，重试失败，放弃本次接口调用，本次要发送的报文为:" + reqXml, e);
//				}
//			} else if (e instanceof Ice.TimeoutException) {
//				logger.error("平台前端ICE连接用户中心(ConfigManage)操作超时，放弃本次接口调用，本次要发送的报文为:" + reqXml);
//			} else {
//				logger.error(e.getMessage(), e);
//			}
		}

		logger.info("调用用户中心接口[" + methodName + "]，返回报文 << " + respXml);
		return respXml;
	}

	/**
	 * 调用用户中心其他信息接口
	 * 
	 * @param methodName
	 *            方法名字：调用指定的方法
	 * @since 2015-5-10 下午16:13:57
	 */
	public String otherTypeZreocSrvIPrx(String methodName, String reqXml) {
		logger.info("调用用户中心接口[" + methodName + "]，请求报文 >> " + reqXml);
		String respXml = "";
		try {
//			if(this.iceOtherTypeClient.isAvailable()){
				// 这里使用第三方的ReflectASM反射，性能测试结果得出性能比JDK的传统反射高出15倍左右。
				reqXml = AppCache.SafeSessionId + reqXml;
				respXml = (String) otherTypeMethodAccess.invoke(otherTypeZreocSrvIPrx, methodName, reqXml, null);
				String resultCode = this.pauseXml(respXml);
				if (resultCode.equals(Constants.SESSIONID_LOST_EFFICACY)) {
					systemServcieImpl.getSessionId();
					if (reqXml.split(";").length > 1) {
						respXml = this.otherTypeZreocSrvIPrx(methodName, reqXml.split(";")[1]);
					} else {
						this.otherTypeZreocSrvIPrx(methodName, reqXml);
					}
				}
//			}
		} catch (Exception e) {
			logger.error("调用用户中心接口[" + methodName + "]异常"+e.toString()+"报文为"+reqXml);
//			if (e instanceof Ice.SocketException) {
//				synchronized (this.iceOtherTypeClient) {
//					logger.error("平台前端ICE连接用户中心(otherType)中断，正在试图重连...");
//					iceOtherTypeClient.setAvailable(false);
//					this.initCEPUserCenterConfigClient();
//				}
//				// 重新调用服务
//				if (iceOtherTypeClient.isAvailable()) {
//					respXml = (String) otherTypeMethodAccess.invoke(otherTypeZreocSrvIPrx, methodName, reqXml, null);
//					String resultCode = this.pauseXml(respXml);
//					if (resultCode.equals(Constants.SESSIONID_LOST_EFFICACY)) {
//						systemServcieImpl.getSessionId();
//						if (reqXml.split(";").length > 1) {
//							this.otherTypeZreocSrvIPrx(methodName, reqXml.split(";")[1]);
//						} else {
//							this.otherTypeZreocSrvIPrx(methodName, reqXml);
//						}
//					}
//				} else {
//					// 记录错误报文日志，不再处理此报文
//					logger.error("平台前端ICE连接用户中心(OtherType)中断，重试失败，放弃本次接口调用，本次要发送的报文为:" + reqXml, e);
//				}
//			} else if (e instanceof Ice.TimeoutException) {
//				logger.error("平台前端ICE连接用户中心(OtherType)操作超时，放弃本次接口调用，本次要发送的报文为:" + reqXml);
//			} else {
//				logger.error(e.getMessage(), e);
//			}
		}

		logger.info("调用用户中心接口[" + methodName + "]，返回报文 << " + respXml);
		return respXml;
	}

	private String pauseXml(String response) {
		String resultCode = "";
		try {
			Document doc = DocumentHelper.parseText(response);
			Element root = doc.getRootElement();
			resultCode = root.attributeValue("st");
		} catch (DocumentException e) {
			logger.error("解析报文失败，此次解析报文为:" + response, e);
		}
		return resultCode;
	}
	
	private String replaceSensitiveXmlInfo(String xml) {
		if (xml == null || xml.equals("")) {
			return xml;
		}
		try {
			Document doc = DocumentHelper.parseText(xml);
			Element rec = doc.getRootElement().element("rec");
			if (rec != null) {
				String temp = rec.attributeValue("phnm");
				if (null != temp && !"".equals(temp)) {
					rec.addAttribute("phnm", StringUtil.getStarMobile(temp));
				}
				temp = rec.attributeValue("eml");
				if (null != temp && !"".equals(temp)) {
					rec.addAttribute("eml", StringUtil.getStarEmail(temp));
				}
			}
			xml = doc.asXML();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return xml;
	}
	
	public static void main(String[] args) {
		String resXml = "<?xml version='1.0' encoding='UTF-8'?><resp st='1' msg='成功'><rec eml='abc@sina.com' arcd=' 86' uid='5000005261' emlmrk='0' sex='0' lv='2' mnpwd ='76761618e3741cc3def5372920c88b45' mnt='CNY' tpagt='' regtm='2015-12-12 09:25:18' rgsrc='null' appauth='' regip='192.168.6.48' utyp='1' ust='1' nmchg='1' fstnm='李' frzrs=' ' rmk='' phnm='13510779536' phmrk='1' mntnm='' bthdy='2005-12-01' lsttm='2016-03-22 18:21:53' ncknm='麒麟得那' unm='jagger2016' ref='' rcmda='' lstip='192.168.88.240' ntlty='8' lstnm='明' pro='南湖公园1好吗' mnymrk='1'/></resp>";
		String result = new CEPUserCenterIceClient().replaceSensitiveXmlInfo(resXml);
		System.out.println(result);
	}
}
