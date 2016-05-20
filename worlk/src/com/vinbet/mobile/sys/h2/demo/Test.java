package com.vinbet.mobile.sys.h2.demo;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import com.alibaba.fastjson.JSON;
import com.vinbet.mobile.entity.portal.PaymentInfo;
import com.vinbet.mobile.entity.ssc.SscOrder;
import com.vinbet.mobile.sys.h2.H2Dao;
import com.vinbet.mobile.sys.h2.H2Mem;

public class Test {

	public static void main(String[] args) throws Exception {
		H2Mem.init(1000, 1);
		H2Dao dao = new H2Dao();
		List<Integer> ids = new ArrayList<Integer>();
		Random rnd = new Random();
		List<SscOrder> ps = dao.select(new SscOrder());
		for (SscOrder pojo : ps) {
			System.out.println(pojo.getAmount());
		}
		
		//dao.execSql("alter table paymentinfo add paytime varchar(25) default '2015/02/01 00:00:00' not null");
		//dao.execSql("alter table paymentinfo add userip varchar(25) default '127.0.0.1'");
		List<PaymentInfo> paymentInfos = null;
		paymentInfos = dao.select(new PaymentInfo());
		for (PaymentInfo pay : paymentInfos) {
			System.out.println(JSON.toJSONString(pay));

		}
	}

}
