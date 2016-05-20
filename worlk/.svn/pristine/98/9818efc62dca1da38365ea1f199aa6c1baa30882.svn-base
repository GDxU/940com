package com.vinbet.mobile.entity.ssc;

import java.util.List;

/**
 * 前台注单数据传输对象
 */
public class OrderDto {

    public List<String> titles;
    public List<String> types;
    public List<String> rates;
    public String bon;
    public String issue;
    public String gameId;
    public String hc;
    public String path = "";

    public List<String> getTitles() {
        return titles;
    }

    public List<String> getTypes() {
        return types;
    }

    public List<String> getRates() {
        return rates;
    }

    public String getBon() {
        return bon;
    }

    public String getIssue() {
        return issue;
    }

    public String getGameId() {
        return gameId;
    }

    public String getPath() {
        return path;
    }

    public String getHc() {
        return hc;
    }

    public String getOds() {
        if (types != null && types.size() > 0) {
            StringBuffer sb = new StringBuffer();
            for (String type : types) {
                sb.append(type).append(",");
            }
            sb.deleteCharAt(sb.length() - 1);
            return sb.toString();
        }
        return null;
    }

}
