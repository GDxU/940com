package com.vinbet.mobile.util;


import java.security.MessageDigest;
import java.util.Random;

/**
 * 加密工具类
 * @author ink
 * @version [Ver 1.0]
 * @since 14-10-31 下午2:25
 */
public class PasswordEncoder {
    private final static String[] hexDigits = {"0", "1", "2", "3", "4", "5","6", "7", "8", "9", "a", "b", "c", "d", "e", "f"};
    private final static String algorithm ="MD5";

    private PasswordEncoder() {
    }

    /**
     * 进行加密操作
     * @param salt 盐
     * @param rawPass 要加密密码
     * @return
     */
    public static String encode(String salt,String rawPass) {
        String result = null;
        try {
            MessageDigest md = MessageDigest.getInstance(algorithm);
            //加密后的字符串
            result = byteArrayToHexString(md.digest(mergePasswordAndSalt(rawPass,salt).getBytes("utf-8")));
        } catch (Exception ex) {
        }
        return result;
    }

    /**
     * 密码验证
     * @param encPass 加盐密码
     * @param rawPass 未加工密码
     * @param salt 盐
     * @return boolean
     */
    public static boolean isPasswordValid(String encPass, String rawPass,String salt) {
        String pass1 = "" + encPass;
        String pass2 = encode(salt,rawPass);
        return pass1.equals(pass2);
    }

    /**
     * 合并密码和要添加的混淆字符(加盐)
     * @param password
     * @return
     */
    private static String mergePasswordAndSalt(String password,String salt) {
        if (password == null) {
            password = "";
        }

        if ((salt == null) || "".equals(salt)) {
            return password;
        } else {
            return password + "{" + salt.toString() + "}";
        }
    }

    /**
     * 转换字节数组为16进制字串
     * @param b 字节数组
     * @return 16进制字串
     */
    private static String byteArrayToHexString(byte[] b) {
        StringBuffer resultSb = new StringBuffer();
        for (int i = 0; i < b.length; i++) {
            resultSb.append(byteToHexString(b[i]));
        }
        return resultSb.toString();
    }

    /**
     * 转换字节为16进行的字符串
     * @param b
     * @return
     */
    private static String byteToHexString(byte b) {
        int n = b;
        if (n < 0)
            n = 256 + n;
        int d1 = n / 16;
        int d2 = n % 16;
        return hexDigits[d1] + hexDigits[d2];
    }

    /**
     * 随机生成密码
     * @return
     */
    public static String randomPwd(){
        StringBuffer sb = new StringBuffer();
        Random random = new Random();
        int range = hexDigits.length-1;//指定范围
        int next = random.nextInt(range);
        for (int i =0;i<6;i++){
            sb.append(hexDigits[next]);
            next = random.nextInt(range);
        }
        return sb.toString();
    }
    public static void main(String[] args) {
        String salt = "helloworld";
        String encode = PasswordEncoder.encode(salt,"test");
        System.out.println(encode);
        boolean passwordValid = PasswordEncoder.isPasswordValid("083a8db3ff5b9b4ece3ef2bde03226c8", "test",salt);
        System.out.println(passwordValid + "-----------------");
        System.out.println(randomPwd());
    }
}
