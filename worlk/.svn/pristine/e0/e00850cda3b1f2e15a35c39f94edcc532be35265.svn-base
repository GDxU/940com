package com.vinbet.mobile.timer.portal;

import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;

import com.vinbet.mobile.sys.AppCache;

/**
 * 定时清理用户输入验证码次数任务
 * 
 */
@IocBean
public class UserSendCodeCountTask implements Runnable {
	private Log logger = Logs.get();

	@Override
	public void run() {
		try {
			logger.info("定时任务清理用户输入验证码次数信息...count:" + AppCache.userGetCodeRecord.size());
			AppCache.userGetCodeRecord.clear();
		} catch (Exception e) {
		}
	}
}
