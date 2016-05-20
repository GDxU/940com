package com.vinbet.mobile.sys;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;

import com.cep.mgrcenter.zreocsrvi.PrmtSynZreocSrvIPrx;
import com.cep.mgrcenter.zreocsrvi.PrmtSynZreocSrvIPrxHelper;
import com.vinbet.mobile.zeroc.ConnectionParam;
import com.vinbet.mobile.zeroc.IceClient;

/**
 * 连接管理中心ICE服务配置管理类。 
 * <pre>
 * <功能详细描述>  
 * </pre>
 * @author  cjp
 * @version  [Ver 1.0]
 * @since 2015-4-6 上午11:24:27
 */
@IocBean
public class CEPMgrCenterClient {
//    private static Logger logger = Logger.getLogger(CEPMgrCenterClient.class.getName());
    private Log logger = Logs.getLog(CEPMgrCenterClient.class);
    private ConnectionParam connParam;
    @Inject
	private PropertiesLoader propertiesLoader;   
    private IceClient iceClient;
    private PrmtSynZreocSrvIPrx prmtSynZreocSrvIPrx;
    
    
    @SuppressWarnings("rawtypes")
	public void initCEPMgrCenterClient() {
    	int tryCount = 888;
    	String cepMgrCenterIceIP=propertiesLoader.getTrim("cepmgrcenter.cepmgrcenterIce.ip");//从资源文件中获取管理中心ice服务IP地址。
    	String cepMgrCenterIcePort=propertiesLoader.getTrim("cepmgrcenter.cepmgrcenterIce.tcpPort");//从资源文件中获取管理中心ice服务端口地址。
    	String cepMgrCenterIceObjkey=propertiesLoader.getTrim("cepmgrcenter.cepmgrcenterIce.objKey");//和管理中心约定的秘钥
    	logger.info("\n\n开始初始化【管理中心ice】ip:"+cepMgrCenterIceIP+":"+cepMgrCenterIcePort+"的ICE客户端。。。。。。");
        this.connParam = new ConnectionParam();
        this.connParam.setClientCfgClassPath("com/vinbet/mobile/config/ice/IceCfg_MgrCenter.client");
        this.connParam.setConnType(ConnectionParam.TCP);//TCP方式访问。
        this.connParam.setPort(cepMgrCenterIcePort);//TCP的端口
        this.connParam.setTimeOut(Integer.parseInt(propertiesLoader.getTrim("cepmgrcenter.cepmgrcenterIce.timeOut")));//超时时间。
        Map<String, Class> prxHelperMap = new ConcurrentHashMap<String, Class>();
        prxHelperMap.put(cepMgrCenterIceObjkey, PrmtSynZreocSrvIPrxHelper.class);
        while (true) {
            try {
            	tryCount--;
                this.connParam.setIp(cepMgrCenterIceIP);
                this.iceClient = new IceClient();
                this.iceClient.initClientPrxs(this.connParam, prxHelperMap);
                this.prmtSynZreocSrvIPrx = (PrmtSynZreocSrvIPrx) this.iceClient.getPrxByKey(cepMgrCenterIceObjkey);
                this.iceClient.setAvailable(true);
                logger.info("成功初始化【管理中心ice】ip:"+cepMgrCenterIceIP+":"+cepMgrCenterIcePort+"的ICE客户端!");
                break;
            } catch (Exception e) {
            	logger.error("客户端ICE连接服务端【管理中心ice】 "+cepMgrCenterIceIP+":"+cepMgrCenterIcePort+" 出现异常 "+e.toString());
				if(tryCount <= 0){
					logger.info("初始化【管理中心ice】ip:"+cepMgrCenterIceIP+":"+cepMgrCenterIcePort+"的ICE客户端失败，系统将在下次调用前再次初始化!");
					break;
				}else{
					logger.error("重连失败，请检测网络和管理中心"+cepMgrCenterIceIP+":"+cepMgrCenterIcePort+" 的ICE服务是否正常，继续重试...");
				}
				try{Thread.sleep(1000L*2);}catch(Exception e2){}
            }
        }
    }
    
