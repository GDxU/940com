package com.vinbet.mobile.sys;

import org.nutz.lang.util.MultiLineProperties;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.MessageLoader;
import org.nutz.resource.NutResource;
import org.nutz.resource.Scans;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Ray on 2014/8/27.
 */
public class I18nLoader implements MessageLoader {

    private static Log log = Logs.getLog(I18nLoader.class);

    @Override
    public Map<String, Map<String, Object>> load(String refer) {
        Map<String, Map<String, Object>> resMap = new HashMap<String, Map<String, Object>>();
        List<NutResource> nrs = Scans.me().scan(refer, "^.+[.]properties$");
        if (log.isDebugEnabled()) {
            log.debug("从以下文件中加载资源:");
            for (NutResource nr : nrs) {
                log.debug(nr.getName());
            }
            log.debug("共" + nrs.size() + "个资源文件!");
        }
        for (NutResource nr : nrs) {
            String[] nms = nr.getName().split("[\\\\/]");
            if (nms.length != 3) {
                log.error("资源目录结构有所改变,可能无法正常的加载资源文件,请检查代码!!!");
                return resMap;
            }
            String lng = nms[1];
            if (resMap.get(lng) == null) {
                resMap.put(lng, new HashMap<String, Object>());
            }
            try {
                MultiLineProperties p = new MultiLineProperties();
                Reader r = nr.getReader();
                p.load(r);
                r.close();
                for (Map.Entry<String, String> entry : p.entrySet()) {
                    resMap.get(lng).put(entry.getKey(), entry.getValue());
                }
            } catch (Exception e) {
                log.error("加载资源文件出错!!!", e.fillInStackTrace());
            }
        }
        if (log.isDebugEnabled())
            log.debug("资源文件加载完成,共" + resMap.size() + "种语言.");
        return resMap;
    }
}
