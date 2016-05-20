package com.vinbet.mobile.entity.portal;

import java.util.ArrayList;
import java.util.List;
public class RespBeanForActivityEnd {
	private String st;//st 结果编码，0表示可以转出，1表示不能转出，2表示需要强制转出
	private String back;//表示强制转出需要扣除多少钱
	private String wash;//如果st=1或者st=2此属性有效，表示还需要的流水量
	private String msg;//对应消息提示
	private List<MsgForActivityEnd> MsgList=new ArrayList<MsgForActivityEnd>();
	public String getSt() {
		return st;
	}
	public void setSt(String st) {
		this.st = st;
	}
	public String getBack() {
		return back;
	}
	public void setBack(String back) {
		this.back = back;
	}
	public List<MsgForActivityEnd> getMsgList() {
		return MsgList;
	}
	public String getWash() {
		return wash;
	}
	public void setWash(String wash) {
		this.wash = wash;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}	
}
