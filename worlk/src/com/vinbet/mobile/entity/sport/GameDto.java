package com.vinbet.mobile.entity.sport;

import java.util.Comparator;
import java.util.List;

/**
 * Created by ray on 15/3/26.
 */
public class GameDto implements Comparable<GameDto> {
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
    public int compareTo(GameDto o) {
        if (this.getPid().equals("2") || this.getPid().equals("3")) {
            List<Item> trs1 = this.getItems();
            List<Item> trs2 = o.getItems();
            if (trs1.size() < 2 || trs2.size() < 2) {
                return 0;
            }
            double d1 = Math.abs(trs1.get(0).getRt() - trs1.get(1).getRt());
            double d2 = Math.abs(trs2.get(0).getRt() - trs2.get(1).getRt());
            if (d1 > d2) {
                return 1;
            }
            if (d1 == d2) {
                return 0;
            }
            return -1;
        }
        return 0;
    }
}
