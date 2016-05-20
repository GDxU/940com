package com.vinbet.mobile.timer.sport;

import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;

/**
 * Created by ray on 15/4/20.
 *
 * 已废弃，不在使用
 */
@IocBean
public class FootballTask implements Runnable {

	private Log log = Logs.getLog(FootballTask.class);

	@Inject
	private FootballFullTask footballFullTask;

	@Inject
	private FootballPartTask footballPartTask;

	private int count = 60;

	@Override
	public void run() {
		long start = System.currentTimeMillis();
		if (count == 60) {
			footballFullTask.run();
			count = 0;
			log.info("request full data,total time:" + (System.currentTimeMillis() - start));
		} else {
			footballPartTask.run();
			count++;
			log.info("request part data,total time:" + (System.currentTimeMillis() - start));
		}
	}
}
