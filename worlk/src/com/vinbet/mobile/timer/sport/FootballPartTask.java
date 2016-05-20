package com.vinbet.mobile.timer.sport;

import com.alibaba.fastjson.JSON;
import com.vinbet.mobile.entity.sport.*;
import com.vinbet.mobile.sys.PropertiesLoader;
import com.vinbet.mobile.sys.sport.SportFBCache;
import com.vinbet.mobile.util.GzipUtil;
import com.vinbet.mobile.util.HttpClientUtil;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import java.io.ByteArrayInputStream;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by ray on 15/3/27.
 *
 * 已废弃，不在使用
 */
@IocBean
public class FootballPartTask extends TimerTask {

    @Inject
    private PropertiesLoader propertiesLoader;

    private Log log = Logs.getLog(FootballPartTask.class);

    @Override
    public void run() {
        //国际化信息
        ConcurrentHashMap<String, String> i18nMap = new ConcurrentHashMap<String, String>();

        Sport inplaySport = new Sport();
        Sport todaySport = new Sport();
        Sport earlySport = new Sport();
        try {
            //全量数据，按类别滚球，今日，早餐，分几种不同语言请求
            //取每种类别取其中一个语言请求作为数据缓存（暂定为中文），其余的只处理国际化信息

            SAXParserFactory factory = SAXParserFactory.newInstance();
            SAXParser parser = factory.newSAXParser();
            //滚球数据
            HashMap<String, String> param = new HashMap<String, String>();
            param.put("s", "1");
            param.put("t", "1");
            param.put("m", "1");
            param.put("v", SportFBCache.ip_ver);
            //中文+数据
            param.put("l", "zh");
            String xml = GzipUtil.unGzipString(HttpClientUtil.doGetString(propertiesLoader.getTrim("vinbet.sport.url") + "/core/apiData.getMatchInfoData.do", param, false));
            log.debug("i-xml:" + xml);
            if (xml != null && !xml.trim().equals("")) {
                parser.parse(new ByteArrayInputStream(xml.getBytes("UTF-8")), new FootballPartHandle(false, "zh", i18nMap, inplaySport));
            }
            //英文
            param.put("l", "en");
            xml = GzipUtil.unGzipString(HttpClientUtil.doGetString(propertiesLoader.getTrim("vinbet.sport.url") + "/core/apiData.getMatchInfoData.do", param, false));
            if (xml != null && !xml.trim().equals("")) {
                parser.parse(new ByteArrayInputStream(xml.getBytes("UTF-8")), new FootballPartHandle(true, "en", i18nMap, null));
            }
            //其余语言...


            //今日数据，需要区分过关数据
            // /中文+数据
            param.put("v", SportFBCache.td_ver);
            param.put("t", "2");
            param.put("l", "zh");
            xml = GzipUtil.unGzipString(HttpClientUtil.doGetString(propertiesLoader.getTrim("vinbet.sport.url") + "/core/apiData.getMatchInfoData.do", param, false));
            log.debug("t-xml:" + xml);
            if (xml != null && !xml.trim().equals("")) {
                parser.parse(new ByteArrayInputStream(xml.getBytes("UTF-8")), new FootballPartHandle(false, "zh", i18nMap, todaySport));
            }
            //英文
            param.put("l", "en");
            xml = GzipUtil.unGzipString(HttpClientUtil.doGetString(propertiesLoader.getTrim("vinbet.sport.url") + "/core/apiData.getMatchInfoData.do", param, false));
            if (xml != null && !xml.trim().equals("")) {
                parser.parse(new ByteArrayInputStream(xml.getBytes("UTF-8")), new FootballPartHandle(true, "en", i18nMap, null));
            }


            //早餐数据，需要区分过关数据
            //中文+数据
            param.put("v", SportFBCache.er_ver);
            param.put("t", "3");
            param.put("l", "zh");
            xml = GzipUtil.unGzipString(HttpClientUtil.doGetString(propertiesLoader.getTrim("vinbet.sport.url") + "/core/apiData.getMatchInfoData.do", param, false));
            log.debug("e-xml:" + xml);
            if (xml != null && !xml.trim().equals("")) {
                parser.parse(new ByteArrayInputStream(xml.getBytes("UTF-8")), new FootballPartHandle(false, "zh", i18nMap, earlySport));
            }
            //英文
            param.put("l", "en");
            xml = GzipUtil.unGzipString(HttpClientUtil.doGetString(propertiesLoader.getTrim("vinbet.sport.url") + "/core/apiData.getMatchInfoData.do", param, false));
            if (xml != null && !xml.trim().equals("")) {
                parser.parse(new ByteArrayInputStream(xml.getBytes("UTF-8")), new FootballPartHandle(true, "en", i18nMap, null));
            }

            SportFBCache.ip_ver = inplaySport.getVersion();
            SportFBCache.td_ver = todaySport.getVersion();
            SportFBCache.er_ver = earlySport.getVersion();
            //处理并更新缓存数据
            //inplay
            ConcurrentHashMap<String, String> inplayMTLMap = SportFBCache.inplayMTLMap;
            ConcurrentHashMap<String, List<Match>> inplayMatchMap = SportFBCache.inplayMatchMap;
            if (log.isDebugEnabled()) {
                log.debug("inplaySport:" + JSON.toJSONString(inplaySport));
            }
            //删除赛事
            if (inplaySport.getDmid() != null) {
                String[] ids = inplaySport.getDmid().split(",");
                for (String id : ids) {
                    if (!id.trim().equals("")) {
                        if (inplayMTLMap.get(id) != null) {
                            String lid = inplayMTLMap.get(id);
                            List<Match> matches = inplayMatchMap.get(lid);
                            for (int i = 0; i < matches.size(); i++) {
                                Match m = matches.get(i);
                                if (m.getId().equals(id)) {
                                    matches.remove(i);
                                    inplayMTLMap.remove(m.getId());
                                    if (matches.isEmpty()) {
                                        for (int j = 0; j < SportFBCache.inplayLeagues.size(); j++) {
                                            if (SportFBCache.inplayLeagues.get(j).getId().equals(lid)) {
                                                SportFBCache.inplayLeagues.remove(j);
                                                break;
                                            }
                                        }
                                    }
                                    break;
                                }
                            }
                        }
                    }
                }
            }
            //检测数据变动
            for (League nl : inplaySport.getLeagues()) {
                //判断联赛是否存在
                boolean isExist = false;
                League ol = null;
                for (int i = 0; i < SportFBCache.inplayLeagues.size(); i++) {
                    ol = SportFBCache.inplayLeagues.get(i);
                    if (ol.getId().equals(nl.getId())) {
                        isExist = true;
                        break;
                    }
                }
                //如果不存在，直接添加到缓存
                if (!isExist) {
                    SportFBCache.inplayLeagues.add(nl);
                    SportFBCache.inplayMatchMap.put(nl.getId(), nl.getMatches());
                    for (Match match : nl.getMatches()) {
                        SportFBCache.inplayMTLMap.put(match.getId(), nl.getId());
                    }
                } else {
                    //如果存在就检测联赛属性是否变动，以及联赛下赛事信息的变动
                    if (ol.getLevel() != nl.getLevel()) {
                        ol.setLevel(nl.getLevel());
                    }
                    if (ol.getSort() != nl.getSort()) {
                        ol.setSort(nl.getSort());
                    }
                    boolean isMatchExist;
                    List<Match> omatchs = SportFBCache.inplayMatchMap.get(nl.getId());
                    List<Match> nmatchs = new ArrayList<Match>();
                    for (int i = 0; i < nl.getMatches().size(); i++) {
                        isMatchExist = false;
                        Match om;
                        Match nm = nl.getMatches().get(i);
                        for (int j = 0; j < omatchs.size(); j++) {
                            om = omatchs.get(j);
                            if (nm.getId().equals(om.getId())) {
                                isMatchExist = true;
                                if (!om.getItype().equals(nm.getItype())) {
                                    om.setItype(nm.getItype());
                                }
                                if (!om.getStart().equals(nm.getStart())) {
                                    om.setStart(nm.getStart());
                                }
                                if (!om.getTt().equals(nm.getTt())) {
                                    om.setTt(nm.getTt());
                                }
                                if (!om.getStatus().equals(nm.getStatus())) {
                                    om.setStatus(nm.getStatus());
                                }
                                if (!om.getSroll().equals(nm.getSroll())) {
                                    om.setSroll(nm.getSroll());
                                }
                                if (!om.getMu().equals(nm.getMu())) {
                                    om.setMu(nm.getMu());
                                }

                                if (nm.getDg() != null) {
                                    String[] gids = nm.getDg().split(",");
                                    for (String gid : gids) {
                                        for (int k = 0; k < om.getGames().size(); k++) {
                                            if (om.getGames().get(k).getId().equals(gid)) {
                                                om.getGames().remove(k);
                                                break;
                                            }
                                        }
                                    }
                                }
                                //检测游戏变动
                                boolean isGameExist;
                                List<Game> ogames = om.getGames();
                                List<Game> ngames = new ArrayList<Game>();
                                for (int k = 0; k < nm.getGames().size(); k++) {
                                    isGameExist = false;
                                    Game og;
                                    Game ng = nm.getGames().get(k);
                                    for (int l = 0; l < om.getGames().size(); l++) {
                                        og = om.getGames().get(l);
                                        if (og.getId().equals(ng.getId())) {
                                            isGameExist = true;
                                            if (!og.getPid().equals(ng.getPid())) {
                                                og.setPid(ng.getPid());
                                            }
                                            if (!og.getDr().equals(ng.getDr())) {
                                                og.setDr(ng.getDr());
                                            }
                                            if (!og.getInum().equals(ng.getInum())) {
                                                og.setInum(ng.getInum());
                                            }
                                            if (!og.getLet().equals(ng.getLet())) {
                                                og.setLet(ng.getLet());
                                            }
                                        }
                                    }
                                    if (!isGameExist) {
                                        ngames.add(ng);
                                    }
                                }
                                if (!ngames.isEmpty()) {
                                    ogames.addAll(ngames);
                                }
                            }
                        }
                        if (!isMatchExist) {
                            nmatchs.add(nm);
                        }
                    }
                    if (!nmatchs.isEmpty()) {
                        omatchs.addAll(nmatchs);
                    }
                }
            }

            //today
            if (log.isDebugEnabled()) {
                log.debug("todaySport:" + JSON.toJSONString(todaySport));
            }
            ConcurrentHashMap<String, String> todayMTLMap = SportFBCache.todayMTLMap;
            ConcurrentHashMap<String, List<Match>> todayMatchMap = SportFBCache.todayMatchMap;
            if (todaySport.getDmid() != null) {
                String[] ids = todaySport.getDmid().split(",");
                for (String id : ids) {
                    if (!id.trim().equals("")) {
                        String lid = todayMTLMap.get(id);
                        if (lid != null) {
                            List<Match> matches = todayMatchMap.get(lid);
                            for (int i = 0; i < matches.size(); i++) {
                                Match m = matches.get(i);
                                if (m.getId().equals(id)) {
                                    matches.remove(i);
                                    if (matches.isEmpty()) {
                                        for (int j = 0; j < SportFBCache.todayLeagues.size(); j++) {
                                            if (SportFBCache.todayLeagues.get(j).getId().equals(lid)) {
                                                SportFBCache.todayLeagues.remove(j);
                                                break;
                                            }
                                        }
                                        for (int j = 0; j < SportFBCache.todayMuLeagues.size(); j++) {
                                            if (SportFBCache.todayMuLeagues.get(j).getId().equals(lid)) {
                                                SportFBCache.todayMuLeagues.remove(j);
                                                break;
                                            }
                                        }
                                    }
                                    todayMTLMap.remove(m.getId());
                                    break;
                                }
                            }
                        }
                    }
                }
            }

            //检测数据变动
            for (League nl : todaySport.getLeagues()) {
                //判断联赛是否存在
                boolean isExist = false;
                League ol = null;
                for (int i = 0; i < SportFBCache.todayLeagues.size(); i++) {
                    ol = SportFBCache.todayLeagues.get(i);
                    if (ol.getId().equals(nl.getId())) {
                        isExist = true;
                        break;
                    }
                }
                //如果不存在，直接添加到缓存
                if (!isExist) {
                    SportFBCache.todayLeagues.add(nl);
                    SportFBCache.todayMatchMap.put(nl.getId(), nl.getMatches());
                    List<Match> tms = new ArrayList<Match>();
                    for (Match match : nl.getMatches()) {
                        SportFBCache.todayMTLMap.put(match.getId(), nl.getId());
                        if (match.getMu().equals("1")) {
                            tms.add(match);
                        }
                    }
                    if (!tms.isEmpty()) {
                        League tl = new League();
                        tl.setId(nl.getId());
                        tl.setSid(nl.getSid());
                        tl.setSort(nl.getSort());
                        tl.setLevel(nl.getLevel());
                        tl.setName(nl.getName());
                        tl.setMatches(tms);
                        SportFBCache.todayMuLeagues.add(tl);
                    }
                } else {
                    //如果存在就检测联赛属性是否变动，以及联赛下赛事信息的变动
                    if (ol.getLevel() != nl.getLevel()) {
                        ol.setLevel(nl.getLevel());
                    }
                    if (ol.getSort() != nl.getSort()) {
                        ol.setSort(nl.getSort());
                    }
                    boolean isMatchExist;
                    List<Match> omatchs = SportFBCache.todayMatchMap.get(nl.getId());
                    List<Match> nmatchs = new ArrayList<Match>();
                    for (int i = 0; i < nl.getMatches().size(); i++) {
                        isMatchExist = false;
                        Match om;
                        Match nm = nl.getMatches().get(i);
                        for (int j = 0; j < omatchs.size(); j++) {
                            om = omatchs.get(j);
                            if (nm.getId().equals(om.getId())) {
                                isMatchExist = true;
                                if (!om.getItype().equals(nm.getItype())) {
                                    om.setItype(nm.getItype());
                                }
                                if (!om.getStart().equals(nm.getStart())) {
                                    om.setStart(nm.getStart());
                                }
                                if (!om.getTt().equals(nm.getTt())) {
                                    om.setTt(nm.getTt());
                                }
                                if (!om.getStatus().equals(nm.getStatus())) {
                                    om.setStatus(nm.getStatus());
                                }
                                if (!om.getSroll().equals(nm.getSroll())) {
                                    om.setSroll(nm.getSroll());
                                }
                                if (!om.getMu().equals(nm.getMu())) {
                                    om.setMu(nm.getMu());
                                    //如果支持过关就加入到过关联赛中，否则移除
                                    if (om.getMu().equals("1")) {
                                        League ml = null;
                                        for (int k = 0; k < SportFBCache.todayMuLeagues.size(); k++) {
                                            if (SportFBCache.todayMuLeagues.get(k).getId().equals(om.getLid())) {
                                                ml = SportFBCache.todayMuLeagues.get(k);
                                            }
                                        }
                                        if (ml != null) {
                                            ml.getMatches().add(om);
                                        } else {
                                            League nnl = null;
                                            String lid = SportFBCache.todayMTLMap.get(om.getId());
                                            for (int k = 0; k < SportFBCache.todayLeagues.size(); k++) {
                                                League onl = SportFBCache.todayLeagues.get(k);
                                                if (onl.getId().equals(lid)) {
                                                    nnl = new League();
                                                    nnl.setId(onl.getId());
                                                    nnl.setSid(onl.getSid());
                                                    nnl.setSort(onl.getSort());
                                                    nnl.setLevel(onl.getLevel());
                                                    nnl.setName(onl.getName());
                                                    nnl.setMatches(new ArrayList<Match>());
                                                }
                                            }
                                            if (nnl != null) {
                                                nnl.getMatches().add(om);
                                            }
                                            SportFBCache.todayMuLeagues.add(nnl);
                                        }
                                    } else {
                                        for (int k = 0; k < SportFBCache.todayMuLeagues.size(); k++) {
                                            if (SportFBCache.todayMuLeagues.get(k).getId().equals(om.getLid())) {
                                                for (int l = 0; l < SportFBCache.todayMuLeagues.get(k).getMatches().size(); l++) {
                                                    if (SportFBCache.todayMuLeagues.get(k).getMatches().get(l).getId().equals(om.getId())) {
                                                        SportFBCache.todayMuLeagues.get(k).getMatches().remove(l);
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                //检测游戏变动
                                boolean isGameExist;
                                List<Game> ogames = om.getGames();
                                List<Game> ngames = new ArrayList<Game>();
                                for (int k = 0; k < nm.getGames().size(); k++) {
                                    isGameExist = false;
                                    Game og;
                                    Game ng = nm.getGames().get(k);
                                    for (int l = 0; l < ogames.size(); l++) {
                                        og = ogames.get(l);
                                        if (og.getId().equals(ng.getId())) {
                                            isGameExist = true;
                                            if (!og.getPid().equals(ng.getPid())) {
                                                og.setPid(ng.getPid());
                                            }
                                            if (!og.getDr().equals(ng.getDr())) {
                                                og.setDr(ng.getDr());
                                            }
                                            if (!og.getInum().equals(ng.getInum())) {
                                                og.setInum(ng.getInum());
                                            }
                                            if (!og.getLet().equals(ng.getLet())) {
                                                og.setLet(ng.getLet());
                                            }
                                        }
                                    }
                                    if (!isGameExist) {
                                        ngames.add(ng);
                                    }
                                }
                                if (!ngames.isEmpty()) {
                                    ogames.addAll(ngames);
                                }

                                if (nm.getDg() != null) {
                                    String[] gids = nm.getDg().split(",");
                                    for (String gid : gids) {
                                        for (int k = 0; k < om.getGames().size(); k++) {
                                            if (om.getGames().get(k).getId().equals(gid)) {
                                                om.getGames().remove(k);
                                                break;
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        if (!isMatchExist) {
                            nmatchs.add(nm);
                        }
                    }
                    if (!nmatchs.isEmpty()) {
                        omatchs.addAll(nmatchs);
                        for (Match match : nmatchs) {
                            SportFBCache.todayMTLMap.put(match.getId(), nl.getId());
                        }
                    }
                }
            }

            //early
            if (log.isDebugEnabled()) {
                log.debug("earlySport:" + JSON.toJSONString(earlySport));
            }
            ConcurrentHashMap<String, String> earlyMTLMap = SportFBCache.earlyMTLMap;
            ConcurrentHashMap<String, List<Match>> earlyMatchMap = SportFBCache.earlyMatchMap;
            if (earlySport.getDmid() != null) {
                String[] ids = earlySport.getDmid().split(",");
                for (String id : ids) {
                    if (!id.trim().equals("")) {
                        String lid = earlyMTLMap.get(id);
                        if (lid != null) {
                            List<Match> matches = earlyMatchMap.get(lid);
                            for (int i = 0; i < matches.size(); i++) {
                                Match m = matches.get(i);
                                if (m.getId().equals(id)) {
                                    matches.remove(i);
                                    if (matches.isEmpty()) {
                                        for (int j = 0; j < SportFBCache.earlyLeagues.size(); j++) {
                                            if (SportFBCache.earlyLeagues.get(j).getId().equals(lid)) {
                                                SportFBCache.earlyLeagues.remove(j);
                                                break;
                                            }
                                        }
                                        for (int j = 0; j < SportFBCache.earlyMuLeagues.size(); j++) {
                                            if (SportFBCache.earlyMuLeagues.get(j).getId().equals(lid)) {
                                                SportFBCache.earlyMuLeagues.remove(j);
                                                break;
                                            }
                                        }
                                    }
                                    earlyMTLMap.remove(m.getId());
                                    break;
                                }
                            }
                        }
                    }
                }
            }

            //检测数据变动
            for (League nl : earlySport.getLeagues()) {
                //判断联赛是否存在
                boolean isExist = false;
                League ol = null;
                for (int i = 0; i < SportFBCache.earlyLeagues.size(); i++) {
                    ol = SportFBCache.earlyLeagues.get(i);
                    if (ol.getId().equals(nl.getId())) {
                        isExist = true;
                        break;
                    }
                }
                //如果不存在，直接添加到缓存
                if (!isExist) {
                    SportFBCache.earlyLeagues.add(nl);
                    SportFBCache.earlyMatchMap.put(nl.getId(), nl.getMatches());
                    List<Match> tms = new ArrayList<Match>();
                    for (Match match : nl.getMatches()) {
                        SportFBCache.earlyMTLMap.put(match.getId(), nl.getId());
                        if (match.getMu().equals("1")) {
                            tms.add(match);
                        }
                    }
                    if (!tms.isEmpty()) {
                        League tl = new League();
                        tl.setId(nl.getId());
                        tl.setSid(nl.getSid());
                        tl.setSort(nl.getSort());
                        tl.setLevel(nl.getLevel());
                        tl.setName(nl.getName());
                        tl.setMatches(tms);
                        SportFBCache.earlyMuLeagues.add(tl);
                    }
                } else {
                    //如果存在就检测联赛属性是否变动，以及联赛下赛事信息的变动
                    if (ol.getLevel() != nl.getLevel()) {
                        ol.setLevel(nl.getLevel());
                    }
                    if (ol.getSort() != nl.getSort()) {
                        ol.setSort(nl.getSort());
                    }
                    boolean isMatchExist;
                    List<Match> omatchs = SportFBCache.earlyMatchMap.get(nl.getId());
                    List<Match> nmatchs = new ArrayList<Match>();
                    for (int i = 0; i < nl.getMatches().size(); i++) {
                        isMatchExist = false;
                        Match om;
                        Match nm = nl.getMatches().get(i);
                        for (int j = 0; j < omatchs.size(); j++) {
                            om = omatchs.get(j);
                            if (nm.getId().equals(om.getId())) {
                                isMatchExist = true;
                                if (!om.getItype().equals(nm.getItype())) {
                                    om.setItype(nm.getItype());
                                }
                                if (!om.getStart().equals(nm.getStart())) {
                                    om.setStart(nm.getStart());
                                }
                                if (!om.getTt().equals(nm.getTt())) {
                                    om.setTt(nm.getTt());
                                }
                                if (!om.getStatus().equals(nm.getStatus())) {
                                    om.setStatus(nm.getStatus());
                                }
                                if (!om.getSroll().equals(nm.getSroll())) {
                                    om.setSroll(nm.getSroll());
                                }
                                if (!om.getMu().equals(nm.getMu())) {
                                    om.setMu(nm.getMu());
                                    //如果支持过关就加入到过关联赛中，否则移除
                                    if (om.getMu().equals("1")) {
                                        League ml = null;
                                        for (int k = 0; k < SportFBCache.earlyMuLeagues.size(); k++) {
                                            if (SportFBCache.earlyMuLeagues.get(k).getId().equals(om.getLid())) {
                                                ml = SportFBCache.earlyMuLeagues.get(k);
                                            }
                                        }
                                        if (ml != null) {
                                            ml.getMatches().add(om);
                                        } else {
                                            League nnl = null;
                                            String lid = SportFBCache.earlyMTLMap.get(om.getId());
                                            for (int k = 0; k < SportFBCache.earlyLeagues.size(); k++) {
                                                League onl = SportFBCache.earlyLeagues.get(k);
                                                if (onl.getId().equals(lid)) {
                                                    nnl = new League();
                                                    nnl.setId(onl.getId());
                                                    nnl.setSid(onl.getSid());
                                                    nnl.setSort(onl.getSort());
                                                    nnl.setLevel(onl.getLevel());
                                                    nnl.setName(onl.getName());
                                                    nnl.setMatches(new ArrayList<Match>());
                                                }
                                            }
                                            if (nnl != null) {
                                                nnl.getMatches().add(om);
                                            }
                                            SportFBCache.earlyMuLeagues.add(nnl);
                                        }
                                    } else {
                                        for (int k = 0; k < SportFBCache.earlyMuLeagues.size(); k++) {
                                            if (SportFBCache.earlyMuLeagues.get(k).getId().equals(om.getLid())) {
                                                for (int l = 0; l < SportFBCache.earlyMuLeagues.get(k).getMatches().size(); l++) {
                                                    if (SportFBCache.earlyMuLeagues.get(k).getMatches().get(l).getId().equals(om.getId())) {
                                                        SportFBCache.earlyMuLeagues.get(k).getMatches().remove(l);
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }

                                if (nm.getDg() != null) {
                                    String[] gids = nm.getDg().split(",");
                                    for (String gid : gids) {
                                        for (int k = 0; k < om.getGames().size(); k++) {
                                            if (om.getGames().get(k).getId().equals(gid)) {
                                                om.getGames().remove(k);
                                                break;
                                            }
                                        }
                                    }
                                }
                                //检测游戏变动
                                boolean isGameExist;
                                List<Game> ogames = om.getGames();
                                List<Game> ngames = new ArrayList<Game>();
                                for (int k = 0; k < nm.getGames().size(); k++) {
                                    isGameExist = false;
                                    Game og;
                                    Game ng = nm.getGames().get(k);
                                    for (int l = 0; l < ogames.size(); l++) {
                                        og = ogames.get(l);
                                        if (og.getId().equals(ng.getId())) {
                                            isGameExist = true;
                                            if (!og.getPid().equals(ng.getPid())) {
                                                og.setPid(ng.getPid());
                                            }
                                            if (!og.getDr().equals(ng.getDr())) {
                                                og.setDr(ng.getDr());
                                            }
                                            if (!og.getInum().equals(ng.getInum())) {
                                                og.setInum(ng.getInum());
                                            }
                                            if (!og.getLet().equals(ng.getLet())) {
                                                og.setLet(ng.getLet());
                                            }
                                        }
                                    }
                                    if (!isGameExist) {
                                        ngames.add(ng);
                                    }
                                }
                                if (!ngames.isEmpty()) {
                                    ogames.addAll(ngames);
                                }
                                break;
                            }
                        }
                        if (!isMatchExist) {
                            nmatchs.add(nm);
                        }
                    }
                    if (!nmatchs.isEmpty()) {
                        omatchs.addAll(nmatchs);
                        for (Match match : nmatchs) {
                            SportFBCache.earlyMTLMap.put(match.getId(), nl.getId());
                        }
                    }
                }
            }
            for (Map.Entry<String, String> entry : i18nMap.entrySet()) {
                SportFBCache.i18nMap.put(entry.getKey(), entry.getValue());
            }
        } catch (Exception e) {
            log.error(e.fillInStackTrace());
        }
    }
}
