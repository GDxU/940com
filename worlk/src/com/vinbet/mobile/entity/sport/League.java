package com.vinbet.mobile.entity.sport;

import java.util.List;

/**
 * 联赛信息 Created by ray on 15/3/26.
 */
public class League implements Comparable<League> {

	private String id;

	private String sid;

	private String name;

	private int sort;

	private int level;

	private String isHot = "0";

	private List<Match> matches;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getSort() {
		return sort;
	}

	public void setSort(int sort) {
		this.sort = sort;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public String getIsHot() {
		return isHot;
	}

	public void setIsHot(String isHot) {
		this.isHot = isHot;
	}

	public List<Match> getMatches() {
		return matches;
	}

	public void setMatches(List<Match> matches) {
		this.matches = matches;
	}

	@Override
	public int compareTo(League o) {
		if (null == this || null == this.name || null == o || null == o.name) {
			return 0;
		}
		return this.name.compareTo(o.name);
	}
}
