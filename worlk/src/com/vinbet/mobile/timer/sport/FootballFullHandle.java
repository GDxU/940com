package com.vinbet.mobile.timer.sport;

import com.vinbet.mobile.entity.sport.*;
import com.vinbet.mobile.sys.sport.SportFBCache;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by ray on 15/3/27.
 */
public class FootballFullHandle extends DefaultHandler {

    private boolean isI18n;
    private String lng;
    private ConcurrentHashMap<String, String> i18nMap;

    public FootballFullHandle(boolean isI18n, String lng, ConcurrentHashMap<String, String> i18nMap, Sport sport) {
        this.isI18n = isI18n;
        this.lng = lng.toUpperCase();
        this.i18nMap = i18nMap;
        if (!isI18n) {
            this.sport = sport;
        }
    }

    private Sport sport;
    private League league;
    private Match match;
    private Game game;
    private Item item;

    private boolean isDmid = false;
    private String dmid;
    private boolean isDgid = false;
    private String dgid;

    private HashSet<String> badGames = new HashSet<String>();

    @Override
    public void startElement(String uri, String localName, String qName, Attributes attrs) throws SAXException {
        ConcurrentHashMap<String, String> kvMap = new ConcurrentHashMap<String, String>();
        for (int i = 0; i < attrs.getLength(); i++) {
            kvMap.put(attrs.getQName(i), attrs.getValue(i));
        }
        if (qName.equalsIgnoreCase("sports")) {
            String key = lng + "-" + kvMap.get("sid");
            i18nMap.put(key, kvMap.get("snm"));
            if (!isI18n) {
                sport.setId(kvMap.get("sid"));
                sport.setName(kvMap.get("sid"));
                sport.setVersion(kvMap.get("version"));
                sport.setLeagues(new ArrayList<League>());
            }
        } else if (qName.equalsIgnoreCase("dmid")) {
            isDmid = true;
        } else if (qName.equalsIgnoreCase("league")) {
            String key = lng + "-" + kvMap.get("lid");
            i18nMap.put(key, kvMap.get("lnm"));
            if (!isI18n) {
                league = new League();
                league.setId(kvMap.get("lid"));
                league.setName(kvMap.get("lid"));
                league.setSid(sport.getId());
                league.setIsHot(kvMap.get("ishot"));
                league.setSort(Integer.parseInt(kvMap.get("sort")));
                league.setMatches(new ArrayList<Match>());
            }
        } else if (qName.equalsIgnoreCase("match")) {
            String key = lng + "-" + kvMap.get("mid");
            i18nMap.put(key, kvMap.get("mnm"));
            if (!isI18n) {
                match = new Match();
                match.setId(kvMap.get("mid"));
                match.setName(kvMap.get("mid"));
                String start = null;
                try {
                    start = kvMap.get("start");
                    if (start != null && !start.equals("")) {
                        match.setStart(SportFBCache.normalSDF.parse(start));
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                match.setItype(kvMap.get("itype"));
                match.setTt(kvMap.get("tt"));
                match.setMu(kvMap.get("mu"));
                match.setStatus(kvMap.get("status"));
                match.setSroll(kvMap.get("sroll"));
                match.setLid(league.getId());
                match.setGames(new ArrayList<Game>());
            }
        } else if (qName.equalsIgnoreCase("dgid")) {
            isDgid = true;
        } else if (qName.equalsIgnoreCase("game")) {
            if (!isI18n) {
                game = new Game();
                game.setId(kvMap.get("gid"));
                game.setMid(match.getId());
                game.setDr(kvMap.get("dr"));
                game.setInum(kvMap.get("inum"));
                game.setPid(kvMap.get("pid"));
                game.setLet(kvMap.get("let"));
                game.setItems(new ArrayList<Item>());
            }
        } else if (qName.equalsIgnoreCase("item")) {
            try {
                String key = lng + "-" + kvMap.get("tid");
                i18nMap.put(key, kvMap.get("tnm").replaceAll("&", "/"));
                if (!isI18n) {
                    item = new Item();
                    item.setId(kvMap.get("tid"));
                    item.setGid(game.getId());
                    item.setName(kvMap.get("tid"));
                    item.setRt(Double.parseDouble(kvMap.get("rt")));
                    item.setRtm(Double.parseDouble(kvMap.get("rtm")));
                }
            } catch (Exception e) {
                if (!isI18n) {
                    badGames.add(game.getId());
//                    System.out.println("bad gid:" + game.getId());
                }

            }
        }
    }

    @Override
    public void characters(char[] ch, int start, int length) throws SAXException {
        StringBuffer sb = new StringBuffer();
        int index = start;
        for (int i = 0; i < length; i++) {
            sb.append(ch[index + i]);
        }
        if (isDmid) {
            dmid = sb.toString().trim();
            if (dmid.isEmpty() || dmid.equals("")) {
                dmid = null;
            }
        }
        if (isDgid) {
            dgid = sb.toString().trim();
            if (dgid.isEmpty() || dgid.equals("")) {
                dgid = null;
            }
        }
    }

    @Override
    public void endElement(String uri, String localName, String qName) throws SAXException {
        if (qName.equalsIgnoreCase("dmid")) {
            isDmid = false;
            if (dmid != null) {
                sport.setDmid(dmid);
            }
        }
        if (qName.equalsIgnoreCase("dgid")) {
            isDgid = false;
            if (dgid != null)
                match.setDg(dgid);
        }
        if (qName.equalsIgnoreCase("item")) {
            if (game != null) {
                game.getItems().add(item);
            }
        }
        if (qName.equalsIgnoreCase("game")) {
            if (match != null) {
                if (!badGames.contains(game.getId())) {
                    match.getGames().add(game);
                }
            }
        }
        if (qName.equalsIgnoreCase("match")) {
            if (league != null) {
                league.getMatches().add(match);
            }
        }
        if (qName.equalsIgnoreCase("league")) {
            if (sport != null) {
                sport.getLeagues().add(league);
            }
        }
        if (qName.equalsIgnoreCase("sports")) {

        }
    }

}
