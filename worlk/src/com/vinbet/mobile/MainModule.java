package com.vinbet.mobile;

import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.Mvcs;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.IocBy;
import org.nutz.mvc.annotation.Localization;
import org.nutz.mvc.annotation.Modules;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.SetupBy;
import org.nutz.mvc.ioc.provider.ComboIocProvider;

import com.vinbet.mobile.sys.I18nLoader;
import com.vinbet.mobile.sys.SystemMrg;

@Modules(scanPackage = true)
// @IocBy(type = AnnotationIocProvider.class, args = { "com.vinbet.mobile" })
@IocBy(type = ComboIocProvider.class, args = { "*org.nutz.ioc.loader.json.JsonLoader", "com/vinbet/mobile/config/jms_cfg.js", "*org.nutz.ioc.loader.annotation.AnnotationIocLoader",
		"com.vinbet.mobile" })
@Localization(value = "i18n", type = I18nLoader.class, defaultLocalizationKey = "zh")
@SetupBy(SystemMrg.class)
public class MainModule {
	private Log log = Logs.getLog(MainModule.class);

	@At("/i18n/?")
	@Ok("json")
	public Object i18n(String lng) {
		Mvcs.setLocalizationKey(lng);
		return "ok";
	}

}
