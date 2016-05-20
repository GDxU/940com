package com.vinbet.mobile.entity.portal;

import java.util.HashMap;
import java.util.Map;

/**
 * 方法返回结果 bean
 * 
 * <pre>
 * <功能详细描述>
 * </pre>
 * 
 * @author cjp
 * @version [Ver 1.0]
 * @since 2015-6-9 下午5:38:37
 */
public class ResultBean {
	/** 返回结果 */
	private String result;
	/** 是否错误 */
	private boolean isError=false;
	/** 错误信息 */
	private String errmsg;
	
	private Map<String,String> errMap=new HashMap<String, String>();
	
	public ResultBean(){}
	
	public ResultBean(String errmsg){
		this.isError=true;
		this.errmsg=errmsg;
	}

	public String getResult() {
		return result;
	}
    /**设置方法返回结果*/
	public void setResult(String result) {
		this.result = result;
	}

	public boolean isError() {
		return isError;
	}
  
	public String getErrmsg() {
		return errmsg;
	}
    /**方法返回错误信息*/
	public void setErrmsg(String errmsg) {
		this.isError=true;
		this.errmsg = errmsg;
	}
 

	public Map<String, String> getErrMap() {
		return errMap;
	}

	public void setErrMap(String field,String errmsg) {
		this.isError=true;
		this.errMap.put(field, errmsg);
	}

}
