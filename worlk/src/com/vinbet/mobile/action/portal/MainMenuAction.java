package com.vinbet.mobile.action.portal;

import java.util.HashMap;

import com.vinbet.mobile.sys.AppStatusCheckFilter;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.By;
import org.nutz.mvc.annotation.Filters;
import org.nutz.mvc.annotation.Ok;

import com.vinbet.mobile.sys.AppCache;
import com.vinbet.mobile.util.CheckSession;

@IocBean(singleton = false)
@Filters({@By(type = CheckSession.class, args = {"USER_SESSION", "/timeout"}), @By(type = AppStatusCheckFilter.class)})
public class MainMenuAction extends CommonAction {

    @At("/pt/dl")
    @Ok("jsp:page.pt.download")
    @Filters
    public Object ptDownLoad() {
        //HashMap<String, Object> obj = new HashMap<String, Object>();
        //return obj;
    	return null;
    }
}
