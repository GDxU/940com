package com.vinbet.mobile.service.portal;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.vinbet.mobile.domain.UserInfo;
import com.vinbet.mobile.entity.portal.BankCard;
import com.vinbet.mobile.entity.portal.EasyPayment;
import com.vinbet.mobile.entity.portal.Financer;
import com.vinbet.mobile.entity.portal.PaymentPlatform;
import com.vinbet.mobile.entity.portal.TotalWallet;
import com.vinbet.mobile.entity.portal.WalletInfo;
import com.vinbet.mobile.sys.AppCache;
import com.vinbet.mobile.sys.CEPMgrCenterClient;
import com.vinbet.mobile.sys.CEPUserCenterIceClient;
import com.vinbet.mobile.sys.PropertiesLoader;
import com.vinbet.mobile.sys.h2.H2Dao;
import com.vinbet.mobile.util.Constants;
import com.vinbet.mobile.util.Constants.PlatformReturnCode;
import com.vinbet.mobile.util.Constants.USER_OPT;
import com.vinbet.mobile.util.Constants.USER_STATUS;
import com.vinbet.mobile.util.DateUtil;
import com.vinbet.mobile.util.HttpClientUtil;
import com.vinbet.mobile.util.JsonResult;
import com.vinbet.mobile.util.MD5Util;
import com.vinbet.mobile.util.RSAUtil;
import com.vinbet.mobile.util.StringUtil;

/**
 * 存款服务层
 * 
 */
@IocBean
public class PaymentServcieImpl {
	@Inject
	private PropertiesLoader propertiesLoader;
	private Log log = Logs.getLog(PaymentServcieImpl.class);
	@Inject
	private CEPUserCenterIceClient cEPUserCenterIceClient;
	@Inject
	private CEPMgrCenterClient cEPMgrCenterClient;

	/**
	 * 系统随机生成用户存款尾数，尾数长度是在配置文件中配置的。目前配置为3
	 */
	public Double getRandomEasyPayMoney() throws Exception {
		String lengthStr = propertiesLoader.getTrim("vinbet.EasyPayDeposit.RandomLength");
		String easyPayLife = propertiesLoader.getTrim("vinbet.EasyPayLife.time");
		Long easyPayLifeTime;
		int length;
		Double randomMoney;
		try {
			length = Integer.valueOf(lengthStr);
			easyPayLifeTime = Long.valueOf(easyPayLife);
			Map<String, String> easyPayCodeMap = AppCache.getEasyPayCodeMap();// 获取内存中存在的金额尾数码
			int i = 0;
			do {
				i++;
				if (i <= 1000) {
					// 如果内存中此验证码已经存在，更换一个随机码。
					randomMoney = StringUtil.getRandomEasyPayMoney(length);
				} else {
					// 获取1000次还是和内存中的重复，则直接延长一位随机码长度。
					randomMoney = StringUtil.getRandomEasyPayMoney(++length);
				}

			} while (easyPayCodeMap.containsKey(randomMoney.toString()));// 如果内存中已经存在，更换一个。
			Map<String, String> randomTempMap = new HashMap<String, String>();
			randomTempMap.put(randomMoney.toString(), randomMoney.toString());

			AppCache.setEasyPayCodeMap(randomTempMap, easyPayLifeTime);
		} catch (Exception e) {
			throw e;
		}

		return randomMoney;

	}

	/**
	 * 随机获取一个公司的易支付帐号。
	 */
	public EasyPayment getEasyPayment(String companyBankORGId) {
		List<EasyPayment> easyPaymentList = AppCache.getEasyPaymentListById(companyBankORGId);
		if (easyPaymentList == null)
			return null;
		// 随机获取一个公司帐号。
		int index = StringUtil.getRandomListIndex(easyPaymentList.size());
		return easyPaymentList.get(index);
	}

	/**
	 * 随机获取一个支付平台对应的支付账号。
	 */
	public PaymentPlatform getPaymentPlatform(String ppid) {
		List<PaymentPlatform> paymentPlatFormList = AppCache.getPaymentPlatListByPPId(ppid);
		if (paymentPlatFormList == null || paymentPlatFormList.size() == 0)
			return null;

		int index = StringUtil.getRandomListIndex(paymentPlatFormList.size());
		return paymentPlatFormList.get(index);
	}
}
