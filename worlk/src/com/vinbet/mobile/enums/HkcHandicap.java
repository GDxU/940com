package com.vinbet.mobile.enums;

import java.util.HashMap;
import java.util.Map;

/**
 * 新香港彩盘口
 */
public enum HkcHandicap {
	A(1), B(2), C(3), D(4);
	private int code;

	private HkcHandicap(int code) {
		this.code = code;
	}

	private static final Map<Integer, HkcHandicap> codeToEnum = new HashMap<Integer, HkcHandicap>();
	static {
		for (HkcHandicap hdp : HkcHandicap.values()) {
			codeToEnum.put(hdp.code, hdp);
		}
	}

	public static HkcHandicap valueOf(int code) {
		return codeToEnum.get(code);
	}

	public static void main(String[] args) {
		System.out.println(HkcHandicap.valueOf(1));
	}
}
