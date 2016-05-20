package com.vinbet.mobile.timer.sport;

import com.vinbet.mobile.entity.sport.MatchReal;
import com.vinbet.mobile.sys.PropertiesLoader;
import com.vinbet.mobile.sys.sport.SportBBCache;
import com.vinbet.mobile.sys.sport.SportFBCache;
import com.vinbet.mobile.util.Constants;
import com.vinbet.mobile.util.GzipUtil;
import com.vinbet.mobile.util.HttpClientUtil;
import com.vinbet.mobile.util.MD5Util;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import java.io.ByteArrayInputStream;
import java.util.HashMap;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by yenn on 15/3/29.
 */
@IocBean
public class BasketballMatchRealTask implements Runnable {

    private ConcurrentHashMap<String, MatchReal> mrMap;

    @Inject
    private PropertiesLoader propertiesLoader;

    private Log log = Logs.getLog(BasketballMatchRealTask.class);

    @Override
    public void run() {
        try {
            SAXParserFactory factory = SAXParserFactory.newInstance();
            SAXParser parser = factory.newSAXParser();
            //滚球盘中数据
            HashMap<String, String> param = new HashMap<String, String>();
            param.put("s", "2");
            param.put("l", "en");
            param.put(Constants.TOKEN_SPORT, MD5Util.md5Hex(propertiesLoader.getTrim("vinbet.token.sport")));
            String xml = GzipUtil.unGzipString(HttpClientUtil.doGetString(propertiesLoader.getTrim("vinbet.sport.url") + "/core/apiData.getMatchRealData.do", param, false));
            if (xml != null && !xml.trim().equals("")) {
                mrMap = new ConcurrentHashMap<String, MatchReal>();
                parser.parse(new ByteArrayInputStream(xml.getBytes("UTF-8")), new BasketballMatchRealHandle(mrMap));
                SportBBCache.mrMap = mrMap;
            }
        } catch (Exception e) {
            log.error(e.fillInStackTrace());
        }
    }
}
