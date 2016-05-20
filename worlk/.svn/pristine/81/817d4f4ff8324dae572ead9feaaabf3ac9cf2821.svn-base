package com.vinbet.mobile.util;

import java.math.BigDecimal;
import java.security.MessageDigest;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

/**
 * 赔率转换工具类，赔率保留两位有效数字
 *
 * @author jerry
 */
public class OddsUtil {

    /**
     * 赔率类型：香港盘
     */
    public static final int ODDS_TYPE_HK = 1;
    /**
     * 赔率类型：印尼盘
     */
    public static final int ODDS_TYPE_ID = 2;
    /**
     * 赔率类型：马来盘
     */
    public static final int ODDS_TYPE_MY = 3;

    /**
     * 赔率类型：欧盘
     */
    public static final int ODDS_TYPE_EUR = 4;

    /**
     * 赔率转换方法(提供香港盘、印尼盘、马来盘之间的互转)
     * 如果转换结果为0，表示转换失败，不符合转换规则
     * 香港盘=1，印尼盘=2，马来盘=3
     *
     * @param ratio    赔率
     * @param srcType  源类型
     * @param destType 目标类型
     * @param scale    小数位数
     * @return
     */
    public static double oddsConversion(double ratio, int srcType, int destType, int scale) {
        //赔率有效验证
        /*
		if((srcType==OddsConversionUtil.ODDS_TYPE_HK && ratio<=0) //香港盘不存在负赔率
			|| (srcType==OddsConversionUtil.ODDS_TYPE_MY && Math.abs(ratio)>1) //马来盘绝对值不能大于1
			|| (srcType==OddsConversionUtil.ODDS_TYPE_ID && Math.abs(ratio)<1)){ //印尼盘绝对值不能小于1		
			return 0;
		}*/
        if (srcType == destType) {
            return formatNum(ratio, false, scale);
        }
        if (srcType == OddsUtil.ODDS_TYPE_HK && destType == OddsUtil.ODDS_TYPE_MY) {//香港转马来
            return hkTomy(ratio, scale);
        } else if (srcType == OddsUtil.ODDS_TYPE_HK && destType == OddsUtil.ODDS_TYPE_ID) {//香港转印尼
            return hkToid(ratio, scale);
        } else if (srcType == OddsUtil.ODDS_TYPE_MY && destType == OddsUtil.ODDS_TYPE_HK) {//马来转香港
            return myTohk(ratio, scale);
        } else if (srcType == OddsUtil.ODDS_TYPE_MY && destType == OddsUtil.ODDS_TYPE_ID) {//马来转印尼
            return myToid(ratio, scale);
        } else if (srcType == OddsUtil.ODDS_TYPE_ID && destType == OddsUtil.ODDS_TYPE_HK) {//印尼转香港
            return idTohk(ratio, scale);
        } else if (srcType == OddsUtil.ODDS_TYPE_ID && destType == OddsUtil.ODDS_TYPE_MY) {//印尼转马来
            return idTomy(ratio, scale);
        } else if (srcType == OddsUtil.ODDS_TYPE_HK && destType == OddsUtil.ODDS_TYPE_EUR) {//香港转欧盘
            return hkToeu(ratio, scale);
        } else {
            return ratio;
        }
    }

    public static double oddsConversion(String ratio, int srcType, int destType, int scale) {
        return oddsConversion(Double.parseDouble(ratio), srcType, destType, scale);
    }

    /**
     * 香港盘转马来盘
     *
     * @param ratio
     * @return
     */
    public static double hkTomy(double ratio, int scale) {
        if (ratio > 1) {
            return -formatNum(1 / ratio, false, scale);
        } else {
            return formatNum(ratio, false, scale);
        }
    }


    /**
     * 香港盘转印尼盘
     *
     * @param ratio
     * @return
     */
    public static double hkToid(double ratio, int scale) {
        if (ratio < 1) {
            return -formatNum(1 / ratio, false, scale);
        } else {
            return formatNum(ratio, false, scale);
        }
    }


    /**
     * 马来转印尼
     * 1f/马来盘赔率
     *
     * @param ratio
     * @return
     */
    public static double myToid(double ratio, int scale) {
        return -formatNum(1 / ratio, false, scale);
    }

    /**
     * 香港盘转欧盘
     *
     * @param ratio
     * @param scale
     * @return
     */
    public static double hkToeu(double ratio, int scale) {
        //return 1+ratio;
        return formatNum(1 + ratio, false, scale);
    }

    /**
     * 马来转香港
     *
     * @param ratio
     * @return
     */
    public static double myTohk(double ratio, int scale) {
        if (ratio < 0) {
            return -formatNum(1 / ratio, false, scale);
        } else {
            return formatNum(ratio, false, scale);
        }
    }

    /**
     * 印尼转马来
     *
     * @param ratio
     * @return
     */
    public static double idTomy(double ratio, int scale) {
        return -formatNum(1 / ratio, false, scale);
    }

    /**
     * 印尼转香港
     *
     * @param ratio
     * @return
     */
    public static double idTohk(double ratio, int scale) {
        if (ratio < 0) {
            return -formatNum(1 / ratio, false, scale);
        } else {
            return formatNum(ratio, false, scale);
        }
    }


