package com.vinbet.mobile.domain;

public class SportUser extends UserInfo {
	/**
	 * 体育中的用户编号
	 */
	private String userIdInSport;
	/**
	 * 用户昵称
	 */
	private String userName;
	/**
	 * 余额：现金余额/信用余额
	 */
	private double balance;
	/**
	 * 信用额
	 */
	private double credits;
	/**
	 * 盘口类型 1:A,2:B,3:C,4:D
	 */
	private String group;
	/**
	 * 状态:1 正常、 2 停用
	 */
	private int status;
	/**
	 * 组浮动值
	 */
	private double diff = 0;
	/**
	 * 组浮动值
	 */
	private double diff2 = 0;

	private String sessionid;
	/**
	 * 在体育中的币种名称
	 */
	private String currency;

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

	public String getSessionid() {
		return sessionid;
	}

	public void setSessionid(String sessionid) {
		this.sessionid = sessionid;
	}

	public String getUserIdInSport() {
		return userIdInSport;
	}

	public void setUserIdInSport(String userIdInSport) {
		this.userIdInSport = userIdInSport;
	}

	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}

	public double getCredits() {
		return credits;
	}

	public void setCredits(double credits) {
		this.credits = credits;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getGroup() {
		return group;
	}

	public void setGroup(String group) {
		this.group = group;
	}

	public double getDiff() {
		return diff;
	}

	public void setDiff(double diff) {
		this.diff = diff;
	}

	public double getDiff2() {
		return diff2;
	}

	public void setDiff2(double diff2) {
		this.diff2 = diff2;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
}
