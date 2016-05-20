package com.vinbet.mobile.sys.hkc;

import com.vinbet.mobile.entity.hkc.HKCResult;
import com.vinbet.mobile.entity.hkc.MarketCtrl;
import com.vinbet.mobile.entity.hkc.PlayCtrl;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by Ray on 2014/10/28.
 */
public class HKCCache {

    //-----------------------------------------var--------------------------------------------------------
    public static int cacheCount = 10;
    public static long currVer;


    //-----------------------------------------cache--------------------------------------------------------

    //作为基础数据,仅用于判断是否有变化<MarketType-gid_ball,JsonRecord>
    /**
     * 不要在业务代码中直接使用该变量
     */
    public static ConcurrentHashMap<String, String> oldRateMap = new ConcurrentHashMap<String, String>();
    //<MarketType-Gid,<ball,rates>>
    /**
     * 不要在业务代码中直接使用该变量,请使用getFullRateMap方法
     */
    public static ConcurrentHashMap<String, ConcurrentHashMap<String, double[]>> fullRateMap = new ConcurrentHashMap<String, ConcurrentHashMap<String, double[]>>();
    //<ver,<MarketType-Gid,<ball,rates>>>
    /**
     * 不要在业务代码中直接使用该变量,请使用getPartRateMap方法
     */
    public static ConcurrentHashMap<Long, ConcurrentHashMap<String, ConcurrentHashMap<String, double[]>>> partRateMap = new ConcurrentHashMap<Long, ConcurrentHashMap<String, ConcurrentHashMap<String, double[]>>>();

    /**
     * 不要在业务代码中直接使用该变量,请使用getMc方法
     */
    public static MarketCtrl marketCtrl = new MarketCtrl();

    public static ConcurrentHashMap<String, String> wscMap = new ConcurrentHashMap<String, String>();

    /**
     * 不要在业务代码中直接使用该变量,请使用getPc方法
     */
    public static ConcurrentHashMap<String, PlayCtrl> playCtrlMap = new ConcurrentHashMap<String, PlayCtrl>();

    /**
     * 不要在业务代码中直接使用该变量,请使用getPcs方法
     */
    public static ConcurrentHashMap<String, List<PlayCtrl>> playCtrlTreeMap = new ConcurrentHashMap<String, List<PlayCtrl>>();

    /**
     * 最新开奖结果
     */
    public static HKCResult result = new HKCResult();

    //-----------------------------------------method--------------------------------------------------------

    /**
     * 获取全量盘口,如果返回空则表示该盘口不存在
     *
     * @param mt  盘口类型,a,b,c,d
     * @param gid 游戏ID
     * @return <球号,double[赔率1,赔率2]>
     */
    public static ConcurrentHashMap<String, double[]> getFullRateMap(String mt, String gid) {
        return fullRateMap.get(mt + "-" + gid);
    }

    /**
     * 获取增量盘口,如果返回空则表示该盘口没变化
     * <p>
     * 方法待实现
     * </p>
     *
     * @param cv  最后一次返回的版本号
     * @param mt  盘口类型,a,b,c,d
     * @param gid 游戏ID
     * @return <球号,double[赔率1,赔率2]>
     */
    public static ConcurrentHashMap<String, double[]> getPartRateMap(long cv, String mt, String gid) {
        ConcurrentHashMap<String, double[]> nmap = new ConcurrentHashMap<String, double[]>();
        ConcurrentHashMap<String, ConcurrentHashMap<String, double[]>> vmap = null;
        ConcurrentHashMap<String, double[]> omap = null;
        while (cv <= currVer) {
            if ((vmap = partRateMap.get(cv)) != null) {
                omap = vmap.get(mt + "-" + gid);
                if (omap != null) {
                    for (Map.Entry<String, double[]> entry : omap.entrySet()) {
                        if (nmap.get(entry.getKey()) == null) {
                            nmap.put(entry.getKey(), entry.getValue());
                        } else {
                            double[] nrs = nmap.get(entry.getKey());
                            double[] prs = entry.getValue();
                            if (prs[0] != 0 && nrs[0] != prs[0]) {
                                nrs[0] = prs[0];
                            }
                            if (prs[1] != 0 && nrs[1] != prs[1]) {
                                nrs[1] = prs[1];
                            }
                        }
                    }
                }
            }
            cv++;
        }
        return nmap;
    }

    /**
     * 返回盘口控制信息
     *
     * @return
     */
    public static MarketCtrl getMc() {
        return marketCtrl;
    }

    /**
     * 返回游戏控制信息
     *
     * @param gid 游戏id
     * @return
     */
    public static PlayCtrl getPc(String gid) {
        return playCtrlMap.get(gid);
    }

    /**
     * 返回游戏控制信息集合
     *
     * @param pid 游戏父id,例如:10(特码),就会返回特A(1001)跟特B(1002)的游戏控制信息
     * @return
     */
    public static List<PlayCtrl> getPcs(String pid) {
        return playCtrlTreeMap.get(pid);
    }

}
