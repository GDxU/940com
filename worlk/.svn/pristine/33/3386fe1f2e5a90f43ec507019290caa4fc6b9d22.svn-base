package com.vinbet.mobile.service.portal;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.Mvcs;

import com.vinbet.mobile.domain.UserInfo;
import com.vinbet.mobile.entity.portal.Activity;
import com.vinbet.mobile.entity.portal.RespBeanForActivityEnd;
import com.vinbet.mobile.entity.portal.RespBeanForActivityJoin;
import com.vinbet.mobile.entity.portal.TotalWallet;
import com.vinbet.mobile.entity.portal.UserActivityInfo;
import com.vinbet.mobile.enums.PromotionCenterMethodEnum;
import com.vinbet.mobile.sys.AppCache;
import com.vinbet.mobile.sys.CEPPromotionCenterClient;
import com.vinbet.mobile.util.Constants;
import com.vinbet.mobile.util.CreateXmlUtil;

/**
 * 活动中心业务逻辑处理类。
 * @author  cjp
 * @version  [Ver 1.0]
 * @since 2015-6-21 下午5:29:19
 */
@IocBean
public class ActivityHandleServiceImpl {
	private static Logger logger = Logger.getLogger(ActivityHandleServiceImpl.class);
	@Inject
	private CEPPromotionCenterClient cEPPromotionCenterClient;
	@Inject
	private SyncDataForActivity syncDataForActivity;
	@Inject
	private UserServcieImpl userServcieImpl;

	
	/**查找用户在转出钱包的子应用中参加的活动列表*/
	public List<UserActivityInfo> findUserActivityList(String walletCategory,String userId) {
		List<UserActivityInfo> userActivityList = new ArrayList<UserActivityInfo>();
		Map<String,List<UserActivityInfo>> activityMap=AppCache.getGameMap().get(walletCategory);
		if(activityMap!=null){	
			synchronized (activityMap){ 	        
	        	//检测转出子应用中正在举行的活动中该用户是否参与。查找用户活动状态是活动中的。
		        for (Map.Entry<String,List<UserActivityInfo>> entry : activityMap.entrySet()){
		        	List<UserActivityInfo> userActivityTempList=entry.getValue();
		        	for(UserActivityInfo userAcTemp:userActivityTempList){
		        		if(userAcTemp.getUserId().equals(userId) && userAcTemp.getStatus().equals(Constants.USER_ACTIVITY_STATUS_UNDERWAY)){  
		        			userActivityList.add(userAcTemp);
		        		}
		        	}
		        } 		  
			 }
		}
		Map<String,UserActivityInfo> userActivityMap=new HashMap<String,UserActivityInfo>();
        for(UserActivityInfo uActInfo:userActivityList){
        	//把重复的活动过滤掉。
        	userActivityMap.put(uActInfo.getActivityNo(), uActInfo);
        }
        userActivityList.clear();
        for(Map.Entry<String, UserActivityInfo> item : userActivityMap.entrySet()){
        	userActivityList.add(item.getValue());
        }
		return userActivityList;
	}
	
