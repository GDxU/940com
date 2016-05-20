package com.vinbet.mobile.action.portal;

import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;

import java.util.HashMap;

/**
 * Created by Ray on 2014/12/13.
 */
@IocBean(singleton = false)
@At("/user/totalReportPage")
public class ReportAction {

    /**
     * 跳转到个人总报表页面
     */
    @At("/")
    @Ok("jsp:page.portal.user.total_report")
    public Object toTotalReportPage() {
        HashMap<String, Object> obj = new HashMap<String, Object>();
        return obj;
    }
}
