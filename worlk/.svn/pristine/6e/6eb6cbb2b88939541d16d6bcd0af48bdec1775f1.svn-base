package com.vinbet.mobile.util;

import java.util.List;
import java.util.Map;

public class ApiJsonResult {
	public static final int JSON_RESULT_SUCCESS = 1;
	public static final int JSON_RESULT_FAILED = 0;
	// 状态码
	private int st = JSON_RESULT_SUCCESS;
	// 描述信息
	private String msg;
	// 结果集
	private List<? extends Object> list;
	// 其它数据,JSON中共有的属性
	private Map<String, Object> obj;
	// 总页数
	private Integer tps;
	// 当前页
	private Integer cp;
	// 总记录数
	private Integer tc;
	// 具体错误返回码
	private String ec;
	
	private Object rec;


	public ApiJsonResult() {
		super();
	}

	public ApiJsonResult(Integer returncode, String message, String code) {
		super();
		this.st = returncode;
		this.msg = message;
		this.ec= code;
	}

	/**
	 * 创建成功的JsonResult对象。
	 * 
	 * @return
	 */
	public static ApiJsonResult createSuccess() {
		final ApiJsonResult jsonResult = new ApiJsonResult(JSON_RESULT_SUCCESS, null,null);
		return jsonResult;
	}

	/**
	 * 创建成功的JsonResult对象。
	 * 
	 * @param msg
	 *            描述信息
	 * @return
	 */
	public static ApiJsonResult createSuccess(String msg) {
		final ApiJsonResult jsonResult = new ApiJsonResult(JSON_RESULT_SUCCESS, msg,null);
		return jsonResult;
	}

	/**
	 * 创建失败的JsonResult对象
	 * 
	 * @param msg
	 *            错误描述
	 * @return
	 */
	public static ApiJsonResult createFalied(final String msg) {
		final ApiJsonResult jsonResult = new ApiJsonResult(JSON_RESULT_FAILED, msg,null);
		return jsonResult;
	}
	
	/**
	 * 创建失败的JsonResult对象
	 * 
	 * @param msg
	 *            错误描述
	 * @return
	 */
	public static ApiJsonResult createFalied(final String msg,final String code) {
		final ApiJsonResult jsonResult = new ApiJsonResult(JSON_RESULT_FAILED, msg,code);
		return jsonResult;
	}

	/**
	 * 创建失败的JsonResult对象
	 * 
	 * @return
	 */
	public static ApiJsonResult createFalied() {
		final ApiJsonResult jsonResult = new ApiJsonResult(JSON_RESULT_FAILED, null,null);
		return jsonResult;
	}

	public void addAll(List<? extends Object> list) {
		this.list = list;
	}

	public List<? extends Object> getList() {
		return list;
	}

	public void setList(List<? extends Object> list) {
		this.list = list;
	}

	public Integer getTps() {
		return tps;
	}

	public void setTps(Integer tps) {
		this.tps = tps;
	}

	public Integer getCp() {
		return cp;
	}

	public void setCp(Integer cp) {
		this.cp = cp;
	}



	public Integer getTc() {
		return tc;
	}

	public void setTc(Integer tc) {
		this.tc = tc;
	}

	public String getEc() {
		return ec;
	}

	public void setEc(String ec) {
		this.ec = ec;
	}

	public int getSt() {
		return st;
	}

	public void setSt(int st) {
		this.st = st;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Map<String, Object> getObj() {
		return obj;
	}

	public void setObj(Map<String, Object> obj) {
		this.obj = obj;
	}

	public Object getRec() {
		return rec;
	}

	public void setRec(Object rec) {
		this.rec = rec;
	}
	
	
}