	/**
	 * 1、获取用户可以参加的活动列表。2、将用户以前参加的活动类型是首划先送的活动，并且钱包余额<1的活动结束。
	 * @author  cjp  
	 * @param walletIn：转入的当前钱包标识
	 * @param trgPntMark：活动的触发点标示
	 * @param userId：用户id
	 * @return 
	 * @throws Exception 
	 * @since  2015-6-2 下午4:28:25
	 */
	public List<Activity> findUserOkActivityList(String walletIn,String trgPntMark,UserInfo userInfo, double balance) throws Exception{
		List<Activity> activityList  = new ArrayList<Activity>();//处于“活动中”的“外部的”活动
		List<Activity> activityCacheList=AppCache.getActivityList();
		if(activityCacheList!=null){
			synchronized (activityCacheList){ 
				for(Activity actTemp:activityCacheList){
					//拿钱包类别标示、触发点标示查询是否有处于“活动中”的“外部的”活动
					if(actTemp.getWalletCategory().equals(walletIn) && actTemp.getTrgPntMark().equals(trgPntMark) && 
					   actTemp.getStatus().equals(Constants.ACTIVITY_STATUS_OPEN) && actTemp.getActType().equals(Constants.ACTIVITY_TYPE_OUT)){ 
					   activityList.add(actTemp);
					}
				}	
			}
		}
		
		Map<String,List<UserActivityInfo>> walletInActUserMap=AppCache.getGameMap().get(walletIn);
		if(walletInActUserMap==null){
			//划入钱包子应用处于“活动中”的“外部的”所有活动，没有任何人参与过。
			return activityList;
		}			
		
		this.waitForRetard(1*1000);//等待1.5s再向用户中心同步数据，防止用户中心的修改数据事务未提交完毕，以至于取到的数据失真。
		HashMap<String, String> req = new HashMap<String, String>();
		HashMap<String, String> rec = new HashMap<String, String>();
		rec.put("uid", userInfo.getUserId());
		rec.put("watyp", walletIn);//1_W_SSC 时时彩钱包,1_W_HK 香港彩钱包,0_W_FCT 翡翠厅钱包,0_W_HJT 皇家厅钱包,0_W_CENTER 中心钱包,1_W_HDYX 测试游戏钱包
		rec.put("utyp", String.valueOf(userInfo.getUserType()));
		rec.put("lg", Mvcs.getDefaultLocalizationKey());
		rec.put("unm", userInfo.getAccoutName());
		String reqXml = CreateXmlUtil.createPublicReqXML(req, rec);
		TotalWallet totalWallet = userServcieImpl.getBalance(reqXml, null,userInfo);
		logger.debug("\n获取钱包"+walletIn+"的总余额为：["+totalWallet.getWalletInfo().get(0).getTotalMoney()+"]");
		double summnyDouble=0;
		try{
		  summnyDouble=Double.valueOf(totalWallet.getWalletInfo().get(0).getTotalMoney());
		}catch(NumberFormatException e){
			logger.error(e.getMessage());
		}	
			
		//遍历处于“活动中”的“外部的”活动
		boolean userForThisActFlag = false;
		for(Activity actTemp:activityList){
			List<UserActivityInfo> userActList=walletInActUserMap.get(actTemp.getActivityMark()+"_"+actTemp.getExtMark());				
			if(userActList!=null){
				synchronized (userActList){ 
					for(UserActivityInfo userAct:userActList){
						if(userAct.getUserId().equals(userInfo.getUserId())){ 
							userForThisActFlag=true;//标识用户已经参加了当前遍历的活动。
							//找到用户参加此活动
							if(Constants.ACTIVITY_MARK_GIFTBEFOREWASHIMPL.indexOf(userAct.getActivityMark()) >= 0){//判断是否该活动是“首划先送红利”						
							    if(summnyDouble-balance <=1){
							         //调用活动中心强制结束活动的接口;	
							    	logger.debug("====findUserOkActivityList:ID为"+userInfo.getUserId()+"的用户钱包"+totalWallet.getWalletInfo().get(0).getWalletCategory()+"亏损完毕(summnyDouble-balance)，结束活动,当前钱包总余额summnyDouble= "+summnyDouble+" ， 该笔转入balance="+balance);
							    	this.waiveActivityForce(userInfo,"",balance,userAct.getActivityNo(),"1");
								}
							}
						}
					}
				}	
			}		
		}
		if(userForThisActFlag){
			//用户已经参加过活动，不能再参加其他任何活动了。
			activityList.clear();
		}		
		return activityList;
	}
	
	public RespBeanForActivityEnd activityEnd(List<String> actNoList,UserInfo userInfo,String walletOut_summny,double balance) throws Exception{
	    Document document = DocumentHelper.createDocument();
	    Element reqEle = document.addElement("req");	    
	    reqEle.addAttribute("uid",userInfo.getUserId());
	    reqEle.addAttribute("uname",userInfo.getAccoutName());
	    reqEle.addAttribute("bln",walletOut_summny);
	    reqEle.addAttribute("trsc",String.valueOf(balance));
	    reqEle.addAttribute("cny", userInfo.getCurrencyName());	
	    for(String actNo:actNoList){
	    	Element recEle = reqEle.addElement("rec"); //根下面创造一个子节点
	    	recEle.addAttribute("actNo",actNo);
	    }
	    document.setXMLEncoding("UTF-8");
	    String reqXML=document.asXML();	     	
		logger.info("\n结束活动的请求报文："+reqXML);
		String resXML=cEPPromotionCenterClient.promotionCenterZreocSrvIPrx(PromotionCenterMethodEnum.ACTIVITYEND.getMethodName(), reqXML);
		logger.info("\n结束活动的活动中心接口("+PromotionCenterMethodEnum.ACTIVITYEND.getMethodName()+")返回报文："+resXML);
		RespBeanForActivityEnd respBean;
		try {
			respBean=syncDataForActivity.paseActivityEndXML(resXML);
		}catch (DocumentException de) {
            throw de;
        }catch (Exception e) { 
            throw e;
        }
		return respBean;
	}
	
