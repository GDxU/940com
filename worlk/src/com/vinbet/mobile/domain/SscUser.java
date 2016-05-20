package com.vinbet.mobile.domain;

public class SscUser extends UserInfo {
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
	 * 盘口类型 盘口类型： A,B,C,D
	 */
	private String handype;
	/**
	 * 当前盘口
	 */
	private String cht;
	/**
	 * 状态:1 正常、 2 停用
	 */
	private int status;
	/**
	 * 今日盈亏
	 */
	private double todayPL;
	/**
	 * 用户层级 1：子公司     2：分公司     3：股东     4：总代    5：代理     6：会员    7：直属会员     8：子帐号     9：外调会员     10：管理员
	 */
	private int userLevel;

	public int getUserLevel() {
		return userLevel;
	}

	public void setUserLevel(int userLevel) {
		this.userLevel = userLevel;
	}

	public double getTodayPL() {
		return todayPL;
	}

	public String getCht() {
		return cht;
	}

	public void setCht(String cht) {
		this.cht = cht;
	}

	public void setTodayPL(double todayPL) {
		this.todayPL = todayPL;
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

	public String getHandype() {
		return handype;
	}

	public void setHandype(String handype) {
		this.handype = handype;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

}
