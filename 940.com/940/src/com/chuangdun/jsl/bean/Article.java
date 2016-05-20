package com.chuangdun.jsl.bean;

import java.util.Date;

import com.chuangdun.jsl.lab.SYS;

public class Article {
	private int id;
	private String title;
	private String type;
	private String author;
	private String preview;
	private String content;
	private int clickNum;
	private long time;
	private String status;
	private int priority;
	private int inCome;
	private long joinTime;
	private String keywords;
	private String desc;
	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}
	public int getInCome() {
		return inCome;
	}

	public void setInCome(int inCome) {
		this.inCome = inCome;
	}

	public int getPriority() {
		return priority;
	}

	public void setPriority(int priority) {
		this.priority = priority;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public final String getType() {
		return type;
	}

	public final void setType(String type) {
		this.type = type;
	}


	public long getTime() {
		return time;
	}

	public void setTime(long time) {
		this.time = time;
	}

	public long getJoinTime() {
		return joinTime;
	}

	public void setJoinTime(long joinTime) {
		this.joinTime = joinTime;
	}

	@Override
	public String toString() {
		return "Article [id=" + id + ", title=" + title + ", author=" + author
				+ ", preview=" + preview + ", content=" + content
				+ ", clickNum=" + clickNum + ", time=" + time + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPreview() {
		return preview;
	}

	public void setPreview(String preview) {
		this.preview = preview;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getClickNum() {
		return clickNum;
	}

	public void setClickNum(int clickNum) {
		this.clickNum = clickNum;
	}

}