	public RespBeanForActivityEnd activityEnd(List<String> actNoList,UserInfo userInfo) throws Exception{
	    Document document = DocumentHelper.createDocument();
	    Element reqEle = document.addElement("req");	    
	    reqEle.addAttribute("uid",userInfo.getUserId());
	    reqEle.addAttribute("uname",userInfo.getAccoutName());
	    reqEle.addAttribute("cny", userInfo.getCurrencyName());	
	    for(String actNo:actNoList){
	    	Element recEle = reqEle.addElement("rec"); //根下面创造一个子节点
	    	recEle.addAttribute("actNo",actNo);
	    }
	    document.setXMLEncoding("UTF-8");
	    String reqXML=document.asXML();	     	
		logger.info("\n结束活动的请求报文："+reqXML);
		String resXML=cEPPromotionCenterClient.promotionCenterZreocSrvIPrx(PromotionCenterMethodEnum.ACTIVITYEND.getMethodName(), reqXML);
		logger.info("\n结束活动的活动中心接口("+PromotionCenterMethodEnum.ACTIVITYEND.getMethodName()+")返回报文："+resXML);
		RespBeanForActivityEnd respBean;
		try {
			respBean=syncDataForActivity.paseActivityEndXML(resXML);
		}catch (DocumentException de) {
            throw de;
        }catch (Exception e) { 
            throw e;
        }
		return respBean;
	}
	
	/**
	 * 参加活动
	 * @author  cjp
	 * @param userInfo
	 * @param ip 
	 * @param balance  触发金额
	 * @param actNo
	 * @return  活动编号
	 * @throws Exception 
	 * @since  2015-6-21 下午8:09:10
	 */
	public RespBeanForActivityJoin joinActivity(UserInfo userInfo,String ip,double balance,String actNo) throws Exception{
		RespBeanForActivityJoin respBean=null;
		try{ 			
			Map<String, String> recMap=new HashMap<String, String>();
			recMap.put("uid",userInfo.getUserId());
			recMap.put("phne",userInfo.getMobile()==null?"":userInfo.getMobile());
			recMap.put("mail",userInfo.getEmail()==null?"":userInfo.getEmail());
			recMap.put("uname",userInfo.getAccoutName());
			recMap.put("ip",ip);
			recMap.put("amt", balance+"");
			recMap.put("actNo", actNo);			
			recMap.put("cny", userInfo.getCurrencyName());
			String reqXML=CreateXmlUtil.createPublicReqXML(null, recMap);	
			
			logger.info("\n用户参加活动请求报文："+reqXML);
			String resXML=cEPPromotionCenterClient.promotionCenterZreocSrvIPrx(PromotionCenterMethodEnum.ACTIVITYJOIN.getMethodName(), reqXML);		
			logger.info("\n用户参加活动调用活动中心接口("+PromotionCenterMethodEnum.ACTIVITYJOIN.getMethodName()+")返回报文："+resXML);
			respBean=syncDataForActivity.paseActivityJoinXML(resXML);
		}catch (DocumentException de) {
            throw de;
        }catch (Exception e) {
            throw e;
        }
		return respBean;
	}
	
