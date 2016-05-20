package com.vinbet.mobile.sys;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import com.esotericsoftware.reflectasm.MethodAccess;
import com.sgfm.prmtncenter.zreocsrvi.PrmtnCenterIPrx;
import com.sgfm.prmtncenter.zreocsrvi.PrmtnCenterIPrxHelper;
import com.vinbet.mobile.zeroc.ConnectionParam;
import com.vinbet.mobile.zeroc.IceClient;

/**
 * 连接活动中心ICE服务配置管理类。 
 * <pre>
 * <功能详细描述>  
 * </pre>
 * @author  cjp
 * @version  [Ver 1.0]
 * @since 2015-6-8 下午15:55:27
 */
@IocBean
public class CEPPromotionCenterClient {
//    private static Logger logger = Logger.getLogger(CEPPromotionCenterClient.class.getName());
    private Log logger = Logs.getLog(CEPPromotionCenterClient.class);
    private ConnectionParam connParam;
    @Inject
    private PropertiesLoader propertiesLoader;   
    private IceClient icePromotionCenterClient;  
    private PrmtnCenterIPrx prmtnCenterIPrx;
    private MethodAccess prmtnCenterMethodAccess;
    
    public void initCEPPromotionCenterClient() {
    	this.initCEPPromotionCenterFaceClient();
    	this.prmtnCenterMethodAccess = MethodAccess.get(prmtnCenterIPrx.getClass());
    }
    
    /*
     * 初始化【活动中心ice】
     */
    public void initCEPPromotionCenterFaceClient() {
    	int tryCount = 888;
    	String cepPromotionCenterIceIP=propertiesLoader.getTrim("ceppromotioncenter.promotioncenterIce.ip");//从资源文件中获取用户中心ice服务IP地址。
    	String cepPromotionCenterIcePort=propertiesLoader.getTrim("ceppromotioncenter.promotioncenterIce.tcpPort");//从资源文件中获取用户中心ice服务端口地址。
    	String cepPromotionCenterIceObjkey=propertiesLoader.getTrim("ceppromotioncenter.promotioncenterIce.objKey");//活动中心对外提供ICE服务对象连接字
    	logger.info("\n\n开始初始化【活动中心ice】ip:"+cepPromotionCenterIceIP+":"+cepPromotionCenterIcePort+"的ICE客户端。。。。。。");
        this.connParam = new ConnectionParam();
        this.connParam.setIp(cepPromotionCenterIceIP);
        this.connParam.setClientCfgClassPath("com/vinbet/mobile/config/ice/IceCfg_PromotionCenter.client");
        this.connParam.setConnType(ConnectionParam.TCP);//设置服务协议。
        this.connParam.setPort(cepPromotionCenterIcePort);//端口
        this.connParam.setTimeOut(Integer.parseInt(propertiesLoader.getTrim("ceppromotioncenter.promotioncenterIce.timeOut")));//超时时间。
        Map<String, Class> prxHelperMap = new ConcurrentHashMap<String, Class>();
        prxHelperMap.put(cepPromotionCenterIceObjkey, PrmtnCenterIPrxHelper.class);
        while (true) {
            try {
            	tryCount--;
                this.icePromotionCenterClient = new IceClient();
                this.icePromotionCenterClient.initClientPrxs(this.connParam, prxHelperMap);
                this.prmtnCenterIPrx = (PrmtnCenterIPrx) this.icePromotionCenterClient.getPrxByKey(cepPromotionCenterIceObjkey);
                this.icePromotionCenterClient.setAvailable(true);
                logger.info("成功初始化【活动中心ice】ip:"+cepPromotionCenterIceIP+":"+cepPromotionCenterIcePort+"的ICE客户端!");
                break;
            } catch (Exception e) {
            	logger.error("客户端ICE连接服务端【活动中心ice】 "+cepPromotionCenterIceIP+":"+cepPromotionCenterIcePort+" 出现异常 "+e.toString());
				if(tryCount <= 0){
					logger.info("初始化【活动中心ice】ip:"+cepPromotionCenterIceIP+":"+cepPromotionCenterIcePort+"的ICE客户端失败，系统将在下次调用前再次初始化!");
					break;
				}else{
					logger.error("重连失败，请检测网络和活动中心"+cepPromotionCenterIceIP+":"+cepPromotionCenterIcePort+" 的ICE服务是否正常，继续重试...");
				}
				try{Thread.sleep(1000L*2);}catch(Exception e2){}
            }
        }
    }
    
	/**
	 * 销毁活动中心ICE客户端
	 */
    public void destroyCEPPromotionCenterClient() {
    	this.icePromotionCenterClient.destoryProxy();
        logger.info("\n平台前端销毁活动中心ICE客户端成功！");
    }   
    
    /**
     *  调用活动中心接口
     */
    public String promotionCenterZreocSrvIPrx(String methodName,String reqXml) {
    	logger.info("调用活动中心接口[" + methodName + "]，请求报文 >> " + reqXml);
    	String respXml="";
    	try{  
    		if(this.icePromotionCenterClient.isAvailable()){
    			respXml = (String) this.prmtnCenterMethodAccess.invoke(this.prmtnCenterIPrx, methodName, reqXml,null);//这里使用第三方的ReflectASM反射，性能测试结果得出性能比JDK的传统反射高出15倍左右。
    		}else{
    			logger.error("ice客户端暂时不可用isAvailable属性为false！");
    		}
    	}catch(Exception e){
    		if(e instanceof Ice.SocketException){
				synchronized (this.icePromotionCenterClient) {
					logger.error("平台前端ICE连接活动中心中断，正在试图重连...");
					this.icePromotionCenterClient.setAvailable(false);
					//this.initCEPPromotionCenterFaceClient();
					new IceClientResumeThread().start();
				}
				//停顿3s再重新调用服务					
				this.waitForRetard(3*1000);
				//重新调用服务
				if(this.icePromotionCenterClient.isAvailable()){ 					
					respXml = (String) this.prmtnCenterMethodAccess.invoke(this.prmtnCenterIPrx, methodName, reqXml,null);					 
				}else{
					//记录错误报文日志，不再处理此报文
					logger.error("平台前端ICE连接活动中心中断，重试失败，放弃本次接口调用，本次要发送的报文为:"+reqXml,e);
				}
			}else if(e instanceof Ice.TimeoutException){
				logger.error("平台前端ICE连接活动中心操作超时，放弃本次接口调用，本次要发送的报文为:"+reqXml);
			}else{
				logger.error(e.getMessage(),e);
			}
    	}
        
        logger.info("调用用户中心接口[" + methodName + "]，返回报文 >> " + respXml);
        return respXml;
    }
    
    class IceClientResumeThread extends Thread {
   	 private Log logger = Logs.getLog(CEPMgrCenterClient.class);
   	@Override
   	public void run() {
   		logger.info("Web前端修复线程启动，开始修复ICE连接管理中心！");
   		CEPPromotionCenterClient.this.initCEPPromotionCenterClient();
   	}
   }
   
   private void waitForRetard(int second){ 
		byte[] b=new byte[0];
		synchronized (b) {
			try{
				b.wait(second);
			} catch (InterruptedException e1) {
				e1.printStackTrace();
			}
		}
   }

}
