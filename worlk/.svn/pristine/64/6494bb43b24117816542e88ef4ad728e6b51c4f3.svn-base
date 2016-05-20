package com.vinbet.mobile.entity.portal;

import com.vinbet.mobile.sys.h2.anno.Column;
import com.vinbet.mobile.sys.h2.anno.Index;
import com.vinbet.mobile.sys.h2.anno.Table;

/**
 * 支付信息DTO
 */
@Table
public class PaymentInfo {
	/**
	 * 用户账号
	 */
	@Column
	@Index("UNAME")
	private String userName;
	/**
	 * 支付方式
	 */
	@Column
	private String paymentType;
	/**
	 * 支付银行
	 */
	@Column
	private String paymentBank;
	/**
	 * 办卡网点-省
	 */
	@Column
	private String province;
	/**
	 * 办卡网点-城市
	 */
	@Column
	private String city;
	/**
	 * 分行网点
	 */
	@Column
	private String branches;
	/**
	 * 存款人姓名
	 */
	@Column
	private String depositor;
	/**
	 * 存款金额
	 */
	@Column
	private Double amount;
	/**
	 * 登录密码
	 */
	private String loginpwd;
	/**
	 * 存款时间
	 */
	@Column
	@Index("IPAYTIME")
	private String paytime;
	/**
	 * 用戶ip
	 */
	@Column
	private String userIp;
	
	/**
	 * 用户付款银行
	 */
	private String userPaymentBank;
	
	/**
	 * 资金密码
	 */
	private String fundPwd;
	
	private String paydate;

	private String remark;
	
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getUserIp() {
		return userIp;
	}

	public void setUserIp(String userIp) {
		this.userIp = userIp;
	}

	public String getPaytime() {
		return paytime;
	}

	public void setPaytime(String paytime) {
		this.paytime = paytime;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}



	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public String getPaymentBank() {
		return paymentBank;
	}

	public void setPaymentBank(String paymentBank) {
		this.paymentBank = paymentBank;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getBranches() {
		return branches;
	}

	public void setBranches(String branches) {
		this.branches = branches;
	}

	public String getDepositor() {
		return depositor;
	}

	public void setDepositor(String depositor) {
		this.depositor = depositor;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public String getLoginpwd() {
		return loginpwd;
	}

	public void setLoginpwd(String loginpwd) {
		this.loginpwd = loginpwd;
	}

	public String getUserPaymentBank() {
		return userPaymentBank;
	}

	public void setUserPaymentBank(String userPaymentBank) {
		this.userPaymentBank = userPaymentBank;
	}

	public String getFundPwd() {
		return fundPwd;
	}

	public void setFundPwd(String fundPwd) {
		this.fundPwd = fundPwd;
	}

	public String getPaydate() {
		return paydate;
	}

	public void setPaydate(String paydate) {
		this.paydate = paydate;
	}

}
