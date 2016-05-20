package com.vinbet.mobile.util;

import javax.servlet.http.HttpSession;

import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.ActionContext;
import org.nutz.mvc.ActionFilter;
import org.nutz.mvc.Mvcs;
import org.nutz.mvc.View;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.view.ServerRedirectView;
import org.nutz.mvc.view.UTF8JsonView;
import org.nutz.mvc.view.ViewWrapper;

/**
 * 检查当前 Session，如果存在某一属性，并且不为 null，则通过 <br>
 * 否则，返回用户未登录json报文
 * <p>
 * 构造函数需要两个参数
 * <ul>
 * <li>第一个是， 需要检查的属性名称。如果 session 里存在这个属性，则表示通过检查
 * <li>第二个是，如果未通过检查，将当前请求转向何处。 一个类似 /yourpath/xxx.xx 的路径
 * </ul>
 * 
 */

public class CheckApiSession implements ActionFilter {
	private Log log = Logs.getLog(CheckApiSession.class);
	private String name;

	public CheckApiSession(String name) {
		this.name = name;
	}

	public View  match(ActionContext context) {
		log.debug(context.getPath());
		HttpSession session = Mvcs.getHttpSession(false);
		if (session == null || null == session.getAttribute(name)){
			ApiJsonResult result =ApiJsonResult.createFalied("系统检测到当前尚未登录！");
			result.setSt(5000012);
			return new ViewWrapper(new UTF8JsonView(null),result);
		}
		return null;
	}
}
