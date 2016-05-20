package com.vinbet.mobile.util;

import java.math.BigDecimal;

/**
 * 使用BigDecimal精确计算工具
 * <p>
 * 注意：一定要把数值先转换成String，再封装到BigDecimal中
 * 
 * @author jqjia
 * 
 * @date 2012-06-20
 */
public class ArithUtil {

	// 默认除法运算精度
	private static final int DEF_DIV_SCALE = 10;

	// 这个类不能实例化
	private ArithUtil() {

	}

	/**
	 * 提供精确的加法运算
	 * 
	 * @param v1
	 *            被加数
	 * @param v2
	 *            加数
	 * @return 两个参数的和
	 */
	public static double add(double v1, double v2) {
		BigDecimal b1 = new BigDecimal(Double.toString(v1));
		BigDecimal b2 = new BigDecimal(Double.toString(v2));
		return b1.add(b2).doubleValue();
	}

	/**
	 * 提供精确的减法运算
	 * 
	 * @param v1
	 *            被减数
	 * @param v2
	 *            减数
	 * @return 两个参数的差
	 */
	public static double sub(double v1, double v2) {
		BigDecimal b1 = new BigDecimal(Double.toString(v1));
		BigDecimal b2 = new BigDecimal(Double.toString(v2));
		return b1.subtract(b2).doubleValue();
	}

	/**
	 * 提供精确的乘法运算
	 * 
	 * @param v1
	 *            被乘数
	 * @param v2
	 *            乘数
	 * @return 两个参数的积
	 */
	public static double mul(double v1, double v2) {
		BigDecimal b1 = new BigDecimal(Double.toString(v1));
		BigDecimal b2 = new BigDecimal(Double.toString(v2));
		return b1.multiply(b2).doubleValue();
	}

	/**
	 * 提供（相对）精确的除法运算，当发生除不尽的情况时，精确到 小数点以后10位，以后的数字四舍五入
	 * 
	 * @param v1
	 *            被除数
	 * @param v2
	 *            除数
	 * @return 两个参数的商
	 */
	public static double div(double v1, double v2) {
		return div(v1, v2, DEF_DIV_SCALE);
	}

	/**
	 * 提供（相对）精确的除法运算。当发生除不尽的情况时，由scale参数指 定精度，以后的数字四舍五入。
	 * 
	 * @param v1
	 *            被除数
	 * @param v2
	 *            除数
	 * @param scale
	 *            表示表示需要精确到小数点以后几位。
	 * @return 两个参数的商
	 */
	public static double div(double v1, double v2, int scale) {
		if (scale < 0) {
			throw new IllegalArgumentException("The scale must be a positive integer or zero");
		}
		BigDecimal b1 = new BigDecimal(Double.toString(v1));
		BigDecimal b2 = new BigDecimal(Double.toString(v2));
		return b1.divide(b2, scale, BigDecimal.ROUND_HALF_UP).doubleValue();
	}

	/**
	 * 提供精确的小数位四舍五入处理。
	 * 
	 * @param v
	 *            需要四舍五入的数字
	 * @param scale
	 *            小数点后保留几位
	 * @return 四舍五入后的结果
	 */
	public static double round(double v, int scale) {
		if (scale < 0) {
			throw new IllegalArgumentException("The scale must be a positive integer or zero");
		}
		BigDecimal b = new BigDecimal(Double.toString(v));
		BigDecimal one = new BigDecimal("1");
		return b.divide(one, scale, BigDecimal.ROUND_HALF_UP).doubleValue();
		// return b.setScale(scale, BigDecimal.ROUND_HALF_UP).doubleValue();
	}

	/**
	 * 提供两个BigDecimal的数值比较比较
	 * 
	 * @param b1
	 * @param b2
	 * @return 当此 BigDecimal 在数字上小于、等于或大于 val 时，返回 -1、0 或 1
	 */
	public static int compare(BigDecimal b1, BigDecimal b2) {
		return b1.compareTo(b2);
	}

	/**
	 * 格式化双精度小数，保留两位小数点
	 * 
	 * @param num
	 * @return 精度为两位小数的数值 xxx.xx
	 */
	public static double formatDouble(double num) {
		return Math.round((num) * 100) / 100d;
	}

	/**
	 * 按四舍五入格式化浮点小数，保留两位小数点
	 * 
	 * @param num
	 * @return
	 */
	public static float formatFloat(float num) {
		return Math.round((num) * 100) / 100f;
	}
	
	/**
	 * 格式化双精度小数，保留三位小数点
	 * 
	 * @param num
	 * @return 精度为两位小数的数值 xxx.xx
	 */
	public static double formatDouble_3(double num) {
		return Math.round((num) * 1000) / 1000d;
	}
	/**
	 * 测试
	 */
	public static void main(String[] args) {
		// 1相加
		System.out.println(0.05d + 0.01d);// 0.060000000000000005
		System.out.println(ArithUtil.add(0.05d, 0.01d));// 0.06
		// 2相减
		System.out.println(1.0d - 0.42d);// 0.5800000000000001
		System.out.println(ArithUtil.sub(1.0d, 0.42d));// 0.58
		System.out.println(String.valueOf(Math.round((1 - 0.42f) * 100) / 100d));// 0.58
		// 3相乘
		System.out.println(0.14d * 100);// 14.000000000000002
		System.out.println(ArithUtil.mul(0.14d, 100));// 14.0
		System.out.println(4.015d * 100);// 401.49999999999994
		System.out.println(1.05f * 100);// 104.99999
		System.out.println(4.015f * 100);// 401.5
		System.out.println(ArithUtil.mul(4.015d, 100));// 401.5
		// 4相除
		System.out.println(123.3d / 100);// 1.2329999999999999
		System.out.println(ArithUtil.div(123.3d, 100));// 1.233

	}
}