package com.vinbet.mobile.sys;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

import javax.servlet.http.HttpSession;

import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.Mvcs;
import org.springframework.beans.BeanUtils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.vinbet.mobile.domain.ApiUser;
import com.vinbet.mobile.domain.UserInfo;
import com.vinbet.mobile.entity.portal.Activity;
import com.vinbet.mobile.entity.portal.BankCard;
import com.vinbet.mobile.entity.portal.CollectionInfo;
import com.vinbet.mobile.entity.portal.Currency;
import com.vinbet.mobile.entity.portal.Dict;
import com.vinbet.mobile.entity.portal.EasyPayment;
import com.vinbet.mobile.entity.portal.FreezeCount;
import com.vinbet.mobile.entity.portal.NavigationApp;
import com.vinbet.mobile.entity.portal.PaymentPlatform;
import com.vinbet.mobile.entity.portal.SystemParm;
import com.vinbet.mobile.entity.portal.UserActivityInfo;
import com.vinbet.mobile.entity.portal.WalletCategory;
import com.vinbet.mobile.entity.portal.WechatPayAcc;
import com.vinbet.mobile.util.Constants;
import com.vinbet.mobile.util.HttpClientUtil;
import com.vinbet.mobile.util.I18nIntercept;
import com.vinbet.mobile.util.MD5Util;
import com.vinbet.mobile.util.MyEasyPayConcurrentHashMap;
import com.vinbet.mobile.util.MyOneDayConcurrentHashMap;
import com.vinbet.mobile.util.StringUtil;

/**
 * 应用缓存
 */
public class AppCache {
	private final static Log log = Logs.getLog(AppCache.class);

	public static Lock loadAgentUrlLock = new ReentrantLock();
	/**
	 * 记录用户登录失败的次数
	 */
	public static Map<String, Integer> userLoginFailedRecord = new ConcurrentHashMap<String, Integer>();
	/**
	 * 记录用户输入资金密码失败的次数
	 */
	public static Map<String, FreezeCount> userFundPwdErrorRecord = new ConcurrentHashMap<String, FreezeCount>();
	/**
	 * 记录用户登录失败的次数（用于API系统）
	 */
	public static Map<String, FreezeCount> userLoginPwdErrorRecord = new ConcurrentHashMap<String, FreezeCount>();
	/**
	 * 记录用户获取验证码的次数
	 */
	public static Map<String, Integer> userGetCodeRecord = new ConcurrentHashMap<String, Integer>();
	/**
	 * 记录用户是否展示本地银行存款
	 */
	public static Map<String, String> userLocalBankShow = new ConcurrentHashMap<String, String>();
	/**
	 * 在线用户列表
	 */
	public static Map<String, HttpSession> onlineUsers = new ConcurrentHashMap<String, HttpSession>();
	/**
	 * API登录用户信息管理,key:用户名
	 */
	//public static Map<String, ApiUser> apiUserInfo = new ConcurrentHashMap<String, ApiUser>();
	/**
	 * 项目8系统控制：是否开放某个子应用或子应用下的玩法
	 */
	public static Map<String, String> sscSysConfig = new ConcurrentHashMap<String, String>();
	/**
	 * 项目6系统控制：是否开放某个子应用或子应用下的玩法
	 */
	public static Map<String, String> hkcSysConfig = new ConcurrentHashMap<String, String>();
	/**
	 * 项目7系统控制：是否开放某个子应用或子应用下的玩法
	 */
	public static Map<String, String> qxcSysConfig = new ConcurrentHashMap<String, String>();
	/**
	 * 代理域名缓存,key:代理账号，value：代理域名
	 */
	public static Map<String, String> agentDomain = null;

	/**
	 * 物理文件用于存储用户冻结信息
	 */
	public static File file = new File(Mvcs.getServletContext().getRealPath("/WEB-INF/classes/com/vinbet/mobile/config/freezeUser.out"));

	/**
	 * 安全访问sessionid
	 */
	public static String SafeSessionId = null;

	/** 字典表缓存。key:字典类型主键(dictTypeId) val:该类型下的所有字典列表 */
	private static Map<String, List<Dict>> dictMap = new ConcurrentHashMap<String, List<Dict>>();
	/** 系统参数缓存。 */
	private static Map<String, String> systemParmMap = new ConcurrentHashMap<String, String>();
	/** 国际化资源表。key:国际化主键 val:数据库记录 */
	private static Map<String, Map<String, String>> internationMap = new ConcurrentHashMap<String, Map<String, String>>();
	/** 系统支持的第三方支付平台数据缓存。 */
	/*
	 * private static Map<String, List<PaymentPlatform>> paymentPlatMap = new
	 * ConcurrentHashMap<String, List<PaymentPlatform>>(); private static
	 * Map<String, List<EasyPayment>> easyPaymentMap = new
	 * ConcurrentHashMap<String, List<EasyPayment>>();
	 */
	/**
	 * 平台支持的货币 key 货币单位,如CNY、USD等
	 */
	private static Map<String, Currency> currencyMap = new ConcurrentHashMap<String, Currency>();

