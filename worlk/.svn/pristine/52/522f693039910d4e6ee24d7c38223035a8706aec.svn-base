package com.vinbet.mobile.timer.sport;

import com.vinbet.mobile.entity.sport.MatchReal;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by ray on 15/3/27.
 */
public class FootballMatchRealHandle extends DefaultHandler {

    private ConcurrentHashMap<String, MatchReal> mrMap;

    public FootballMatchRealHandle(ConcurrentHashMap<String, MatchReal> mrMap) {
        this.mrMap = mrMap;
    }

    @Override
    public void startElement(String uri, String localName, String qName, Attributes attrs) throws SAXException {
        ConcurrentHashMap<String, String> kvMap = new ConcurrentHashMap<String, String>();
        for (int i = 0; i < attrs.getLength(); i++) {
            kvMap.put(attrs.getQName(i), attrs.getValue(i));
        }
        if (qName.equalsIgnoreCase("match")) {
            MatchReal mr = new MatchReal();
            mr.setMid(kvMap.get("mid"));
            mr.setGt(kvMap.get("gt"));
            mr.setHhg(kvMap.get("hhg"));
            mr.setHag(kvMap.get("hag"));
            mr.setAg(kvMap.get("ag"));
            mr.setHg(kvMap.get("hg"));
            mr.setHhc(kvMap.get("hhc"));
            mr.setHac(kvMap.get("hac"));
            mr.setAc(kvMap.get("ac"));
            mr.setHc(kvMap.get("hc"));
            mr.setHred(kvMap.get("hred"));
            mr.setAred(kvMap.get("ared"));
            mr.setLt(kvMap.get("lt"));
            mrMap.put(mr.getMid(), mr);
        }
    }

    @Override
    public void characters(char[] ch, int start, int length) throws SAXException {
        StringBuffer sb = new StringBuffer();
        int index = start;
        for (int i = 0; i < length; i++) {
            sb.append(ch[index + i]);
        }
    }

    @Override
    public void endElement(String uri, String localName, String qName) throws SAXException {
        if (qName.equalsIgnoreCase("sports")) {
        }
    }

}
