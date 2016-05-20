package com.vinbet.mobile.entity.sport;

import java.util.List;

/**
 * 体育项
 * Created by ray on 15/3/26.
 */
public class Sport {

    private String id;

    private String version;

    private String name;

    private String dmid;

    private List<League> leagues;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDmid() {
        return dmid;
    }

    public void setDmid(String dmid) {
        this.dmid = dmid;
    }

    public List<League> getLeagues() {
        return leagues;
    }

    public void setLeagues(List<League> leagues) {
        this.leagues = leagues;
    }
}
