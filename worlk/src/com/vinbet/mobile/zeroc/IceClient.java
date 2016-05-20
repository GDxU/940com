package com.vinbet.mobile.zeroc;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import Ice.Communicator;
import Ice.InitializationData;
import Ice.ObjectPrx;
import Ice.Util;

public class IceClient {

	private final static Logger logger = LogManager.getLogger(IceClient.class.getName());
	private Map<String, Ice.ObjectPrx> objPrxyMap;
	private boolean available = false;

	/**
	 * 初始化ice连接
	 * 
	 * @param clientCfgClassPath
	 */
	private Communicator setCommunicator(ConnectionParam connectionParam, String objKey) {
		Communicator communicator = null;
		try {
			InitializationData initData = new InitializationData();
			initData.properties = Util.createProperties();
			initData.properties.load(connectionParam.getClientCfgClassPath());

			StringBuilder sbld = new StringBuilder();
			sbld.append(objKey).append(":").append(connectionParam.getConnType().toLowerCase()).append(" -h ").append(connectionParam.getIp()).append(" -p ").append(connectionParam.getPort());

			initData.properties.setProperty(objKey + ".Proxy", sbld.toString());
			// 初始化ICE运行时
			communicator = Ice.Util.initialize(initData);
		} catch (Exception e) {
			logger.error("ice server initialize error:" + e.getMessage());
			throw new RuntimeException(e);
		}
		return communicator;
	}

	/**
	 * 创建代理对象
	 * 
	 * @param connectionParam 配置对象
	 * @return
	 */
	private Map<String, Object> buildProxy(ConnectionParam connectionParam, String objKey) {
		Map<String, Object> retMap = new HashMap<String, Object>();
		ObjectPrx objPrx = null;
		Communicator communicator = setCommunicator(connectionParam, objKey);
		try {
			objPrx = communicator.propertyToProxy(objKey + ".Proxy").ice_twoway().ice_timeout(connectionParam.getTimeOut());
		} catch (Exception e) {
			logger.error("execute proxy cause error:" + e.getMessage());
			throw new RuntimeException(e);
		}
		retMap.put("proxy", objPrx);
		retMap.put("communicator", communicator);
		return retMap;
	}

	/**
	 * 初始化客户端，在创建客户端对象后调用
	 * 
	 * @param connectionParam 封装链接参数
	 * @param prxHelperMap key=ObjKey 对象的键，必须跟服务端一样,
	 *        value=生成客户端代理对象的帮助类，由Silce自动生成的名称是XXXPrxHelper的类
	 * @throws NoSuchMethodException
	 * @throws SecurityException
	 * @throws InvocationTargetException
	 * @throws IllegalAccessException
	 * @throws IllegalArgumentException
	 */
	public void initClientPrxs(ConnectionParam connectionParam, Map<String, Class> prxHelperMap) throws Exception {
		this.objPrxyMap = new HashMap<String, ObjectPrx>();
		Iterator<Entry<String, Class>> iter = prxHelperMap.entrySet().iterator();
		Map<String, Object> retMap = null;

		Map.Entry<String, Class> entry = null;
		Method method = null;
		ObjectPrx objectPrx = null;
		while (iter.hasNext()) {
			entry = (Map.Entry<String, Class>) iter.next();
			method = entry.getValue().getDeclaredMethod("checkedCast", ObjectPrx.class);
			try {
				retMap = buildProxy(connectionParam, entry.getKey());
				objectPrx = (ObjectPrx) method.invoke(entry.getValue(), retMap.get("proxy"));
			} catch (Exception e) {
				logger.error("Create Ice Client Proxy Error :" + e.toString());
				((Communicator) retMap.get("communicator")).shutdown();
				((Communicator) retMap.get("communicator")).destroy();
				throw (e);
			}
			this.objPrxyMap.put(entry.getKey(), objectPrx);
		}
	}

	/**
	 * 从客户端中获取代理对象，需要在客户端初始化之后才可以调用
	 * 
	 * @param objKey 对象键要跟服务端完全相同
	 * @return
	 */
	public ObjectPrx getPrxByKey(String objKey) {
		return this.objPrxyMap.get(objKey);
	}

	/**
	 * 销毁一个代理对象
	 * 
	 * @param objKey 要销毁的客户端代理对象
	 */
	public void destoryProxy(Ice.ObjectPrx objPrx) {
		if (objPrx != null) {
			try {
				objPrx.ice_getCommunicator().shutdown();
				objPrx.ice_getCommunicator().destroy();
			} catch (Exception e) {
				logger.error("close communicator error" + e.getMessage());
			}
		}
	}

	/**
	 * 销毁该Client中所有代理对象
	 */
	public void destoryProxy() {
		Iterator<Entry<String, ObjectPrx>> iter = objPrxyMap.entrySet().iterator();

		Map.Entry<String, ObjectPrx> entry = null;
		while (iter.hasNext()) {
			entry = (Map.Entry<String, ObjectPrx>) iter.next();
			destoryProxy(entry.getValue());
		}
	}

	public boolean isAvailable() {
		return available;
	}

	public void setAvailable(boolean available) {
		this.available = available;
	}

}
