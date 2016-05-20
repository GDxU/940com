package com.vinbet.mobile.util;

import java.io.IOException;
import java.net.ConnectException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.Consts;
import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;

import com.vinbet.mobile.sys.PropertiesLoader;

/**
 * 发送手机验证码接口类
 * 
 * <pre>
 * <功能详细描述>
 * </pre>
 * 
 * @author cjp
 * @version [Ver 1.0]
 * @since 2015-3-13 下午3:04:53
 */
@IocBean
public class PhoneCodeUtil {

	private Log logger = LogFactory.getLog(this.getClass());
	@Inject
	private PropertiesLoader propertiesLoader;

	private static String encode = "GBK";

	/** 企业账号 */
	private String username = "";

	/** 账号对应的登录密码(明文) */
	private String password = "";

	/**
	 * 账号对应的登录密码（md5加密，16位）。 password和passwordMd5参数只能选择其中一个对接， 考虑安全性使用passwordMd5参数，快速对接使用password参数。
	 */
	private String passwordMd5 = "";

	/**
	 * 该参数用可以包含多个号码，格式为目标号码+逗号,可以重复出现多次， 一次提交号码个数不要超过1000个。因为小灵通号码不支持长短信， 所以小灵通号码和其他号码分开提交发送。
	 */
	private String mobile = "";

	/**
	 * 需要发送的短信内容（GBK编码）。 支持长短信（小灵通号码除外）， 长短信一般不超过3条短信长度。单条短信的字数、 长短信每条的计费字数和支持的最大字数由使用的短信通道决定。
	 */
	private String message = "";

	/** 扩展号，支持的位数视具体业务而定 */
	private String Ext = "";

	private static String SUCCESS = ">0";
	private static String USERNAME_OR_PASSWORD_ERROR = "-1";
	private static String USERNAME_IS_NULL = "-2";
	private static String PASSWORD_IS_NULL = "-3";
	private static String MSG_IS_NULL = "-4";
	private static String PHONE_IS_NULL = "-5";
	private static String MSG_IS_TOO_LOOG = "-7";
	private static String MSG_IS_WRONG = "-8";
	private static String PHONE_IS_WORNG = "-9";
	private static String EXCEEDS_TIMES_NO_SEND = "-10";

	private static String LACK_OF_BALANCE = "-12";
	private static String NEED_COMPANY_NAME = "-15";
	private static String PHONENUMBER_COUNT_TOO_MUCH = "-16";
	private static String NOT_OPEN_INTERFACE = "-20";
	private static String MSG_SIGNATURE_WRONG = "-22";
	private static String CONNECTION_FAILED = "";
	private static String INTERNAL_SYSTEM_ERROR = "-100";

	// 国际短信返回码
	private static String Itnl_USERNAME_OR_PASSWORD_ERROR = "-1"; // 用户名或密码错误
	private static String ITNL_LACK_OF_BALANCE = "-2"; // 余额不足
	private static String ITNL_MSG_ILLEGAL = "-3"; // 包含屏蔽关键字
	private static String ITNL_PHONE_OR_MSG_IS_NULL = "-9"; // 缺少发送号码或短信内容
	private static String ITNL_NOT_ENOUGH_ARGUMENTS = "-99"; // 参数不足

	// 不需要加号 中国国家代码
	private static String china_areacode = "86";

	private static String cmd = "1";

	/**
	 * 发送手机短信
	 * 
	 * <pre>
	 * <功能详细描述>
	 * </pre>
	 * 
	 * @author cjp
	 * @param areacode
	 *            国家代码 例如 +86 +66
	 * @param mobile
	 *            手机号
	 * @param message
	 *            发送消息
	 * @since 2015-3-13 上午10:45:46
	 */
	public void sendsms(String areacode, String mobile, String message) {
		String is_send_sms = propertiesLoader.getTrim("vinbet.is_send_sms");

		if (is_send_sms.equals("false")) {
			return;
		}

		if (!StringUtil.isEmpty(areacode) && !StringUtil.isEmpty(mobile) && !StringUtil.isEmpty(message)) {

			// 去掉加号
			String tempareacode = areacode.replace("+", "").trim();
			// 手机号前面不需要加0
			String frist = mobile.substring(0, 1);
			if (frist.equals("0")) {
				mobile = mobile.substring(1, mobile.length());
			}
			if (tempareacode.equals(china_areacode)) // 发送中国
			{
				this.sendDomesticsms(mobile, message);
			} else { // 发送国外
				this.SendInternationalsms(tempareacode + mobile, message);
			}
		}
	}

