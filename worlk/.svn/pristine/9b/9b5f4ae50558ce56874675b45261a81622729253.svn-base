package com.vinbet.mobile.domain;

public class QxcUser extends UserInfo {
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
	 * 盘口类型1234： 1,2,3,4
	 */
	private String handype;
	/**
	 * 盘口类型ABCD： 1,2,3,4 分别对应A,B,C,D
	 */
	private String handypeText;
	/**
	 * 当前盘口
	 */
	private String cht;

	public String getCht() {
		return cht;
	}

	public void setCht(String cht) {
		this.cht = cht;
	}

	/**
	 * 会员类型
	 */
	private double accountType;
	/**
	 * 用户层级 1：子公司 2：分公司 3：股东 4：总代 5：代理 6：会员 7：直属会员 8：子帐号 9：外调会员 10：管理员
	 */
	private int userLevel;

	public int getUserLevel() {
		return userLevel;
	}

	public void setUserLevel(int userLevel) {
		this.userLevel = userLevel;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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
		if (handype.equals("1")) {
			this.cht = "A";
		} else if (handype.equals("2")) {
			this.cht = "B";
		} else if (handype.equals("3")) {
			this.cht = "C";
		} else if (handype.equals("4")) {
			this.cht = "D";
		}

		this.handype = handype;
		String hantypes[] = handype.split(",");
		this.cht = hantypes[0];
		handypeText = "";
		for (String val : hantypes) {
			if (val.equals("1")) {
				val = "A";
			} else if (val.equals("2")) {
				val = "B";
			} else if (val.equals("3")) {
				val = "C";
			} else if (val.equals("4")) {
				val = "D";
			}
			handypeText += val + ",";
		}
		handypeText = handypeText.substring(0, handypeText.length() - 1);
	}

	public double getAccountType() {
		return accountType;
	}

	public void setAccountType(double accountType) {
		this.accountType = accountType;
	}

	public String getHandypeText() {
		return handypeText;
	}
}
