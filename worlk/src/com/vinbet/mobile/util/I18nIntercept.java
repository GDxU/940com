package com.vinbet.mobile.util;

import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

import com.vinbet.mobile.sys.AppCache;

/**
 *国际化语言转换类。
 * @author  cjp
 * @version  [Ver 1.0]
 * @since 2015-1-21 下午3:53:18
 */
public class I18nIntercept {
    private static final Logger logger = Logger.getLogger(I18nIntercept.class);
    /**当前语言编码*/
    private static ThreadLocal<String> currentLanguage = new ThreadLocal<String>();

    /* 获取当前请求的语言代码。*/
/*	public static String getLanguage() {
		final HttpServletRequest request = I18nIntercept.getRequest();
		String language = null;
		if (request != null) {
			Locale locale = (Locale)request.getSession().getAttribute("WW_TRANS_I18N_LOCALE");
			if(locale!=null){
				language = locale.getLanguage();
			}
		} else {
			language = I18nIntercept.currentLanguage.get();
		}
		
		if (language == null || language.length() == 0) {
			language = Constants.DEFAULT_LANGUAGE;
		}

		return language;
	}*/
	
    /* 得到当前的request请求。*/
/*    public static HttpServletRequest getRequest() {
        HttpServletRequest request = null;
        final ActionContext context = ActionContext.getContext();
        if (context != null) {
            request = (HttpServletRequest) context.get(ServletActionContext.HTTP_REQUEST);
        }
        return request;
    }*/
    
    /**
     * 将oldVal值转换为指定语言的数据。
     * 
     * @param language
     * @param oldVal
     * @return
     */
    public static String convertValue(final String language, final String iid,final String dictOldName) {
        Map<String, Map<String, String>> internationMap = AppCache.getInternationMap();
        return I18nIntercept.convertValue(language, iid, internationMap,dictOldName);
    }

    private static String convertValue(final String language, final String iid, Map<String, Map<String, String>> internationMap,final String dictOldName) {
        final Map<String, String> i18nMap = internationMap.get(iid);
        if (i18nMap != null) {
            String newVal = i18nMap.get(language);
            if (newVal == null || newVal.trim().length() == 0) {
                final String defaultLanguage = Constants.DEFAULT_LANGUAGE;
                newVal = i18nMap.get(defaultLanguage);
            }
            if (newVal == null || newVal.trim().length() == 0) {
                newVal = dictOldName;
            }
            return newVal;
        } else {
        	logger.debug("在国际化内存表中没有找到：["+language+":"+iid+"]");
        	return dictOldName;
        }
    }
}
