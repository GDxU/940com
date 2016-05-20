package com.vinbet.mobile.service.portal;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;

import com.vinbet.mobile.entity.portal.Activity;
import com.vinbet.mobile.entity.portal.RespBeanForUserActivity;
import com.vinbet.mobile.entity.portal.UserActivityInfo;
import com.vinbet.mobile.enums.PromotionCenterMethodEnum;
import com.vinbet.mobile.sys.CEPPromotionCenterClient;
import com.vinbet.mobile.util.CreateXmlUtil;

/**
 * 活动中心数据服务类 
 * </pre>
 * @author  cjp
 * @version  [Ver 1.0]
 * @since 2015-6-11 下午3:48:47
 */
@IocBean
public class ActivityServiceImpl {
	private static Logger logger = Logger.getLogger(ActivityServiceImpl.class);
	@Inject
	private CEPPromotionCenterClient cEPPromotionCenterClient;
	@Inject
	private SyncDataForActivity syncDataForActivity;
	
	/**调用活动中心ice接口，获取现有活动信息，包括开启和关闭的。*/
	public List<Activity> findActivityList(){
		Map<String, String> reqMap=new HashMap<String, String>();
		Map<String, String> recMap=new HashMap<String, String>();
		reqMap.put("type", "1");
		String reqXML=CreateXmlUtil.createPublicReqXML(reqMap, recMap);
		List<Activity> activityList=null;
		try{	
			logger.debug("\n查询现有活动信息请求报文："+reqXML);
			String resXML=cEPPromotionCenterClient.promotionCenterZreocSrvIPrx(PromotionCenterMethodEnum.BASEDATAOBTAIN.getMethodName(), reqXML);
			activityList=syncDataForActivity.paseNowActivityXML(resXML);			
			logger.debug("\n查询现有活动信息cepPromotionCenterClient.promotionCenterZreocSrvIPrx("+PromotionCenterMethodEnum.BASEDATAOBTAIN.getMethodName()+")的返回报文："+resXML);
		} catch (final Exception e) {
        	logger.error(e.getMessage(),e);
        }
		return activityList;
	}
	
	/**请求一个游戏活动的参与用户信息，包括参与当前活动的全部用户活动状态，和以往同类活动但是用户活动状态未结束的。*/
	public Map<String, Object> findGameListByWallet(Activity activity , String start){	
		Map<String, Object> map = new HashMap<String, Object>();
		List<UserActivityInfo> userActivityInfoList=null;
		Map<String, String> reqMap=new HashMap<String, String>();
		Map<String, String> recMap=new HashMap<String, String>();
		reqMap.put("type", "2");
		reqMap.put("start", start);
		recMap.put("currActivityNo", activity.getCurrActivityNo());
		recMap.put("walletCategory", activity.getWalletCategory());
		String reqXML=CreateXmlUtil.createPublicReqXML(reqMap, recMap);
		String resXML = null;
		try{	
			logger.info("\n查询一个游戏活动的参与用户信息请求报文："+reqXML);
			resXML=cEPPromotionCenterClient.promotionCenterZreocSrvIPrx(PromotionCenterMethodEnum.BASEDATAOBTAIN.getMethodName(), reqXML);			
			RespBeanForUserActivity respBeanForUserActivity=syncDataForActivity.paseUserActivityXML(resXML);
			userActivityInfoList=respBeanForUserActivity.getUserActivityList();
			logger.info("\n查询一个游戏活动的参与用户信息cepPromotionCenterClient.promotionCenterZreocSrvIPrx("+PromotionCenterMethodEnum.BASEDATAOBTAIN.getMethodName()+")的返回报文："+resXML);
		}catch (final Exception e) {
        	logger.error(e.getMessage(),e);
        }
		map.put("list", userActivityInfoList);
		map.put("end", resXML == null ? null:(resXML.indexOf("end=") > 0 ? "1":null));
		return map;
	}
}
