package com.vinbet.mobile.action.ssc;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.View;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.By;
import org.nutz.mvc.annotation.Filters;
import org.nutz.mvc.annotation.Param;
import org.nutz.mvc.view.JspView;
import org.nutz.mvc.view.ViewWrapper;

import com.vinbet.mobile.sys.AppCache;
import com.vinbet.mobile.sys.AppStatusCheckFilter;
import com.vinbet.mobile.util.CheckSession;

@IocBean(singleton = false)
@Filters({ @By(type = CheckSession.class, args = { "SSC_USER_SESSION", "/timeout" }), @By(type = AppStatusCheckFilter.class) })
public class XyncAction {
	private Log log = Logs.getLog(XyncAction.class);

	@At("/xync/topage")
	public View topage(@Param("pageName") String pageName, @Param("gameId") String gameId, @Param("betOn") String betOn, @Param("nav") String nav, HttpServletRequest request) {
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("gameId", gameId);
		dataMap.put("betOn", betOn);
		dataMap.put("nav", nav);
		dataMap.put("ballName", i18n.get("label.ssc.play." + betOn));
		dataMap.put("cf", AppCache.sscSysConfig);
		return new ViewWrapper(new JspView("page.ssc.xync." + pageName), dataMap);
	}
}
