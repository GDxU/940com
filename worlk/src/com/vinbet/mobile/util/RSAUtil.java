package com.vinbet.mobile.util;

import java.io.ByteArrayOutputStream;
import java.security.Key;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.Provider;
import java.security.PublicKey;
import java.security.SecureRandom;
import java.security.Signature;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.Cipher;

import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.bouncycastle.util.encoders.Hex;

import com.vinbet.mobile.util.yjpay.RSA;
import com.vinbet.mobile.util.yjpay.RandomUtil;

/**
 * RSA 工具类。
 * 
 * 提供加密、解密、生成密钥对等方法，依赖bcprov-jdk15on-151.jar，需要到http://www.bouncycastle.org下载。
 * 
 */
public class RSAUtil {
	public static final Provider RSA_PROVIDER = new BouncyCastleProvider();
	/**
	 * 加密算法RSA
	 */
	public static final String KEY_ALGORITHM = "RSA";
	/**
	 * 签名算法
	 */
	public static final String SIGNATURE_ALGORITHM = "MD5withRSA";
	/**
	 * RSA最大加密明文大小
	 */
	private static final int MAX_ENCRYPT_BLOCK = 117;

	/**
	 * RSA最大解密密文大小
	 */
	private static final int MAX_DECRYPT_BLOCK = 128;
	private static final String SEED_KEY = "random";
	private static final String CHARSET = "UTF-8";
	private static PrivateKey privateKey = null;
	private static PublicKey publicKey = null;
	private static Map<String, Object> keyMap = new HashMap<String, Object>(2);
	/**
	 * 获取公钥的key
	 */
	private static final String PUBLIC_KEY = "RSAPublicKey";

	/**
	 * 获取私钥的key
	 */
	private static final String PRIVATE_KEY = "RSAPrivateKey";
	public static String publicModulusString = null;
	public static String publicExponentString = null;

	static {
		try {
			generateKeyPair();
		} catch (Exception e) {
			throw new RuntimeException("生成RSA密钥对失败");
		}
	}

	/**
	 * 生成密钥对
	 * <p>
	 * 生成的密钥对的值与 种子(seedKey)、虚拟机实现等都有关系，不同的机器生成的密钥值可能不同。 <BR>
	 * 在实际测试时发现，同样的环境，有些机器每次生成的密钥值也不同，比如每次重启服务器后值不同。 <BR>
	 * 所以在实际生产环境中使用时，该值需要通过服务器端输出到客户端。
	 * 如果有多台服务器，可能每台服务器的值不同，所以需要有类似F5的策略，保证多次请求路由到一台服务器上。
	 * 
	 * @return KeyPair
	 * @throws EncryptException
	 */
	public static void generateKeyPair() throws Exception {
		try {
			KeyPairGenerator keyPairGen = KeyPairGenerator.getInstance("RSA", RSA_PROVIDER);
			final int KEY_SIZE = 1024;
			keyPairGen.initialize(KEY_SIZE, new SecureRandom());
			// keyPairGen.initialize(KEY_SIZE, new
			// SecureRandom(SEED_KEY.getBytes()));这种写法KeyPair的值不变
			KeyPair keyPair = keyPairGen.generateKeyPair();
			privateKey = keyPair.getPrivate();
			publicKey = keyPair.getPublic();
			RSAPublicKey rsaPublicKey = (RSAPublicKey) publicKey;
			RSAPrivateKey rsaPrivateKey = (RSAPrivateKey) privateKey;
			keyMap.put(PUBLIC_KEY, rsaPublicKey);
			keyMap.put(PRIVATE_KEY, rsaPrivateKey);
			publicModulusString = rsaPublicKey.getModulus().toString(16);
			publicExponentString = rsaPublicKey.getPublicExponent().toString(16);
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		}
	}

	public static void getKeyPair() throws Exception {
		try {
			KeyPairGenerator keyPairGen = KeyPairGenerator.getInstance("RSA", RSA_PROVIDER);
			final int KEY_SIZE = 1024;
			keyPairGen.initialize(KEY_SIZE, new SecureRandom());
			// keyPairGen.initialize(KEY_SIZE, new
			// SecureRandom(SEED_KEY.getBytes()));这种写法KeyPair的值不变
			KeyPair keyPair = keyPairGen.generateKeyPair();
			keyPair.getPrivate();
			keyPair.getPublic();
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		}
	}

	/**
	 * 加密 String
	 */
	public static byte[] encrypt(String input) throws Exception {
		Cipher cipher = Cipher.getInstance("RSA", RSA_PROVIDER);
		cipher.init(Cipher.ENCRYPT_MODE, publicKey);
		byte[] re = cipher.doFinal(input.getBytes(CHARSET));
		return re;
	}

