package com.vinbet.mobile.entity.sport;

/**
 * 交易项
 * Created by ray on 15/3/26.
 */
public class Item {

    private String id;
    private String gid;
    private String name;
    //普通玩法赔率
    private double rt;
    //综合过关赔率
    private double rtm;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getGid() {
        return gid;
    }

    public void setGid(String gid) {
        this.gid = gid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getRt() {
        return rt;
    }

    public void setRt(double rt) {
        this.rt = rt;
    }

    public double getRtm() {
        return rtm;
    }

    public void setRtm(double rtm) {
        this.rtm = rtm;
    }
}