	/** 钱包类别 */
	private static Map<String, WalletCategory> walletCategoryMap = new ConcurrentHashMap<String, WalletCategory>();

	/** 本地银行转账列表 */
	private static Map<String, BankCard> localBankMap = new ConcurrentHashMap<String, BankCard>();

	/** 导航菜单 */
	private static List<NavigationApp> navigationAppList = new CopyOnWriteArrayList<NavigationApp>();

	/** 菜单动态静态地址,用于登录和退出 key 子应用标识码,value 导航菜单对象 */
	private static Map<String, NavigationApp> navigationAppMap = new ConcurrentHashMap<String, NavigationApp>();

	/** 互联网支付方式map类型 key ID,value 字典对象 */
	private static Map<String, Dict> aliPayMap = new ConcurrentHashMap<String, Dict>();
	
	/** 微信扫码支付方式map类型 key ID,value 微信账号对象 */
	private static Map<String, WechatPayAcc> wechatAccMap = new ConcurrentHashMap<String, WechatPayAcc>();

	/** 系统支持的第三方支付平台数据缓存。 */
	private static Map<String, List<PaymentPlatform>> paymentPlatMap = new ConcurrentHashMap<String, List<PaymentPlatform>>();
	private static Map<String, List<EasyPayment>> easyPaymentMap = new ConcurrentHashMap<String, List<EasyPayment>>();
	/** 支付平台账号缓存:key */
	public static Map<String, PaymentPlatform> paymentPlatformAccMap = new ConcurrentHashMap<String, PaymentPlatform>();

	/** 保持易支付用户存款尾数，系统随机生成的角分。 */
	private static MyEasyPayConcurrentHashMap<String, String> easyPayCodeMap = new MyEasyPayConcurrentHashMap<String, String>();

	/** 保存现有活动信息，包括开启和关闭的。 */
	private static List<Activity> activityList = new CopyOnWriteArrayList<Activity>();
	/** 保存现有游戏活动的参与用户信息,包括参与当前活动的全部用户活动状态，和以往同类活动但是用户活动状态未结束的。 */
	private static Map<String, Map<String, List<UserActivityInfo>>> ActivityGameMap = new ConcurrentHashMap<String, Map<String, List<UserActivityInfo>>>();

	/**
	 * 保存手机验证码 key=手机号， value=map<key='vcode' value=验证字符串> map<key='time'
	 * value=时间戳>
	 * */
	private static MyOneDayConcurrentHashMap<String, Map<String, String>> phonevCode = new MyOneDayConcurrentHashMap<String, Map<String, String>>();
	/**
	 * 保存邮箱验证字符串 key=用户Id value=map<key='vCode' value=验证字符串> map<key='time'
	 * value=时间戳> map<key='email' value=邮箱地址>
	 * 
	 **/
	private static MyOneDayConcurrentHashMap<String, Map<String, String>> emialvCode = new MyOneDayConcurrentHashMap<String, Map<String, String>>();
	/**
	 * 收款信息缓存 key存款流水号，value收款信息
	 */
	public static Map<String, CollectionInfo> collecitonInfos = new ConcurrentHashMap<String, CollectionInfo>();

	public static boolean loadAgentDomain(PropertiesLoader propertiesLoader) {
		boolean flag = false;
		try {
			// loadAgentUrlLock.lock();
			// if (agentDomain != null) {
			// return true;
			// }
			final Map<String, String> parameters = new HashMap<String, String>();
			parameters.put("uuid", UUID.randomUUID().toString());
			String ts = String.valueOf(new Date().getTime());
			parameters.put("ts", ts);
			parameters.put("valideTime", propertiesLoader.getTrim("vinbet.platform.valideTime"));
			parameters.put("sipsession", MD5Util.md5Hex(propertiesLoader.getTrim("vinbet.token.platform") + ts));
			String url = new StringBuilder(propertiesLoader.getTrim("vinbet.platform.url")).append("/userinfomobileapi!getAgentUrl.shtml").toString();
			String response = HttpClientUtil.doPostString(url, parameters);
			if (response != null && !response.equals("")) {
				JSONObject jsonObject = JSON.parseObject(response);
				int resultCode = jsonObject.getIntValue("code");
				if (resultCode == 10000) {
					agentDomain = new ConcurrentHashMap<String, String>();
					JSONArray array = JSON.parseArray(jsonObject.getString("list"));
					for (Object object : array) {
						JSONObject domain = (JSONObject) object;
						agentDomain.put(domain.getString("agentUrl"), domain.getString("agentNumber"));
					}
					flag = true;
				}
			}
		} catch (Exception e) {
			log.error("获取代理域名失败.", e);
		} finally {
			// loadAgentUrlLock.unlock();
		}
		return flag;
	}

	// -------------------------------PhonevCode内存对象相关操作----begin-----------------------------------------
	public static Map<String, String> getPhonevCode(String phnumber) {
		return phonevCode.get(phnumber);
	}