	/**
	 * 解密 byte[]
	 */
	public static byte[] decrypt(byte[] encrypted) throws Exception {
		Cipher cipher = Cipher.getInstance("RSA", RSA_PROVIDER);
		cipher.init(Cipher.DECRYPT_MODE, privateKey);
		byte[] re = cipher.doFinal(encrypted);
		return re;
	}

	/**
	 * 解密 String
	 */
	public static String decrypt(String value) throws Exception {
		byte[] input = Hex.decode(value);
		byte[] raw = decrypt(input);

		// 标志位为0之后的是输入的有效字节
		int i = raw.length - 1;
		while (i > 0 && raw[i] != 0) {
			i--;
		}
		i++;
		byte[] data = new byte[raw.length - i];
		for (int j = i; j < raw.length; j++) {
			data[j - i] = raw[j];
		}
		return new String(data, CHARSET);
	}

	/**
	 * <p>
	 * 获取私钥
	 * </p>
	 * 
	 * @param keyMap
	 *            密钥对
	 * @return
	 * @throws Exception
	 */
	public static String getPrivateKey() throws Exception {
		Key key = (Key) keyMap.get(PRIVATE_KEY);
		return BASE64Util.encode(key.getEncoded());
	}

	/**
	 * <p>
	 * 获取公钥
	 * </p>
	 * 
	 * @param keyMap
	 *            密钥对
	 * @return
	 * @throws Exception
	 */
	public static String getPublicKey() throws Exception {
		Key key = (Key) keyMap.get(PUBLIC_KEY);
		return BASE64Util.encode(key.getEncoded());
	}

	/**
	 * <p>
	 * 用私钥对信息生成数字签名
	 * </p>
	 * 
	 * @param data
	 *            已加密数据
	 * @param privateKey
	 *            私钥(BASE64编码)
	 * 
	 * @return
	 * @throws Exception
	 */
	public static String sign(byte[] data, String privateKey) throws Exception {
		byte[] keyBytes = BASE64Util.decode(privateKey);
		PKCS8EncodedKeySpec pkcs8KeySpec = new PKCS8EncodedKeySpec(keyBytes);
		KeyFactory keyFactory = KeyFactory.getInstance(KEY_ALGORITHM);
		PrivateKey privateK = keyFactory.generatePrivate(pkcs8KeySpec);
		Signature signature = Signature.getInstance(SIGNATURE_ALGORITHM);
		signature.initSign(privateK);
		signature.update(data);
		return BASE64Util.encode(signature.sign());
	}

	/**
	 * <p>
	 * 校验数字签名
	 * </p>
	 * 
	 * @param data
	 *            已加密数据
	 * @param publicKey
	 *            公钥(BASE64编码)
	 * @param sign
	 *            数字签名
	 * 
	 * @return
	 * @throws Exception
	 * 
	 */
	public static boolean verify(byte[] data, String publicKey, String sign) throws Exception {
		byte[] keyBytes = BASE64Util.decode(publicKey);
		X509EncodedKeySpec keySpec = new X509EncodedKeySpec(keyBytes);
		KeyFactory keyFactory = KeyFactory.getInstance(KEY_ALGORITHM);
		PublicKey publicK = keyFactory.generatePublic(keySpec);
		Signature signature = Signature.getInstance(SIGNATURE_ALGORITHM);
		signature.initVerify(publicK);
		signature.update(data);
		return signature.verify(BASE64Util.decode(sign));
	}

	/**
	 * <P>
	 * 私钥解密
	 * </p>
	 * 
	 * @param encryptedData
	 *            已加密数据
	 * @param privateKey
	 *            私钥(BASE64编码)
	 * @return
	 * @throws Exception
	 */
	public static byte[] decryptByPrivateKey(byte[] encryptedData, String privateKey) throws Exception {
		byte[] keyBytes = BASE64Util.decode(privateKey);
		PKCS8EncodedKeySpec pkcs8KeySpec = new PKCS8EncodedKeySpec(keyBytes);
		KeyFactory keyFactory = KeyFactory.getInstance(KEY_ALGORITHM);
		Key privateK = keyFactory.generatePrivate(pkcs8KeySpec);
		Cipher cipher = Cipher.getInstance(keyFactory.getAlgorithm());
		cipher.init(Cipher.DECRYPT_MODE, privateK);
		int inputLen = encryptedData.length;
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		int offSet = 0;
		byte[] cache;
		int i = 0;
		// 对数据分段解密
		while (inputLen - offSet > 0) {
			if (inputLen - offSet > MAX_DECRYPT_BLOCK) {
				cache = cipher.doFinal(encryptedData, offSet, MAX_DECRYPT_BLOCK);
			} else {
				cache = cipher.doFinal(encryptedData, offSet, inputLen - offSet);
			}
			out.write(cache, 0, cache.length);
			i++;
			offSet = i * MAX_DECRYPT_BLOCK;
		}
		byte[] decryptedData = out.toByteArray();
		out.close();
		return decryptedData;
	}

