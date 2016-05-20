package com.vinbet.mobile.sys.sport;

import com.vinbet.mobile.entity.sport.League;
import com.vinbet.mobile.entity.sport.Match;
import com.vinbet.mobile.entity.sport.MatchReal;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by ray on 15/3/27.
 *
 * 篮球缓存
 */
public class SportBBCache {

    //版本号
    public static String ip_ver = "-1";
    public static String td_ver = "-1";
    public static String er_ver = "-1";

    //赔率版本号
    public static String rver = "-1";

    public static SimpleDateFormat normalSDF = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    public static SimpleDateFormat inplaySDF = new SimpleDateFormat("HH:mm");
    //<语言-ID，国际化值>
    public static ConcurrentHashMap<String, String> i18nMap = new ConcurrentHashMap<String, String>();
    //滚球盘中<MID,MATCHREAL>
    public static ConcurrentHashMap<String, MatchReal> mrMap = new ConcurrentHashMap<String, MatchReal>();
    //赔率信息
    public static ConcurrentHashMap<String, Double[]> rdMap = new ConcurrentHashMap<String, Double[]>();

    //滚球联赛
    public static List<League> inplayLeagues = new ArrayList<League>();
    //滚球赛事<LID,...>
    public static ConcurrentHashMap<String, List<Match>> inplayMatchMap = new ConcurrentHashMap<String, List<Match>>();
    public static ConcurrentHashMap<String, String> inplayMTLMap = new ConcurrentHashMap<String, String>();
    //今日联赛
    public static List<League> todayLeagues = new ArrayList<League>();
    //今日赛事<LID,...>
    public static ConcurrentHashMap<String, List<Match>> todayMatchMap = new ConcurrentHashMap<String, List<Match>>();
    //今日综合联赛
    public static List<League> todayMuLeagues = new ArrayList<League>();
    //今日综合赛事<LID,...>
    public static ConcurrentHashMap<String, List<Match>> todayMuMatchMap = new ConcurrentHashMap<String, List<Match>>();
    public static ConcurrentHashMap<String, String> todayMTLMap = new ConcurrentHashMap<String, String>();
    //早餐联赛
    public static List<League> earlyLeagues = new ArrayList<League>();
    //早餐赛事<LID,>
    public static ConcurrentHashMap<String, List<Match>> earlyMatchMap = new ConcurrentHashMap<String, List<Match>>();
    //早餐综合联赛
    public static List<League> earlyMuLeagues = new ArrayList<League>();
    //早餐综合赛事<LID,>
    public static ConcurrentHashMap<String, List<Match>> earlyMuMatchMap = new ConcurrentHashMap<String, List<Match>>();
    public static ConcurrentHashMap<String, String> earlyMTLMap = new ConcurrentHashMap<String, String>();


}