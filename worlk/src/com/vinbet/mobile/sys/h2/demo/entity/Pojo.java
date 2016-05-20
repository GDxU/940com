package com.vinbet.mobile.sys.h2.demo.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.vinbet.mobile.sys.h2.anno.Column;
import com.vinbet.mobile.sys.h2.anno.Index;
import com.vinbet.mobile.sys.h2.anno.Table;

@Table
public class Pojo {
	@Column
	@Index("A,mi")
	private Float money;
	@Column(pk = true)
	@Index("A")
	private Integer id;
	@Column(uc = true)
	private Long code;
	@Column
	@Index("A,si")
	private Double speed;

	private Date dt;

	private Boolean isEnabled;

	private String comment;

	public Float getMoney() {
		return money;
	}

	public void setMoney(Float money) {
		this.money = money;
	}

	public Double getSpeed() {
		return speed;
	}

	public void setSpeed(Double speed) {
		this.speed = speed;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Long getCode() {
		return code;
	}

	public void setCode(Long code) {
		this.code = code;
	}

	public Date getDt() {
		return dt;
	}

	public void setDt(Date dt) {
		this.dt = dt;
	}

	public Boolean getIsEnabled() {
		return isEnabled;
	}

	public void setIsEnabled(Boolean isEnabled) {
		this.isEnabled = isEnabled;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	@Override
	public String toString() {
		return "Pojo [code=" + code + ", comment=" + comment + ", dt=" + (dt == null ? "null" : new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(dt).toString()) + ", id=" + id + ", isEnabled=" + isEnabled + ", money=" + money + ", speed=" + speed + "]";
	}

}
