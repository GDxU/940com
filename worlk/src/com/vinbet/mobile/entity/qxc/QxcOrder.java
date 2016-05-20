package com.vinbet.mobile.entity.qxc;

import com.vinbet.mobile.sys.h2.anno.Column;
import com.vinbet.mobile.sys.h2.anno.Index;
import com.vinbet.mobile.sys.h2.anno.Table;

@Table
public class QxcOrder {
	@Column
	@Index("GID_qxc")
	private String gid;
	@Column
	private String issue;
	@Column
	private String uname;
	@Column
	private String time;
	@Column
	private Integer amount;
	@Column
	@Index("YY_qxc")
	private Integer year;
	@Column
	@Index("MM_qxc")
	private Integer month;
	@Column
	@Index("DD_qxc")
	private Integer day;
	@Column
	private Integer num;
	
	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
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

	public String getIssue() {
		return issue;
	}

	public void setIssue(String issue) {
		this.issue = issue;
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

	public String getGid() {
		return gid;
	}

	public void setGid(String gid) {
		this.gid = gid;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}
}
