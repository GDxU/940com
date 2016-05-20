package com.vinbet.mobile.sys.h2.demo;

import java.util.Date;

import com.vinbet.mobile.sys.h2.H2Mem;
import com.vinbet.mobile.sys.h2.demo.entity.Pojo;
import com.vinbet.mobile.sys.h2.util.ColMapping;
import com.vinbet.mobile.sys.h2.util.Entity;
import com.vinbet.mobile.sys.h2.util.EntityUtil;
import com.vinbet.mobile.sys.h2.util.SqlCnd;

/**
 * H2内存数据库基本CRUD操作
 * 
 * @author Yenn
 * 
 */
public class CRUDDemo {

	public static void main(String[] args) throws Exception {
		// 初始化
		H2Mem.init(100, 5);
		Pojo p = new Pojo();
		p.setCode(10000L);
		p.setComment("aaaa");
		p.setDt(new Date());
		p.setId(1);
		p.setIsEnabled(true);
		p.setMoney(0.2F);
		p.setSpeed(2.00D);
		Entity entity = EntityUtil.toEntity(p);
		System.out.println(SqlCnd.update(entity));
		for (ColMapping col : entity.getCols()) {
			if (col.isEnabled()) {
				System.out.println(col.getPi() + ":" + col.getPojoFieldVal());
			}
		}

	}

}