	/**
	 * 缓存手机验证字条串 ，缓存字符串和时间，使用的时候检查是否在过期时间内
	 * 
	 * @author cjp
	 * @param phone
	 * @param randomStr
	 * @since 2014-11-6 下午4:17:21
	 */
	public static void setPhonevCode(String userid, String phnumber, String randomStr, long time) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("vcode", randomStr);
		map.put("time", System.currentTimeMillis() + "");
		map.put("phone", phnumber);
		phonevCode.put(userid, map, time);
	}

	public static void removePhonevCode(String phnumber) {
		phonevCode.remove(phnumber);
	}

	public static Map<String, Map<String, String>> getPhonevCode() {
		return phonevCode;
	}

	/**
	 * 检查手机验证码上次发送是否已经过了60秒 </pre>
	 * 
	 * @author cjp
	 * @param userid
	 * @return
	 * @since 2015-2-11 上午10:27:24
	 */
	public static long checkPhoneTime60(String userid) {
		Map<String, String> map = phonevCode.get(userid);
		if (map == null) {
			return 0;
		}
		long startTime = Long.valueOf(map.get("time"));
		long time = System.currentTimeMillis() - startTime;
		if (time < 60 * 1000) {
			return 60 - time / 1000;
		}
		return 0;
	}

	/**
	 * 验证手机验证码 ，验证正确后删除
	 * 
	 * @author cjp
	 * @param phone
	 *            手机号码
	 * @param expiredTime
	 *            过期时间 秒
	 * @param phcode
	 *            用户收到的手机验证码
	 * @since 2014-12-3 下午5:14:11
	 */
	public static boolean checkPhvCode(String userid, String phnumber, long expiredTime, String phcode) {
		Map<String, String> map = phonevCode.get(userid);
		if (map == null) {
			return false;
		}

		if (null == map.get("phone")) {
			return false;
		}

		long startTime = Long.valueOf(map.get("time"));
		long time = System.currentTimeMillis() - startTime;

		if (time > expiredTime * 1000) {
			phonevCode.remove(phnumber);
			return false;
		}
		String vcode = map.get("vcode");
		if (!StringUtil.isEmpty(vcode) && !StringUtil.isEmpty(phcode) && vcode.equals(phcode)) {
			phonevCode.remove(userid);
			return true;
		}
		return false;
	}

	/**
	 * 验证手机验证码 ，验证正确后不删除
	 * 
	 * @author cjp
	 * @param phnumber
	 * @param expiredTime
	 *            过期时间秒
	 * @param phcode
	 * @since 2014-12-4 下午10:08:13
	 */
	public static boolean checkPhvCodeNoDel(String userid, String phnumber, long expiredTime, String phcode) {
		Map<String, String> map = phonevCode.get(userid);
		if (map == null) {
			return false;
		}

		if (null == map.get("phone")) {
			return false;
		}
		long startTime = Long.valueOf(map.get("time"));
		long time = System.currentTimeMillis() - startTime;

		if (time > expiredTime) {
			phonevCode.remove(userid);
			return false;
		}
		String vcode = map.get("vcode");
		if (!StringUtil.isEmpty(vcode) && !StringUtil.isEmpty(phcode) && vcode.equals(phcode)) {
			return true;
		}
		return false;
	}

	// -------------------------------PhonevCode内存对象相关操作----end-----------------------------------------

	// -------------------------------EmialvCode内存对象相关操作----begin-----------------------------------------
	public static Map<String, String> getEmialvCode(String userid) {
		return emialvCode.get(userid);
	}

	/**
	 * 缓存邮箱验证字条串， 缓存字符串和时间，使用的时候检查是否在过期时间内
	 * 
	 * @author cjp
	 * @param userName
	 * @param randomStr
	 * @param email
	 * @since 2014-11-6 下午4:34:15
	 */
	public static void setEmialvCode(String UserId, String randomStr, String email, long time) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("vcode", randomStr);
		map.put("time", System.currentTimeMillis() + "");
		map.put("email", email);
		emialvCode.put(UserId, map, time);
	}

	/**
	 * 检查上次发送邮件时间是否超过60秒 </pre>
	 * 
	 * @author cjp
	 * @param userid
	 * @return
	 * @since 2015-2-11 上午11:05:33
	 */
	public static long checkEmailTime60(String userid) {
		Map<String, String> map = emialvCode.get(userid);
		if (map == null) {
			return 0;
		}
		long startTime = Long.valueOf(map.get("time"));
		long time = System.currentTimeMillis() - startTime;
		if (time < 60 * 1000) {
			return 60 - time / 1000;
		}
		return 0;
	}

	public static void removeEmailvCode(String userId) {
		emialvCode.remove(userId);
	}

	public static Map<String, Map<String, String>> getEmialvCode() {
		return emialvCode;
	}

	/**
	 * 验证邮箱验证码
	 * 
	 * @author cjp
	 * @param userid
	 * @param expiredTime
	 *            过期时间秒
	 * @param emailCode
	 * @since 2015-3-13 下午5:22:54
	 */
	public static String checkEmailvCode(String userid, long expiredTime, String emailCode) {
		Map<String, String> map = emialvCode.get(userid);
		if (map == null) {
			return "";
		}
		long startTime = Long.valueOf(map.get("time"));
		long time = System.currentTimeMillis() - startTime;

		if (time > expiredTime * 1000) {
			emialvCode.remove(userid);
			return "";
		}
		String vcode = map.get("vcode");
		if (!StringUtil.isEmpty(vcode) && !StringUtil.isEmpty(emailCode) && vcode.equals(emailCode)) {
			emialvCode.remove(userid);
			return map.get("email");
		}
		return "";
	}

	/**
	 * 验证邮箱验证码 ， 验证不删除
	 * 
	 * @author cjp
	 * @param userid
	 * @param expiredTime
	 *            过期时间秒
	 * @param emailCode
	 * @since 2015-3-13 下午5:22:54
	 */
	public static String checkEmailvCodeNoDel(String userid, long expiredTime, String emailCode) {
		Map<String, String> map = emialvCode.get(userid);
		if (map == null) {
			return "";
		}
		long startTime = Long.valueOf(map.get("time"));
		long time = System.currentTimeMillis() - startTime;
		if (time > expiredTime * 1000) {
			emialvCode.remove(userid);
			return "";
		}
		String vcode = map.get("vcode");
		if (!StringUtil.isEmpty(vcode) && !StringUtil.isEmpty(emailCode) && vcode.equals(emailCode)) {
			return map.get("email");
		}
		return "";
	}

	// -------------------------------EmialvCode内存对象相关操作----end-----------------------------------------

	// -------------------------------数据字典缓存相关操作----begin-----------------------------------------

	/* 初始化数据字典到内存中。 */
	public static void initDict(final List<Dict> dictList) {
		log.info("初始化数据字典到平台前端系统内存中开始");
		if (dictList != null && dictList.size() > 0) {
			synchronized (dictMap) {
				dictMap.clear();
				Map<String, List<Dict>> dictMapNew = new HashMap<String, List<Dict>>();
				if (dictList != null) {
					for (final Dict item : dictList) {
						if (item.getDictTypeId() == null) {
							continue;
						}
						List<Dict> tempList = dictMapNew.get(item.getDictTypeId());
						if (tempList == null) {
							// map里面还没有键值对，添加键值对。
							tempList = new ArrayList<Dict>();
							dictMapNew.put(item.getDictTypeId(), tempList);// 向map中添加键值对。
						}
						tempList.add(item);
					}
				}
				AppCache.setDictMap(dictMapNew);
			}
		}
		log.info("初始化数据字典到平台前端系统内存中成功！");
	}

	/* 更新字典缓存。 */
	public static void setDictMap(Map<String, List<Dict>> dict) {
		for (Map.Entry<String, List<Dict>> item : dict.entrySet()) {
			try {
				AppCache.dictMap.put(item.getKey(), item.getValue());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	/* 更新支付宝机构缓存。 */
	public static void setAlipayDictMap(final List<Dict> dictList) {
		synchronized (dictMap) {
			if(AppCache.getDictListByTypeId(Constants.ALIPAY_DAG)!=null||AppCache.getDictListByTypeId(Constants.ALIPAY_DAG).size()==0){
				AppCache.dictMap.remove(Constants.ALIPAY_DAG);
			}
			if(AppCache.getDictListByTypeId(Constants.WECHATPAY_DAG)!=null||AppCache.getDictListByTypeId(Constants.WECHATPAY_DAG).size()==0){
				AppCache.dictMap.remove(Constants.WECHATPAY_DAG);
			}
			if (dictList != null) {
				for (final Dict item : dictList) {
					Map<String, List<Dict>> dictMapNew = new HashMap<String, List<Dict>>();
					if (item.getDictTypeId() == null) {
						continue;
					}
					List<Dict> tempList = dictMapNew.get(item.getDictTypeId());
					if (tempList == null) {
						// map里面还没有键值对，添加键值对。
						tempList = new ArrayList<Dict>();
						dictMapNew.put(item.getDictTypeId(), tempList);// 向map中添加键值对。
					}
					tempList.add(item);
					AppCache.setDictMap(dictMapNew);
				}
			}
		}
	}
	
	

	/* 从缓存中取得字典资源表.<br>获取的数据不能做修改操作。 */
	public static Map<String, List<Dict>> getDictMap() {
		return AppCache.dictMap;
	}

	/**
	 * 根据字典类型返回字典列表,未国际化。
	 * 
	 * @param dictTypeId
	 * @return
	 */
	public static List<Dict> getDictListByTypeId(final String dictTypeId) {
		final List<Dict> dictList = AppCache.getDictMap().get(dictTypeId);
		if (dictList == null) {
			log.info("\n前端系统内存中没有【" + dictTypeId + "】数据字典项！");
			return new ArrayList<Dict>();
		}
		// 过滤停用字典项在字典标签中完成。
		/*
		 * for (final Dict item : dictList) { if (item.getStatus() ==
		 * Constants.DICT_STATUS_N) { dictList.remove(item);//过滤掉已经停用的数据字典项 } }
		 */
		return dictList;

	}

	/* 根据字典类型返回字典列表,已国际化。 */
	public static List<Dict> getI18nDictListByType(final String dictTypeId) {
		final List<Dict> dictList = AppCache.getDictMap().get(dictTypeId);
		if (dictList == null) {
			log.info("\n前端系统内存中没有【" + dictTypeId + "】数据字典项！");
			return new ArrayList<Dict>();
		} else {
			if (Constants.BANKNAME_DAG.equals(dictTypeId) || dictTypeId.equals(Constants.ORG_DAG) || dictTypeId.equals(Constants.LOCALBANK_TRANSFER_COMPANYBANKACC_DAG)
					|| dictTypeId.equals(Constants.EASY_PAY_BANK_DAG)) { // 如果是银行卡,只显示支持用户对应货币的银行
				final List<Dict> tempList = new ArrayList<Dict>();
				UserInfo userInfo = (UserInfo) Mvcs.getHttpSession().getAttribute(Constants.USER_SESSION);
				String currency = userInfo.getCurrencyName();
				for (final Dict item : dictList) {

					if (item.getRules().indexOf(currency) != -1) {
						if (item.getStatus() == Constants.DICT_STATUS_Y) {
							final Dict temp = new Dict();
							BeanUtils.copyProperties(item, temp);
							temp.setDictName(AppCache.getI18nInfo(item.getIid(), item.getDictName()));
							tempList.add(temp);
						}
					}
				}
				return tempList;
			} else {
				List<Dict> tempList = new ArrayList<Dict>();
				for (final Dict item : dictList) {
					if (item.getStatus() == Constants.DICT_STATUS_Y) {
						Dict temp = new Dict();
						temp = (Dict) item.clone();
						temp.setDictName(AppCache.getI18nInfo(item.getIid(), item.getDictName()));
						tempList.add(temp);
					}
				}
				return tempList;
			}

		}
	}

	/* 根据字典类型和语言返回字典列表,已国际化,用于手机端API。 */
	public static List<Dict> getI18nDictListByLg(final String dictTypeId, String lg) {
		final List<Dict> dictList = AppCache.getDictMap().get(dictTypeId);
		if (dictList == null) {
			log.info("\n前端系统内存中没有【" + dictTypeId + "】数据字典项！");
			return new ArrayList<Dict>();
		} else {
			List<Dict> tempList = new ArrayList<Dict>();
			for (final Dict item : dictList) {
				if (item.getStatus() == Constants.DICT_STATUS_Y) {
					Dict temp = new Dict();
					temp = (Dict) item.clone();
					temp.setDictName(AppCache.getI18nInfo(item.getIid(), item.getDictName(), lg));
					temp.setIid(null);
					temp.setIcon(null);
					temp.setRemark(null);
					temp.setDictTypeRemark(null);
					// temp.setDictTypeName(null);
					tempList.add(temp);
				}
			}
			return tempList;

		}
	}

	// -------------------------------数据字典缓存相关操作----end-----------------------------------------

	// -------------------------------第三方支付平台缓存相关操作----begin-----------------------------------------

	public static void initPaymentPlat(final List<PaymentPlatform> dpaymentPlatList) {
		if (null != dpaymentPlatList && dpaymentPlatList.size() > 0) {
			log.info("初始化第三方支付平台到平台前端系统内存中开始");
			Map<String, List<PaymentPlatform>> paymentPlatMapNew = new HashMap<String, List<PaymentPlatform>>();
			synchronized (paymentPlatMap) {
				paymentPlatMap.clear();
				if (dpaymentPlatList != null) {
					for (final PaymentPlatform item : dpaymentPlatList) {
						List<PaymentPlatform> tempList = paymentPlatMapNew.get(item.getPaymentPlatId());
						if (tempList == null) {
							tempList = new ArrayList<PaymentPlatform>();
							paymentPlatMapNew.put(item.getPaymentPlatId(), tempList);// 向map中添加键值对。
						}
						tempList.add(item);
					}
				}
				AppCache.setPaymentPlatMap(paymentPlatMapNew);
			}
			log.info("初始化第三方支付平台到平台前端系统内存中成功！");
		}
	}

	public static void setPaymentPlatMap(Map<String, List<PaymentPlatform>> paymentPlat) {
		for (Map.Entry<String, List<PaymentPlatform>> item : paymentPlat.entrySet()) {
			AppCache.paymentPlatMap.put(item.getKey(), item.getValue());
		}
	}

	public static Map<String, List<PaymentPlatform>> getPaymentPlatMap() {
		return AppCache.paymentPlatMap;
	}

	public static List<PaymentPlatform> getPaymentPlatListByPPId(String paymentPlatId) {
		final List<PaymentPlatform> paymentPlatList = AppCache.getPaymentPlatMap().get(paymentPlatId);
		return paymentPlatList;
	}

	// -------------------------------第三方支付平台缓存相关操作----end-----------------------------------------

	// -------------------------------CurrencyMap内存对象相关操作----begin-----------------------------------------
	public static Map<String, Currency> getCurrencyMap() {
		return currencyMap;
	}

	/**
	 * @author cjp
	 * @param currency_key
	 *            货币单位如USD等
	 * @param currency
	 *            　货币对象
	 * @since 2015-1-6 下午8:52:54
	 */
	public static void setCurrencyMap(String currency_key, Currency currency) {
		AppCache.currencyMap.put(currency_key, currency);
	}

	// -------------------------------CurrencyMap内存对象相关操作----end-----------------------------------------

	// -------------------------------国际化资源缓存相关操作----begin-----------------------------------------
	/* 返回指定国际化资源ID的国际化资源信息. */
	public static String getI18nInfo(String iid, String dictOldName) {
		if (StringUtil.isEmpty(iid)) {
			return dictOldName;
		}
		String result = iid;
		String language = Mvcs.getLocalizationKey();
		result = I18nIntercept.convertValue(language, iid, dictOldName);
		return result;
	}

	/* 返回指定国际化资源ID的国际化资源信息，重写方法，增加语言参数，给API使用 */
	public static String getI18nInfo(String iid, String dictOldName, String lg) {
		if (StringUtil.isEmpty(iid)) {
			return dictOldName;
		}
		String result = iid;
		String language = lg;
		result = I18nIntercept.convertValue(language, iid, dictOldName);
		return result;
	}

	/* 初始化国际化资源信息到缓存中。 */
	public static void initInternationInfo(final List<Map<String, String>> internations) {
		if (null != internations && internations.size() > 0) {
			synchronized (internationMap) {
				AppCache.internationMap.clear();
				log.info("初始化国际化资源信息到缓存中");
				Map<String, Map<String, String>> internationMap = new HashMap<String, Map<String, String>>();
				if (internations != null) {
					for (final Map<String, String> internation : internations) {
						final Map<String, String> temp = new HashMap<String, String>();
						internationMap.put(internation.get("id"), temp);
						for (final String key : internation.keySet()) {
							final String value = internation.get(key);
							temp.put(key, value == null ? "" : value);
						}
					}
				}
				AppCache.setInternationMap(internationMap);
			}
		}
	}

	/* 将国际化信息重新存入到缓存中。 */
	public static void setInternationMap(Map<String, Map<String, String>> internationMap) {
		for (Map.Entry<String, Map<String, String>> item : internationMap.entrySet()) {
			AppCache.internationMap.put(item.getKey(), item.getValue());
		}
	}

	/**
	 * 从缓存中取得国际化资源表。<br>
	 * 注：获取中的信息不能作修改操作。
	 */
	public static Map<String, Map<String, String>> getInternationMap() {
		return AppCache.internationMap;
	}

	/* 查询指定国际化资源KEY的指定语种的信息。<br> 如果指定语种的信息没有找到，将找系统参数定义的默认语言，如果仍然没找到将返回key。 */
	public static String getInternationInfo(final String key, final String lanuage) {
		String result = null;
		final Map<String, String> map = AppCache.getInternationMap().get(key);
		if (map == null || map.size() == 0) {
			// 此key没有国际化信息。
			result = key;
		} else {
			result = map.get(lanuage);
			if (StringUtil.isEmpty(result)) {
				// 没有指定语言的国际化信息，返回默认中文。
				result = map.get("zh");
			}
			if (StringUtil.isEmpty(result)) {
				result = key;
			}
		}
		return result;
	}

	// -------------------------------国际化资源缓存相关操作----end-----------------------------------------

	// -------------------------------系统参数缓存相关操作----begin-----------------------------------------
	/* 初始化系统参数到内存中。 */
	public static void initSystemParm(final List<SystemParm> parmList) {
		log.info("初始化系统参数到内存中");
		AppCache.setLocalBankShowMap();
		if (null != parmList && parmList.size() > 0) {
			synchronized (systemParmMap) {
				systemParmMap.clear();
				Map<String, String> systemParmMap = new HashMap<String, String>();
				if (parmList != null) {
					for (final SystemParm item : parmList) {
						systemParmMap.put(item.getParameterCode(), item.getParameterValue());
					}
				}
				AppCache.setSystemParm(systemParmMap);
			}
		}
	}

	/* 从缓存中取得系统参数资源表. */
	public static Map<String, String> getSystemParmMap() {
		return AppCache.systemParmMap;
	}

	/* 根据key查找系统参数 */
	public static String getSystemParm(final String key) {
		return AppCache.getSystemParmMap().get(key);
	}

	/* 更新系统参数缓存。 */
	public static void setSystemParm(Map<String, String> systemParmMap) {
		for (Map.Entry<String, String> parm : systemParmMap.entrySet()) {
			AppCache.systemParmMap.put(parm.getKey(), parm.getValue());
		}
	}

	// -------------------------------系统参数缓存相关操作----end-----------------------------------------

	// --------------------------------钱包类别缓存 相关操作
	// begin------------------------------------------
	public static Map<String, WalletCategory> getWalletCategoryMap() {
		return walletCategoryMap;
	}

	public static void initWalletCategoryMap(Map<String, WalletCategory> map) {
		if (null != map && map.size() > 0) {
			log.info("初始化钱包类别到内存中");
			synchronized (AppCache.walletCategoryMap) {
				AppCache.walletCategoryMap.clear();
				AppCache.walletCategoryMap = map;
			}
		}

	}

	// --------------------------------钱包类别缓存 相关操作
	// end------------------------------------------

	// --------------------------------钱包类别缓存 相关操作
	// begin------------------------------------------
	public static Map<String, BankCard> getLocalBankMap() {
		return localBankMap;
	}

	public static void initLocalBankMap(Map<String, BankCard> localBankMap) {
		log.info("初始化本地银行列表到内存中");
		synchronized (AppCache.localBankMap) {
			AppCache.localBankMap.clear();
			AppCache.localBankMap = localBankMap;
		}

	}

	// --------------------------------钱包类别缓存 相关操作
	// end------------------------------------------

	// --------------------------------导航菜单静态动态缓存 相关操作
	// start------------------------------------------
	public static void initNavigationAppList(List<NavigationApp> list) {
		if (null != list && list.size() > 0) {
			log.info("初始化导航菜单到内存中");
			synchronized (navigationAppList) {
				navigationAppList.clear();
				if (list != null) {
					for (NavigationApp navigationApp : list) {
						navigationAppList.add(navigationApp);
					}
				}
			}
		}
	}

	public static List<NavigationApp> getNavigationAppList() {
		return navigationAppList;
	}

	public static void setNavigationAppList(List<NavigationApp> navigationAppList) {
		AppCache.navigationAppList = navigationAppList;
	}

	public static Map<String, NavigationApp> getNavigationAppMap() {
		return navigationAppMap;
	}

	public static void setNavigationAppMap(Map<String, NavigationApp> Map) {
		synchronized (navigationAppMap) {
			navigationAppMap.clear();
			for (Map.Entry<String, NavigationApp> entry : Map.entrySet()) {
				navigationAppMap.put(entry.getKey(), entry.getValue());
			}
		}
	}

	public static Map<String, Dict> getAliPayMap() {
		return aliPayMap;
	}

	public static void setAliPayMap(Map<String, Dict> Map) {
		synchronized (aliPayMap) {
			aliPayMap.clear();
			for (Map.Entry<String, Dict> entry : Map.entrySet()) {
				aliPayMap.put(entry.getKey(), entry.getValue());
			}
		}
	}
	
	public static Map<String, WechatPayAcc> getWechatAccMap() {
		return wechatAccMap;
	}

	public static void setWechatAccMap(Map<String, WechatPayAcc> Map) {
		synchronized (wechatAccMap) {
			wechatAccMap.clear();
			for (Map.Entry<String, WechatPayAcc> entry : Map.entrySet()) {
				wechatAccMap.put(entry.getKey(), entry.getValue());
			}
		}
	}

	// --------------------------------导航菜单静态动态缓存 相关操作
	// end------------------------------------------

	// -------------------------------易支付内存对象相关操作----begin-----------------------------------------
	/* 初始化易支付内存对象。 */
	public static void initEasyPayment(final List<EasyPayment> easyPaymentList) {
		if (null != easyPaymentList && easyPaymentList.size() > 0) {
			log.info("初始化易支付银行机构信息到平台前端系统内存中开始");
			Map<String, List<EasyPayment>> easyPaymentMapNew = new HashMap<String, List<EasyPayment>>();
			synchronized (easyPaymentMap) {
				easyPaymentMap.clear();
				if (easyPaymentList != null) {
					for (final EasyPayment item : easyPaymentList) {
						List<EasyPayment> tempList = easyPaymentMapNew.get(item.getEasyPayORGId());
						if (tempList == null) {
							// map里面还没有键值对，添加键值对。
							tempList = new ArrayList<EasyPayment>();
							easyPaymentMapNew.put(item.getEasyPayORGId(), tempList);// 向map中添加键值对。
						}
						tempList.add(item);
					}
				}
				AppCache.setEasyPaymentMap(easyPaymentMapNew);
			}
			log.info("初始化易支付银行机构信息到平台前端系统内存中成功！");
		}
	}

	public static void setEasyPaymentMap(Map<String, List<EasyPayment>> EasyPayment) {
		for (Map.Entry<String, List<EasyPayment>> item : EasyPayment.entrySet()) {
			AppCache.easyPaymentMap.put(item.getKey(), item.getValue());
		}
	}

	public static Map<String, List<EasyPayment>> getEasyPaymentMap() {
		return AppCache.easyPaymentMap;
	}

	/* 根据公司易支付银行机构id获取帐号列表 */
	public static List<EasyPayment> getEasyPaymentListById(String companyBankORGId) {
		final List<EasyPayment> easyPaymentList = AppCache.getEasyPaymentMap().get(companyBankORGId);
		return easyPaymentList;
	}

	// -------------------------------易支付内存对象相关操作----end-----------------------------------------

	// -------------------------------易支付code内存对象相关操作----begin-----------------------------------------
	// 向易支付码内存中添加新生成的易支付码。
	public static void setEasyPayCodeMap(Map<String, String> easyPayCode, Long time) {
		for (Map.Entry<String, String> item : easyPayCode.entrySet()) {
			AppCache.easyPayCodeMap.put(item.getKey(), item.getValue(), time);
		}
	}

	public static void removeEasyPayCode(String easyPayCode) {
		easyPayCodeMap.remove(easyPayCode);
	}

	// 获取内存中易支付码。
	public static Map<String, String> getEasyPayCodeMap() {
		return AppCache.easyPayCodeMap;
	}

	// -------------------------------易支付code内存对象相关操作----end-----------------------------------------

	// --------------------------------现有活动信息缓存相关的操作
	// begin------------------------------------------
	public static void initActivityList(List<Activity> list) {
		log.info("初始化现有活动信息到内存中开始！");
		synchronized (activityList) {
			activityList.clear();
			ActivityGameMap.clear();
			if (null != list) {
				for (Activity activity : list) {
					activityList.add(activity);
				}
			}
		}
		log.info("初始化现有活动信息到内存中成功！");
	}

	public static List<Activity> getActivityList() {
		return activityList;
	}

	public static void addActivityList(List<Activity> List) {
		synchronized (activityList) {
			for (Activity activity : List) {
				activityList.add(activity);
			}
		}
	}

	// --------------------------------现有活动信息缓存相关的操作
	// end------------------------------------------

	// -------------------------------现有游戏活动的参与用户信息缓存相关的操作
	// begin-------------------------------
	public static void addGameMap(List<UserActivityInfo> userActListTemp, List<UserActivityInfo> userActList) {
		for (UserActivityInfo usActInfo : userActList) {
			userActListTemp.add(usActInfo);
		}
	}

	public static void setGameMap(Map<String, Map<String, List<UserActivityInfo>>> gameMap) {
		synchronized (AppCache.ActivityGameMap) {
			for (Map.Entry<String, Map<String, List<UserActivityInfo>>> entry : gameMap.entrySet()) {
				AppCache.ActivityGameMap.put(entry.getKey(), entry.getValue());
			}
		}
	}

	public static Map<String, Map<String, List<UserActivityInfo>>> getGameMap() {
		return AppCache.ActivityGameMap;
	}

	// -------------------------------现有游戏活动的参与用户信息缓存相关的操作
	// end---------------------------------

	public static void initCurrencyMap(Map<String, Currency> map) {
		synchronized (AppCache.currencyMap) {
			AppCache.currencyMap.clear();
			for (Map.Entry<String, Currency> item : map.entrySet()) {
				AppCache.currencyMap.put(item.getKey(), item.getValue());
			}
		}

	}

	public static void initAreaMap(List<Dict> list) {
		synchronized (AppCache.dictMap) {
			// 先删掉以前的地区数据
			Map<String, List<Dict>> dictMap = AppCache.getDictMap();
			Iterator<Entry<String, List<Dict>>> it = dictMap.entrySet().iterator();
			while (it.hasNext()) {
				Entry<String, List<Dict>> entry = (Entry<String, List<Dict>>) it.next();
				if (entry.getKey().equals(Constants.NATIONALITY) || entry.getKey().contains("arealevel2_") || entry.getKey().contains("arealevel3_")) {
					it.remove();
				}
			}
			// 存入新的地区数据
			Map<String, List<Dict>> dictMapNew = new HashMap<String, List<Dict>>();
			if (list != null) {
				for (final Dict item : list) {
					if (item.getDictTypeId() == null) {
						continue;
					}
					List<Dict> tempList = dictMapNew.get(item.getDictTypeId());
					if (tempList == null) {
						// map里面还没有键值对，添加键值对。
						tempList = new ArrayList<Dict>();
						dictMapNew.put(item.getDictTypeId(), tempList);// 向map中添加键值对。
					}
					tempList.add(item);
				}
			}
			// AppCache.setDictMap(dictMapNew);
			for (Map.Entry<String, List<Dict>> item : dictMapNew.entrySet()) {
				AppCache.dictMap.put(item.getKey(), item.getValue());
			}
		}

	}

	public static void writeFreezeFile(Map<String, FreezeCount> map) {
		ObjectOutputStream oout = null;
		try {
			oout = new ObjectOutputStream(new FileOutputStream(file));
			oout.writeObject(map);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (oout != null) {
					oout.close();
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public static void readFreezeFile() {
		ObjectInputStream oin = null;
		try {
			Map<String, FreezeCount> map;
			oin = new ObjectInputStream(new FileInputStream(file));
			Object obj = oin.readObject();

			if (obj != null) {
				map = (Map<String, FreezeCount>) obj;
				synchronized (AppCache.userFundPwdErrorRecord) {
					AppCache.userFundPwdErrorRecord = map;
				}
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			try {
				if (oin != null) {
					oin.close();
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public static void setLocalBankShowMap() {
		userLocalBankShow.clear();
		userLocalBankShow = new ConcurrentHashMap<String, String>();
	}
}