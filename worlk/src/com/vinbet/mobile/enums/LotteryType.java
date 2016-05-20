package com.vinbet.mobile.enums;

import java.util.HashMap;
import java.util.Map;

public enum LotteryType {
	KLC(1, "广东快乐十分"), GXKLC(12, "广西快乐十分"), TJKLC(13, "天津快乐十分"), 
	HNKLC(23, "湖南快乐十分"),BJKLC(18, "北京快乐8"),
	SSC(2, "重庆时时彩"), JXSSC(6, "江西时时彩"), XJSSC(7, "新疆时时彩"), 
	TJSSC(11, "天津时时彩"),YNSSC(14, "云南时时彩"),SHSSC(15, "上海时时乐"),
	GDSYXW(8, "广东十一选五"), SHSYXW(9, "上海十一选五"), SDSYXW(10, "山东十一运夺金"),
	JXSYXW(19, "江西十一选五"),LNSYXW(20, "辽宁十一选五"),HBSYXW(21, "湖北十一选五"),JSSYXW(22, "江苏十一选五"),
	JSKS(4, "江苏骰宝"),AHKS(16, "安徽快三"),GXKS(17, "广西快三"), BJC(3, "北京赛车(PK10)"), 
	XYNC(5, "幸运农场");
	private int code;
	private String sscName;

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getSscName() {
		return sscName;
	}

	public void setSscName(String sscName) {
		this.sscName = sscName;
	}

	private LotteryType(int code, String sscName) {
		this.code = code;
		this.sscName = sscName;
	}

	public static String getName(String alias) {
		return stringToEnum.get(alias).getSscName();
	}
	public static String getName(int code) {
		return codeToEnum.get(code).getSscName();
	}
	public static LotteryType valueOf(int code){
		return codeToEnum.get(code);
	}
	private static final Map<String, LotteryType> stringToEnum = new HashMap<String, LotteryType>();
	private static final Map<Integer, LotteryType> codeToEnum = new HashMap<Integer, LotteryType>();
	static {
		for (LotteryType sscType : LotteryType.values()) {
			stringToEnum.put(sscType.name(), sscType);
			codeToEnum.put(sscType.code, sscType);
		}
	}
}
