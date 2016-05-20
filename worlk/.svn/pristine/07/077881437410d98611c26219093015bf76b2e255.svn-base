package com.vinbet.mobile.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * MD5工具類
 */
public class MD5Util {
	private static final char DIGITS[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };

	public static String md5Hex(String source) {
		String desc = null;
		try {
			byte[] data = MessageDigest.getInstance("MD5").digest(source.getBytes());
			int l = data.length;
			char out[] = new char[l << 1];
			int i = 0;
			int j = 0;
			for (; i < l; i++) {
				out[j++] = DIGITS[(240 & data[i]) >>> 4];
				out[j++] = DIGITS[15 & data[i]];
			}
			desc = new String(out);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return desc;
	}

	/**
	 * md5加密算法
	 * 
	 * @param orgin
	 *            要加密密码
	 * @return 加密后字符
	 */
	public static String md5(String orgin) {
		MessageDigest md;
		try {
			md = MessageDigest.getInstance("MD5");
			String result = byte2hex(md.digest(orgin.toString().getBytes("utf-8")));
			return result;
		} catch (Exception e) {
			throw new RuntimeException("sign error !");
		}
	}

	/**
	 * 字符转16进制
	 * 
	 * @param b
	 * @return
	 */
	private static String byte2hex(byte[] b) {
		String hs = "";
		String stmp = "";
		for (int n = 0; n < b.length; ++n) {
			stmp = Integer.toHexString(b[n] & 0xFF);
			if (stmp.length() == 1)
				hs = hs + "0" + stmp;
			else
				hs = hs + stmp;
		}
		return hs.toUpperCase();
	}

	public static String sha256(String base) {
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			byte[] hash = digest.digest(base.getBytes("UTF-8"));
			StringBuffer hexString = new StringBuffer();
			for (int i = 0; i < hash.length; i++) {
				String hex = Integer.toHexString(0xff & hash[i]);
				if (hex.length() == 1)
					hexString.append('0');
				hexString.append(hex);
			}
			return hexString.toString();
		} catch (Exception ex) {
			throw new RuntimeException(ex);
		}
	}

	public static void main(String[] args) throws Exception {
		System.out.println(sha256(md5Hex(md5Hex("111bbb").toUpperCase()).toUpperCase()));
		// System.out.println(md5Hex("z7KOVpVnI7HN99Ao"));
		String pwd = MD5Util.sha256(MD5Util.md5(MD5Util.md5("111bbb")));
		System.out.println(pwd);
		System.out.println(MD5Util.md5("a222222"));
		System.out.println(PasswordEncoder.encode("jagger2016",  MD5Util.md5("a222222")));
		System.out.println(PasswordEncoder.encode("jagger2016",  "11422340BAFCA404C4491863373311A6"));
		
	}
}
