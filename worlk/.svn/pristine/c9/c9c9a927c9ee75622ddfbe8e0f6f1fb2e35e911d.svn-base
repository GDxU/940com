package com.vinbet.mobile.entity.portal;

import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

import com.vinbet.mobile.annotation.SSCode;

/**
 * 存款分配信息
 */
public class AmountAllocation {
	/**
	 * 体育投注
	 */
	@SSCode(val = "40000")
	public double sports = 0;
	/**
	 * 交易平台
	 */
	@SSCode(val = "30000")
	public double tflat = 0;
	/**
	 * 真人娱乐
	 */
	@SSCode(val = "50000")
	public double casino = 0;
	/**
	 * 新香港彩
	 */
	@SSCode(val = "90000")
	public double hk = 0;
	/**
	 * 时时彩
	 */
	@SSCode(val = "120000")
	public double ssc = 0;
	/**
	 * 国际彩票
	 */
	@SSCode(val = "20000")
	public double ltf = 0;
	/**
	 * 欧洲游戏
	 */
	@SSCode(val = "100000")
	public double poker = 0;
	/**
	 * 浩游戏
	 */
	@SSCode(val = "130000")
	public double pt = 0;

	/**
	 * 获取应用对应的编号
	 * 
	 * @param filedName
	 * @return
	 */
	public static String getCode(String filedName) {
		return codes.get(filedName);
	}

	private static final Map<String, String> codes = new HashMap<String, String>();
	static {
		Field field[] = AmountAllocation.class.getDeclaredFields();
		for (Field f : field) {
			Annotation annotation = f.getAnnotation(SSCode.class);
			if (annotation instanceof SSCode) {
				SSCode ssCode = (SSCode) annotation;
				codes.put(f.getName(), ssCode.val());
			} else {
				codes.put(f.getName(), null);
			}
		}
	}

	public static void main(String[] args) {
		System.out.println(AmountAllocation.getCode("sports"));
	}
}
