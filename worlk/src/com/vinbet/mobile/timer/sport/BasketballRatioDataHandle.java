package com.vinbet.mobile.timer.sport;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by ray on 15/3/27.
 */
public class BasketballRatioDataHandle extends DefaultHandler {

    private ConcurrentHashMap<String, Double[]> rdMap;

    public BasketballRatioDataHandle(ConcurrentHashMap<String, Double[]> rdMap) {
        this.rdMap = rdMap;
    }

    @Override
    public void startElement(String uri, String localName, String qName, Attributes attrs) throws SAXException {
        ConcurrentHashMap<String, String> kvMap = new ConcurrentHashMap<String, String>();
        for (int i = 0; i < attrs.getLength(); i++) {
            kvMap.put(attrs.getQName(i), attrs.getValue(i));
        }
        if (qName.equalsIgnoreCase("item")) {
            Double[] rts = new Double[2];
            rts[0] = Double.parseDouble(kvMap.get("rt"));
            rts[1] = Double.parseDouble(kvMap.get("rtm"));
            rdMap.put(kvMap.get("tid"), rts);
        }
    }

    @Override
    public void characters(char[] ch, int start, int length) throws SAXException {
    }

    @Override
    public void endElement(String uri, String localName, String qName) throws SAXException {
    }

}
