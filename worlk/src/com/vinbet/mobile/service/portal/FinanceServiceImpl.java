package com.vinbet.mobile.service.portal;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.Callable;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;

import com.vinbet.mobile.action.portal.UserAction;
import com.vinbet.mobile.util.HttpClientUtil;
import com.vinbet.mobile.util.MD5Util;

@IocBean
public class FinanceServiceImpl {
	private Log log = Logs.getLog(FinanceServiceImpl.class);
	ExecutorService executor = Executors.newFixedThreadPool(100);
//	public Map<String, String> getUserBalance(String url,String userName,String valideTime,String platform,String[] appids) throws InterruptedException{
//		Map<String, String> resMap = new ConcurrentHashMap<String, String>();
//		final CountDownLatch cd = new CountDownLatch(appids.length);
//		for(int i=0;i<appids.length;i++){
//			Map<String, String> parameters = new HashMap<String, String>();
//			parameters.put("userName", userName);
//			parameters.put("valideTime", valideTime);
//			String id = appids[i].split(":")[1];
//			parameters.put("appid", id);
//			String ts = String.valueOf(new Date().getTime());
//			parameters.put("ts", ts);
//			parameters.put("sipsession", MD5Util.md5Hex(platform + ts));
//			parameters.put("uuid", UUID.randomUUID().toString());
//			executor.submit(new GetUserBalanceThread(url, parameters, cd, resMap));
//			
//			
//		}
//		cd.await();
//		return resMap;
//	}
//	
//	class GetUserBalanceThread implements Runnable{
//		private String url;
//		private Map<String, String> pm;
//		private CountDownLatch cd;
//		private Map<String, String> resMap;
//		
//		public GetUserBalanceThread(String url,Map<String, String> pm,CountDownLatch cd,Map<String, String> resMap){
//			this.url = url;
//			this.pm = pm;
//			this.cd = cd;
//			this.resMap = resMap;
//		}
//		
//		@Override
//		public void run() {
//			// TODO Auto-generated method stub
//			try {
//				String res = HttpClientUtil.doGetString(url, pm);
//				resMap.put(pm.get("appid"), res);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}finally{
//				cd.countDown();
//			}
//		}
//	}
	
	class GetUserBalanceThread implements Callable<String>{
		private String url;
		private Map<String, String> pm;
		
		public GetUserBalanceThread(String url,Map<String, String> pm){
			this.url = url;
			this.pm = pm;
		}
		
		@Override
		public String call() throws Exception {
			String result = pm.get("appid") + "_";
			try {
				String res = HttpClientUtil.doGetString(url, pm);
				result = result + res;
			} catch (Exception e) {
				//e.printStackTrace();
				log.error(e);
			}
			return result;
		}
	}
	
	public Map<String, String> getUserBalance(String url,String userName,String valideTime,String platform,String[] appids) throws InterruptedException{
		Map<String, String> resMap = new ConcurrentHashMap<String, String>();
		 Future<String>[] futures = new Future[appids.length];
		for(int i=0;i<appids.length;i++){
			Map<String, String> parameters = new HashMap<String, String>();
			parameters.put("userName", userName);
			parameters.put("valideTime", valideTime);
			String id = appids[i].split(":")[1];
			parameters.put("appid", id);
			String ts = String.valueOf(new Date().getTime());
			parameters.put("ts", ts);
			parameters.put("sipsession", MD5Util.md5Hex(platform + ts));
			parameters.put("uuid", UUID.randomUUID().toString());
			futures[i] = executor.submit(new GetUserBalanceThread(url, parameters));
		}
		for (int i = 0; i < futures.length; i++) {
			try {
				String result = futures[i].get(10000, TimeUnit.MILLISECONDS);
				int ind = result.indexOf("_");
				resMap.put(result.substring(0, ind), result.substring(ind+1, result.length()));
			} catch (Exception e) {
				if(!(e instanceof java.util.concurrent.TimeoutException)){
					log.error(e);
				}
			}
		}
		return resMap;
	}
}
