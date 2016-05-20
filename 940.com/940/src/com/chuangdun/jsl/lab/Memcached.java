package com.chuangdun.jsl.lab;

import java.util.Date;

import com.danga.MemCached.MemCachedClient;
import com.danga.MemCached.SockIOPool;

/**
 * @author Administrator
 *
 */
/**
 * @author Administrator
 *
 */
public class Memcached {

	/**
	 * memcached客户端单例
	 */
	private static MemCachedClient cachedClient = new MemCachedClient();

	/**
	 * 初始化连接池
	 */
	static
	{
		// 获取连接池的实例
		SockIOPool pool = SockIOPool.getInstance();

		// 服务器列表及其权重
		String[] servers = SYS.memCashedHost;
		Integer[] weights = SYS.memCashedWeights;

		// 设置服务器信息
		pool.setServers(servers);
		pool.setWeights(weights);

		// 设置初始连接数、最小连接数、最大连接数、最大处理时间
		pool.setInitConn(10);
		pool.setMinConn(10);
		pool.setMaxConn(1000);
		pool.setMaxIdle(1000 * 60 * 60);

		// 设置连接池守护线程的睡眠时间
		pool.setMaintSleep(60);

		// 设置TCP参数，连接超时
		pool.setNagle(false);
		pool.setSocketTO(3000);
		pool.setSocketConnectTO(0);

		// 初始化并启动连接池
		pool.initialize();

		// 压缩设置，超过指定大小的都压缩
		// cachedClient.setCompressEnable(true);
		// cachedClient.setCompressThreshold(1024*1024);
	}

	private Memcached() {
	}

	/**
	 * @description 添加到MemCache
	 * @param key
	 * @param value
	 * @return
	 * @author A.C
	 * @time 2013-4-11 下午8:09:21
	 */
	public static boolean add(String key, Object value)
	{
		return cachedClient.add(key, value);
	}

	/**
	 * @description 添加到MemCache
	 * @param key
	 * @param value
	 * @param hash
	 * @return
	 * @author A.C
	 * @time 2013-4-11 下午8:09:23
	 */
	public static boolean add(String key, Object value, Integer hash)
	{
		return cachedClient.add(key, value, hash);
	}

	/**
	 * @description 添加到MemCache（推荐使用）
	 * @param key
	 * @param value
	 * @param expire (new Date(1000) 数值以毫秒计)
	 * @return
	 * @author A.C
	 * @time 2013-4-11 下午8:09:18
	 */
	public static boolean add(String key, Object value, Date expire)
	{
		return cachedClient.add(key, value, expire);
	}

	/**
	 * @description 存放到MemCache
	 * @param key
	 * @param value
	 * @return
	 * @author A.C
	 * @time 2013-4-11 下午8:11:34
	 */
	public static boolean put(String key, Object value)
	{
		return cachedClient.set(key, value);
	}

	/**
	 * @description 存放到MemCache
	 * @param key
	 * @param value
	 * @param hash
	 * @return
	 * @author A.C
	 * @time 2013-4-11 下午8:12:06
	 */
	public static boolean put(String key, Object value, Integer hash)
	{
		return cachedClient.set(key, value, hash);
	}

	/**
	 * @description 存放到MemCache（推荐使用）
	 * @param key
	 * @param value
	 * @param expire (new Date(1000) 数值以毫秒计)
	 * @return
	 * @author A.C
	 * @time 2013-4-11 下午8:12:20
	 */
	public static boolean put(String key, Object value, Date expire)
	{
		return cachedClient.set(key, value, expire);
	}

	public static boolean put(String key, Object value, Date expire,Integer i)
	{
		return cachedClient.set(key, value, expire,i);
	}
	
	/**
	 * @description 替换Memcache中的值
	 * @param key
	 * @param value
	 * @return
	 * @author A.C
	 * @time 2013-4-11 下午8:12:36
	 */
	public static boolean replace(String key, Object value)
	{
		return cachedClient.replace(key, value);
	}

	/**
	 * @description 替换Memcache中的值
	 * @param key
	 * @param value
	 * @param hash
	 * @return
	 * @author A.C
	 * @time 2013-4-11 下午8:13:05
	 */
	public static boolean replace(String key, Object value, Integer hash)
	{
		return cachedClient.replace(key, value, hash);
	}

	/**
	 * @description 替换Memcache中的值（推荐使用）
	 * @param key
	 * @param value
	 * @param expire (new Date(1000) 数值以毫秒计)
	 * @return
	 * @author A.C
	 * @time 2013-4-11 下午8:13:05
	 */
	public static boolean replace(String key, Object value, Date expire)
	{

		return cachedClient.replace(key, value, expire);
	}

	/**
	 * @description 获取memcache中的一个对象
	 * @param key
	 * @return
	 * @author A.C
	 * @time 2013-4-11 下午8:14:17
	 */
	public static Object get(String key)
	{
		return cachedClient.get(key);
	}

	/**
	 * @description 删除
	 * @param key
	 * @return
	 * @author A.C
	 * @time 2013-4-11 下午8:14:32
	 */
	public static boolean delete(String key)
	{
		return cachedClient.delete(key);
	}

	/**
	 * @description 清空所有缓存
	 * @return
	 * @author A.C
	 * @time 2013-4-11 下午8:14:38
	 */
	public static boolean flushAll()
	{
		return cachedClient.flushAll();
	}

	/**
	 * @description 创建计数器
	 * @param key
	 * @param l  	 初始值
	 * @param expire 过期时间
	 * @return boolean
	 * @author A.C
	 * @time 2013-4-15 下午3:01:11
	 */
	public static boolean storeCounter(String key, long l, Date expire)
	{
		return cachedClient.storeCounter(key, l, expire);
	}

	public static boolean storeCounter(String key, long l)
	{
		return cachedClient.storeCounter(key, l);
	}
	/**
	 * @description 创建计数器
	 * @param key
	 * @param l  	 初始值
	 * @param expire 过期时间
	 * @return boolean
	 * @author A.C
	 * @time 2013-4-15 下午3:01:11
	 */
	public static boolean storeCounter(String key, long l, Date expire,Integer i)
	{
		return cachedClient.storeCounter(key, l, expire,i);
	}
	/**
	 * @description 计数器加
	 * @param key
	 * @return long 新的值
	 * @author A.C
	 * @time 2013-4-15 下午3:02:18
	 */
	public static long incr(String key)
	{
		return cachedClient.incr(key);
	}

	/**
	 * @description 计数器加
	 * @param key
	 * @param l 	加的值
	 * @return long 新的值
	 * @author A.C
	 * @time 2013-4-15 下午3:02:18
	 */
	public static long incr(String key,long l)
	{
		return cachedClient.incr(key,l);
	}
	
	/**
	 * @description 计数器加,如果没有则创建
	 * @param key
	 * @param l 	加的值
	 * @return long 新的值
	 * @author A.C
	 */
	public static long addOrIncr(String key,long l)
	{
		return cachedClient.addOrIncr(key, l);
	}
	/**
	 * @description 获取计数器
	 * @param key
	 * @author A.C
	 */
	public static long getCounter(String key)
	{
		return cachedClient.getCounter(key);
	}
	
}