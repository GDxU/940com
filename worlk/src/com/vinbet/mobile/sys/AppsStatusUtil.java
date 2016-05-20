package com.vinbet.mobile.sys;

import org.nutz.log.Log;
import org.nutz.log.Logs;

import java.util.HashMap;
import java.util.Map;

/**
 * 系统子应用状态维护工具类
 * Created by ray on 15/1/30.
 */
public class AppsStatusUtil {

    private static Log log = Logs.getLog(AppsStatusUtil.class);
    private static Map<String, Boolean[]> sMap = new HashMap<String, Boolean[]>();

    private AppsStatusUtil() {
    }

    static {
        //Boolean结构，【是否手动修改，状态是否正常】
        sMap.put("ssc", new Boolean[]{false, true});
        sMap.put("hkc", new Boolean[]{false, true});
        sMap.put("qxc", new Boolean[]{false, true});
        sMap.put("sport", new Boolean[]{false, true});
    }

    private static boolean getAppsStatus(String name) {
        return sMap.get(name)[1];
    }

    private static void setAppsStatus(String name, boolean status) {
        if (getManualStatus(name)) {
            log.error(name + " setup status failure! because it is manual operation!");
        } else {
            sMap.get(name)[1] = status;
            log.debug(name + " setup status succeed! current status:" + status);
        }
    }

    /**
     * 手动设置对应的子应用状态，仅供后台管理使用，其他业务严禁使用，应该使用其他子应用对应的状态设置方法
     * <br>
     * 例如：setSscStatus,setHkcStatus
     *
     * @param name
     * @param status
     */
    public static void setAppsStatusByManual(String name, boolean status) {
        sMap.get(name)[0] = true;
        sMap.get(name)[1] = status;
        log.info(name + " setup status succeed! current status:" + status);
    }

    private static boolean getManualStatus(String name) {
        return sMap.get(name)[0];
    }

    /**
     * 设置对应的子应用状态为自动检测，仅供后台管理使用，其他业务严禁使用
     * @param name
     */
    public static void setManualStatusToAuto(String name) {
        sMap.get(name)[0] = false;
    }

    /**
     * 获取时时彩子应用状态
     *
     * @return
     */
    public static boolean getSscStatus() {
        return getAppsStatus("ssc");
    }

    /**
     * 设置时时彩子应用状态
     *
     * @param status
     */
    public static void setSscStatus(boolean status) {
        setAppsStatus("ssc", status);
    }

    /**
     * 获取香港彩子应用状态
     *
     * @return
     */
    public static boolean getHkcStatus() {
        return getAppsStatus("hkc");
    }


    /**
     * 设置香港彩子应用状态
     *
     * @param status
     */
    public static void setHkcStatus(boolean status) {
        setAppsStatus("hkc", status);
    }

    
    /**
     * 获取七星彩子应用状态
     *
     * @return
     */
    public static boolean getQxcStatus() {
        return getAppsStatus("qxc");
    }


    /**
     * 设置七星彩子应用状态
     *
     * @param status
     */
    public static void setQxcStatus(boolean status) {
        setAppsStatus("qxc", status);
    }
    /**
     * 设置新体育子应用状态
     *
     * @param status
     */
    public static void setSportStatus(boolean status) {
        setAppsStatus("sport", status);
    }

    /**
     * 获取香港彩子应用状态
     * @return
     */
    public static boolean getSportStatus() {
        return getAppsStatus("sport");
    }
}
