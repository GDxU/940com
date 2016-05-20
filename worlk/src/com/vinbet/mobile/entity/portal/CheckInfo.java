package com.vinbet.mobile.entity.portal;


import java.util.HashMap;
import java.util.Map;


public class CheckInfo {
	
    private  String msg = "" ; // 返回的消息
    private  String resultCode = "";//状态 
    private  String isExist = "";//是否存在0.未绑定/未使用/未超过最大银行卡数量1.绑定/使用/有未审核通过记录/超过银行卡数量2.手机和邮箱都绑定
    private  String email = "";//邮箱
	private String phoneNum;  //手机号码
	private String drawCount; //当天提款次数
	private String cardId; //银行卡ID
	private String drwfee;//提款手续费
	private String ytbet;//已经完成投注费用
	private String ndbet;//需要完成投注费用
	private String svmny;//上次提款和本次提款直接存款费用
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	public String getResultCode() {
		return resultCode;
	}
	public void setResultCode(String resultCode) {
		this.resultCode = resultCode;
	}
	public String getIsExist() {
		return isExist;
	}
	public void setIsExist(String isExist) {
		this.isExist = isExist;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public String getDrawCount() {
		return drawCount;
	}
	public void setDrawCount(String drawCount) {
		this.drawCount = drawCount;
	}
	public String getCardId() {
		return cardId;
	}
	public void setCardId(String cardId) {
		this.cardId = cardId;
	}
	public String getDrwfee() {
		return drwfee;
	}
	public void setDrwfee(String drwfee) {
		this.drwfee = drwfee;
	}
	public String getYtbet() {
		return ytbet;
	}
	public void setYtbet(String ytbet) {
		this.ytbet = ytbet;
	}
	public String getNdbet() {
		return ndbet;
	}
	public void setNdbet(String ndbet) {
		this.ndbet = ndbet;
	}
	public String getSvmny() {
		return svmny;
	}
	public void setSvmny(String svmny) {
		this.svmny = svmny;
	}
	
	 

}
