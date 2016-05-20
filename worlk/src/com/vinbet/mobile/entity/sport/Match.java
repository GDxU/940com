package com.vinbet.mobile.entity.sport;

import java.util.Date;
import java.util.List;

/**
 * Created by yenn on 15/3/26.
 */
public class Match implements Comparable<Match> {

    private String id;
    private String lid;
    private String name;
    //指标 1=进球数 2＝角球数
    private String itype;
    //开赛时间(GMT0) MM-dd 24HH:mm
    private Date start;
    //是否中立场标识 0=否 1=是
    private String tt;
    //是否综合过关1：是 0：否
    private String mu;
    //已收赛事ID,已收赛事ID
    private String dg;
    //赛事状态：3单式 4滚球
    private String status;
    //是否支持滚球,0-否,1-是
    private String sroll;

    private List<Game> games;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getLid() {
        return lid;
    }

    public void setLid(String lid) {
        this.lid = lid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getStart() {
        return start;
    }

    public void setStart(Date start) {
        this.start = start;
    }

    public String getTt() {
        return tt;
    }

    public void setTt(String tt) {
        this.tt = tt;
    }

    public String getDg() {
        return dg;
    }

    public void setDg(String dg) {
        this.dg = dg;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getItype() {
        return itype;
    }

    public void setItype(String itype) {
        this.itype = itype;
    }

    public List<Game> getGames() {
        return games;
    }

    public void setGames(List<Game> games) {
        this.games = games;
    }

    public String getMu() {
        return mu;
    }

    public void setMu(String mu) {
        this.mu = mu;
    }

    public String getSroll() {
        return sroll;
    }

    public void setSroll(String sroll) {
        this.sroll = sroll;
    }

    @Override
    public int compareTo(Match o) {
        return String.valueOf(this.getStart().getTime()).compareTo(String.valueOf(o.getStart().getTime()));
    }
}
