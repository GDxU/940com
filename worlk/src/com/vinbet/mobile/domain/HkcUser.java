package com.vinbet.mobile.domain;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class HkcUser extends UserInfo {
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
	 * 当前选择盘口,如1
	 */
	private String cht;
	/**
	 * 当前选择盘口,如A
	 */
	private String chtText;
	/**
	 * 该用户支持的盘口类型,如1,2,3,4
	 */
	private String handype;
	/**
	 * 该用户支持的盘口类型,如A,B,C,D
	 */
	private String handypeText;
	/**
	 * 状态:1 正常、 2 停用
	 */
	private int status;
	/**
	 * 用户层级 1：子公司 2：分公司 3：股东 4：总代 5：代理 6：会员 7：直属会员 8：子帐号 9：外调会员 10：管理员
	 */
	private int userLevel;
	/**
	 * 用户盘差 key:游戏id,value:盘差值
	 */
	private Map<String, Double> rateDiffs = new ConcurrentHashMap<String, Double>();

	public void setRateDiffs(Map<String, Double> rateDiffs) {
		this.rateDiffs = rateDiffs;
	}

	public Map<String, Double> getRateDiffs() {
		return rateDiffs;
	}

	/**
	 * 根据游戏编号获取用户盘差
	 * 
	 * @param gameCode
	 * @return
	 */
	public Double getUserGameRateDiff(String gameCode) {
		return rateDiffs.get(gameCode);
	}

	public int getUserLevel() {
		return userLevel;
	}

	public void setUserLevel(int userLevel) {
		this.userLevel = userLevel;
	}

	public String getCht() {
		return cht;
	}

	public void setCht(String cht) {
		this.cht = cht;
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
		String hantypes[] = handype.split(",");
		this.cht = hantypes[hantypes.length - 1];
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

		if (cht.equals("1")) {
			this.chtText = "A";
		} else if (cht.equals("2")) {
			this.chtText = "B";
		} else if (cht.equals("3")) {
			this.chtText = "C";
		} else if (cht.equals("4")) {
			this.chtText = "D";
		}
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

	public String getHandypeText() {
		return handypeText;
	}

	public void setHandypeText(String handypeText) {
		this.handypeText = handypeText;
	}

	public String getChtText() {
		return chtText;
	}

	public void setChtText(String chtText) {
		this.chtText = chtText;
	}

}
