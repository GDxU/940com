package com.vinbet.mobile.domain;

import java.util.Map;

import com.alibaba.fastjson.annotation.JSONField;
import com.vinbet.mobile.entity.portal.CollectionInfo;

public class UserInfo {
	/**
	 * 用户ID
	 */
	private String userId;
	/**
	 * 上级代理ID
	 */
	private String agentId;
	/**
	 * 账号名称
	 */
	@JSONField(name = "userName")
	private String accoutName;
	/**
	 * 用户真实姓名
	 */
	private String trueName;
	/**
	 * 用户状态:0 正常 1 冻结 2 注销
	 */
	private int userStatus;
	/**
	 * 用户类型:1现金、0信用
	 */
	@JSONField(name = "iscash")
	private int userType;
	/**
	 * 货币类型 :1人民币、 2泰铢
	 */
	private int currencyType;
	/**
	 * 货币名称 :1人民币、 2泰铢
	 */
	private String currencyName;
	/**
	 * 登录IP
	 */
	private String loginIp;
	/**
	 * 注册IP
	 */
	private String createIp;
	/**
	 * 註冊時間
	 */
	@JSONField(name = "createTime")
	private String registTime;
	/**
	 * 性別：男:M,女:F
	 */
	private String sex;
	/**
	 * 生日
	 */
	@JSONField(name = "birthdate")
	private String birthdate;
	/**
	 * 國家
	 */
	private String country;
	/**
	 * 地址
	 */
	private String address;
	/**
	 * 国际电话区号
	 */
	@JSONField(name = "nationalNumber")
	private String interTelCode;
	/**
	 * 手機號碼
	 */
	private String mobile;
	/**
	 * 聯繫電話
	 */
	private String tel;
	/**
	 * 密保邮箱
	 */
	private String email;
	/**
	 * 邮箱状态：0未绑定  1已绑定
	 */
	@JSONField(name = "emailIsValid")
	private String emailStatus;
	/**
	 * 用户可访问的子应用,key:应用id 如:40000;value:应用简写 如:sports
	 */
	private transient Map<String, String> accessibleApps;
	/**
	 * 最近一次存款收款信息
	 */
	private transient CollectionInfo collectionInfo;
	
	/**
	 * 登陆时间
	 */
	private transient String loginTime;
	
	/**
	 * 手机绑定状态 0未绑定  1已绑定
	 */
	private String mobileStatus;
	/**
	 * 上次登录时间
	 */
	private String lastLoginTime;
	/**
	 * 上次登录IP
	 */
	private String lastLoginIp;
	
	/**
	 * 资金密码
	 */
	private String fundPwd;
	
	/**
	 * 昵称
	 */
	private String nickName;
	
	/**
	 * 用户级别 1-待定（默认）、2-普通、3-VIP、4-作弊、5-测试
	 */
	private String userLv;
	
	/**
	 * 姓
	 */
	private String surName;
	
	
	/**
	 * 名
	 */
	private String givenName;
	
	/**
	 *国家名称
	 */
	private String countryName;
	
	/**
	 * 状态名称
	 */
	private String statusName;
	
	/**
	 * 允许访问的应用
	 */
	private String appauth;
	
	/**
	 * 姓名是否已修改, 0-未修改,1-已修改
	 */
	private String isNameChanged;
	
	/**
	 * 加星号邮箱
	 */
	private String starEmail;
	
	/**
	 * 加星号手机
	 */
	private String starMobile;
	
	/**
	 * 是否设置资金密码标识0,没有设置资金密码，1设置资金密码
	 */
	private String isSetFundPwd;
	
	/**
	 * 推荐人
	 */
	private String ref;
	
	/**
	 * 是否可以重置密码(找回密码专用)
	 */
	private transient boolean isResetPwd;
	

	public String getLoginTime() {
		return loginTime;
	}

	public void setLoginTime(String loginTime) {
		this.loginTime = loginTime;
	}

	public String getAccoutName() {
		return accoutName;
	}

	public void setAccoutName(String accoutName) {
		this.accoutName = accoutName;
	}

	public int getUserType() {
		return userType;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}

