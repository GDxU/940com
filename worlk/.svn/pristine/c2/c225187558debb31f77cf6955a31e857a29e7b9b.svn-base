package com.vinbet.mobile.sys.h2.util;

/**
 * SQL条件
 * 
 * @author ray
 * 
 */
public class SqlE {

	private String name;
	private String op;
	private String value;
	private String sign;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getOp() {
		return op;
	}

	public void setOp(String op) {
		this.op = op;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	@Override
	public String toString() {
		if (op.equalsIgnoreCase("in")) {
			return name.toUpperCase() + " " + op.toUpperCase() + " (" + value + ")";
		} else {
			if (null == value) {
				return name.toUpperCase() + " " + op.toUpperCase() + " NULL";
			} else {
				return name.toUpperCase() + " " + op.toUpperCase() + " '" + value + "'";
			}
		}

	}

	public SqlE(String name, String op, String value, String sign) {
		this.name = name;
		this.op = op;
		this.value = value;
		this.sign = sign;
	}

}
