package com.vinbet.mobile.sys.jms;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;
import org.apache.log4j.Logger;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;

import com.vinbet.mobile.entity.portal.RespBeanForUserActivity;
import com.vinbet.mobile.entity.portal.UserActivityInfo;
import com.vinbet.mobile.service.portal.SyncDataForActivity;
import com.vinbet.mobile.sys.AppCache;
import com.vinbet.mobile.util.Constants;

/**
 *用户活动相关：新用户参加活动和参加活动的用户状态变更JMS队列topic_user_act监听业务类。
 * @author  cjp
 * @version  [Ver 1.0]
 * @since 2015-6-14 下午3:40:36
 */
@IocBean
public class UserActivityAboutListener  implements MessageListener{
	private static Logger log = Logger.getLogger(UserActivityAboutListener.class);
	@Inject
	SyncDataForActivity syncDataForActivity;
    @Override
    public void onMessage(Message message) {
    	try{
	    	TextMessage tmsg = (TextMessage) message;
	        String StringMsg = null;
	        try {
	        	StringMsg = tmsg.getText();
                RespBeanForUserActivity respBeanForUserActivity=syncDataForActivity.paseUserActivityXML(StringMsg);
	        	for(UserActivityInfo useActInfo:respBeanForUserActivity.getUserActivityList()){
	        		disposeUserActivityInfo(respBeanForUserActivity.getType(),useActInfo);
	        	}
	        } catch (JMSException e){
	            log.error("\n\n从活动中心消息队列【"+Constants.USER_ACTIVITY_ABOUT+"]获取消息报文错误。\n\n", e);
	            return;
	        }catch (Exception e){
				log.error(e.getMessage());
			}
	        log.info("\n\n从活动中心消息队列【"+Constants.USER_ACTIVITY_ABOUT+"]获取消息报文："+StringMsg+"\n\n");
    	}finally{
	        try {
	        	message.acknowledge();
	        } catch (JMSException e2) {
	            log.error("消息响应失败。", e2);
	        }
    	}
    }
    
    /**
     * 先根据钱包类别标示为key从缓存gameMap中取出该游戏活动的参与用户userMap ，根据活动类别标示为key从userMap中取出参与该类型活动的用户list，根据recNo定位到用户，然后根据type进行操作。
     * @author  cjp
     * @param opt 操作方式：1增加,2更新,3删除
     * @param useActInfo 
     * @since  2015-6-14 下午4:28:18
     */
    private void disposeUserActivityInfo(String opt,UserActivityInfo useActInfo){
    	Map<String,List<UserActivityInfo>> walletGameMap=AppCache.getGameMap().get(useActInfo.getWalletCategory()); 
    	if(Constants.USER_ACTIVITY_ADD.equals(opt)){
    		//增加        		
    		if(walletGameMap==null){
    			walletGameMap = new ConcurrentHashMap<String, List<UserActivityInfo>>();
				AppCache.getGameMap().put(useActInfo.getWalletCategory(), walletGameMap);
    		}
    		
    		List<UserActivityInfo> userActivityInfoCacheList=walletGameMap.get(useActInfo.getActivityMark()+"_"+useActInfo.getExtMark());
    		if(userActivityInfoCacheList==null){
    			userActivityInfoCacheList=new CopyOnWriteArrayList<UserActivityInfo>();
				walletGameMap.put(useActInfo.getActivityMark()+"_"+useActInfo.getExtMark(), userActivityInfoCacheList); 
    		}
    		        		        
    		userActivityInfoCacheList.add(useActInfo);	//向活动用户中list中添加。    
    	}else if(Constants.USER_ACTIVITY_UPDATE.equals(opt)){
    		//更新。 
    		if(walletGameMap==null){
    			return;
    		}
    		
    		List<UserActivityInfo> userActivityInfoCacheList=walletGameMap.get(useActInfo.getActivityMark()+"_"+useActInfo.getExtMark());
    		if(userActivityInfoCacheList==null){
    			return;
    		}
    		
    		for(UserActivityInfo useActCache:userActivityInfoCacheList){
    			if(useActCache.getRecordNo().equals(useActInfo.getRecordNo())){ 
    				userActivityInfoCacheList.remove(useActCache);
    				userActivityInfoCacheList.add(useActInfo);
    				break;
    			}
    		}
    	}else if(Constants.USER_ACTIVITY_DELETE.equals(opt)){
    		//删除
    		if(walletGameMap==null){
    			return;
    		}
    		
    		List<UserActivityInfo> userActivityInfoCacheList=walletGameMap.get(useActInfo.getActivityMark()+"_"+useActInfo.getExtMark());
    		if(userActivityInfoCacheList==null){
    			return;
    		}
    		for(UserActivityInfo useActCache:userActivityInfoCacheList){
    			if(useActCache.getRecordNo().equals(useActInfo.getRecordNo())){ 
    				userActivityInfoCacheList.remove(useActCache);
    				break;
    			}
    		}
    	}    
    	
    }
    	    
}