	/**
	 * <p>
	 * 公钥解密
	 * </p>
	 * 
	 * @param encryptedData
	 *            已加密数据
	 * @param publicKey
	 *            公钥(BASE64编码)
	 * @return
	 * @throws Exception
	 */
	public static byte[] decryptByPublicKey(byte[] encryptedData, String publicKey) throws Exception {
		byte[] keyBytes = BASE64Util.decode(publicKey);
		X509EncodedKeySpec x509KeySpec = new X509EncodedKeySpec(keyBytes);
		KeyFactory keyFactory = KeyFactory.getInstance(KEY_ALGORITHM);
		Key publicK = keyFactory.generatePublic(x509KeySpec);
		Cipher cipher = Cipher.getInstance(keyFactory.getAlgorithm());
		cipher.init(Cipher.DECRYPT_MODE, publicK);
		int inputLen = encryptedData.length;
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		int offSet = 0;
		byte[] cache;
		int i = 0;
		// 对数据分段解密
		while (inputLen - offSet > 0) {
			if (inputLen - offSet > MAX_DECRYPT_BLOCK) {
				cache = cipher.doFinal(encryptedData, offSet, MAX_DECRYPT_BLOCK);
			} else {
				cache = cipher.doFinal(encryptedData, offSet, inputLen - offSet);
			}
			out.write(cache, 0, cache.length);
			i++;
			offSet = i * MAX_DECRYPT_BLOCK;
		}
		byte[] decryptedData = out.toByteArray();
		out.close();
		return decryptedData;
	}

	/**
	 * <p>
	 * 公钥加密
	 * </p>
	 * 
	 * @param data
	 *            源数据
	 * @param publicKey
	 *            公钥(BASE64编码)
	 * @return
	 * @throws Exception
	 */
	public static byte[] encryptByPublicKey(byte[] data, String publicKey) throws Exception {
		byte[] keyBytes = BASE64Util.decode(publicKey);
		X509EncodedKeySpec x509KeySpec = new X509EncodedKeySpec(keyBytes);
		KeyFactory keyFactory = KeyFactory.getInstance(KEY_ALGORITHM);
		Key publicK = keyFactory.generatePublic(x509KeySpec);
		// 对数据加密
		Cipher cipher = Cipher.getInstance(keyFactory.getAlgorithm());
		cipher.init(Cipher.ENCRYPT_MODE, publicK);
		int inputLen = data.length;
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		int offSet = 0;
		byte[] cache;
		int i = 0;
		// 对数据分段加密
		while (inputLen - offSet > 0) {
			if (inputLen - offSet > MAX_ENCRYPT_BLOCK) {
				cache = cipher.doFinal(data, offSet, MAX_ENCRYPT_BLOCK);
			} else {
				cache = cipher.doFinal(data, offSet, inputLen - offSet);
			}
			out.write(cache, 0, cache.length);
			i++;
			offSet = i * MAX_ENCRYPT_BLOCK;
		}
		byte[] encryptedData = out.toByteArray();
		out.close();
		return encryptedData;
	}

	/**
	 * <p>
	 * 私钥加密
	 * </p>
	 * 
	 * @param data
	 *            源数据
	 * @param privateKey
	 *            私钥(BASE64编码)
	 * @return
	 * @throws Exception
	 */
	public static byte[] encryptByPrivateKey(byte[] data, String privateKey) throws Exception {
		byte[] keyBytes = BASE64Util.decode(privateKey);
		PKCS8EncodedKeySpec pkcs8KeySpec = new PKCS8EncodedKeySpec(keyBytes);
		KeyFactory keyFactory = KeyFactory.getInstance(KEY_ALGORITHM);
		Key privateK = keyFactory.generatePrivate(pkcs8KeySpec);
		Cipher cipher = Cipher.getInstance(keyFactory.getAlgorithm());
		cipher.init(Cipher.ENCRYPT_MODE, privateK);
		int inputLen = data.length;
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		int offSet = 0;
		byte[] cache;
		int i = 0;
		// 对数据分段加密
		while (inputLen - offSet > 0) {
			if (inputLen - offSet > MAX_ENCRYPT_BLOCK) {
				cache = cipher.doFinal(data, offSet, MAX_ENCRYPT_BLOCK);
			} else {
				cache = cipher.doFinal(data, offSet, inputLen - offSet);
			}
			out.write(cache, 0, cache.length);
			i++;
			offSet = i * MAX_ENCRYPT_BLOCK;
		}
		byte[] encryptedData = out.toByteArray();
		out.close();
		return encryptedData;
	}

