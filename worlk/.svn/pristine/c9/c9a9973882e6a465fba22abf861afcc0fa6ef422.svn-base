package com.vinbet.mobile.sys.h2.demo;

import java.util.List;
import java.util.Random;
import java.util.concurrent.CountDownLatch;

import com.vinbet.mobile.sys.h2.H2Dao;
import com.vinbet.mobile.sys.h2.demo.entity.Pojo;
import com.vinbet.mobile.sys.h2.util.Cnd;

public class OPThread extends Thread {

	private int op;
	private ThreadLocal<List<Integer>> _ids = new ThreadLocal<List<Integer>>();
	private List<Integer> tids;
	private H2Dao dao = new H2Dao();
	private Random rnd = new Random();
	private long ms;
	private CountDownLatch countDownLatch;
	private CountDownLatch start;
	private int dc;

	public OPThread(int op, int no, List<Integer> ids, CountDownLatch countDownLatch, int dc,CountDownLatch start) {
		this.countDownLatch = countDownLatch;
		this.start = start;
		this.dc = dc;
		switch (op) {
			case 1:
				setName("insert-" + no);
				break;
			case 2:
				setName("update-" + no);
				break;
			case 3:
				setName("select-" + no);
				break;
			case 4:
				setName("delete-" + no);
				break;
			default:
				break;
		}
		this.op = op;
		tids = ids;
	}

	@Override
	public void run() {
		try {
			start.await();
			_ids.set(tids);
			for (int j = 0; j < dc; j++) {
				if (op == 1) {
					int i = rnd.nextInt();
					i = Math.abs(i);
					Pojo p = new Pojo();
					p.setId(i);
					p.setCode(Long.parseLong(i + ""));
					p.setMoney(Float.parseFloat(i + ""));
					p.setSpeed(Double.parseDouble(i + ""));
					try {
						dao.insert(p);
						_ids.get().add(i);
					} catch (Exception e) {
					}
				} else if (op == 2) {
					try {
						int i = rnd.nextInt(_ids.get().size());
						i = _ids.get().get(i);
						Pojo p = dao.selectOne(Pojo.class, new Cnd().where("id", "=", i));
						i = rnd.nextInt();
						i = Math.abs(i);
						p.setCode(Long.parseLong(i + ""));
						p.setMoney(Float.parseFloat(i + ""));
						p.setSpeed(Double.parseDouble(i + ""));
						dao.update(p);
					} catch (Exception e) {
					}
				} else if (op == 3) {
					try {
						int i = rnd.nextInt(_ids.get().size());
						i = _ids.get().get(i);
						long st = System.currentTimeMillis();
						Pojo p = dao.selectOne(Pojo.class, new Cnd().where("id", "=", i));
						long t = System.currentTimeMillis() - st;
						if (t > ms) {
							ms = t;
							System.out.println(getName() + " max:" + ms + "ms");
						}
					} catch (Exception e) {
					}
				} else if (op == 4) {
					try {
						int i = rnd.nextInt(_ids.get().size());
						int id = _ids.get().get(i);
						dao.delete(Pojo.class, new Cnd().where("id", "=", id));
						_ids.get().remove(i);
					} catch (Exception e) {
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			countDownLatch.countDown();
		}

	}
}
