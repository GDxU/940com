package com.vinbet.mobile.util;

import java.util.List;
import java.util.Map;

public class JsonResult {
	public static final int JSON_RESULT_SUCCESS = 0;
	public static final int JSON_RESULT_FAILED = 1;
	// 状态码
	private int r = JSON_RESULT_SUCCESS;
	// 描述信息
	private String m;
	// 结果集
	private List<? extends Object> list;
	// 其它数据,JSON中共有的属性
	private Map<String, Object> data;
	// 总页数
	private Integer tps;
	// 当前页
	private Integer cp;
	// 总记录数
	private Integer tc;
	// 具体错误返回码
	private String ec;

	public JsonResult() {
		super();
	}

	public JsonResult(Integer returncode, String message, String code) {
		super();
		this.r = returncode;
		this.m = message;
		this.ec= code;
	}

	/**
	 * 创建成功的JsonResult对象。
	 * 
	 * @return
	 */
	public static JsonResult createSuccess() {
		final JsonResult jsonResult = new JsonResult(JSON_RESULT_SUCCESS, null,null);
		return jsonResult;
	}

	/**
	 * 创建成功的JsonResult对象。
	 * 
	 * @param msg
	 *            描述信息
	 * @return
	 */
	public static JsonResult createSuccess(String msg) {
		final JsonResult jsonResult = new JsonResult(JSON_RESULT_SUCCESS, msg,null);
		return jsonResult;
	}

	/**
	 * 创建失败的JsonResult对象
	 * 
	 * @param msg
	 *            错误描述
	 * @return
	 */
	public static JsonResult createFalied(final String msg) {
		final JsonResult jsonResult = new JsonResult(JSON_RESULT_FAILED, msg,null);
		return jsonResult;
	}
	
	/**
	 * 创建失败的JsonResult对象
	 * 
	 * @param msg
	 *            错误描述
	 * @return
	 */
	public static JsonResult createFalied(final String msg,final String code) {
		final JsonResult jsonResult = new JsonResult(JSON_RESULT_FAILED, msg,code);
		return jsonResult;
	}

	/**
	 * 创建失败的JsonResult对象
	 * 
	 * @return
	 */
	public static JsonResult createFalied() {
		final JsonResult jsonResult = new JsonResult(JSON_RESULT_FAILED, null,null);
		return jsonResult;
	}

	public void addAll(List<? extends Object> list) {
		this.list = list;
	}

	public int getR() {
		return r;
	}

	public void setR(int r) {
		this.r = r;
	}

	public String getM() {
		return m;
	}

	public void setM(String m) {
		this.m = m;
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

	public Map<String, Object> getData() {
		return data;
	}

	public void setData(Map<String, Object> data) {
		this.data = data;
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


	
}
