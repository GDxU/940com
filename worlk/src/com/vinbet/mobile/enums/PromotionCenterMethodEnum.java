package com.vinbet.mobile.enums;

/**
 * 活动中心提供的所有ice接口
 * <pre>
 * <功能详细描述>  
 * </pre>
 * @author  cjp
 * @version  [Ver 1.0]
 * @since 2015-5-11 下午4:18:36
 */
public enum PromotionCenterMethodEnum {
	BASEDATAOBTAIN("baseDataObtain","查询基本活动信息数据"),	
	ACTIVITYAUTH("activityAuth","活动授权，这个接口先搁置不用"),
	ACTIVITYJOIN("activityJoin","参与活动"),
	ACTIVITYABORT("activityAbort","取消活动"),
	ACTIVITYEND("activityEnd","结束活动，第一次调用该方法force必须为0，如果能够正常转出则st返回0，如果st返回时1则拒绝用户转出，如果st返回时2，让用户选择是否强制转出，如果同意强制转出则再次请求时force=1"),
	COMMONSRV("commonSrv","通用接口，此接口暂未启用"); 
	
	private String methodName;
	private String explanation;
	
    private PromotionCenterMethodEnum(String methodName,String explanation){
     	this.methodName = methodName;
     	this.explanation = explanation;
    }
    
    public String getMethodName() {
        return this.methodName;
    }

    public String getExplanation() {
        return this.explanation;
    }

}
