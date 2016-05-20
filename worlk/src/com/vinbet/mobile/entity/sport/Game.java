package com.vinbet.mobile.entity.sport;

import java.util.List;

/**
 * Created by ray on 15/3/26.
 */
public class Game implements Cloneable, Comparable<Game> {

    private String id;
    private String mid;
    //游戏对应类型1标准盘,2让球,3大小球,4单双,5总进球,6双重机会,7半全场,8波胆
    private String pid;
    //半全场标识1全场,2上半场,3下半场
    private String dr;
    //指标值
    private String inum;
    //让球的让球方1:主 0：客
    private String let;

    private List<Item> items;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getMid() {
        return mid;
    }

    public void setMid(String mid) {
        this.mid = mid;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getDr() {
        return dr;
    }

    public void setDr(String dr) {
        this.dr = dr;
    }

    public String getInum() {
        return inum;
    }

    public void setInum(String inum) {
        this.inum = inum;
    }

    public String getLet() {
        return let;
    }

    public void setLet(String let) {
        this.let = let;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    @Override
    public Game clone() throws CloneNotSupportedException {
        return (Game) super.clone();
    }

    @Override
    public int compareTo(Game o) {
        if (this.getPid().equals(o.getPid())) {
            if (this.getDr().equals(o.getDr())) {
                return this.getInum().compareTo(o.getInum());
            } else {
                return this.getDr().compareTo(o.getDr());
            }
        } else {
            return this.getPid().compareTo(o.getPid());
        }

    }
}
