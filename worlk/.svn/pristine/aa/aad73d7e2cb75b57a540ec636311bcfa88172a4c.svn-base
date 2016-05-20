package com.vinbet.mobile.sys.jms;

import java.util.ArrayList;
import java.util.List;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;

import org.apache.log4j.Logger;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;

import com.vinbet.mobile.entity.portal.Activity;
import com.vinbet.mobile.service.portal.SyncDataForActivity;
import com.vinbet.mobile.sys.AppCache;
import com.vinbet.mobile.util.Constants;
/**
 *活动相关：新增活动和活动状态变化JMS队列topic_act监听业务类。
 * @author  cjp
 * @version  [Ver 1.0]
 * @since 2015-6-14 上午11:34:08
 */
@IocBean
public class ActivityAboutListener  implements MessageListener{
	private static Logger log = Logger.getLogger(ActivityAboutListener.class);
	@Inject
	private SyncDataForActivity syncDataForActivity;
    @Override
    public void onMessage(Message message) {
    	try{
	    	TextMessage tmsg = (TextMessage) message;
	        String StringMsg = null;
	        try {
	        	StringMsg = tmsg.getText();
	        	
	        	List<Activity> activityList=syncDataForActivity.paseNowActivityXML(StringMsg);
	        	for(Activity act:activityList){
	        		disposeActivity(act);
	        	}
	        	System.out.println(StringMsg);
	        } catch (JMSException e) {
	            log.error("\n\n从活动中心消息队列【"+Constants.ACTIVITY_ABOUT+"]获取消息报文错误。\n\n", e);
	            return;
	        }catch (Exception e) {
				log.error(e.getMessage());
			}
	        log.info("\n\n从活动中心消息队列【"+Constants.ACTIVITY_ABOUT+"]获取消息报文："+StringMsg+"\n\n");
    	}finally{
	        try {
	        	message.acknowledge();
	        } catch (JMSException e2) {
	            log.error("消息响应失败。", e2);
	        }
    	}
    }
    
    /**
     * 拿着activityMark和 walletCategory比对现有缓存数据，如果缓存中有则更新其内容，如果缓存中没有则新增到缓存。
     * @author  
     * @param act 
     * @since  2015-5-13 下午6:07:50
     */
    private void disposeActivity(Activity act){
    	List<Activity> activityCacheList=AppCache.getActivityList();
    	List<Activity> activityRemoveList=new ArrayList<Activity>();
    	for(Activity actCache:activityCacheList){
    		//拿着activityMark和 walletCategory比对现有缓存数据，如果缓存中有则更新其内容
    		if(actCache.getActivityMark().equals(act.getActivityMark()) && actCache.getWalletCategory().equals(act.getWalletCategory()) 
    				&& actCache.getExtMark().equals(act.getExtMark())){      			
    			activityRemoveList.add(actCache); 
    			break;
    		}
    	}
		//如果缓存中有则更新其内容，如果缓存中没有则新增到缓存。
    	AppCache.getActivityList().removeAll(activityRemoveList);
    	AppCache.getActivityList().add(act);    	
    }    

}
