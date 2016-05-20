package com.vinbet.mobile.service.portal;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.nutz.ioc.loader.annotation.IocBean;

import com.vinbet.mobile.entity.portal.Activity;
import com.vinbet.mobile.entity.portal.MsgForActivityEnd;
import com.vinbet.mobile.entity.portal.RespBeanForActivityEnd;
import com.vinbet.mobile.entity.portal.RespBeanForActivityJoin;
import com.vinbet.mobile.entity.portal.RespBeanForUserActivity;
import com.vinbet.mobile.entity.portal.UserActivityInfo;
import com.vinbet.mobile.util.StringUtil;

@IocBean
public class SyncDataForActivity {
	private Log logger = LogFactory.getLog(this.getClass());
	
	/**解析现有活动信息报文**/
	@SuppressWarnings("unchecked")
	public List<Activity> paseNowActivityXML(String xml) throws DocumentException, Exception {
		List<Activity> activityList=new ArrayList<Activity>();
    	if(!StringUtil.isEmpty(xml)){
        	try{
                Document dom = DocumentHelper.parseText(xml);
        		List<Element> eleList = dom.getRootElement().elements();        		
    			for (Element element : eleList) {  
    				Activity activity=new Activity();
    				activity.setActivityMark(element.attribute("activityMark")==null?"":element.attribute("activityMark").getValue());
    				activity.setExtMark(element.attribute("extMark")==null?"":element.attribute("extMark").getValue());
    				activity.setActivityName(element.attribute("activityName")==null?"":element.attribute("activityName").getValue());
    				activity.setCurrActivityNo(element.attribute("currActivityNo")==null?"":element.attribute("currActivityNo").getValue());
    				activity.setTrgPntMark(element.attribute("trgPntMark")==null?"":element.attribute("trgPntMark").getValue());
    				activity.setWalletCategory(element.attribute("walletCategory")==null?"":element.attribute("walletCategory").getValue());
    				activity.setActivityDesc(element.attribute("activityDesc")==null?"":element.attribute("activityDesc").getValue());
    				activity.setStatus(element.attribute("status")==null?"":element.attribute("status").getValue());
    				activity.setActType(element.attribute("actType")==null?"":element.attribute("actType").getValue());
    				activityList.add(activity);
    			}
    			
        	}catch (DocumentException de) {
                throw de;

            }catch (Exception e) {
                throw e;
            }
	    }else{
			logger.info("平台前端ICE调用活动中心获取现有活动信息，包括开启和关闭的返回报文为空！");
        	return null;
		}    	
    	return activityList;
   }
	
	/**解析一个游戏活动的参与用户信息报文**/
	@SuppressWarnings("unchecked")
	public RespBeanForUserActivity paseUserActivityXML(String xml) throws DocumentException, Exception {
		RespBeanForUserActivity respBeanForUserActivity=new RespBeanForUserActivity();		
    	if(!StringUtil.isEmpty(xml)){
        	try{
                Document dom = DocumentHelper.parseText(xml);
                Element eleRoot=dom.getRootElement();
                String type=eleRoot.attribute("type")==null?"":eleRoot.attribute("type").getValue();
                respBeanForUserActivity.setType(type);
        		List<Element> eleList = dom.getRootElement().elements();        		
    			for (Element element : eleList) {  
    				UserActivityInfo userActivityInfo=new UserActivityInfo();
    				userActivityInfo.setUserId(element.attribute("uid")==null?"":element.attribute("uid").getValue());
    				userActivityInfo.setActivityNo(element.attribute("actNo")==null?"":element.attribute("actNo").getValue());
    				userActivityInfo.setWalletCategory(element.attribute("wlc")==null?"":element.attribute("wlc").getValue());
    				userActivityInfo.setExtMark(element.attribute("extMk")==null?"":element.attribute("extMk").getValue());
    				userActivityInfo.setAmt(element.attribute("amt")==null?"":element.attribute("amt").getValue());
    				userActivityInfo.setActivityMark(element.attribute("actm")==null?"":element.attribute("actm").getValue());
    				userActivityInfo.setStatus(element.attribute("st")==null?"":element.attribute("st").getValue());
    				userActivityInfo.setRecordNo(element.attribute("recNo")==null?"":element.attribute("recNo").getValue());
    				respBeanForUserActivity.getUserActivityList().add(userActivityInfo);
    			}
    			
        	}catch (DocumentException de) {
                throw de;

            }catch (Exception e) {
                throw e;
            }
	    }else{
			logger.info("平台前端ICE调用活动中心获取一个游戏活动的参与用户信息返回报文为空！");
			return null;
		}    	
    	return respBeanForUserActivity;
   }
	
