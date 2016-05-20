package com.vinbet.mobile.util;

import java.security.Key;
import java.security.Security;

import javax.crypto.Cipher;

import org.apache.commons.lang.StringUtils;
import org.nutz.log.Log;
import org.nutz.log.Logs;

/**
 * 加密工具
 */
public class DesUtils {

	private static Log logger = Logs.getLog(DesUtils.class);
	/** 字符串默认键值 **/
	private static String strDefaultKey = "encodeField";

	/** 加密工具 **/
	private static Cipher encryptCipher = null;

	/** 解密工具 **/
	private static Cipher decryptCipher = null;

	private static DesUtils des = null;

	static {
		try {
			des = new DesUtils();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 
	 */
	public DesUtils() throws Exception {
		this(strDefaultKey);
	}

	public DesUtils(String strKey) throws Exception {
		Security.addProvider(new com.sun.crypto.provider.SunJCE());
		Key key = getKey(strKey.getBytes());

		encryptCipher = Cipher.getInstance("DES");
		encryptCipher.init(Cipher.ENCRYPT_MODE, key);

		decryptCipher = Cipher.getInstance("DES");
		decryptCipher.init(Cipher.DECRYPT_MODE, key);
	}

	public static DesUtils getInstannce() {
		return des;
	}

	public static byte[] encrypt(byte[] arrB) throws Exception {
		return encryptCipher.doFinal(arrB);
	}

	/**
	 * 加密
	 * 
	 * @param strIn
	 *            加密字符
	 * @return
	 * @throws Exception
	 */
	public static String encode(String strIn) {
		try {
			if (StringUtils.isEmpty(strIn)) {
				return "";
			}
			return byteArr2HexStr(encrypt(strIn.getBytes()));
		} catch (Exception e) {
			logger.error("加密出错,加密的原始文字:" + strIn, e);
			return "";
		}
	}

	public static byte[] decrypt(byte[] arrB) throws Exception {
		return decryptCipher.doFinal(arrB);
	}

	/**
	 * 解密
	 * 
	 * @param strIn
	 *            解密
	 * @return
	 * @throws Exception
	 */
	public static String decode(String strIn) {
		try {
			if (StringUtils.isEmpty(strIn)) {
				return "";
			}
			return new String(decrypt(hexStr2ByteArr(strIn)));
		} catch (Exception e) {
			logger.error("解密出错,解密的密文:" + strIn, e);
			return strIn;
		}
		// return "";
	}

	private Key getKey(byte[] arrBTmp) throws Exception {
		byte[] arrB = new byte[8];
		for (int i = 0; i < arrBTmp.length && i < arrB.length; i++) {
			arrB[i] = arrBTmp[i];
		}
		Key key = new javax.crypto.spec.SecretKeySpec(arrB, "DES");
		return key;
	}

	public static String byteArr2HexStr(byte[] arrB) throws Exception {
		int iLen = arrB.length;
		StringBuffer sb = new StringBuffer(iLen * 2);
		for (int i = 0; i < iLen; i++) {
			int intTmp = arrB[i];
			while (intTmp < 0) {
				intTmp = intTmp + 256;
			}
			if (intTmp < 16) {
				sb.append("0");
			}
			sb.append(Integer.toString(intTmp, 16));
		}
		return sb.toString();
	}

	public static byte[] hexStr2ByteArr(String strIn) throws Exception {
		byte[] arrB = strIn.getBytes();
		int iLen = arrB.length;
		byte[] arrOut = new byte[iLen / 2];
		for (int i = 0; i < iLen; i = i + 2) {
			String strTmp = new String(arrB, i, 2);
			arrOut[i / 2] = (byte) Integer.parseInt(strTmp, 16);
		}
		return arrOut;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		try {
			String test = "smtp.gmail.com";
			DesUtils des = DesUtils.getInstannce();
			System.out.println("加密前的字符串：" + test);
			System.out.println("加密后的字符串：" + DesUtils.encode(test));

			String mm = des.encode(test);
			System.out.println("解密后的字符：" + DesUtils.decode(mm));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
