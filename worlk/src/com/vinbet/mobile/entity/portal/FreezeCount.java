package com.vinbet.mobile.entity.portal;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
public class FreezeCount implements Serializable {
	private int count;//失败次数
	private Long firstTimer;//第一次时间戳
	private Long freezeTimer;//冻结时间戳
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public Long getFirstTimer() {
		return firstTimer;
	}
	public void setFirstTimer(Long firstTimer) {
		this.firstTimer = firstTimer;
	}
	public Long getFreezeTimer() {
		return freezeTimer;
	}
	public void setFreezeTimer(Long freezeTimer) {
		this.freezeTimer = freezeTimer;
	}
	
}
