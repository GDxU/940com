package com.vinbet.mobile.util;


import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import org.apache.log4j.Logger;

/**
 * 有生存期限的安全的MAP。
 * @author  cjp
 * @version  [Ver 1.0]
 * @since 2014-12-8 下午3:37:43
 */
public class MyOneDayConcurrentHashMap<K, V> extends ConcurrentHashMap<K, V> {
	private static Logger logger = Logger.getLogger(MyOneDayConcurrentHashMap.class.getName());
	private static final long serialVersionUID = 1L;
	Map<K, Long> time = new ConcurrentHashMap<K, Long>(); 
	
	
	/**
	 * 
	 * @param time 生存时间，单位：秒
	 */
	public MyOneDayConcurrentHashMap() {
		new Thread(){
			@Override
			public void run() {
				while(true){
					try{
						long curTime = System.currentTimeMillis();
						for(Map.Entry<K, Long> item : time.entrySet()){
							if(curTime>=item.getValue()){
								MyOneDayConcurrentHashMap.this.remove(item.getKey());
								MyOneDayConcurrentHashMap.this.time.remove(item.getKey());
								logger.info("MyOneDayConcurrentHashMap自动删除：【"+item.getKey()+"】");
							}
						}
						Thread.sleep(24* 60 * 60 * 1000);//每天运行一次。
					}catch (Exception e) {
						logger.error(e.getMessage(),e);
					}
				}
			}
			
		}.start();
	}

	public V put(K key, V value, long time) {
		this.time.put(key, System.currentTimeMillis()+time);
		return super.put(key, value);
	}
}