	/**解析用户活动相关报文，获取操作方式：1增加,2更新,3删除**/
	public String paseUserActivityXMLForOPT(String xml) throws DocumentException, Exception {
		String opt="";
    	if(!StringUtil.isEmpty(xml)){
        	try{
                Document dom = DocumentHelper.parseText(xml);
        		Element eleRoot= dom.getRootElement();         		
        		opt=eleRoot.attribute("type")==null?"":eleRoot.attribute("type").getValue();    			
        	}catch (DocumentException de) {
                throw de;

            }catch (Exception e) {
                throw e;
            }
	    }else{
			logger.info("平台前端ICE调用活动中心获取一个游戏活动的参与用户信息返回报文为空！");
        	return null;
		}    	
    	return opt;
   }
	
	/**解析结束活动返回报文*/
	@SuppressWarnings("unchecked")
	public RespBeanForActivityEnd paseActivityEndXML(String xml) throws DocumentException, Exception {
		RespBeanForActivityEnd respBean=new RespBeanForActivityEnd();
		if(!StringUtil.isEmpty(xml)){
        	try{
        		Document dom = DocumentHelper.parseText(xml);
        		Element eleRoot= dom.getRootElement(); 
        		respBean.setSt(eleRoot.attribute("st")==null?"":eleRoot.attribute("st").getValue());
        		respBean.setBack(eleRoot.attribute("back")==null?"":eleRoot.attribute("back").getValue());
        		respBean.setWash(eleRoot.attribute("wash")==null?"":eleRoot.attribute("wash").getValue());
        		respBean.setMsg(eleRoot.attribute("msg")==null?"":eleRoot.attribute("msg").getValue());
        		List<Element> eleList = eleRoot.elements(); 
        		for (Element element : eleList) { 
        			MsgForActivityEnd msg= new MsgForActivityEnd();
        			msg.setActNo(element.attribute("actNo")==null?"":element.attribute("actNo").getValue());
        			msg.setSt(element.attribute("st")==null?"":element.attribute("st").getValue());
        			respBean.getMsgList().add(msg);
        		}
        	}catch (DocumentException de) {
                throw de;
            }catch (Exception e) {
                throw e;
            }
		}else{
			logger.info("平台前端ICE调用活动中心结束活动的返回报文为空！");
        	return null;
		} 
		return respBean;
	}
	
	/**解析参加活动返回报文*/
	@SuppressWarnings("unchecked")
	public RespBeanForActivityJoin paseActivityJoinXML(String xml) throws DocumentException, Exception {
		RespBeanForActivityJoin respBean=new RespBeanForActivityJoin();
		if(!StringUtil.isEmpty(xml)){
        	try{
                Document dom = DocumentHelper.parseText(xml);
        		List<Element> eleList = dom.getRootElement().elements(); 
        		for (Element element : eleList) { 
        			respBean.setSt(element.attribute("st")==null?"":element.attribute("st").getValue());
        			respBean.setMsg(element.attribute("msg")==null?"":element.attribute("msg").getValue());
        			break;
        		}
        	}catch (DocumentException de) {
                throw de;

            }catch (Exception e) {
                throw e;
            }
		}else{
			logger.info("平台前端ICE调用活动中心参加活动的返回报文为空！");
        	return null;
		} 
		return respBean;
	}
	
	public boolean paseActivityEndStXML(String xml) throws DocumentException, Exception {
		boolean flag=false;
		if(!StringUtil.isEmpty(xml)){
        	try{
                Document dom = DocumentHelper.parseText(xml);
        		Element rootElement = dom.getRootElement(); 
        		String st=rootElement.attribute("st")==null?"":rootElement.attribute("st").getValue();
        		if("1".equals(st)){
        			//st=”0失败，1成功”
        			flag=true;
        		}
        	}catch (DocumentException de) {
                throw de;

            }catch (Exception e) {
                throw e;
            }
		}else{
			logger.info("平台前端ICE调用活动中心参加活动的返回报文为空！");
		} 
		return flag;
	}
}
