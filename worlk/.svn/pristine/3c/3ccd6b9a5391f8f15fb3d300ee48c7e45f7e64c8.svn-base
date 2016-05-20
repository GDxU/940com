package com.vinbet.mobile.timer.portal;

import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;

import com.vinbet.mobile.entity.portal.CollectionInfo;
import com.vinbet.mobile.sys.AppCache;

@IocBean
public class CollectionInfoClearTask implements Runnable {
	private Log logger = Logs.getLog(CollectionInfoClearTask.class);

	// @Inject
	// private PropertiesLoader propertiesLoader;

	public void run() {
		try {
			Map<String, CollectionInfo> collecitonInfos = AppCache.collecitonInfos;
			Iterator<Entry<String, CollectionInfo>> it = collecitonInfos.entrySet().iterator();
			long now = System.currentTimeMillis();
			int count = 0;
			while (it.hasNext()) {
				Entry<String, CollectionInfo> entry = it.next();
				CollectionInfo info = entry.getValue();
				if (now - info.getOrderTime() >= 30 * 60 * 1000L) {
					count++;
					it.remove();
				}
			}

			logger.info("定时任务清理掉过期的存款记录信息 " + count + " 条.");
		} catch (Exception e) {
			logger.error("CollectionInfoClearTask 执行失败...");
		}
	}
}
