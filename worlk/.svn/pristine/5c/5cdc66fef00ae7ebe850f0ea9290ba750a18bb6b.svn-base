package com.vinbet.mobile.timer.portal;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;

import com.vinbet.mobile.entity.portal.FreezeCount;
import com.vinbet.mobile.sys.AppCache;
import com.vinbet.mobile.sys.CEPUserCenterIceClient;
import com.vinbet.mobile.util.Constants;
import com.vinbet.mobile.util.CreateXmlUtil;
import com.vinbet.mobile.util.JsonResult;

/**
 * 定时清理异常登录失败用户缓存
 * 
 */


@IocBean
public class UserLoginFailedTask implements Runnable {
	private Log logger = Logs.get();
	@Inject
	private CEPUserCenterIceClient cEPUserCenterIceClient;
	@Override
	public void run() {
		try {
			//用户资金密码错误清除任务
			Map<String, FreezeCount> map = AppCache.userFundPwdErrorRecord;
			Long fundErrorTime = (long)Double.parseDouble(AppCache.getSystemParm(Constants.FUND_PWD_ERROR_TIME))*1000L*60;
			Long freezeTime = (long)Double.parseDouble(AppCache.getSystemParm(Constants.UNFREEZE_TIME))*1000L*60;
			int maxError = Integer.parseInt(AppCache.getSystemParm(Constants.FUND_PWD_ERROR_CONUT));
			boolean flag = false;
			int fundcount=0;
			int freezecount=0;
			Iterator<Entry<String, FreezeCount>> it = map.entrySet().iterator();
			while(it.hasNext()){
				Entry<String, FreezeCount> entry = (Entry<String, FreezeCount>)it.next();
				FreezeCount freezeCount = entry.getValue();
				if(freezeCount.getCount()>=maxError){
					if(freezeCount.getFreezeTimer()==null || System.currentTimeMillis()-freezeCount.getFreezeTimer()>freezeTime){
						flag = true;
						HashMap<String, String> req = new HashMap<String, String>();
						HashMap<String, String> rec = new HashMap<String, String>();
						req.put("opt", "2");// 1、新增，2、修改
						rec.put("uid",entry.getKey());// 用户ID
						rec.put("ust", "1");// 用户状态 1正常
						rec.put("frzrs"," ");// 冻结原因需置为空
						String xml = CreateXmlUtil.createPublicReqXML(req, rec);
						String response = cEPUserCenterIceClient.baseManagerZreocSrvIPrx("cashUserRegister", xml);
						if (response != null && !response.equals("")) {
							Document doc = DocumentHelper.parseText(response);
							Element root = doc.getRootElement();
							String resultCode = root.attributeValue("st");
							if (resultCode.equals(Constants.SUCCESS)) {
								it.remove();
							}
						}
					}
				}else{
					if(System.currentTimeMillis()-freezeCount.getFirstTimer()>fundErrorTime){
						flag = true;
						it.remove();
					}
				}
			}
			if(flag){
				AppCache.writeFreezeFile(map);
			}
			logger.info("定时任务清理资金密码错误用户以及冻结用户信息...资金密码错误用户:" + fundcount+"冻结用户："+freezecount);
			
			//用户资金密码错误清除任务
			Map<String, FreezeCount> loginmap = AppCache.userLoginPwdErrorRecord;
			Long loginErrorTime = (long)Double.parseDouble(AppCache.getSystemParm(Constants.LOGIN_PWD_ERROR_TIME))*1000L*60;
			Long lockTime = (long)Double.parseDouble(AppCache.getSystemParm(Constants.UNLOCK_TIME))*1000L*60;
			int loginMaxError = Integer.parseInt(AppCache.getSystemParm(Constants.LOGIN_PWD_ERROR_CONUT));
			Iterator<Entry<String, FreezeCount>> lit = loginmap.entrySet().iterator();
			while(lit.hasNext()){
				Entry<String, FreezeCount> entry = (Entry<String, FreezeCount>)lit.next();
				FreezeCount loginLockCount = entry.getValue();
				if(loginLockCount.getCount()>=loginMaxError){
					if(loginLockCount.getFreezeTimer()==null || System.currentTimeMillis()-loginLockCount.getFreezeTimer()>lockTime){
						lit.remove();
					}
				}else{
					if(System.currentTimeMillis()-loginLockCount.getFirstTimer()>loginErrorTime){
						lit.remove();
					}
				}
			}
			//AppCache.userFundPwdErrorRecord.clear();
		} catch (Exception e) {
			logger.error("定时任务清理资金密码错误用户以及冻结用户异常！",e);
		}
	}
	/*public static void main(String[] args) {
		Map<String,FreezeCount> map = new HashMap<String, FreezeCount>();
		FreezeCount count = new FreezeCount();
		count.setCount(1);
		count.setFirstTimer(System.currentTimeMillis());
		count.setFreezeTimer(System.currentTimeMillis());
		map.put("abc",count);
		File file = new File("person.out");
		Map<String, FreezeCount> newPerson;
		try {
			ObjectOutputStream oout = new ObjectOutputStream(new FileOutputStream(file));
			oout.writeObject(map);
			oout.close();
			ObjectInputStream oin = new ObjectInputStream(new FileInputStream(file));
			newPerson = (Map)oin.readObject();
			oin.close();
			System.out.println(newPerson);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}*/
	public static void main(String[] args) {
		double a =0.01133;
		double b =0.02233;
		System.out.println((a*10+b*10)/10);
	}
}