	/**
	 * 向国内发送手机验证码
	 * 
	 * <pre>
	 * <功能详细描述>
	 * </pre>
	 * 
	 * @author cjp
	 * @param mobile
	 *            手机号码
	 * @param message
	 *            信息 验证码
	 * @since 2015-3-13 下午5:00:15
	 */
	private void sendDomesticsms(String mobile, String message) {

		String sendsms_url = propertiesLoader.getTrim("vinbet.sendDomesticsms_url");// 获取国内发送短信接口地址。
		username = propertiesLoader.getTrim("vinbet.sendDomesticsms_username");// 获取发送短信企业用户。
		password = propertiesLoader.getTrim("vinbet.sendDomesticsms_password");// 获取发送短信企业用户密码。
		String signature = propertiesLoader.getTrim("vinbet.sendDomesticsms_Signature");

		List<NameValuePair> nvps = new ArrayList<NameValuePair>();
		nvps.add(new BasicNameValuePair("username", DesUtils.decode(username)));
		nvps.add(new BasicNameValuePair("password", DesUtils.decode(password)));
		nvps.add(new BasicNameValuePair("mobile", mobile));
		nvps.add(new BasicNameValuePair("message", signature + message));
		String returnXmlData = HttpClientUtil.doPostRequest(DesUtils.decode(sendsms_url), nvps, encode);
		logger.info("发送短信，mobile:" + StringUtil.getStarMobile(mobile) + " message:" + signature + message);
		if (returnXmlData.equals(SUCCESS)) {
			logger.info("发送短信成功");
		} else if (returnXmlData.equals(USERNAME_OR_PASSWORD_ERROR)) {
			logger.error("账号或者密码错误");
		} else if (returnXmlData.equals(USERNAME_IS_NULL)) {
			logger.error("缺少企业账号");
		} else if (returnXmlData.equals(PASSWORD_IS_NULL)) {
			logger.error("缺少密码");
		} else if (returnXmlData.equals(MSG_IS_NULL)) {
			logger.error("缺少短信内容");
		} else if (returnXmlData.equals(PHONE_IS_NULL)) {
			logger.error("缺少目标号码");
		} else if (returnXmlData.equals(MSG_IS_TOO_LOOG)) {
			logger.error("短信内容过长(小灵通最大56个字)");
		} else if (returnXmlData.indexOf(MSG_IS_WRONG) > 0) {
			logger.error("含有非法字符");// 第二行返回非法关键词
		} else if (returnXmlData.equals(PHONE_IS_WORNG)) {
			logger.error("目标号码格式错误，或者包含错误的手机号码");
		} else if (returnXmlData.equals(EXCEEDS_TIMES_NO_SEND)) {
			logger.error("超过规定发送时间，禁止提交发送");
		} else if (returnXmlData.equals(LACK_OF_BALANCE)) {
			logger.error("余额不足");
		} else if (returnXmlData.equals(NEED_COMPANY_NAME)) {
			logger.error("发送内容前面需加签名"); // 例如【XXX公司】，签名必须放在最前面，如果内容的编码错误，出现乱码，识别不出签名【XXX公司】，也会返回-15
		} else if (returnXmlData.equals(PHONENUMBER_COUNT_TOO_MUCH)) {
			logger.error("提交号码数量小于最小提交量限制");
		} else if (returnXmlData.equals(NOT_OPEN_INTERFACE)) {
			logger.error("未开通接口");
		} else if (returnXmlData.equals(MSG_SIGNATURE_WRONG)) {
			logger.error("短信内容签名不正确");
		} else if (returnXmlData.equals(CONNECTION_FAILED)) {
			logger.error("连接失败");
		} else if (returnXmlData.equals(INTERNAL_SYSTEM_ERROR)) {
			logger.error("系统内部错误");
		}
		logger.info("发送短信返回信息，mobile:" + StringUtil.getStarMobile(mobile) + " returnXmlData:" + returnXmlData);
	}

	/**
	 * 向国外手机号发送短信
	 * 
	 * <pre>
	 * <功能详细描述>
	 * </pre>
	 * 
	 * @author cjp
	 * @param mobile
	 * @param message
	 * @since 2015-3-14 上午10:36:46
	 */
	private void SendInternationalsms(String mobile, String message) {

		String sendsms_url = propertiesLoader.getTrim("vinbet.sendInternationasms_url");// 获取国际发送短信接口地址。
		username = propertiesLoader.getTrim("vinbet.sendInternationasms_username");// 获取发送短信企业用户。
		password = propertiesLoader.getTrim("vinbet.sendInternationasms_password");// 获取发送短信企业用户密码。
		String signature = propertiesLoader.getTrim("vinbet.sendInternational_Signature");
		List<NameValuePair> nvps = new ArrayList<NameValuePair>();
		nvps.add(new BasicNameValuePair("cmd", cmd));
		nvps.add(new BasicNameValuePair("username", DesUtils.decode(username)));
		nvps.add(new BasicNameValuePair("password", DesUtils.decode(password)));
		nvps.add(new BasicNameValuePair("sendto", mobile));
		nvps.add(new BasicNameValuePair("content", signature + "-Verification Code:" + message));
		logger.info("发送短信，mobile:" + StringUtil.getStarMobile(mobile) + " message:" + message);
		String returnXmlData = HttpClientUtil.doPostRequest(DesUtils.decode(sendsms_url), nvps, encode);

		if (returnXmlData.indexOf(Itnl_USERNAME_OR_PASSWORD_ERROR) != -1) {
			logger.info("用户名或密码错误");
		}
		if (returnXmlData.indexOf(ITNL_LACK_OF_BALANCE) != -1) {
			logger.info("余额不足");
		}
		if (returnXmlData.indexOf(ITNL_MSG_ILLEGAL) != -1) {
			logger.info("包含屏蔽关键字");
		}
		if (returnXmlData.indexOf(ITNL_PHONE_OR_MSG_IS_NULL) != -1) {
			logger.info("缺少发送号码或短信内容");
		}
		if (returnXmlData.indexOf(ITNL_NOT_ENOUGH_ARGUMENTS) != -1) {
			logger.info("参数不足");
		} else {
			logger.info("发送短信成功，流水号，价格，数量：" + returnXmlData);
		}

		logger.info("发送短信返回信息，mobile:" + StringUtil.getStarMobile(mobile) + " returnXmlData:" + returnXmlData);
	}

}
