package com.vinbet.mobile.zeroc;

import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.concurrent.ConcurrentHashMap;

import Ice.Communicator;
import Ice.InitializationData;
import Ice.ObjectAdapter;
import Ice.Util;

public class IceServerUtil {

	private static Communicator communicator = null;
	// 存放多个连接器
	private static ConcurrentHashMap<String, Communicator> communicatorMap = new ConcurrentHashMap<String, Communicator>();

	/**
	 * 启动ICE服务，支持多组件服务
	 * 
	 * @param srvObjMap key=对象的标示objKey，客户端调用时需要。value=要发布的组件对象
	 * @param configPath
	 */
	public static void startIceServer(Map<String, Ice.Object> srvObjMap, String serverCfgClassPath) {
		StringBuilder communicatorId = new StringBuilder();
		InitializationData initData = new InitializationData();
		initData.properties = Util.createProperties();
		initData.properties.load(serverCfgClassPath);
		communicator = Ice.Util.initialize(initData);

		Iterator<Entry<String, Ice.Object>> iter = srvObjMap.entrySet().iterator();
		ObjectAdapter adapterObj = communicator.createObjectAdapterWithEndpoints("MutiSrvAdapter", initData.properties.getProperty("IceServer"));
		while (iter.hasNext()) {
			Map.Entry<String, Ice.Object> entry = (Map.Entry<String, Ice.Object>) iter.next();
			adapterObj.add(entry.getValue(), communicator.stringToIdentity(entry.getKey()));
			communicatorId.append(entry.getKey());
		}
		adapterObj.activate();

		new Thread() {
			@Override
			public void run() {
				communicator.waitForShutdown();// 线程阻塞
			}

		}.start();

		communicatorMap.put(communicatorId.toString(), communicator);
		try {
			Thread.sleep(1000L * 1);
		} catch (Exception e) {
		}
	}

	private static void destroyCommunicator(String communicatorId) {
		Iterator<Entry<String, Communicator>> iter = communicatorMap.entrySet().iterator();
		while (iter.hasNext()) {
			Map.Entry<String, Communicator> entry = (Map.Entry<String, Communicator>) iter.next();
			if (communicatorId != null) {
				if (communicatorId.equals(entry.getKey())) {
					entry.getValue().destroy();
					communicatorMap.remove(entry.getKey());
					break;
				}
			} else {
				entry.getValue().destroy();
				communicatorMap.remove(entry.getKey());
			}
		}
	}

	/**
	 *销毁ICE服务
	 */
	public static void destory() {
		destroyCommunicator(null);
	}

	public static void destory(String communicatorId) {
		destroyCommunicator(communicatorId);
	}

}
