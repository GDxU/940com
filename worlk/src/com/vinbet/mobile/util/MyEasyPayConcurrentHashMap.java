package com.vinbet.mobile.util;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import org.apache.log4j.Logger;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import com.vinbet.mobile.sys.PropertiesLoader;

/**
 * 易支付随机生成角分数据保持结构，有生存期限的安全的MAP。
 * @author  cjp
 * @version  [Ver 1.0]
 * @since 2015-5-25 
 */
@IocBean
public class MyEasyPayConcurrentHashMap<K, V> extends ConcurrentHashMap<K, V> {
	private static Logger logger = Logger.getLogger(MyOneDayConcurrentHashMap.class.getName());
	private static final long serialVersionUID = 1L;
	Map<K, Long> time = new ConcurrentHashMap<K, Long>(); 
	
	
	/**
	 * 
	 * @param time 生存时间，单位：秒    24* 60 * 60 * 1000
	 */
	public MyEasyPayConcurrentHashMap() {
		new Thread(){
			@Override
			public void run() {
				while(true){
					try{
						long curTime = System.currentTimeMillis();
						for(Map.Entry<K, Long> item : time.entrySet()){
							if(curTime>=item.getValue()){
								MyEasyPayConcurrentHashMap.this.remove(item.getKey());
								MyEasyPayConcurrentHashMap.this.time.remove(item.getKey());
								logger.info("MyEasyPayConcurrentHashMap自动删除：【"+item.getKey()+"】");
							}
						}
						Long timefrequency=30000L;
						Thread.sleep(timefrequency);//根据配置文件配置来决定多久扫描一次过期数据,目前配置为30秒=30000ms
					}catch (Exception e) {
						logger.error(e.getMessage(),e);
					}
				}
			}
			
		}.start();
	}

	public V put(K key, V value, Long time) {
		this.time.put(key, System.currentTimeMillis()+time);
		return super.put(key, value);
	}
}
