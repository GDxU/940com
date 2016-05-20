package com.vinbet.mobile.sys;

import org.nutz.json.JsonFormat;
import org.nutz.mvc.ActionContext;
import org.nutz.mvc.ActionFilter;
import org.nutz.mvc.View;
import org.nutz.mvc.view.JspView;
import org.nutz.mvc.view.UTF8JsonView;
import org.nutz.mvc.view.ViewWrapper;

import java.util.HashMap;

/**
 * Created by yenn on 15/1/30.
 */
public class AppStatusCheckFilter implements ActionFilter {
	@Override
	public View match(ActionContext ac) {
		String path = ac.getPath().toLowerCase();
		boolean isMaintain = false;
		if (path.contains("/ssc")) {
			isMaintain = AppsStatusUtil.getSscStatus() == false;
		} else if (path.contains("/hkc")) {
			isMaintain = AppsStatusUtil.getHkcStatus() == false;
		}else if (path.contains("/sport")) {
            isMaintain = AppsStatusUtil.getSportStatus() == false;
        }else if (path.contains("/qxc")) {
            isMaintain = AppsStatusUtil.getQxcStatus() == false;
        }
		if (isMaintain) {
			if (path.contains("/rate/") || path.contains("/getrateinfo")) {
				HashMap<String, Object> obj = new HashMap<String, Object>();
				obj.put("c", 1);
				obj.put("e", "系统通信异常,请稍后重试!");
				// 为兼容不同页面取值问题
				obj.put("r", 1);
				obj.put("m", "系统通信异常,请稍后重试!");
				return new ViewWrapper(new UTF8JsonView(new JsonFormat(true)), obj);
			} else {
				return new JspView("/maintain");
			}
		}
		return null;
	}
}
