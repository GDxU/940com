package com.vinbet.mobile.entity.sport;

import com.vinbet.mobile.sys.h2.anno.Column;
import com.vinbet.mobile.sys.h2.anno.Index;
import com.vinbet.mobile.sys.h2.anno.Table;

@Table
public class SportOrder {
	@Column
	@Index("SID_SPORT")
	private String sid;//项目id
	@Column
	private String pid;//玩法id
	@Column
	private String uname;
	@Column
	private String time;
	@Column
	private Integer amount;
	@Column
	@Index("YY_SPORT")
	private Integer year;
	@Column
	@Index("MM_SPORT")
	private Integer month;
	@Column
	@Index("DD_SPORT")
	private Integer day;
	@Column
	private Integer num;
	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public Integer getMonth() {
		return month;
	}

	public void setMonth(Integer month) {
		this.month = month;
	}

	public Integer getDay() {
		return day;
	}

	public void setDay(Integer day) {
		this.day = day;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}
}
