package com.vinbet.mobile.timer.ssc;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.vinbet.mobile.sys.AppCache;
import com.vinbet.mobile.sys.AppsStatusUtil;
import com.vinbet.mobile.sys.PropertiesLoader;
import com.vinbet.mobile.util.Constants;
import com.vinbet.mobile.util.HttpClientUtil;
import com.vinbet.mobile.util.MD5Util;

/**
 * 定时去时时彩后台获取时时彩系统配置信息
 */
@IocBean
public class SscSysConfigTimer implements Runnable {
	private static final Logger logger = LogManager.getLogger(SscSysConfigTimer.class);
	@Inject
	private PropertiesLoader propertiesLoader;

	@Override
	public void run() {
		int tryCount = 1800;
		while (true) {
			// 1显示、0隐藏
			try {
				tryCount--;
				this.loadSscSysConfig();
				break;
			} catch (Exception e) {
				logger.error(" >> 拉取SSC系统配置数据异常,原因：SSC后台维护中或接口数据结构有调整...");
				logger.debug(e);
				if (tryCount <= 0) {
					break;
				}
				try {
					TimeUnit.SECONDS.sleep(30);
				} catch (InterruptedException ie) {
				}
			}
		}
	}

	public void loadSscSysConfig() {
		String url = new StringBuilder(propertiesLoader.getTrim("vinbet.ssc.url")).append("/sysConfig").toString();
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put(Constants.TOKEN_SSC, MD5Util.md5Hex(propertiesLoader.getTrim("vinbet.token.ssc")));
		String response = HttpClientUtil.doGetString(url, parameters, false);
		JSONObject jo = JSON.parseObject(response);
		if (jo == null) {
			logger.error("与SSC后台通信异常，拉取时时彩系统配置数据失败.<<" + response);
			return;
		}
		JSONObject config = JSON.parseObject(jo.getString("sysConfig"));
		if (config.getIntValue("app_open") == 0) {// 网站维护中
			return;
		}
		Map<String, String> sscSysConfig = AppCache.sscSysConfig;
		// ==============================KLC==============================
		sscSysConfig.put("klc", config.getString("game_open_klc"));
		sscSysConfig.put("klc_1", config.getString("klc_game_control_1"));// 第一球
		sscSysConfig.put("klc_2", config.getString("klc_game_control_2"));
		sscSysConfig.put("klc_3", config.getString("klc_game_control_3"));
		sscSysConfig.put("klc_4", config.getString("klc_game_control_4"));
		sscSysConfig.put("klc_5", config.getString("klc_game_control_5"));
		sscSysConfig.put("klc_6", config.getString("klc_game_control_6"));
		sscSysConfig.put("klc_7", config.getString("klc_game_control_7"));
		sscSysConfig.put("klc_8", config.getString("klc_game_control_8"));
		sscSysConfig.put("klc_zh", config.getString("klc_game_control_longhu"));// 总和
		sscSysConfig.put("klc_lm", config.getString("klc_game_control_lianma"));// 连码
		// ==============================SSC==============================
		sscSysConfig.put("ssc", config.getString("game_open_ssc"));
		String ssc_1 = config.getString("ssc_game_control_1");
		String ssc_2 = config.getString("ssc_game_control_2");
		String ssc_3 = config.getString("ssc_game_control_3");
		String ssc_4 = config.getString("ssc_game_control_4");
		String ssc_5 = config.getString("ssc_game_control_5");
		if (ssc_1.equals("1") || ssc_2.equals("1") || ssc_3.equals("1") || ssc_4.equals("1") || ssc_5.equals("1")) {
			sscSysConfig.put("ssc_1_5", "1");
		} else {
			sscSysConfig.put("ssc_1_5", "0");
		}
		sscSysConfig.put("ssc_1", ssc_1);
		sscSysConfig.put("ssc_2", ssc_2);
		sscSysConfig.put("ssc_3", ssc_3);
		sscSysConfig.put("ssc_4", ssc_4);
		sscSysConfig.put("ssc_5", ssc_5);
		sscSysConfig.put("ssc_zh", config.getString("ssc_game_control_longhu"));// 总和-龙虎和
		sscSysConfig.put("ssc_zh", config.getString("ssc_game_control_san"));// 前三、中三、后三
		sscSysConfig.put("ssc_yizhi", config.getString("ssc_game_control_yizi"));// 一字
		sscSysConfig.put("ssc_erzi", config.getString("ssc_game_control_erzi"));// 二字
		sscSysConfig.put("ssc_sanzi", config.getString("ssc_game_control_sanzi"));// 三字
		sscSysConfig.put("ssc_erzidw", config.getString("ssc_game_control_erzidw"));// 二定位
		sscSysConfig.put("ssc_sanzidw", config.getString("ssc_game_control_sanzidw"));// 三定位
		sscSysConfig.put("ssc_zuxuansan", config.getString("ssc_game_control_zuxuansan"));// 组选三
		sscSysConfig.put("ssc_zuxuanliu", config.getString("ssc_game_control_zuxuanliu"));// 组选六
		sscSysConfig.put("ssc_kuadu", config.getString("ssc_game_control_kuadu"));// 跨度ssc_game_control_hs
		sscSysConfig.put("ssc_hs", config.getString("ssc_game_control_hs"));
		// ==============================BJC==============================
		sscSysConfig.put("bjc", config.getString("game_open_bjc"));
		sscSysConfig.put("bjc_12", config.getString("bjc_game_control_1_2"));// 冠、亚军组合
		sscSysConfig.put("bjc_1_5", config.getString("bjc_game_control_3_6"));// 一、二、三、四、五名
		sscSysConfig.put("bjc_6_10", config.getString("bjc_game_control_7_10"));// 六、七、八、九、十名
		// ==============================XYNC==============================
		sscSysConfig.put("xync", config.getString("game_open_xync"));
		sscSysConfig.put("xync_1", config.getString("xync_game_control_1"));// 第一球
		sscSysConfig.put("xync_2", config.getString("xync_game_control_2"));
		sscSysConfig.put("xync_3", config.getString("xync_game_control_3"));
		sscSysConfig.put("xync_4", config.getString("xync_game_control_4"));
		sscSysConfig.put("xync_5", config.getString("xync_game_control_5"));
		sscSysConfig.put("xync_6", config.getString("xync_game_control_6"));
		sscSysConfig.put("xync_7", config.getString("xync_game_control_7"));
		sscSysConfig.put("xync_8", config.getString("xync_game_control_8"));
		sscSysConfig.put("xync_zm", config.getString("xync_game_control_zhengma"));// 正码
		sscSysConfig.put("xync_zh", config.getString("xync_game_control_longhu"));// 总和
		sscSysConfig.put("xync_lm", config.getString("xync_game_control_lianma"));// 连码
		// ==============================JSKS==============================
		sscSysConfig.put("jsks", config.getString("game_open_jsks"));
		sscSysConfig.put("jsks_sj", config.getString("jsks_game_control_sanjun"));// 三军、大小
		sscSysConfig.put("jsks_ws", config.getString("jsks_game_control_weisuai"));// 围骰
		sscSysConfig.put("jsks_qs", config.getString("jsks_game_control_quansuai"));// 全骰
		sscSysConfig.put("jsks_point", config.getString("jsks_game_control_point"));// 点数
		sscSysConfig.put("jsks_lc", config.getString("jsks_game_control_longcards"));// 长牌
		sscSysConfig.put("jsks_sc", config.getString("jsks_game_control_shortcards"));// 短牌
		// ==============================JXSSC==============================
		sscSysConfig.put("jxssc", config.getString("game_open_jxssc"));
		String jxssc_1 = config.getString("jxssc_game_control_1");
		String jxssc_2 = config.getString("jxssc_game_control_2");
		String jxssc_3 = config.getString("jxssc_game_control_3");
		String jxssc_4 = config.getString("jxssc_game_control_4");
		String jxssc_5 = config.getString("jxssc_game_control_5");
		if (jxssc_1.equals("1") || jxssc_2.equals("1") || jxssc_3.equals("1") || jxssc_4.equals("1") || jxssc_5.equals("1")) {
			sscSysConfig.put("jxssc_1_5", "1");
		} else {
			sscSysConfig.put("jxssc_1_5", "0");
		}
		sscSysConfig.put("jxssc_1", jxssc_1);
		sscSysConfig.put("jxssc_2", jxssc_2);
		sscSysConfig.put("jxssc_3", jxssc_3);
		sscSysConfig.put("jxssc_4", jxssc_4);
		sscSysConfig.put("jxssc_5", jxssc_5);
		sscSysConfig.put("jxssc_zh", config.getString("jxssc_game_control_longhu"));// 总和-龙虎和
		sscSysConfig.put("jxssc_zh", config.getString("jxssc_game_control_san"));// 前三、中三、后三
		sscSysConfig.put("jxssc_yizhi", config.getString("jxssc_game_control_yizi"));// 一字
		sscSysConfig.put("jxssc_erzi", config.getString("jxssc_game_control_erzi"));// 二字
		sscSysConfig.put("jxssc_sanzi", config.getString("jxssc_game_control_sanzi"));// 三字
		sscSysConfig.put("jxssc_erzidw", config.getString("jxssc_game_control_erzidw"));// 二定位
		sscSysConfig.put("jxssc_sanzidw", config.getString("jxssc_game_control_sanzidw"));// 三定位
		sscSysConfig.put("jxssc_zuxuansan", config.getString("jxssc_game_control_zuxuansan"));// 组选三
		sscSysConfig.put("jxssc_zuxuanliu", config.getString("jxssc_game_control_zuxuanliu"));// 组选六
		sscSysConfig.put("jxssc_kuadu", config.getString("jxssc_game_control_kuadu"));// 跨度
		sscSysConfig.put("jxssc_hs", config.getString("jxssc_game_control_hs"));
		// ==============================XJSSC==============================
		sscSysConfig.put("xjssc", config.getString("game_open_xjssc"));
		String xjssc_1 = config.getString("xjssc_game_control_1");
		String xjssc_2 = config.getString("xjssc_game_control_2");
		String xjssc_3 = config.getString("xjssc_game_control_3");
		String xjssc_4 = config.getString("xjssc_game_control_4");
		String xjssc_5 = config.getString("xjssc_game_control_5");
		if (xjssc_1.equals("1") || xjssc_2.equals("1") || xjssc_3.equals("1") || xjssc_4.equals("1") || xjssc_5.equals("1")) {
			sscSysConfig.put("xjssc_1_5", "1");
		} else {
			sscSysConfig.put("xjssc_1_5", "0");
		}
		sscSysConfig.put("xjssc_1", xjssc_1);
		sscSysConfig.put("xjssc_2", xjssc_2);
		sscSysConfig.put("xjssc_3", xjssc_3);
		sscSysConfig.put("xjssc_4", xjssc_4);
		sscSysConfig.put("xjssc_5", xjssc_5);
		sscSysConfig.put("xjssc_zh", config.getString("xjssc_game_control_longhu"));// 总和-龙虎和
		sscSysConfig.put("xjssc_zh", config.getString("xjssc_game_control_san"));// 前三、中三、后三
		sscSysConfig.put("xjssc_yizhi", config.getString("xjssc_game_control_yizi"));// 一字
		sscSysConfig.put("xjssc_erzi", config.getString("xjssc_game_control_erzi"));// 二字
		sscSysConfig.put("xjssc_sanzi", config.getString("xjssc_game_control_sanzi"));// 三字
		sscSysConfig.put("xjssc_erzidw", config.getString("xjssc_game_control_erzidw"));// 二定位
		sscSysConfig.put("xjssc_sanzidw", config.getString("xjssc_game_control_sanzidw"));// 三定位
		sscSysConfig.put("xjssc_zuxuansan", config.getString("xjssc_game_control_zuxuansan"));// 组选三
		sscSysConfig.put("xjssc_zuxuanliu", config.getString("xjssc_game_control_zuxuanliu"));// 组选六
		sscSysConfig.put("xjssc_kuadu", config.getString("xjssc_game_control_kuadu"));// 跨度
		sscSysConfig.put("xjssc_hs", config.getString("xjssc_game_control_hs"));
		// ==============================GDSYXW==============================
		sscSysConfig.put("gdsyxw", config.getString("game_open_gdsyxw"));
		sscSysConfig.put("gdsyxw_1", config.getString("gdsyxw_game_control_1"));// 第一球
		sscSysConfig.put("gdsyxw_2", config.getString("gdsyxw_game_control_2"));
		sscSysConfig.put("gdsyxw_3", config.getString("gdsyxw_game_control_3"));
		sscSysConfig.put("gdsyxw_4", config.getString("gdsyxw_game_control_4"));
		sscSysConfig.put("gdsyxw_5", config.getString("gdsyxw_game_control_5"));
		if (config.getString("gdsyxw_game_control_1").equals("1") || config.getString("gdsyxw_game_control_2").equals("1") || config.getString("gdsyxw_game_control_3").equals("1")
				|| config.getString("gdsyxw_game_control_4").equals("1") || config.getString("gdsyxw_game_control_5").equals("1")) {
			sscSysConfig.put("gdsyxw_1_5", "1");
		} else {
			sscSysConfig.put("gdsyxw_1_5", "0");
		}
		sscSysConfig.put("gdsyxw_zh", config.getString("gdsyxw_game_control_1_5"));// 总和-龙虎和
		if (sscSysConfig.get("gdsyxw_zh").equals("1") || sscSysConfig.get("gdsyxw_1_5").equals("1")) {
			sscSysConfig.put("gdsyxw_lm", "1");// 两面
		} else {
			sscSysConfig.put("gdsyxw_lm", "0");
		}
		sscSysConfig.put("gdsyxw_renxuan", config.getString("gdsyxw_game_control_renxuan"));
		sscSysConfig.put("gdsyxw_zuxuan", config.getString("gdsyxw_game_control_zuxuan"));
		sscSysConfig.put("gdsyxw_zhixuan", config.getString("gdsyxw_game_control_zhixuan"));
		// ==============================GXKLC==============================
		sscSysConfig.put("gxklc", config.getString("game_open_gxklc"));
		String gxklc_1 = config.getString("gxklc_game_control_1");
		String gxklc_2 = config.getString("gxklc_game_control_2");
		String gxklc_3 = config.getString("gxklc_game_control_3");
		String gxklc_4 = config.getString("gxklc_game_control_4");
		String gxklc_5 = config.getString("gxklc_game_control_5");
		if (gxklc_1.equals("1") || gxklc_2.equals("1") || gxklc_3.equals("1") || gxklc_4.equals("1") || gxklc_5.equals("1")) {
			sscSysConfig.put("gxklc_1_5", "1");
		} else {
			sscSysConfig.put("gxklc_1_5", "0");
		}
		sscSysConfig.put("gxklc_1", gxklc_1);
		sscSysConfig.put("gxklc_2", gxklc_2);
		sscSysConfig.put("gxklc_3", gxklc_3);
		sscSysConfig.put("gxklc_4", gxklc_4);
		sscSysConfig.put("gxklc_5", gxklc_5);
		sscSysConfig.put("gxklc_lh", config.getString("gxklc_game_control_longhu"));// 龙虎
		sscSysConfig.put("gxklc_zh", config.getString("gxklc_game_control_zonghe"));// 总和
		sscSysConfig.put("gxklc_zm", config.getString("gxklc_game_control_zhengma"));// 正码
		// ==============================TJKLC==============================
		sscSysConfig.put("tjklc", config.getString("game_open_tjklc"));
		sscSysConfig.put("tjklc_1", config.getString("tjklc_game_control_1"));// 第一球
		sscSysConfig.put("tjklc_2", config.getString("tjklc_game_control_2"));
		sscSysConfig.put("tjklc_3", config.getString("tjklc_game_control_3"));
		sscSysConfig.put("tjklc_4", config.getString("tjklc_game_control_4"));
		sscSysConfig.put("tjklc_5", config.getString("tjklc_game_control_5"));
		sscSysConfig.put("tjklc_6", config.getString("tjklc_game_control_6"));
		sscSysConfig.put("tjklc_7", config.getString("tjklc_game_control_7"));
		sscSysConfig.put("tjklc_8", config.getString("tjklc_game_control_8"));
		sscSysConfig.put("tjklc_zh", config.getString("tjklc_game_control_longhu"));// 总和
		sscSysConfig.put("tjklc_lm", config.getString("tjklc_game_control_lianma"));// 连码
		// ==============================TJSSC==============================
		sscSysConfig.put("tjssc", config.getString("game_open_tjssc"));
		String tjssc_1 = config.getString("tjssc_game_control_1");
		String tjssc_2 = config.getString("tjssc_game_control_2");
		String tjssc_3 = config.getString("tjssc_game_control_3");
		String tjssc_4 = config.getString("tjssc_game_control_4");
		String tjssc_5 = config.getString("tjssc_game_control_5");
		if (tjssc_1.equals("1") || tjssc_2.equals("1") || tjssc_3.equals("1") || tjssc_4.equals("1") || tjssc_5.equals("1")) {
			sscSysConfig.put("tjssc_1_5", "1");
		} else {
			sscSysConfig.put("tjssc_1_5", "0");
		}
		sscSysConfig.put("tjssc_1", tjssc_1);
		sscSysConfig.put("tjssc_2", tjssc_2);
		sscSysConfig.put("tjssc_3", tjssc_3);
		sscSysConfig.put("tjssc_4", tjssc_4);
		sscSysConfig.put("tjssc_5", tjssc_5);
		sscSysConfig.put("tjssc_zh", config.getString("tjssc_game_control_longhu"));// 总和-龙虎和
		sscSysConfig.put("tjssc_zh", config.getString("tjssc_game_control_san"));// 前三、中三、后三
		sscSysConfig.put("tjssc_yizhi", config.getString("tjssc_game_control_yizi"));// 一字
		sscSysConfig.put("tjssc_erzi", config.getString("tjssc_game_control_erzi"));// 二字
		sscSysConfig.put("tjssc_sanzi", config.getString("tjssc_game_control_sanzi"));// 三字
		sscSysConfig.put("tjssc_erzidw", config.getString("tjssc_game_control_erzidw"));// 二定位
		sscSysConfig.put("tjssc_sanzidw", config.getString("tjssc_game_control_sanzidw"));// 三定位
		sscSysConfig.put("tjssc_zuxuansan", config.getString("tjssc_game_control_zuxuansan"));// 组选三
		sscSysConfig.put("tjssc_zuxuanliu", config.getString("tjssc_game_control_zuxuanliu"));// 组选六
		sscSysConfig.put("tjssc_kuadu", config.getString("tjssc_game_control_kuadu"));// 跨度
		sscSysConfig.put("tjssc_hs", config.getString("tjssc_game_control_hs"));
		// ==============================SHSYXW==============================
		sscSysConfig.put("shsyxw", config.getString("game_open_shsyxw"));
		sscSysConfig.put("shsyxw_1", config.getString("shsyxw_game_control_1"));// 第一球
		sscSysConfig.put("shsyxw_2", config.getString("shsyxw_game_control_2"));
		sscSysConfig.put("shsyxw_3", config.getString("shsyxw_game_control_3"));
		sscSysConfig.put("shsyxw_4", config.getString("shsyxw_game_control_4"));
		sscSysConfig.put("shsyxw_5", config.getString("shsyxw_game_control_5"));
		if (config.getString("shsyxw_game_control_1").equals("1") || config.getString("shsyxw_game_control_2").equals("1") || config.getString("shsyxw_game_control_3").equals("1")
				|| config.getString("shsyxw_game_control_4").equals("1") || config.getString("shsyxw_game_control_5").equals("1")) {
			sscSysConfig.put("shsyxw_1_5", "1");
		} else {
			sscSysConfig.put("shsyxw_1_5", "0");
		}
		sscSysConfig.put("shsyxw_zh", config.getString("shsyxw_game_control_1_5"));// 总和-龙虎和
		if (sscSysConfig.get("shsyxw_zh").equals("1") || sscSysConfig.get("shsyxw_1_5").equals("1")) {
			sscSysConfig.put("shsyxw_lm", "1");// 两面
		} else {
			sscSysConfig.put("shsyxw_lm", "0");
		}
		sscSysConfig.put("shsyxw_renxuan", config.getString("shsyxw_game_control_renxuan"));
		sscSysConfig.put("shsyxw_zuxuan", config.getString("shsyxw_game_control_zuxuan"));
		sscSysConfig.put("shsyxw_zhixuan", config.getString("shsyxw_game_control_zhixuan"));
		// ==============================SDSYXW==============================
		sscSysConfig.put("sdsyxw", config.getString("game_open_sdsyxw"));
		sscSysConfig.put("sdsyxw_1", config.getString("sdsyxw_game_control_1"));// 第一球
		sscSysConfig.put("sdsyxw_2", config.getString("sdsyxw_game_control_2"));
		sscSysConfig.put("sdsyxw_3", config.getString("sdsyxw_game_control_3"));
		sscSysConfig.put("sdsyxw_4", config.getString("sdsyxw_game_control_4"));
		sscSysConfig.put("sdsyxw_5", config.getString("sdsyxw_game_control_5"));
		if (config.getString("sdsyxw_game_control_1").equals("1") || config.getString("sdsyxw_game_control_2").equals("1") || config.getString("sdsyxw_game_control_3").equals("1")
				|| config.getString("sdsyxw_game_control_4").equals("1") || config.getString("sdsyxw_game_control_5").equals("1")) {
			sscSysConfig.put("sdsyxw_1_5", "1");
		} else {
			sscSysConfig.put("sdsyxw_1_5", "0");
		}
		sscSysConfig.put("sdsyxw_zh", config.getString("sdsyxw_game_control_1_5"));// 总和-龙虎和
		if (sscSysConfig.get("sdsyxw_zh").equals("1") || sscSysConfig.get("sdsyxw_1_5").equals("1")) {
			sscSysConfig.put("sdsyxw_lm", "1");// 两面
		} else {
			sscSysConfig.put("sdsyxw_lm", "0");
		}
		sscSysConfig.put("sdsyxw_renxuan", config.getString("sdsyxw_game_control_renxuan"));
		sscSysConfig.put("sdsyxw_zuxuan", config.getString("sdsyxw_game_control_zuxuan"));
		sscSysConfig.put("sdsyxw_zhixuan", config.getString("sdsyxw_game_control_zhixuan"));
		// ==============================AHKS==============================
		sscSysConfig.put("ahks", config.getString("game_open_ahks"));
		sscSysConfig.put("ahks_sj", config.getString("ahks_game_control_sanjun"));// 三军、大小
		sscSysConfig.put("ahks_ws", config.getString("ahks_game_control_weisuai"));// 围骰
		sscSysConfig.put("ahks_qs", config.getString("ahks_game_control_quansuai"));// 全骰
		sscSysConfig.put("ahks_point", config.getString("ahks_game_control_point"));// 点数
		sscSysConfig.put("ahks_lc", config.getString("ahks_game_control_longcards"));// 长牌
		sscSysConfig.put("ahks_sc", config.getString("ahks_game_control_shortcards"));// 短牌
		// ==============================GXKS==============================
		sscSysConfig.put("gxks", config.getString("game_open_gxks"));
		sscSysConfig.put("gxks_sj", config.getString("gxks_game_control_sanjun"));// 三军、大小
		sscSysConfig.put("gxks_ws", config.getString("gxks_game_control_weisuai"));// 围骰
		sscSysConfig.put("gxks_qs", config.getString("gxks_game_control_quansuai"));// 全骰
		sscSysConfig.put("gxks_point", config.getString("gxks_game_control_point"));// 点数
		sscSysConfig.put("gxks_lc", config.getString("gxks_game_control_longcards"));// 长牌
		sscSysConfig.put("gxks_sc", config.getString("gxks_game_control_shortcards"));// 短牌
		// ==============================JXSYXW==============================
		sscSysConfig.put("jxsyxw", config.getString("game_open_jxsyxw"));
		sscSysConfig.put("jxsyxw_1", config.getString("jxsyxw_game_control_1"));// 第一球
		sscSysConfig.put("jxsyxw_2", config.getString("jxsyxw_game_control_2"));
		sscSysConfig.put("jxsyxw_3", config.getString("jxsyxw_game_control_3"));
		sscSysConfig.put("jxsyxw_4", config.getString("jxsyxw_game_control_4"));
		sscSysConfig.put("jxsyxw_5", config.getString("jxsyxw_game_control_5"));
		if (config.getString("jxsyxw_game_control_1").equals("1") || config.getString("jxsyxw_game_control_2").equals("1") || config.getString("jxsyxw_game_control_3").equals("1")
				|| config.getString("jxsyxw_game_control_4").equals("1") || config.getString("jxsyxw_game_control_5").equals("1")) {
			sscSysConfig.put("jxsyxw_1_5", "1");
		} else {
			sscSysConfig.put("jxsyxw_1_5", "0");
		}
		sscSysConfig.put("jxsyxw_zh", config.getString("jxsyxw_game_control_1_5"));// 总和-龙虎和
		if (sscSysConfig.get("jxsyxw_zh").equals("1") || sscSysConfig.get("jxsyxw_1_5").equals("1")) {
			sscSysConfig.put("jxsyxw_lm", "1");// 两面
		} else {
			sscSysConfig.put("jxsyxw_lm", "0");
		}
		sscSysConfig.put("jxsyxw_renxuan", config.getString("jxsyxw_game_control_renxuan"));
		sscSysConfig.put("jxsyxw_zuxuan", config.getString("jxsyxw_game_control_zuxuan"));
		sscSysConfig.put("jxsyxw_zhixuan", config.getString("jxsyxw_game_control_zhixuan"));
		// ==============================LNSYXW==============================
		sscSysConfig.put("lnsyxw", config.getString("game_open_lnsyxw"));
		sscSysConfig.put("lnsyxw_1", config.getString("lnsyxw_game_control_1"));// 第一球
		sscSysConfig.put("lnsyxw_2", config.getString("lnsyxw_game_control_2"));
		sscSysConfig.put("lnsyxw_3", config.getString("lnsyxw_game_control_3"));
		sscSysConfig.put("lnsyxw_4", config.getString("lnsyxw_game_control_4"));
		sscSysConfig.put("lnsyxw_5", config.getString("lnsyxw_game_control_5"));
		if (config.getString("lnsyxw_game_control_1").equals("1") || config.getString("lnsyxw_game_control_2").equals("1") || config.getString("lnsyxw_game_control_3").equals("1")
				|| config.getString("lnsyxw_game_control_4").equals("1") || config.getString("lnsyxw_game_control_5").equals("1")) {
			sscSysConfig.put("lnsyxw_1_5", "1");
		} else {
			sscSysConfig.put("lnsyxw_1_5", "0");
		}
		sscSysConfig.put("lnsyxw_zh", config.getString("lnsyxw_game_control_1_5"));// 总和-龙虎和
		if (sscSysConfig.get("lnsyxw_zh").equals("1") || sscSysConfig.get("lnsyxw_1_5").equals("1")) {
			sscSysConfig.put("lnsyxw_lm", "1");// 两面
		} else {
			sscSysConfig.put("lnsyxw_lm", "0");
		}
		sscSysConfig.put("lnsyxw_renxuan", config.getString("lnsyxw_game_control_renxuan"));
		sscSysConfig.put("lnsyxw_zuxuan", config.getString("lnsyxw_game_control_zuxuan"));
		sscSysConfig.put("lnsyxw_zhixuan", config.getString("lnsyxw_game_control_zhixuan"));
		// ==============================HBSYXW==============================
		sscSysConfig.put("hbsyxw", config.getString("game_open_hbsyxw"));
		sscSysConfig.put("hbsyxw_1", config.getString("hbsyxw_game_control_1"));// 第一球
		sscSysConfig.put("hbsyxw_2", config.getString("hbsyxw_game_control_2"));
		sscSysConfig.put("hbsyxw_3", config.getString("hbsyxw_game_control_3"));
		sscSysConfig.put("hbsyxw_4", config.getString("hbsyxw_game_control_4"));
		sscSysConfig.put("hbsyxw_5", config.getString("hbsyxw_game_control_5"));
		if (config.getString("hbsyxw_game_control_1").equals("1") || config.getString("hbsyxw_game_control_2").equals("1") || config.getString("hbsyxw_game_control_3").equals("1")
				|| config.getString("hbsyxw_game_control_4").equals("1") || config.getString("hbsyxw_game_control_5").equals("1")) {
			sscSysConfig.put("hbsyxw_1_5", "1");
		} else {
			sscSysConfig.put("hbsyxw_1_5", "0");
		}
		sscSysConfig.put("hbsyxw_zh", config.getString("hbsyxw_game_control_1_5"));// 总和-龙虎和
		if (sscSysConfig.get("hbsyxw_zh").equals("1") || sscSysConfig.get("hbsyxw_1_5").equals("1")) {
			sscSysConfig.put("hbsyxw_lm", "1");// 两面
		} else {
			sscSysConfig.put("hbsyxw_lm", "0");
		}
		sscSysConfig.put("hbsyxw_renxuan", config.getString("hbsyxw_game_control_renxuan"));
		sscSysConfig.put("hbsyxw_zuxuan", config.getString("hbsyxw_game_control_zuxuan"));
		sscSysConfig.put("hbsyxw_zhixuan", config.getString("hbsyxw_game_control_zhixuan"));
		// ==============================JSSYXW==============================
		sscSysConfig.put("jssyxw", config.getString("game_open_jssyxw"));
		sscSysConfig.put("jssyxw_1", config.getString("jssyxw_game_control_1"));// 第一球
		sscSysConfig.put("jssyxw_2", config.getString("jssyxw_game_control_2"));
		sscSysConfig.put("jssyxw_3", config.getString("jssyxw_game_control_3"));
		sscSysConfig.put("jssyxw_4", config.getString("jssyxw_game_control_4"));
		sscSysConfig.put("jssyxw_5", config.getString("jssyxw_game_control_5"));
		if (config.getString("jssyxw_game_control_1").equals("1") || config.getString("jssyxw_game_control_2").equals("1") || config.getString("jssyxw_game_control_3").equals("1")
				|| config.getString("jssyxw_game_control_4").equals("1") || config.getString("jssyxw_game_control_5").equals("1")) {
			sscSysConfig.put("jssyxw_1_5", "1");
		} else {
			sscSysConfig.put("jssyxw_1_5", "0");
		}
		sscSysConfig.put("jssyxw_zh", config.getString("jssyxw_game_control_1_5"));// 总和-龙虎和
		if (sscSysConfig.get("jssyxw_zh").equals("1") || sscSysConfig.get("jssyxw_1_5").equals("1")) {
			sscSysConfig.put("jssyxw_lm", "1");// 两面
		} else {
			sscSysConfig.put("jssyxw_lm", "0");
		}
		sscSysConfig.put("jssyxw_renxuan", config.getString("jssyxw_game_control_renxuan"));
		sscSysConfig.put("jssyxw_zuxuan", config.getString("jssyxw_game_control_zuxuan"));
		sscSysConfig.put("jssyxw_zhixuan", config.getString("jssyxw_game_control_zhixuan"));
		// ==============================YNSSC==============================
		sscSysConfig.put("ynssc", config.getString("game_open_ynssc"));
		String ynssc_1 = config.getString("ynssc_game_control_1");
		String ynssc_2 = config.getString("ynssc_game_control_2");
		String ynssc_3 = config.getString("ynssc_game_control_3");
		String ynssc_4 = config.getString("ynssc_game_control_4");
		String ynssc_5 = config.getString("ynssc_game_control_5");
		if (ynssc_1.equals("1") || ynssc_2.equals("1") || ynssc_3.equals("1") || ynssc_4.equals("1") || ynssc_5.equals("1")) {
			sscSysConfig.put("ynssc_1_5", "1");
		} else {
			sscSysConfig.put("ynssc_1_5", "0");
		}
		sscSysConfig.put("ynssc_1", ynssc_1);
		sscSysConfig.put("ynssc_2", ynssc_2);
		sscSysConfig.put("ynssc_3", ynssc_3);
		sscSysConfig.put("ynssc_4", ynssc_4);
		sscSysConfig.put("ynssc_5", ynssc_5);
		sscSysConfig.put("ynssc_zh", config.getString("ynssc_game_control_longhu"));// 总和-龙虎和
		sscSysConfig.put("tjssc_zh", config.getString("ynssc_game_control_san"));// 前三、中三、后三
		sscSysConfig.put("ynssc_yizhi", config.getString("ynssc_game_control_yizi"));// 一字
		sscSysConfig.put("ynssc_erzi", config.getString("ynssc_game_control_erzi"));// 二字
		sscSysConfig.put("ynssc_sanzi", config.getString("ynssc_game_control_sanzi"));// 三字
		sscSysConfig.put("ynssc_erzidw", config.getString("ynssc_game_control_erzidw"));// 二定位
		sscSysConfig.put("ynssc_sanzidw", config.getString("ynssc_game_control_sanzidw"));// 三定位
		sscSysConfig.put("ynssc_zuxuansan", config.getString("ynssc_game_control_zuxuansan"));// 组选三
		sscSysConfig.put("ynssc_zuxuanliu", config.getString("ynssc_game_control_zuxuanliu"));// 组选六
		sscSysConfig.put("ynssc_kuadu", config.getString("ynssc_game_control_kuadu"));// 跨度
		sscSysConfig.put("ynssc_hs", config.getString("ynssc_game_control_hs"));
		// ==============================SHSSC==============================
		sscSysConfig.put("shssc", config.getString("game_open_shssc"));
		String shssc_1 = config.getString("shssc_game_control_1");
		String shssc_2 = config.getString("shssc_game_control_2");
		String shssc_3 = config.getString("shssc_game_control_3");
		if (shssc_1.equals("1") || shssc_2.equals("1") || shssc_3.equals("1")) {
			sscSysConfig.put("shssc_1_5", "1");
		} else {
			sscSysConfig.put("shssc_1_5", "0");
		}
		sscSysConfig.put("shssc_1", shssc_1);
		sscSysConfig.put("shssc_2", shssc_2);
		sscSysConfig.put("shssc_3", shssc_3);
		sscSysConfig.put("shssc_yizhi", config.getString("shssc_game_control_yizi"));// 一字
		sscSysConfig.put("shssc_erzi", config.getString("shssc_game_control_erzi"));// 二字
		sscSysConfig.put("shssc_sanzi", config.getString("shssc_game_control_sanzi"));// 三字
		sscSysConfig.put("shssc_erzidw", config.getString("shssc_game_control_erzidw"));// 二定位
		sscSysConfig.put("shssc_sanzidw", config.getString("shssc_game_control_sanzidw"));// 三定位
		sscSysConfig.put("shssc_zuxuansan", config.getString("shssc_game_control_zuxuansan"));// 组选三
		sscSysConfig.put("shssc_zuxuanliu", config.getString("shssc_game_control_zuxuanliu"));// 组选六
		sscSysConfig.put("shssc_kuadu", config.getString("shssc_game_control_kuadu"));// 跨度
		sscSysConfig.put("shssc_hs", config.getString("shssc_game_control_hs"));
		// ==============================HNKLC==============================
		sscSysConfig.put("hnklc", config.getString("game_open_hnklc"));
		sscSysConfig.put("hnklc_1", config.getString("hnklc_game_control_1"));// 第一球
		sscSysConfig.put("hnklc_2", config.getString("hnklc_game_control_2"));
		sscSysConfig.put("hnklc_3", config.getString("hnklc_game_control_3"));
		sscSysConfig.put("hnklc_4", config.getString("hnklc_game_control_4"));
		sscSysConfig.put("hnklc_5", config.getString("hnklc_game_control_5"));
		sscSysConfig.put("hnklc_6", config.getString("hnklc_game_control_6"));
		sscSysConfig.put("hnklc_7", config.getString("hnklc_game_control_7"));
		sscSysConfig.put("hnklc_8", config.getString("hnklc_game_control_8"));
		sscSysConfig.put("hnklc_zh", config.getString("hnklc_game_control_longhu"));// 总和
		sscSysConfig.put("hnklc_lm", config.getString("hnklc_game_control_lianma"));// 连码
		// ==============================BJKLC==============================
		sscSysConfig.put("bjklc", config.getString("game_open_bjklc"));
		sscSysConfig.put("bjklc_zh", config.getString("bjklc_game_control_zonghe"));// 总和
		sscSysConfig.put("bjklc_oh", config.getString("bjklc_game_control_oddhe"));// 单双和
		sscSysConfig.put("bjklc_qh", config.getString("bjklc_game_control_qianhe"));// 前后和
		sscSysConfig.put("bjklc_wx", config.getString("bjklc_game_control_wuxing"));// 五行
		sscSysConfig.put("bjklc_zm", config.getString("bjklc_game_control_zhengma"));// 连码

		if ("1".equals(config.getString("game_open_klc")) || "1".equals(config.getString("game_open_gxklc")) || "1".equals(config.getString("game_open_tjklc"))
				|| "1".equals(config.getString("game_open_hnklc")) || "1".equals(config.getString("game_open_bjklc"))) {
			sscSysConfig.put("z_klc", "1");
		} else {
			sscSysConfig.put("z_klc", "0");
		}
		if ("1".equals(config.getString("game_open_ssc")) || "1".equals(config.getString("game_open_jxssc")) || "1".equals(config.getString("game_open_xjssc"))
				|| "1".equals(config.getString("game_open_tjssc")) || "1".equals(config.getString("game_open_ynssc")) || "1".equals(config.getString("game_open_shssc"))) {
			sscSysConfig.put("z_ssc", "1");
		} else {
			sscSysConfig.put("z_ssc", "0");
		}
		if ("1".equals(config.getString("game_open_gdsyxw")) || "1".equals(config.getString("game_open_shsyxw")) || "1".equals(config.getString("game_open_sdsyxw"))
				|| "1".equals(config.getString("game_open_jxsyxw")) || "1".equals(config.getString("game_open_lnsyxw")) || "1".equals(config.getString("game_open_hbsyxw"))
				|| "1".equals(config.getString("game_open_jxsyxw"))) {
			sscSysConfig.put("z_syxw", "1");
		} else {
			sscSysConfig.put("z_syxw", "0");
		}
		if ("1".equals(config.getString("game_open_jsks")) || "1".equals(config.getString("game_open_ahks")) || "1".equals(config.getString("game_open_gxks"))) {
			sscSysConfig.put("z_ks", "1");
		} else {
			sscSysConfig.put("z_ks", "0");
		}

		AppsStatusUtil.setSscStatus(true);
		Constants.heartbeat_lasttime_ssc = System.currentTimeMillis();
	}
}