	public static void main(String[] args) throws Exception {
		// System.out.println(privateKey);// 私钥
		// System.out.println(publicKey);// 公钥

		// String test = "123456张三&￥#";
		// byte[] en_test = encrypt(test);
		// byte[] de_test = decrypt(en_test);
		// System.out.println(new String(de_test));

		/**
		 * ExecutorService executor = Executors.newFixedThreadPool(1); long y =
		 * System.currentTimeMillis(); final CountDownLatch countDownLatch = new
		 * CountDownLatch(1000); for (int i = 0; i < 1000; i++) {
		 * executor.execute(new Runnable() { public void run() { try {
		 * TimeUnit.MILLISECONDS.sleep(1); RSAUtil.generateKeyPair(); } catch
		 * (Exception e) { e.printStackTrace(); } countDownLatch.countDown(); }
		 * }); } try { countDownLatch.await(); } catch (InterruptedException e)
		 * { } System.out.println(System.currentTimeMillis() - y);
		 */

		String publicKey = RSAUtil.getPublicKey();
		String privateKey = RSAUtil.getPrivateKey();
		// publicKey =
		// "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCM4hgAV3MK9M/PVNc1jK3b9BBcuAgS/RFnJlXt3dzTanVJVQLul49njW5y9y+YBuEY6f9NODAZRm0Sy1GTgqC6FdPV1juopaVVvMsFJ540hEPz94LEiO/8h9W2PWZFKLBuGKiqOXHEBFVe42rwiB6md78jzbjAErXYpBgvLHNiAwIDAQAB";
		// privateKey =
		// "MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAIziGABXcwr0z89U1zWMrdv0EFy4CBL9EWcmVe3d3NNqdUlVAu6Xj2eNbnL3L5gG4Rjp/004MBlGbRLLUZOCoLoV09XWO6ilpVW8ywUnnjSEQ/P3gsSI7/yH1bY9ZkUosG4YqKo5ccQEVV7javCIHqZ3vyPNuMAStdikGC8sc2IDAgMBAAECgYA8JU5P3wW7WLbbcgIK14tmCvVtUBgKW0YxvlkTGxPqoll+PC/rQoMzl1re9A66nb090LBw/Br0v29Thb/G9Q6+oMNOGS3azCnz343THrK1ttAsAfEX+IZ/kUo3IfBjiXbBYS5qYmPjXF5K1exnLmbLeDXemArsbA4sOfi2MdtFOQJBAMYxtd6QMOVD2nS2DK9zdPc1ABGaP/Vz3eqbmGAIzr7h/sQ3GCwt/C2xzxZZr5+5zI+dBIe2k1pUSQ6kAxKrCs8CQQC1+TjqEIkpya/4XPkDe2+T4pi1/9m3varV5wGCIOMV+66CXjIEpKtVr5nTwO+0sGknnGabATEAo+AeSdXCPjKNAkASXytHrUALEIYgiXuVi/NMswoFl7HUE+B/TdsLE+XuRc6y65R/C+gzaCcVIE0qVjPDID/6QI9aMTPwen2abmZ7AkEApH9NBrG5/E94xi/tXkt3+pxM5cEJo8JNqx0uzN5DyXyBLRJPbskYpNWfXb88MP+Dny4PxrEWBfkdwOOH2xZ0hQJBALz1D6UxirPkHinhzGtfUJaEZeKEueQUEzUEU5BHBRqU67XK1YSGZOR3DEpkfNixAhU5qRyfzI1LQI0Ov/oqxV8=";
		System.err.println("公钥加密——私钥解密");
		String source = RandomUtil.getRandom(16);
		System.out.println("\r加密前文字：\r\n" + source);
		// //////////////////////////////////////////////////////////////////////////
		byte[] data = source.getBytes();
		String encodedData = RSA.encrypt(new String(data), publicKey);
		System.out.println("加密后文字：\r\n" + new String(encodedData));
		// //////////////////////////////////////////////////////////////////////////
		String decodedData = RSA.decrypt(encodedData, privateKey);
		String target = new String(decodedData);
		System.out.println("解密后文字: \r\n" + target);

	}
}
