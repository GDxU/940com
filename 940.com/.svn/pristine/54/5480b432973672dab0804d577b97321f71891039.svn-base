package com.chuangdun.jsl.lab;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.InetAddress;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.net.UnknownHostException;
import java.security.MessageDigest;
import java.sql.Clob;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Base64;
import org.apache.log4j.Logger;

public class LAB {

	/**
	 * 获取请求IP
	 * 
	 * **/
	public static String IP(HttpServletRequest request) {
		String forword = request.getHeader("x-forwarded-for");// 安全宝
		if (forword != null && !"".equals(forword)) {
			if (forword.indexOf(",") > -1) {
				return forword.substring(0, forword.indexOf(","));
			}
			forword.replace("#", "");
			System.out.println();
			return forword;
		}
		return request.getRemoteAddr();
	}

	/**
	 * 按字符编码MD5
	 * 
	 * @param str
	 *            需要加密的字符串
	 * 
	 * @param encodeing
	 *            编码集
	 * 
	 * **/
	public static String md5(String str, String encodeing) {
		MessageDigest md5;
		StringBuffer md5StrBuff = new StringBuffer();
		try {
			md5 = MessageDigest.getInstance("MD5");
			if (encodeing != null && !"".equals(encodeing)) {
				md5.update(str.getBytes(encodeing));
			} else {
				md5.update(str.getBytes());
			}
			byte[] domain = md5.digest();
			for (int i = 0; i < domain.length; i++) {
				if (Integer.toHexString(0xFF & domain[i]).length() == 1) {
					md5StrBuff.append("0").append(
							Integer.toHexString(0xFF & domain[i]));
				} else
					md5StrBuff.append(Integer.toHexString(0xFF & domain[i]));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return md5StrBuff.toString().toLowerCase();
	}

	/**
	 * 按默认编码MD5
	 * 
	 * @param str
	 *            需要加密的字符串
	 * **/
	public static String md5(String str) {
		return md5(str, "");
	}

	/**
	 * 手机号归属地查询MD5
	 * 
	 * @param str
	 *            需要加密的字符串
	 * **/
	public static String md5_phone(String str) {
		return md5(str + "#@$*)!", "").toUpperCase();
	}

	/**
	 * 登录密码MD5(私用)
	 * 
	 * @param str
	 *            需要加密的字符串
	 * **/
	public static String md5_pass(String str) {
		return md5(str + ",vs/..~", "").toLowerCase();
	}

	/**
	 * 交易密码MD5(私用)
	 * 
	 * @param str
	 *            需要加密的字符串
	 * **/
	public static String md5_payment(String str) {
		return md5(str + "#@$*)!", "").toLowerCase();
	}

	/**
	 * 硬解码MD5(私用)
	 * 
	 * @param str
	 *            需要加密的字符串
	 * **/
	public static String md5_hard(String str) {
		return md5(str + "~ (*&.?", "").toLowerCase();
	}

	/**
	 * sha1加密
	 * 
	 * @param str
	 *            需要加密的字符串
	 * 
	 * **/
	public static String sha1(String str) {
		MessageDigest sha1 = null;
		StringBuffer buffer = new StringBuffer();
		try {
			sha1 = MessageDigest.getInstance("SHA1");
			sha1.update(str.getBytes());
			byte[] domain = sha1.digest();
			for (int i = 0; i < domain.length; i++) {
				if (Integer.toHexString(0xFF & domain[i]).length() == 1) {
					buffer.append("0").append(
							Integer.toHexString(0xFF & domain[i]));
				} else
					buffer.append(Integer.toHexString(0xFF & domain[i]));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return buffer.toString().toLowerCase();
	}

	/**
	 * 字符串转换成日期
	 * 
	 * @param dateStr
	 *            日期(2010-10-10 12:10:10)
	 * @param formatStr
	 *            转换格式(yyyy-MM-dd HH:mm:ss)
	 * @throws java.text.ParseException
	 * **/
	public static Date StringToDate(String dateStr, String formatStr)
			throws java.text.ParseException {
		DateFormat dd = new SimpleDateFormat(formatStr);
		Date date = null;
		date = dd.parse(dateStr);
		return date;
	}

	public static java.sql.Date StringToSqlDate(String timeStr,String format)
			throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		java.sql.Date date = new java.sql.Date(sdf.parse(timeStr).getTime());
		System.out.println(date.getTime());
		return date;

	}
	

	

	/**
	 * 字符串转换成int，有错就按默认值返回
	 * 
	 * @param s
	 *            原字符串
	 * @param defaultValue
	 *            默认值
	 * **/
	public static int parseInt(String s, int defaultValue) {
		if (!isNumber(s))
			return defaultValue;
		return Integer.parseInt(s);
	}

	public static long parseLong(String s, long defaultValue) {
		if (!isNumber(s))
			return defaultValue;
		return Long.parseLong(s);
	}

	/**
	 * 提取特定范围字符/参数
	 * 
	 * @param str
	 *            原字符串
	 * @param head
	 *            头符
	 * @param foot
	 *            尾符
	 * **/
	public static String Substring(String str, String head, String foot) {
		int i_head = str.indexOf(head) + head.length();// 头
		int i_length = str.indexOf(foot);// 尾
		if (i_head > -1 && i_length > -1)// 如果头尾都存在
		{
			return str.substring(i_head, i_length);
		} else {
			return null;
		}
	}

	/**
	 * 按格式获取当前系统时间
	 * 
	 * @param formatStr
	 *            转换格式(yyyy-MM-dd HH:mm:ss)
	 * @return String
	 * **/
	public static String getSysTime(String formatStr) {
		SimpleDateFormat dd = new SimpleDateFormat(formatStr);
		return dd.format(new Date());
	}

	/**
	 * 获取域名IP
	 * 
	 * @param domain
	 *            域名
	 * @return String IP
	 * **/
	public static String DomainToIP(String domain) {
		String ip = null;
		try {
			ip = InetAddress.getAllByName(domain)[0].getHostAddress()
					.toString();
		} catch (UnknownHostException e) {
		}
		return ip;
	}

	/**
	 * 按格式转换Timpstamp
	 * 
	 * @param t
	 *            需要转换的时间戳
	 * @param format
	 *            转换的时间格式
	 * @return String
	 * **/
	public static String formatTimestamp(Timestamp t, String format) {
		if (t != null) {
			DateFormat df = new SimpleDateFormat(format);
			return df.format(t);
		} else
			return "";
	}

	/**
	 * 获取完美世界keystore路径
	 * 
	 * @return String 路径
	 * **/
	public static String getWanmeiKeystore() {
		String basedir = System.getProperty("user.dir");
		if (!basedir.endsWith("/")) {
			basedir += "/";
		}

		if (basedir.indexOf(":") == -1) { // for LINUX OS
			basedir = "/" + basedir;
		}
		return basedir + "/keystore/wanmei.keystore";
	}

	/**
	 * 日期格式的字符串按新的格式返回字符串
	 * 
	 * @param dateStr
	 *            日期(2010-10-10 12:10:10)
	 * @param formatStr
	 *            转换格式(yyyy-MM-dd HH:mm:ss)
	 * @throws java.text.ParseException
	 * **/
	public static String StringToDateToString(String dateStr, String format,
			String newFormat) {
		if (dateStr != null) {
			Date date = null;
			try {
				date = StringToDate(dateStr, format);
			} catch (ParseException e) {
				return null;
			}
			SimpleDateFormat sdf = new SimpleDateFormat(newFormat);
			return sdf.format(date);
		} else {
			return "";
		}
	}

	/**
	 * 日期格式的字符串按新的格式返回字符串
	 * 
	 * @param dateStr
	 *            日期(2010-10-10 12:10:10)
	 * @param formatStr
	 *            转换格式(yyyy-MM-dd HH:mm:ss)
	 * @throws java.text.ParseException
	 * **/
	public static Date StringToDate(String dateStr, String format,
			String newFormat) {
		if (dateStr != null) {
			Date date = null;
			try {
				date = StringToDate(dateStr, format);
			} catch (ParseException e) {
				return null;
			}
			return date;
		} else {
			return new Date();
		}
	}

	/**
	 * 判断是否数字
	 * 
	 * @param str
	 * **/
	public static boolean isNumber(String str) {
		if (str == null || "".equals(str))
			return false;
		return str.matches("^[-]?[0-9]+");
	}

	/**
	 * 判断是否金额
	 * 
	 * @param str
	 * **/
	public static boolean isBigDecimal(String str) {
		java.util.regex.Matcher match = null;
		if (isNumber(str) == true) {
			java.util.regex.Pattern pattern = java.util.regex.Pattern
					.compile("^[+-]?[0-9]*");
			match = pattern.matcher(str.trim());
		} else {
			if (str.trim().indexOf(".") == -1) {
				java.util.regex.Pattern pattern = java.util.regex.Pattern
						.compile("^[+-]?[0-9]*");
				match = pattern.matcher(str.trim());
			} else {
				java.util.regex.Pattern pattern = java.util.regex.Pattern
						.compile("^[+-]?[0-9]+(\\.\\d{1,100}){1}");
				match = pattern.matcher(str.trim());
			}
		}
		return match.matches();
	}

	/**
	 * 转换null成空
	 * 
	 * @param str
	 * **/
	public static String replaceNull(String str) {
		if (str == null || "null".equals(str))
			return "www.940.com";
		else
			return str;

	}

	/**
	 * 把字符串中间字符替换成星号
	 * 
	 * @param str
	 * @param c
	 *            *号的个数
	 * @param e
	 *            尾部留几个数
	 * **/
	public static String replaceChar(String str, int c, int e) {
		if (str == null || "".equals(str)) {
			return "";
		} else if ("N".equals(str))
			return str;
		else {
			StringBuffer sb = new StringBuffer();
			int len = str.length();
			int a = c + e;
			int b = 0;// 开始索引
			int end = len - e;// 结束索引
			if (len > a) {
				b = len - a;
				for (int i = 0; i < len; i++) {
					if (i < b || i >= end) {
						sb.append(str.charAt(i));
					} else {
						sb.append("*");
					}
				}
			} else {
				for (int i = 0; i < str.length(); i++) {
					if (i < end) {
						sb.append(str.charAt(i));
					} else {
						sb.append("*");
					}
				}
			}
			return sb.toString();
		}
	}

	/**
	 * @description 客户端
	 * @param int client
	 * @return String
	 * @author A.C
	 */
	public static String getClientText(int client) {
		String c = "API";
		switch (client) {
		case 0:
			c = "API";
			break;
		case -1:
			c = "淘宝离线托管";
			break;
		case -2:
			c = "拍拍离线托管";
			break;
		case 1:
			c = "淘宝本地监控";
			break;
		case 2:
			c = "拍拍本地监控";
			break;
		case 10:
			c = "pc";
			break;
		case 11:
			c = "wap";
			break;
		case 12:
			c = "iPhone";
			break;
		case 13:
			c = "android";
			break;
		case 16:
			c = "手机网页";
			break;
		case 17:
			c = "电脑网页";
			break;
		case 20:
			c = "管理员(自动)";
			break;
		case 21:
			c = "管理员(手动)";
			break;
		case 40:
			c = "pc(实物)";
			break;
		default:
			c = "未知主机";
			break;
		}

		return c;
	}

	public static String getShopText(int shop) {
		String c = "系统";
		switch (shop) {
		case 1:
			c = "淘宝";
			break;
		case 2:
			c = "拍拍";
			break;
		default:
			break;
		}

		return c;
	}

	public static String getAutoText(int client) {
		if (client < 0) {
			return "自动";
		} else {
			return "手动";

		}
	}

	/**
	 * @description IP转换成数字
	 * @param ip
	 * @return long
	 * @author A.C
	 */
	public static long IpToLong(String ip) {
		String arr[] = ip.split("\\.");
		if (arr.length == 4) {
			long ip0 = Long.parseLong(arr[0]);
			long ip1 = Long.parseLong(arr[1]);
			long ip2 = Long.parseLong(arr[2]);
			long ip3 = Long.parseLong(arr[3]);
			return (ip0 * 256 * 256 * 256 + ip1 * 256 * 256 + ip2 * 256 + ip3);
		} else {
			return 0;
		}

	}

	/**
	 * 去掉小数点后多余的0
	 * 
	 * **/
	public static String subZeroAndDot(String s) {
		if (s.indexOf(".") > 0) {
			s = s.replaceAll("0+?$", "");// 去掉多余的0
			s = s.replaceAll("[.]$", "");// 如最后一位是.则去掉
		}
		return s;
	}

	/**
	 * 财务类型
	 * **/
	public static String getFinanceText(int type) {
		String s = "";
		switch (type) {
		case 1:
			s = "转入账";
			break;
		case -1:
			s = "转出账";
			break;
		case 2:
			s = "转账手续费";
			break;

		case 3:
			s = "快提";
			break;
		case 4:
			s = "慢提";
			break;
		case 5:

			s = "网店加款";
			break;
		case 6:
			s = "直储";
			break;
		case 13:
			s = "普及版";
			break;
		case 15:
			s = "专业版";
			break;
		case 16:
			s = "豪华版";
			break;
		case 29:
			s = "返销";
			break;
		case 30:
			s = "自动退款";
			break;
		case 31:
			s = "人工退款";
			break;
		case 34:
			s = "蓝钻";
			break;
		case 35:
			s = "红钻";
			break;
		case 36:
			s = "绿钻";
			break;
		case 41:
			s = "短信套餐";
			break;
		case 42:
			s = "密保卡";
			break;
		case 43:
			s = "激活码";
			break;
		case 44:
			s = "推广客佣金";
			break;
		case 45:
			s = "实物销售";
			break;
		case 46:
			s = "靓号";
			break;
		case 47:
			s = "工资";
			break;
		case 48:
			s = "供货商结款";
			break;
		case 49:
			s = "注销账号";
			break;
		case 50:
			s = "开通安全盾";
			break;
		case 100:
			s = "中国移动";
			break;
		case 101:
			s = "中国联通";
			break;
		case 102:
			s = "中国电信";
			break;
		case 103:
			s = "电信固话";
			break;
		case 200:
			s = "QQ业务";
			break;
		case 201:
			s = "Q币/Q点";
			break;
		case 300:
			s = "游戏点卡";
			break;
		case 301:
			s = "巨人一卡通";
			break;
		case 302:
			s = "魔兽世界";
			break;
		case 303:
			s = "盛大点券";
			break;
		default:
			s = type + "";
			break;
		}
		return s;
	}

	/**
	 * 获取性别
	 * **/
	public static String getSexText(int sex) {
		String c = "保密";
		switch (sex) {
		case 1:
			c = "男";
			break;
		case 2:
			c = "女";
			break;
		default:
			break;
		}

		return c;
	}

	/**
	 * 获取用户日志类型
	 * **/
	public static String getUserlogTypeText(int type) {
		String c = "未知";
		switch (type) {
		case 1:
			c = "登录日志";
			break;
		case 2:
			c = "操作日志";
			break;
		case 3:
			c = "充值日志";
			break;
		case 100:
			c = "管理员操作";
			break;
		case 101:
			c = "注销账号";
			break;
		default:
			break;
		}

		return c;
	}

	/**
	 * 获取黑名单类型
	 * **/
	public static String getBlackTypeText(int type) {
		String c = "未知";
		switch (type) {
		case 1:
			c = "登录";
			break;
		case 2:
			c = "充值";
			break;
		case 3:
			c = "白名单";
			break;
		default:
			break;
		}

		return c;
	}

	/**
	 * 获取产品大类
	 * **/
	public static String getProductBigTypeText(int type) {
		String c = "未知";
		switch (type) {
		case 1:
			c = "手机";
			break;
		case 2:
			c = "QQ";
			break;
		case 3:
			c = "游戏";
			break;
		default:
			break;
		}

		return c;
	}

	/**
	 * 获取产品小类
	 * **/
	public static String getProductTypeText(int type) {
		String c = "未知";
		switch (type) {
		case 100:
			c = "中国移动";
			break;
		case 101:
			c = "中国联通";
			break;
		case 102:
			c = "中国电信";
			break;
		case 103:
			c = "电信固话";
			break;
		case 200:
			c = "QQ业务";
			break;
		case 201:
			c = "Q币/Q点";
			break;
		case 300:
			c = "游戏点券";
			break;
		case 301:
			c = "巨人一卡通";
			break;
		case 302:
			c = "魔兽世界";
			break;
		case 303:
			c = "盛大点券";
			break;
		default:
			break;
		}

		return c;
	}

	public static String my(HttpServletRequest request, String name) {
		String username = getCookie(request, "Name");
		String power = getCookie(request, "Power");
		String key = getCookie(request, "Key");
		String strLoginKey = LAB.md5(username + "&*()" + power);
		if (strLoginKey.equals(key)) {
			if ("Name".equals(name)) {
				return username;
			} else if ("Power".equals(name)) {
				return power;
			}
		}
		return null;
	}

	/**
	 * 写入cookie
	 * **/
	public static void setCookie(HttpServletResponse response, String name,
			String value, boolean remember) {
		Cookie cookie = new Cookie("SUDUDA_COM_" + name, value);
		if (remember) {
			cookie.setMaxAge(25920000);// 300天
		}
		response.addCookie(cookie);
	}

	/**
	 * 读取cookie
	 * **/
	public static String getCookie(HttpServletRequest request, String name) {
		name = "SUDUDA_COM_" + name;
		Map<String, Cookie> cookieMap = ReadCookieMap(request);
		if (cookieMap.containsKey(name)) {
			Cookie cookie = (Cookie) cookieMap.get(name);
			return cookie.getValue();
		} else {
			return null;
		}
	}

	/**
	 * 写入cookie
	 * **/
	public static void CookieSet(HttpServletResponse response, String name,
			String value, boolean remember) {
		Cookie cookie = new Cookie("SUDUDA_COM_" + name.replace("@", "~"),
				value);
		if (remember) {
			cookie.setMaxAge(315360000);// 10年
		}
		cookie.setPath("/");
		response.addCookie(cookie);
	}

	public static void CookieSet(HttpServletResponse response, String name,
			String value, String path) {
		Cookie cookie = new Cookie("SUDUDA_COM_" + name, value);
		cookie.setMaxAge(315360000);// 10年
		cookie.setPath(path);
		response.addCookie(cookie);
	}

	/**
	 * 读取cookie
	 * **/
	public static String CookieGet(HttpServletRequest request, String name) {
		name = "SUDUDA_COM_" + name;
		Map<String, Cookie> cookieMap = ReadCookieMap(request);
		if (cookieMap.containsKey(name)) {
			Cookie cookie = (Cookie) cookieMap.get(name);
			return cookie.getValue();
		} else {
			return null;
		}
	}

	/**
	 * 判断证书是否正确
	 * **/
	public static String HardIsOK(HttpServletRequest request, String name) {

		name = name.replace("@", "~");
		String hardstatus = CookieGet(request, name + "_hardstatus");
		if (hardstatus == null || "".equals(hardstatus)) {
			return "9";
		}
		String hard = CookieGet(request, name + "_hard");
		String key = CookieGet(request, name + "_hardkey");
		String cer = LAB.md5(name + "~ +_ )" + hard + hardstatus);
		if (cer.equals(key)) {
			return "1";
		}
		return "0";

	}

	/**
	 * 判断证书是否正确
	 * **/
	public static String CertificateIsOK(String username, String cert_key) {
		if (cert_key.indexOf("-") > -1) {
			String arr[] = cert_key.split("-");
			String cert = LAB.md5(username + "~ +_ )" + arr[1]);
			cert = cert.substring(6, 22);
			if (cert.equals(arr[0])) {
				return "1";
			}
			return "0";
		} else {
			return "0";
		}

	}

	/**
	 * 将cookie封装到Map里面
	 * 
	 * @param request
	 * @return
	 */
	private static Map<String, Cookie> ReadCookieMap(HttpServletRequest request) {
		Map<String, Cookie> cookieMap = new HashMap<String, Cookie>();
		Cookie[] cookies = request.getCookies();
		if (null != cookies) {
			for (Cookie cookie : cookies) {
				cookieMap.put(cookie.getName(), cookie);
			}
		}
		return cookieMap;
	}

	public static boolean isEmail(String email) {
		if ("".equals(email)) {
			return false;
		}
		Pattern pattern = Pattern
				.compile("\\w+([-_.]\\w+)*@\\w+([-_.]\\w+)*\\.\\w+([-_.]\\w+)*");
		return pattern.matcher(email).matches();
	}

	public static String replaceLink(String link, String val) {
		if (val == null || "".equals(val))
			return "";
		if ("N".equals(val))
			return val;
		else {
			return "<a href=\"" + link + val + "\">" + val + "</a>";
		}
	}

	/**
	 * 获取小数点后几位
	 * 
	 * @param s小数点位数
	 * @param value
	 *            需要转换的值
	 * **/
	public static float getScaleValue(int s, float value) {
		String val = value + "";
		int len = val.length() - (val.indexOf(".") + 1);// 小数点后的位数
		if (len <= s) {
			return value;
		} else {
			BigDecimal bd = new BigDecimal(value);
			bd = bd.setScale(s, BigDecimal.ROUND_DOWN);// 小数点后三位，去尾法
			return bd.floatValue();
		}
	}

	public static String getShopsellerStatusText(int status) {
		String c = "未知";
		switch (status) {
		case -10:
			c = "申请托管";
			break;
		case 10:
			c = "托管中";
			break;
		case -9:
			c = "申请退出";
			break;
		case 1:
			c = "本地监控";
			break;
		case 0:
			c = "未监控";
			break;
		default:
			break;
		}

		return c;
	}

	public static String getAreaText(int area) {
		String s = area + "";
		switch (area) {
		case 0:
			s = "全国";
			break;
		case 11:
			s = "北京";
			break;
		case 12:
			s = "天津";
			break;
		case 13:
			s = "河北";
			break;
		case 14:
			s = "山西";
			break;
		case 15:
			s = "内蒙古";
			break;
		case 21:
			s = "辽宁";
			break;
		case 22:
			s = "吉林";
			break;
		case 23:
			s = "黑龙江";
			break;
		case 31:
			s = "上海";
			break;
		case 32:
			s = "江苏";
			break;
		case 33:
			s = "浙江";
			break;
		case 34:
			s = "安徽";
			break;
		case 35:
			s = "福建";
			break;
		case 36:
			s = "江西";
			break;
		case 37:
			s = "山东";
			break;
		case 41:
			s = "河南";
			break;
		case 42:
			s = "湖北";
			break;
		case 43:
			s = "湖南";
			break;
		case 44:
			s = "广东";
			break;
		case 45:
			s = "广西";
			break;
		case 46:
			s = "海南";
			break;
		case 50:
			s = "重庆";
			break;
		case 51:
			s = "四川";
			break;
		case 52:
			s = "贵州";
			break;
		case 53:
			s = "云南";
			break;
		case 54:
			s = "西藏";
			break;
		case 61:
			s = "陕西";
			break;
		case 62:
			s = "甘肃";
			break;
		case 63:
			s = "青海";
			break;
		case 64:
			s = "宁夏";
			break;
		case 65:
			s = "新疆";
			break;
		default:
			break;
		}
		return s;
	}

	public static void logs(String name, String error) {
		Logger log = Logger.getLogger(name);
		log.info(error);
	}

	public static String getArticleType(int type) {
		String txt = type + "";
		switch (type) {
		case 1:
			txt = "建议";
			break;
		case 2:
			txt = "投诉";
			break;
		case 10:
			txt = "系统公告";
			break;
		case 11:
			txt = "维护公告";
			break;
		default:
			break;
		}
		return txt;
	}

	/**
	 * @param str
	 *            需要转换的字符串
	 * @param style
	 *            转换后的样式
	 * @param begin
	 *            开始字符串 以0开始
	 * @param len
	 *            转换字符个数
	 * 
	 * **/
	public static String replaceSpanColor(String str, String style) {
		StringBuffer sb = new StringBuffer();
		int begin = 0, len = 0;
		if (str == null)
			str = "";
		if (str.length() == 11
				&& (str.indexOf("18") == 0 || str.indexOf("13") == 0 || str
						.indexOf("15") == 0))// 手机
		{
			begin = 3;
			len = 4;
			String beginStr = str.substring(0, begin);
			String midelStr = str.substring(begin, begin + len);
			String endStr = str.substring(begin + len);
			sb.append(beginStr + "<b class='" + style + "'>" + midelStr
					+ "</b>" + endStr);
		} else if (isNumber(str)) // QQ
		{
			int l = str.length();
			switch (l) {
			case 5:
				begin = 0;
				len = 1;
				break;
			case 6:
				begin = 0;
				len = 2;
				break;
			case 7:
				begin = 0;
				len = 3;
				break;
			case 8:
				begin = 0;
				len = 4;
				break;
			case 9:
				begin = 1;
				len = 4;
				break;
			case 10:
				begin = 2;
				len = 4;
				break;
			case 11:
				begin = 3;
				len = 4;
				break;
			case 12:
				begin = 4;
				len = 4;
				break;
			default:
				break;
			}
			String beginStr = str.substring(0, begin);
			String midelStr = str.substring(begin, begin + len);
			String endStr = str.substring(begin + len);
			if ("".equals(endStr)) {
				endStr = midelStr;
				midelStr = "";
			}
			sb.append(beginStr + "<b class='" + style + "'>" + midelStr
					+ "</b>" + endStr);
		} else {
			sb.append(str);
		}
		return sb.toString();
	}

	public static String decode(String param)
			throws UnsupportedEncodingException {
		return URLDecoder.decode(param, "UTF-8");
	}

	public static String encode(String param)
			throws UnsupportedEncodingException {
		return URLEncoder.encode(param, "UTF-8");
	}

	public static String replaceUrl(String url) {
		String patternStr = "(http|https)://[\\w+\\./-?/+/%@&/+]*";
		Pattern pattern = Pattern.compile(patternStr, Pattern.DOTALL);
		Matcher matcher = null;
		matcher = pattern.matcher(url);

		while (matcher != null && matcher.find()) {
			int a = matcher.groupCount();
			while ((a--) > 0) {
				if (a == 0) {
					url = url.replace(matcher.group(a),
							"<a href='" + matcher.group(a)
									+ "' target='_blank'>点此打开</a>");
				}
			}
		}
		return url;
		// StringBuffer sb=new StringBuffer();
		// int h=url.indexOf("http");
		// if(h>-1)
		// {
		// sb.append(url.substring(0,h));
		// sb.append("<a href='");
		// url=url.substring(h);
		// int k=url.indexOf(" ");
		// if(k>-1)
		// {
		// sb.append(url.substring(0,k)+"' target='_blank'>点此打开</a>");
		// sb.append(url.substring(k));
		// }
		// else
		// {
		// sb.append(url+"' target='_blank'>点此打开</a>");
		// }
		//
		// }
		// else {
		// sb.append(url);
		// }
		// return sb.toString();
	}

	public static String extractStr(String content, String reg) {
		String str = "";
		Pattern pattern = Pattern.compile(reg, Pattern.CASE_INSENSITIVE);
		Matcher matcher = pattern.matcher(content);
		while (matcher.find()) {
			str = matcher.group();
		}
		return str;
	}

	/**
	 * 按概率输出加款地址
	 * 
	 * **/
	public static String getSavingUrl(String url) {
		String u = "";
		String[] tmp = url.split("\n");

		int i = tmp.length;

		if (i == 1) {
			u = url;
		} else {
			Random r = new Random();
			int l = r.nextInt(i);
			u = tmp[l];
			if (u.indexOf("taobao.com") < 0) {
				u = "http://chuangdun.taobao.com";
			}
			// String mi=getSysTime("mm");
			// int m=Integer.parseInt(mi);
			// switch (i)
			// {
			// case 2:
			// if(m<40)
			// {
			// u=tmp[0];
			// }
			// else
			// {
			// u=tmp[1];
			// }
			// break;
			// case 3:
			// if(m<25)
			// {
			// u=tmp[0];
			// }
			// else if(m>25&m<50)
			// {
			// u=tmp[1];
			// }
			// else
			// {
			// u=tmp[2];
			// }
			// break;
			// default:
			// Random r = new Random();
			// int l = r.nextInt(i);
			// u=tmp[l];
			// break;
			// }
		}
		return u;
	}

	/**
	 * 检查索引文件是否存在
	 * **/
	public static boolean isIndexExisted(String path) {
		try {
			File dir = new File(path);
			if (dir.listFiles().length > 0)
				return true;
			else
				return false;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public static String guid() {
		String str = UUID.randomUUID().toString();
		str = str.replace("-", "").substring(0, 16);
		return str;
	}

	public static String httpget(String url) {
		return httpget(url, "UTF-8", null);
	}

	public static String httpget(String url, String charset) {
		return httpget(url, charset, null);
	}

	public static String httpget(String url, Map<String, String> header) {
		return httpget(url, "UTF-8", header);
	}

	public static String httpget(String url, String charset,
			Map<String, String> header) {
		BufferedReader br = null;
		String tips = "";
		try {
			URL host = new URL(url);
			HttpURLConnection connection = (HttpURLConnection) host
					.openConnection();
			if (header != null && !header.isEmpty()) {
				for (Map.Entry<String, String> m : header.entrySet()) {
					connection.setRequestProperty(m.getKey(), m.getValue());
				}
			}
			// connection.setRequestProperty("User-Agent",
			// "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36 OPR/26.0.1656.60 (Edition Campaign 18)");
			// connection.setRequestProperty("Cookie",
			// "cna=rHo2DB2HeAMCAXFbg0lpZfg/; miid=4266849237290114150; l=chang2030::1408874459268::11; thw=cn; __utma=1.892851791.1414504594.1414731114.1415685100.3; __utmz=1.1415685100.3.3.utmcsr=mai.taobao.com|utmccn=(referral)|utmcmd=referral|utmcct=/seller_admin.htm; cainiao_abtest=1; x=e%3D1%26p%3D*%26s%3D0%26c%3D0%26f%3D0%26g%3D0%26t%3D0%26__ll%3D-1%26_ato%3D0; uc2=wuf=http%3A%2F%2Fmail.163.com%2Fjs6%2Fread%2Freadhtml.jsp%3Fssid%3D%252f6otjf7LAiBOmJe8o%252bN5hsSI4VnRnNCk8Ghm%252fxVBJHU%253d%26mid%3D163%3A1tbiowYtD1D%2BXCzM9gABsi%26font%3D15%26color%3D064977; lzstat_uv=2380811731707049997|1723936@2948565@2801066@2043323@3045821@2945730@2798379@2945527@2966542@3349933@2765337@3201199@3514461@3492151@3469614@2981197@2718185@3432847@2512732@3529709@3524859@3524954@3524861@3524863@3524865@3476526@2738597@2831558@2706017; ali_ab=58.61.50.76.1406523081753.1; ck1=; uc3=nk2=AHLWi98F6Af3&id2=UUtCHfFdxMo%3D&vt3=F8dATkWgXm4uBIIELaA%3D&lg2=UtASsssmOIJ0bQ%3D%3D; unt=chang2030%26center; lgc=chang2030; tracknick=chang2030; _cc_=WqG3DMC9EA%3D%3D; tg=0; mt=ci=9_1&cyk=1_0; isg=4013128EAFACAA2C2275208D714DEF68; v=0; cookie2=1c09c5168796aea3e7a1d624df293609; t=18a06a06fe1b7b6921f6e609e97c71c0");
			br = new BufferedReader(new InputStreamReader(
					connection.getInputStream(), charset));
			String s = "";
			StringBuffer sb = new StringBuffer("");
			while ((s = br.readLine()) != null) {
				sb.append(s);
			}
			tips = sb.toString();
			sb.setLength(0);// 清空 （此法效率最高）
			br.close();
			br = null;

		} catch (Exception err) {
			err.printStackTrace();
			if (br != null)// 避免二次try (不放在finally块，避免每次if判断)
			{
				try {
					br.close();// 关闭BufferedReader
				} catch (Exception e) {

				}
			}
		}

		return tips;

	}

	public static String httpsget(String url, String charset,
			Map<String, String> header) throws Exception {
		TrustManager[] tm = { new MyX509TrustManager() };
		SSLContext sslContext = SSLContext.getInstance("SSL", "SunJSSE");

		sslContext.init(null, tm, new java.security.SecureRandom());

		// 从上述SSLContext对象中得到SSLSocketFactory对象
		SSLSocketFactory ssf = sslContext.getSocketFactory();

		BufferedReader br = null;
		String tips = "";
		try {
			URL host = new URL(url);
			HttpsURLConnection connection = (HttpsURLConnection) host
					.openConnection();
			if (header != null && !header.isEmpty()) {
				for (Map.Entry<String, String> m : header.entrySet()) {
					connection.setRequestProperty(m.getKey(), m.getValue());
				}
			}
			// connection.setRequestProperty("User-Agent",
			// "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36 OPR/26.0.1656.60 (Edition Campaign 18)");
			// connection.setRequestProperty("Cookie",
			// "cna=rHo2DB2HeAMCAXFbg0lpZfg/; miid=4266849237290114150; l=chang2030::1408874459268::11; thw=cn; __utma=1.892851791.1414504594.1414731114.1415685100.3; __utmz=1.1415685100.3.3.utmcsr=mai.taobao.com|utmccn=(referral)|utmcmd=referral|utmcct=/seller_admin.htm; cainiao_abtest=1; x=e%3D1%26p%3D*%26s%3D0%26c%3D0%26f%3D0%26g%3D0%26t%3D0%26__ll%3D-1%26_ato%3D0; uc2=wuf=http%3A%2F%2Fmail.163.com%2Fjs6%2Fread%2Freadhtml.jsp%3Fssid%3D%252f6otjf7LAiBOmJe8o%252bN5hsSI4VnRnNCk8Ghm%252fxVBJHU%253d%26mid%3D163%3A1tbiowYtD1D%2BXCzM9gABsi%26font%3D15%26color%3D064977; lzstat_uv=2380811731707049997|1723936@2948565@2801066@2043323@3045821@2945730@2798379@2945527@2966542@3349933@2765337@3201199@3514461@3492151@3469614@2981197@2718185@3432847@2512732@3529709@3524859@3524954@3524861@3524863@3524865@3476526@2738597@2831558@2706017; ali_ab=58.61.50.76.1406523081753.1; ck1=; uc3=nk2=AHLWi98F6Af3&id2=UUtCHfFdxMo%3D&vt3=F8dATkWgXm4uBIIELaA%3D&lg2=UtASsssmOIJ0bQ%3D%3D; unt=chang2030%26center; lgc=chang2030; tracknick=chang2030; _cc_=WqG3DMC9EA%3D%3D; tg=0; mt=ci=9_1&cyk=1_0; isg=4013128EAFACAA2C2275208D714DEF68; v=0; cookie2=1c09c5168796aea3e7a1d624df293609; t=18a06a06fe1b7b6921f6e609e97c71c0");
			br = new BufferedReader(new InputStreamReader(
					connection.getInputStream(), charset));
			String s = "";
			StringBuffer sb = new StringBuffer("");
			while ((s = br.readLine()) != null) {
				sb.append(s);
			}
			tips = sb.toString();
			sb.setLength(0);// 清空 （此法效率最高）
			br.close();
			br = null;

		} catch (Exception err) {
			err.printStackTrace();
			if (br != null)// 避免二次try (不放在finally块，避免每次if判断)
			{
				try {
					br.close();// 关闭BufferedReader
				} catch (Exception e) {

				}
			}
		}

		return tips;

	}

	public static String clobToString(Clob clob) throws SQLException {
		return clob != null ? clob.getSubString(1, (int) clob.length()) : "";
	}

	public static String NumberToABC(String num) {
		num = num.replace("0", "o");
		num = num.replace("1", "a");
		num = num.replace("2", "b");
		num = num.replace("3", "c");
		num = num.replace("4", "d");
		num = num.replace("5", "e");
		num = num.replace("6", "f");
		num = num.replace("7", "g");
		num = num.replace("8", "h");
		num = num.replace("9", "i");
		return num;
	}

	public static String ABCToNumber(String abc) {
		abc = abc.replace("o", "0");
		abc = abc.replace("a", "1");
		abc = abc.replace("b", "2");
		abc = abc.replace("c", "3");
		abc = abc.replace("d", "4");
		abc = abc.replace("e", "5");
		abc = abc.replace("f", "6");
		abc = abc.replace("g", "7");
		abc = abc.replace("h", "8");
		abc = abc.replace("i", "9");
		return abc;
	}

	//首页根据 游标位置返回 样式名
	public static String getClassByIndex(int index){
		if(index ==0){
			return "cur";
		}else
			return "";
	}
	//首页根据 游标位置返回 样式名
		public static String getClassByIndex1(int index){
			if(index ==0){
				return "cur";
			}else
				return "";
		}
		
	
	public static String getHtml2Text(String HTMLStr) {
		String htmlStr = HTMLStr;
		String textStr = "";
		java.util.regex.Pattern p_script;
		java.util.regex.Matcher m_script;
		java.util.regex.Pattern p_style;
		java.util.regex.Matcher m_style;
		java.util.regex.Pattern p_html;
		java.util.regex.Matcher m_html;
		try {
			String regEx_script = "<[\\s]*?script[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?script[\\s]*?>";
			String regEx_style = "<[\\s]*?style[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?style[\\s]*?>";
			String regEx_html = "<[^>]+>";
			p_script = Pattern.compile(regEx_script, Pattern.CASE_INSENSITIVE);
			m_script = p_script.matcher(htmlStr);
			htmlStr = m_script.replaceAll("");
			p_style = Pattern.compile(regEx_style, Pattern.CASE_INSENSITIVE);
			m_style = p_style.matcher(htmlStr);
			htmlStr = m_style.replaceAll("");
			p_html = Pattern.compile(regEx_html, Pattern.CASE_INSENSITIVE);
			m_html = p_html.matcher(htmlStr);
			htmlStr = m_html.replaceAll("");
			textStr = htmlStr.replaceAll(" ", "");
			textStr = htmlStr.replaceAll("<", "<");
			textStr = htmlStr.replaceAll(">", ">");
			textStr = htmlStr.replaceAll("&", "&");
		} catch (Exception e) {
			// System.err.println("Html2Text: " + e.getMessage());
		}
		return textStr;
	}

	/**
	 * @param bytes
	 * @return
	 */
	public static byte[] decode64(final byte[] bytes) {
		return Base64.decodeBase64(bytes);
	}

	public static String getBASE64(byte[] b) {
		String s = null;
		if (b != null) {
			s = new sun.misc.BASE64Encoder().encode(b);
		}
		return s;
	}

	public static byte[] getFromBASE64(String s) {
		byte[] b = null;
		if (s != null) {
			sun.misc.BASE64Decoder decoder = new sun.misc.BASE64Decoder();
			try {
				b = decoder.decodeBuffer(s);
				return b;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return b;
	}

	public static String getSSOStr(String which, String SSO) {
		try {
			SSO = new String(getFromBASE64(SSO), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		int index = SSO.indexOf("!vab");
		String result = null;
		if (which.equals("user")) {

			result = SSO.substring(0, index);
		} else if (which.equals("password")) {
			result = SSO.substring(index + 4);
		}
		return result;
	}

}