    /**
     * 根据出入条件格式化浮点小数，保留两位小数点（第三位小数要么进一位，要么舍掉）
     *
     * @param num    需要格式化的数值
     * @param isCeil 小数位是否进1位处理 true:进      false:舍
     * @return 精度为两位小数的数值 xxx.xx
     */
    public static double formatNum(double num, boolean isCeil, int scale) {
        BigDecimal bigRate = new BigDecimal(100);
        BigDecimal srcNum = new BigDecimal(num + "");
        if (isCeil) {
            return srcNum.multiply(bigRate).divide(bigRate, scale, BigDecimal.ROUND_CEILING).doubleValue();
        } else {
            return srcNum.multiply(bigRate).divide(bigRate, scale, BigDecimal.ROUND_FLOOR).doubleValue();
        }
    }

    /**
     * 格式化双精度小数
     *
     * @param num
     * @param scale  小数位
     * @param isCeil 　 小数位是否进1位处理 true:进      false:舍
     * @return
     */
    public static double formatDouble(double num, int scale, boolean isCeil) {
        BigDecimal bigDecimal = new BigDecimal(num + "");
        if (isCeil) {
            return bigDecimal.setScale(scale, BigDecimal.ROUND_CEILING).doubleValue();
        } else {
            return bigDecimal.setScale(scale, BigDecimal.ROUND_FLOOR).doubleValue();
        }
    }

    /**
     * 比较两个Double型数值的大小，小数位精确到三位比较
     *
     * @param a 比较的数值1
     * @param b 比较的数值2
     * @return 若a大于b，返回1；若a小于b返回-1；a、b相等返回0
     */
    public static int compareDouble(double a, double b) {
        if (formatDouble(a, 3, false) > formatDouble(b, 3, false)) {
            return 1;
        } else if (formatDouble(a, 3, false) < formatDouble(b, 3, false)) {
            return -1;
        } else {
            return 0;
        }
    }

    /**
     * 计算总水位
     *
     * @param ratio1
     * @param ratio2
     * @return
     */
    public static double calcGameRatio(double ratio1, double ratio2) {

        double res = 0;
        if (ratio1 >= 1 && ratio2 >= 1) {//两个赔率都大于1，总水位等于两赔率之和
            res = ratio1 + ratio2;
        } else if (ratio1 > 1 && ratio2 <= 1) {//其中一个赔率大于1，一个赔率小于1
            res = 2 + ratio2 - 1 / ratio1;
        } else if (ratio1 <= 1 && ratio2 > 1) {
            res = 2 + ratio1 - 1 / ratio2;
        } else if (ratio1 <= 1 && ratio2 <= 1) {
            res = ratio1 + ratio2;
        }
        return formatDouble(res, 2, true);
    }


    /**
     * 降水，香港盘大于1的赔率需转成马来盘降水后再转回香港盘
     *
     * @param srcRatio
     * @param val
     * @return
     */
    public static double divRatio(double srcRatio, double val, int scale) {
        if (srcRatio <= 1) {
            return formatNum(srcRatio - val, false, scale);
        } else {
            double temp = OddsUtil.hkTomy(srcRatio, scale) - val;
            return OddsUtil.myTohk(temp, scale);
        }
    }

    /**
     * MD5 加密
     * 加密过程：
     * <p/>
     * 1，使用base64加密
     * 2，使用MD5加密
     * 3,反转加密字符串
     */
    public static String getMD5Str(String str) {
        //首先BASE64 加密
        BASE64Encoder encoder = new BASE64Encoder();
        MessageDigest messageDigest = null;
        try {
            //BASE64加密
            str = encoder.encode(str.getBytes("UTF-8"));
            //MD5 加密
            messageDigest = MessageDigest.getInstance("MD5");
            messageDigest.reset();
            messageDigest.update(str.getBytes("UTF-8"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        byte[] byteArray = messageDigest.digest();
        StringBuffer md5StrBuff = new StringBuffer();
        for (int i = 0; i < byteArray.length; i++) {
            if (Integer.toHexString(0xFF & byteArray[i]).length() == 1) {
                md5StrBuff.append("0").append(Integer.toHexString(0xFF & byteArray[i]));
            } else {
                md5StrBuff.append(Integer.toHexString(0xFF & byteArray[i]));
            }
        }
        // 返回反转加密字符串，
        return md5StrBuff.reverse().toString().trim();
    }

    // 将 s 进行 BASE64 编码
    public static String getBASE64(String s) {
        if (s == null) {
            return null;
        }
        return (new BASE64Encoder()).encode(s.getBytes());
    }

    // 将 BASE64 编码的字符串 s 进行解码
    public static String getFromBASE64(String s) {
        if (s == null) {
            return null;
        }
        BASE64Decoder decoder = new BASE64Decoder();
        try {
            byte[] b = decoder.decodeBuffer(s);
            return new String(b);
        } catch (Exception e) {
            return null;
        }
    }

    public static double formatDouble(double d) {
        return formatDouble(d, 3, false);
    }

    public static double formatDouble(double d, int dis) {
        return formatDouble(d, dis, false);
    }

    public static double oddsConversion(double ratio, int h) {
        return oddsConversion(ratio, ODDS_TYPE_HK, h, 3);
    }

    public static double oddsConversion(double ratio, int h, int dis) {
        return oddsConversion(ratio, ODDS_TYPE_HK, h, dis);
    }

    public static void main(String[] args) {

        double orign = 0.62d;//原始赔率
        double f = 1.01d;// 浮动值
        System.out.println(oddsConversion(formatDouble(orign * f), 1, 2, 3));

    }
}
