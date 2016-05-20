package com.vinbet.mobile.enums;

import java.util.HashMap;
import java.util.Map;

/**
 * 七星彩盘口
 */
public enum QxcHandicap {
	A(1), B(2), C(3), D(4);
	private int code;

	private QxcHandicap(int code) {
		this.code = code;
	}

	private static final Map<Integer, QxcHandicap> codeToEnum = new HashMap<Integer, QxcHandicap>();
	static {
		for (QxcHandicap hdp : QxcHandicap.values()) {
			codeToEnum.put(hdp.code, hdp);
		}
	}

	public static QxcHandicap valueOf(int code) {
		return codeToEnum.get(code);
	}

	public static void main(String[] args) {
		System.out.println(QxcHandicap.valueOf(1));
	}
}