	public String getLoginIp() {
		return loginIp;
	}

	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}

	public String getRegistTime() {
		return registTime;
	}

	public void setRegistTime(String registTime) {
		if (null != registTime && !registTime.equals("null")) {
			this.registTime = registTime;
		}
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(String birthdate) {
		if (birthdate == null || birthdate.equals("null")) {
			birthdate = "";
		}
		this.birthdate = birthdate;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		if (country != null && !country.equals("null")) {
			this.country = country;
		}
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		if (address == null || address.contains("null")) {
			address = "";
		}
		this.address = address;
	}

	public String getInterTelCode() {
		return interTelCode;
	}

	public void setInterTelCode(String interTelCode) {
		if (interTelCode == null || interTelCode.equals("null")) {
			interTelCode = "";
		}
		this.interTelCode = interTelCode;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		if (mobile == null || mobile.equals("null")) {
			mobile = "";
		}
		this.mobile = mobile;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getAgentId() {
		return agentId;
	}

	public void setAgentId(String agentId) {
		this.agentId = agentId;
	}

	public String getTrueName() {
		return trueName;
	}

	public void setTrueName(String trueName) {
		if (trueName != null && !trueName.equals("null")) {
			this.trueName = trueName;
		}
	}

	public int getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(int userStatus) {
		this.userStatus = userStatus;
	}

	public int getCurrencyType() {
		return currencyType;
	}

	public void setCurrencyType(int currencyType) {
		this.currencyType = currencyType;
	}

	public String getCreateIp() {
		return createIp;
	}

	public void setCreateIp(String createIp) {
		this.createIp = createIp;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		if (email != null && !email.equals("null")) {
			this.email = email;
		}
	}

	public String getEmailStatus() {
		return emailStatus;
	}

	public void setEmailStatus(String emailStatus) {
		if (emailStatus != null && !emailStatus.equals("null")) {
			this.emailStatus = emailStatus;
		}
	}

	public String getCurrencyName() {
		return currencyName;
	}

	public Map<String, String> getAccessibleApps() {
		return accessibleApps;
	}

	public void setAccessibleApps(Map<String, String> accessibleApps) {
		this.accessibleApps = accessibleApps;
	}

	public void setCurrencyName(String currencyName) {
		this.currencyName = currencyName;
	}

	public CollectionInfo getCollectionInfo() {
		return collectionInfo;
	}

	public void setCollectionInfo(CollectionInfo collectionInfo) {
		this.collectionInfo = collectionInfo;
	}

	public String getMobileStatus() {
		return mobileStatus;
	}

	public void setMobileStatus(String mobileStatus) {
		this.mobileStatus = mobileStatus;
	}

	public String getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(String lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	public String getLastLoginIp() {
		return lastLoginIp;
	}

	public void setLastLoginIp(String lastLoginIp) {
		this.lastLoginIp = lastLoginIp;
	}

	public String getFundPwd() {
		return fundPwd;
	}

	public void setFundPwd(String fundPwd) {
		this.fundPwd = fundPwd;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getUserLv() {
		return userLv;
	}

	public void setUserLv(String userLv) {
		this.userLv = userLv;
	}

	public String getSurName() {
		return surName;
	}

	public void setSurName(String surName) {
		this.surName = surName;
	}

	public String getGivenName() {
		return givenName;
	}

	public void setGivenName(String givenName) {
		this.givenName = givenName;
	}

	public String getCountryName() {
		return countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}

	public String getStatusName() {
		return statusName;
	}

	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}

	public String getAppauth() {
		return appauth;
	}

	public void setAppauth(String appauth) {
		this.appauth = appauth;
	}

	public String getIsNameChanged() {
		return isNameChanged;
	}

	public void setIsNameChanged(String isNameChanged) {
		this.isNameChanged = isNameChanged;
	}

	public String getStarEmail() {
		return starEmail;
	}

	public void setStarEmail(String starEmail) {
		this.starEmail = starEmail;
	}

	public String getStarMobile() {
		return starMobile;
	}

	public void setStarMobile(String starMobile) {
		this.starMobile = starMobile;
	}

	public String getIsSetFundPwd() {
		return isSetFundPwd;
	}

	public void setIsSetFundPwd(String isSetFundPwd) {
		this.isSetFundPwd = isSetFundPwd;
	}

	public String getRef() {
		return ref;
	}

	public void setRef(String ref) {
		this.ref = ref;
	}

	public boolean isResetPwd() {
		return isResetPwd;
	}

	public void setResetPwd(boolean isResetPwd) {
		this.isResetPwd = isResetPwd;
	}

	
	
	
}
