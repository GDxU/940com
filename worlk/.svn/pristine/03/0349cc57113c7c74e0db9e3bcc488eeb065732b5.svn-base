package com.vinbet.mobile.action.ssc;

import com.vinbet.mobile.sys.AppCache;
import com.vinbet.mobile.sys.AppStatusCheckFilter;
import com.vinbet.mobile.util.CheckSession;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.View;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.By;
import org.nutz.mvc.annotation.Filters;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;
import org.nutz.mvc.view.JspView;
import org.nutz.mvc.view.ViewWrapper;

import java.util.HashMap;
import java.util.Map;

@IocBean(singleton = false)
@Filters({ @By(type = CheckSession.class, args = { "SSC_USER_SESSION", "/timeout" }), @By(type = AppStatusCheckFilter.class) })
public class GameJxsyxwAction {
	private Log log = Logs.getLog(GameJxsyxwAction.class);

	@At("/jxsyxw/topage")
	public View topage(@Param("pageName") String pageName, @Param("gameId") String gameId, @Param("betOn") String betOn, @Param("nav") String nav) {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("gameId", gameId);
		dataMap.put("betOn", betOn);
		dataMap.put("nav", nav);
		dataMap.put("cf", AppCache.sscSysConfig);
		return new ViewWrapper(new JspView("page.ssc.jxsyxw." + pageName), dataMap);
	}

	@At("/ssc/jxsyxwmenu")
	@Ok("jsp:page.ssc.jxsyxw.gameJxsyxw")
	public Object sdsyxwmenu() {
		HashMap<String, Object> obj = new HashMap<String, Object>();
		obj.put("cf", AppCache.sscSysConfig);
		return obj;
	}
}
