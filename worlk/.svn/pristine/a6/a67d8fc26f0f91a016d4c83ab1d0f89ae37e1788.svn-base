package com.vinbet.mobile.util;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.vinbet.mobile.entity.hkc.HkcOrder;
import com.vinbet.mobile.entity.portal.Register;
import com.vinbet.mobile.entity.qxc.QxcOrder;
import com.vinbet.mobile.entity.sport.SportOrder;
import com.vinbet.mobile.entity.ssc.SscOrder;
import com.vinbet.mobile.sys.h2.H2Dao;

public class OrderRecorder {
	private static final Logger logger = LogManager.getLogger(OrderRecorder.class);
	private static ExecutorService pool = Executors.newFixedThreadPool(50);
	private static H2Dao h2Dao = new H2Dao();

	public static void recordUser(final Register register) {
		pool.submit(new Runnable() {
			public void run() {
				try {
					h2Dao.insert(register);
				} catch (Exception e) {
					logger.error(e);
				}
			}
		});

	}

	public static void recordSscOrder(final SscOrder order) {
		pool.submit(new Runnable() {
			public void run() {
				try {
					h2Dao.insert(order);
				} catch (Exception e) {
					logger.error(e);
				}
			}
		});
	}

	public static void recordHkcOrder(final HkcOrder order) {
		pool.submit(new Runnable() {
			public void run() {
				try {
					h2Dao.insert(order);
				} catch (Exception e) {
					logger.error(e);
				}
			}
		});
	}

	public static void recordQxcOrder(final QxcOrder order) {
		pool.submit(new Runnable() {
			public void run() {
				try {
					h2Dao.insert(order);
				} catch (Exception e) {
					logger.error(e);
				}
			}
		});
	}

	public static void recordSportOrder(final SportOrder order) {
		pool.submit(new Runnable() {
			public void run() {
				try {
					h2Dao.insert(order);
				} catch (Exception e) {
					logger.error(e);
				}
			}
		});
	}

	public static void destory() {
		pool.shutdown();
	}
}
