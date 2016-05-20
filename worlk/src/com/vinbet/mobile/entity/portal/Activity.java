package com.vinbet.mobile.entity.portal;

/**
 * 活动对象类
 * <pre>
 * <功能详细描述>  
 * </pre>
 * @author  cjp
 * @version  [Ver 1.0]
 * @since 2015-5-9 下午3:19:02
 */
public class Activity {
	private String activityMark;//活动类别标示,属于什么类别的。
	private String extMark;//活动扩展码
	private String activityName;//活动名称。
	private String currActivityNo;//活动编号
	private String trgPntMark;//活动触发点标示
	private String walletCategory;//活动钱包类别标示
	private String activityDesc;//活动描述
	private String status;//活动状态，1-开启,0-关闭
	private String actType;//内部活动0，外部活动1。
	
	private String st;
	
	
	public String getExtMark() {
		return extMark;
	}
	public void setExtMark(String extMark) {
		this.extMark = extMark;
	}
	public String getSt() {
		return st;
	}
	public void setSt(String st) {
		this.st = st;
	}
	public String getActivityMark() {
		return activityMark;
	}
	public void setActivityMark(String activityMark) {
		this.activityMark = activityMark;
	}
	public String getCurrActivityNo() {
		return currActivityNo;
	}
	public void setCurrActivityNo(String currActivityNo) {
		this.currActivityNo = currActivityNo;
	}
	public String getTrgPntMark() {
		return trgPntMark;
	}
	public void setTrgPntMark(String trgPntMark) {
		this.trgPntMark = trgPntMark;
	}
	public String getWalletCategory() {
		return walletCategory;
	}
	public void setWalletCategory(String walletCategory) {
		this.walletCategory = walletCategory;
	}
	public String getActivityDesc() {
		return activityDesc;
	}
	public void setActivityDesc(String activityDesc) {
		this.activityDesc = activityDesc;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getActType() {
		return actType;
	}
	public void setActType(String actType) {
		this.actType = actType;
	}
	public String getActivityName() {
		return activityName;
	}
	public void setActivityName(String activityName) {
		this.activityName = activityName;
	}
	
}
