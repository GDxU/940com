package com.vinbet.mobile.util;

import org.nutz.lang.random.R;
import org.nutz.log.Log;
import org.nutz.log.Logs;

/**
 * Created by Yenn on 15/12/9.
 */
public class EncryptUtil {
	private Log log = Logs.getLog(EncryptUtil.class);
	private int[] pwdArry;
	private int myKey;
	private int pubKey;

	public int getR() {
		return R.random(100000000, 999999999);
	}

	public int getPublicKey(int pk1, int pk2) {
		pubKey = pk2;
		myKey = getR();
		return pk1 ^ myKey % pubKey;
	}

	public boolean makePrivateKey(int pk) {
		try {
			int p = pk ^ myKey % pubKey;
			String[] ps = (p + "").split("");
			pwdArry = new int[ps.length - 1];
			int index = 0;
			for (String s : ps) {
				if (!s.isEmpty()) {
					pwdArry[index] = new Integer(s);
					index++;
				}
			}
			return true;
		} catch (Exception e) {
			log.error("EncryptUtil makePrivateKey error:", e);
		}
		return false;
	}

	public String encode(String str) {
		try {
			StringBuffer sb = new StringBuffer();
			String base64Str = BASE64Util.encode(str.getBytes("UTF-8"));
			int index = 0;
			for (char c : base64Str.toCharArray()) {
				int t = c - pwdArry[index];
				sb.append((char) t);
				index++;
				if (index == pwdArry.length) {
					index = 0;
				}
			}
			return BASE64Util.encode(sb.toString().getBytes("UTF-8"));
		} catch (Exception e) {
			log.error("EncryptUtil encode error:", e);
		}
		return null;
	}

	public String decode(String str) {
		try {
			str = str.replace("-", "+").replace("_", "/").replace("*", "=");
			StringBuffer sb = new StringBuffer();
			String base64Str = new String(BASE64Util.decode(str), "UTF-8");
			int index = 0;
			for (char c : base64Str.toCharArray()) {
				int t = c + pwdArry[index];
				sb.append((char) t);
				index++;
				if (index == pwdArry.length) {
					index = 0;
				}
			}
			return new String(BASE64Util.decode(sb.toString()), "UTF-8");

		} catch (Exception e) {
			log.error("EncryptUtil decode error:", e);
		}
		return null;
	}

}
