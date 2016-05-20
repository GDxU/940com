package com.vinbet.mobile.entity.portal;


import java.util.HashMap;
import java.util.Map;

import com.alibaba.fastjson.annotation.JSONField;

/**
* 资金明细
* @author cjp
* @date 2015-5-14 下午2:54:05
 */
public class FundDetail {
	
    private  String optType = "" ; //操作类型
    private  String optMoney = "";//操作金额
    private  String applyTime = "";//申请时间
    private String procTime="";//处理时间
    private  String changeMoney = "";//增减金额
	private String realMoney;  //实际金额
	private String balance; //余额
	private String remark; //备注
	private String status; //状态
	private String opter; //操作人
	private String orderId;//流水号
	private String utacc;//划出应用
	private String inacc;//划入应用
	private String accmny;//记账金额
	public String getOptType() {
		return optType;
	}
	public void setOptType(String optType) {
		this.optType = optType;
	}
	public String getOptMoney() {
		return optMoney;
	}
	public void setOptMoney(String optMoney) {
		this.optMoney = optMoney;
	}
	public String getChangeMoney() {
		return changeMoney;
	}
	public void setChangeMoney(String changeMoney) {
		this.changeMoney = changeMoney;
	}
	public String getRealMoney() {
		return realMoney;
	}
	public void setRealMoney(String realMoney) {
		this.realMoney = realMoney;
	}
	public String getBalance() {
		return balance;
	}
	public void setBalance(String balance) {
		this.balance = balance;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getOpter() {
		return opter;
	}
	public void setOpter(String opter) {
		this.opter = opter;
	}
	public String getApplyTime() {
		return applyTime;
	}
	public void setApplyTime(String applyTime) {
		this.applyTime = applyTime;
	}
	public String getProcTime() {
		return procTime;
	}
	public void setProcTime(String procTime) {
		this.procTime = procTime;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getUtacc() {
		return utacc;
	}
	public void setUtacc(String utacc) {
		this.utacc = utacc;
	}
	public String getInacc() {
		return inacc;
	}
	public void setInacc(String inacc) {
		this.inacc = inacc;
	}
	public String getAccmny() {
		return accmny;
	}
	public void setAccmny(String accmny) {
		this.accmny = accmny;
	}

	
	 
}