	/**
	 * 放弃活动
	 * @author  cjp
	 * @param userInfo
	 * @param ip 
	 * @param balance  触发金额
	 * @param actNo
	 * @return  活动编号
	 * @throws Exception 
	 * @since  2015-6-21 下午8:09:10
	 */
	public void waiveActivity(UserInfo userInfo,String ip,double balance,String actNoForWaive) throws Exception{
		try{ 	
			if(actNoForWaive!=null){
				String[] actNos=actNoForWaive.split(",");
				for(String actNo:actNos){
					Map<String, String> recMap=new HashMap<String, String>();
					recMap.put("uid",userInfo.getUserId());
					recMap.put("phne",userInfo.getMobile()==null?"":userInfo.getMobile());
					recMap.put("mail",userInfo.getEmail()==null?"":userInfo.getEmail());
					recMap.put("ip",ip);
					recMap.put("amt", balance+"");
					recMap.put("actNo", actNo);		
					recMap.put("uname", userInfo.getAccoutName());	
					String reqXML=CreateXmlUtil.createPublicReqXML(null, recMap);	
					
					logger.info("\n用户放弃活动请求报文："+reqXML);
					String resXML=cEPPromotionCenterClient.promotionCenterZreocSrvIPrx(PromotionCenterMethodEnum.ACTIVITYABORT.getMethodName(), reqXML);		
					logger.info("\n用户放弃活动调用活动中心接口("+PromotionCenterMethodEnum.ACTIVITYABORT.getMethodName()+")返回报文："+resXML);
				}
			}

		}catch (Exception e) {
            throw e;
        }
	}
	
	/**
	 *结束用户活动状态的接口
	 * @author  cjp  
	 * @param userInfo
	 * @param actNoList
	 * @return 
	 * @throws Exception 
	 * @since  2015-7-24 下午2:00:31
	 */
	public boolean commonSrv(UserInfo userInfo,List<Activity> actNoList) throws Exception{
		boolean flag=false;
	    Document document = DocumentHelper.createDocument();
	    Element reqEle = document.addElement("req");	 
	    reqEle.addAttribute("type","1");
	    reqEle.addAttribute("uid",userInfo.getUserId());	    
		for(Activity act:actNoList){
	    	Element recEle = reqEle.addElement("rec"); //根下面创造一个子节点
	    	recEle.addAttribute("actNo",act.getCurrActivityNo());
	    	recEle.addAttribute("st",act.getSt());
		}
	    document.setXMLEncoding("UTF-8");
	    String reqXML=document.asXML();	     	
		logger.info("\n结束用户活动状态的接口的请求报文："+reqXML);
		String resXML=cEPPromotionCenterClient.promotionCenterZreocSrvIPrx(PromotionCenterMethodEnum.COMMONSRV.getMethodName(), reqXML);
		logger.info("\n结束用户活动状态的接口("+PromotionCenterMethodEnum.COMMONSRV.getMethodName()+")返回报文："+resXML);
		try {
			flag=syncDataForActivity.paseActivityEndStXML(resXML);
			if(flag==false){
				logger.error("\n用户【"+userInfo.getAccoutName()+"】同意强转后，调用活动中心结束用户活动状态的接口返回失败！\n请求活动中心报文为：【"+reqXML+"】\n");
			}
		}catch (DocumentException de) {
            throw de;
        }catch (Exception e) {  
            throw e;
        }
		return flag;
	}
	
	public void waiveActivityForce(UserInfo userInfo,String ip,double balance,String actNoForWaive,String force) throws Exception{
		try{ 	
			if(actNoForWaive!=null){
				String[] actNos=actNoForWaive.split(",");
				for(String actNo:actNos){
					Map<String, String> recMap=new HashMap<String, String>();
					recMap.put("uid",userInfo.getUserId());
					recMap.put("phne",userInfo.getMobile()==null?"":userInfo.getMobile());
					recMap.put("mail",userInfo.getEmail()==null?"":userInfo.getEmail());
					recMap.put("ip",ip);
					recMap.put("amt", String.valueOf(balance));
					recMap.put("actNo", actNo);		
					recMap.put("uname", userInfo.getAccoutName());	
					if(force!=null){
						recMap.put("force", force);	
					}
					String reqXML=CreateXmlUtil.createPublicReqXML(null, recMap);	
					
					logger.info("\n用户放弃活动请求报文："+reqXML);
					String resXML=cEPPromotionCenterClient.promotionCenterZreocSrvIPrx(PromotionCenterMethodEnum.ACTIVITYABORT.getMethodName(), reqXML);		
					logger.info("\n用户放弃活动调用活动中心接口("+PromotionCenterMethodEnum.ACTIVITYABORT.getMethodName()+")返回报文："+resXML);
				}
			}

		}catch (Exception e) {
            throw e;
        }
	}
	
    private void waitForRetard(int second) throws InterruptedException{ 
		byte[] b=new byte[0];
		synchronized (b) {
			b.wait(second);
		}
    }
	public static void main(String[] args) {

	}
}
