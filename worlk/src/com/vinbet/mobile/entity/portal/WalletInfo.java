package com.vinbet.mobile.entity.portal;

import java.util.List;

/**
 * 钱包总和信息
 * @author cjp
 * @version [Ver 1.0]
 * @since 2015-5-10 下午4:55
 */
public class WalletInfo{
	private String drawableMoney;//可提款
	private String activityMoney;//活动费用
	private String totalMoney;//总余额	
	private String iid;//国际化id
	private String currency;//货币单位
	private String walletStatus;//钱包状态
	private String walletCategory;//钱包类型
	
	public String getWalletCategory() {
		return walletCategory;
	}
	public void setWalletCategory(String walletCategory) {
		this.walletCategory = walletCategory;
	}
	public String getDrawableMoney() {
		return drawableMoney;
	}
	public void setDrawableMoney(String drawableMoney) {
		this.drawableMoney = drawableMoney;
	}
	public String getActivityMoney() {
		return activityMoney;
	}
	public void setActivityMoney(String activityMoney) {
		this.activityMoney = activityMoney;
	}
	public String getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(String totalMoney) {
		this.totalMoney = totalMoney;
	}
	public String getIid() {
		return iid;
	}
	public void setIid(String iid) {
		this.iid = iid;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public String getWalletStatus() {
		return walletStatus;
	}
	public void setWalletStatus(String walletStatus) {
		this.walletStatus = walletStatus;
	}
	
	
	


}