	/**
	 * 销毁管理中心ICE客户端
	 */
    public void destroyCEPMgrCenterClient() {
    	this.iceClient.destoryProxy();
        logger.info("平台前端销毁管理中心ICE客户端成功！");
    }
    
    //调用管理中心Ice提供的接口，从管理中心获取数据字典。
    public String getSyncPrmtData(String reqXml) {
    	logger.debug("getSyncPrmtData请求报文："+reqXml);
    	String respXml="";
    	try{
    		if(this.iceClient.isAvailable()){
    			respXml = this.prmtSynZreocSrvIPrx.syncPrmtData(reqXml);
    		}else{
    			logger.error("ice客户端暂时不可用isAvailable属性为false！");
    		}
    	}catch(Exception e){
    		if(e instanceof Ice.SocketException){
				synchronized (this.iceClient) {
					logger.error("平台前端ICE连接管理中心中断，正在试图重连...");
					iceClient.setAvailable(false);
					//this.initCEPMgrCenterClient();
					new IceClientResumeThread().start();
				}
				//停顿3s再重新调用服务					
				this.waitForRetard(3*1000);
				//重新调用服务
				if(iceClient.isAvailable()){
					respXml = this.prmtSynZreocSrvIPrx.syncPrmtData(reqXml);
				}else{
					//记录错误报文日志，不再处理此报文
					logger.error("平台前端ICE连接管理中心中断，重试失败，放弃本次接口调用，本次要发送的报文为:"+reqXml,e);
				}
			}else if(e instanceof Ice.TimeoutException){
				logger.error("平台前端ICE连接管理中心操作超时，放弃本次接口调用，本次要发送的报文为:"+reqXml);
			}else{
				logger.error(e.getMessage(),e);
			}
    	}
        
        logger.debug("getSyncPrmtData从管理中心收到数据字典返回报文："+respXml);
        return respXml;
    }
    /**
     *  调用管理中心ICE接口获取财务员信息 用于提款审核
     * @author  cjp  
     * @param reqXml
     * @return 
     * @since  2015-4-12 下午12:23:22
     */
    public String retTreasureData(String reqXml) {
    	logger.debug("retTreasureData请求报文："+reqXml); 
    	String respXml="";
    	try{
    		if(this.iceClient.isAvailable()){
    			respXml = this.prmtSynZreocSrvIPrx.retTreasureData(reqXml);
    		}else{
    			logger.error("ice客户端暂时不可用isAvailable属性为false！");
    		}
    	}catch(Exception e){
    		if(e instanceof Ice.SocketException){
				synchronized (this.iceClient) {
					logger.error("平台前端ICE连接管理中心中断，正在试图重连...");
					iceClient.setAvailable(false);
					//this.initCEPMgrCenterClient();
					new IceClientResumeThread().start();
				}
				//停顿3s再重新调用服务					
				this.waitForRetard(3*1000);
				//重新调用服务
				if(iceClient.isAvailable()){
					respXml = this.prmtSynZreocSrvIPrx.retTreasureData(reqXml);
				}else{
					//记录错误报文日志，不再处理此报文
					logger.error("平台前端ICE连接管理中心中断，重试失败，放弃本次接口调用，本次要发送的报文为:"+reqXml,e);
				}
			}else if(e instanceof Ice.TimeoutException){
				logger.error("平台前端ICE连接管理中心操作超时，放弃本次接口调用，本次要发送的报文为:"+reqXml);
			}else{
				logger.error(e.getMessage(),e);
			}
    	}
        
        logger.debug("retTreasureData从管理中心收到数据字典返回报文："+respXml);
        return respXml;
    }
    
    class IceClientResumeThread extends Thread {
    	 private Log logger = Logs.getLog(CEPMgrCenterClient.class);
    	@Override
    	public void run() {
    		logger.info("Web前端修复线程启动，开始修复ICE连接管理中心！");
    		CEPMgrCenterClient.this.initCEPMgrCenterClient();
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
