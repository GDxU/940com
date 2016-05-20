package com.vinbet.mobile.timer.sport;

import java.io.ByteArrayInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;

import com.vinbet.mobile.entity.sport.League;
import com.vinbet.mobile.entity.sport.Match;
import com.vinbet.mobile.entity.sport.Sport;
import com.vinbet.mobile.sys.PropertiesLoader;
import com.vinbet.mobile.sys.sport.SportBBCache;
import com.vinbet.mobile.util.Constants;
import com.vinbet.mobile.util.GzipUtil;
import com.vinbet.mobile.util.HttpClientUtil;
import com.vinbet.mobile.util.MD5Util;

/**
 * Created by ray on 15/3/27.
 */
@IocBean
public class BasketballFullTask implements Runnable {

	@Inject
	private PropertiesLoader propertiesLoader;

	private Log log = Logs.getLog(BasketballFullTask.class);

	long count = 0;

	@Override
	public void run() {
		long start = System.currentTimeMillis();
		// 国际化信息
		ConcurrentHashMap<String, String> i18nMap = new ConcurrentHashMap<String, String>();

		List<League> inplayLeagues = new ArrayList<League>();
		ConcurrentHashMap<String, List<Match>> inplayMatchMap = new ConcurrentHashMap<String, List<Match>>();
		ConcurrentHashMap<String, String> inplayMTLMap = new ConcurrentHashMap<String, String>();

		List<League> todayLeagues = new ArrayList<League>();
		ConcurrentHashMap<String, List<Match>> todayMatchMap = new ConcurrentHashMap<String, List<Match>>();
		List<League> todayMuLeagues = new ArrayList<League>();
		ConcurrentHashMap<String, List<Match>> todayMuMatchMap = new ConcurrentHashMap<String, List<Match>>();
		ConcurrentHashMap<String, String> todayMTLMap = new ConcurrentHashMap<String, String>();

		List<League> earlyLeagues = new ArrayList<League>();
		ConcurrentHashMap<String, List<Match>> earlyMatchMap = new ConcurrentHashMap<String, List<Match>>();
		List<League> earlyMuLeagues = new ArrayList<League>();
		ConcurrentHashMap<String, List<Match>> earlyMuMatchMap = new ConcurrentHashMap<String, List<Match>>();
		ConcurrentHashMap<String, String> earlyMTLMap = new ConcurrentHashMap<String, String>();

		Sport inplaySport = new Sport();
		Sport todaySport = new Sport();
		Sport earlySport = new Sport();
		try {

			// 全量数据，按类别滚球，今日，早餐，分几种不同语言请求
			// 取每种类别取其中一个语言请求作为数据缓存（暂定为中文），其余的只处理国际化信息

			SAXParserFactory factory = SAXParserFactory.newInstance();
			SAXParser parser = factory.newSAXParser();
			// 滚球数据
			HashMap<String, String> param = new HashMap<String, String>();
			param.put("s", "2");
			param.put("t", "1");
			param.put("m", "1");
			param.put("v", "-1");
			// 中文+赛事+赔率
			param.put("l", "zh");
			param.put(Constants.TOKEN_SPORT, MD5Util.md5Hex(propertiesLoader.getTrim("vinbet.token.sport")));
			String xml = GzipUtil.unGzipString(HttpClientUtil.doGetString(propertiesLoader.getTrim("vinbet.sport.url") + "/core/apiData.getMatchInfoData.do", param, false));
			if (xml != null && !xml.trim().equals("")) {
				parser.parse(new ByteArrayInputStream(xml.getBytes("UTF-8")), new BasketballFullHandle(false, "zh", i18nMap, inplaySport));
			}
			// 英文
			param.put("l", "en");
			xml = GzipUtil.unGzipString(HttpClientUtil.doGetString(propertiesLoader.getTrim("vinbet.sport.url") + "/core/apiData.getMatchInfoData.do", param, false));
			if (xml != null && !xml.trim().equals("")) {
				parser.parse(new ByteArrayInputStream(xml.getBytes("UTF-8")), new BasketballFullHandle(true, "en", i18nMap, null));
			}
			// 其余语言...

			// 今日数据，需要区分过关数据
			// /中文+数据
			param.put("t", "2");
			param.put("l", "zh");
			xml = GzipUtil.unGzipString(HttpClientUtil.doGetString(propertiesLoader.getTrim("vinbet.sport.url") + "/core/apiData.getMatchInfoData.do", param, false));
			if (xml != null && !xml.trim().equals("")) {
				parser.parse(new ByteArrayInputStream(xml.getBytes("UTF-8")), new BasketballFullHandle(false, "zh", i18nMap, todaySport));
			}
			// 英文
			param.put("l", "en");
			xml = GzipUtil.unGzipString(HttpClientUtil.doGetString(propertiesLoader.getTrim("vinbet.sport.url") + "/core/apiData.getMatchInfoData.do", param, false));
			if (xml != null && !xml.trim().equals("")) {
				parser.parse(new ByteArrayInputStream(xml.getBytes("UTF-8")), new BasketballFullHandle(true, "en", i18nMap, null));
			}

			// 早餐数据，需要区分过关数据
			// 中文+数据
			param.put("t", "3");
			param.put("l", "zh");
			xml = GzipUtil.unGzipString(HttpClientUtil.doGetString(propertiesLoader.getTrim("vinbet.sport.url") + "/core/apiData.getMatchInfoData.do", param, false));
			if (xml != null && !xml.trim().equals("")) {
				parser.parse(new ByteArrayInputStream(xml.getBytes("UTF-8")), new BasketballFullHandle(false, "zh", i18nMap, earlySport));
			}
			// 英文
			param.put("l", "en");
			xml = GzipUtil.unGzipString(HttpClientUtil.doGetString(propertiesLoader.getTrim("vinbet.sport.url") + "/core/apiData.getMatchInfoData.do", param, false));
			if (xml != null && !xml.trim().equals("")) {
				parser.parse(new ByteArrayInputStream(xml.getBytes("UTF-8")), new BasketballFullHandle(true, "en", i18nMap, null));
			}

			// TODO 先不做多线程，直接按顺序请求，如有性能问题在分多线程处理

			// 处理并缓存数据
			// inplay
			for (League league : inplaySport.getLeagues()) {
				inplayLeagues.add(league);
				inplayMatchMap.put(league.getId(), league.getMatches());
				for (Match match : league.getMatches()) {
					inplayMTLMap.put(match.getId(), league.getId());
				}
			}
			// today
			League mul;
			for (League league : todaySport.getLeagues()) {
				todayLeagues.add(league);
				todayMatchMap.put(league.getId(), league.getMatches());
				mul = null;
				for (Match match : league.getMatches()) {
					todayMTLMap.put(match.getId(), league.getId());
					if (match.getMu().equals("1")) {
						if (mul == null || !mul.getId().equals(league.getId())) {
							mul = new League();
							mul.setId(league.getId());
							mul.setSort(league.getSort());
							mul.setSid(league.getSid());
							mul.setName(league.getName());
							mul.setLevel(league.getLevel());
							mul.setMatches(new ArrayList<Match>());
						}
						mul.getMatches().add(match);
					}
				}
				if (mul != null) {
					todayMuLeagues.add(mul);
					todayMuMatchMap.put(mul.getId(), mul.getMatches());
				}
			}
			// early
			for (League league : earlySport.getLeagues()) {
				earlyLeagues.add(league);
				earlyMatchMap.put(league.getId(), league.getMatches());
				mul = null;
				for (Match match : league.getMatches()) {
					earlyMTLMap.put(match.getId(), league.getId());
					if (match.getMu().equals("1")) {
						if (mul == null || !mul.getId().equals(league.getId())) {
							mul = new League();
							mul.setId(league.getId());
							mul.setSort(league.getSort());
							mul.setSid(league.getSid());
							mul.setName(league.getName());
							mul.setLevel(league.getLevel());
							mul.setMatches(new ArrayList<Match>());
						}
						mul.getMatches().add(match);
					}
				}
				if (mul != null) {
					earlyMuLeagues.add(mul);
					earlyMuMatchMap.put(mul.getId(), mul.getMatches());
				}
			}

			SportBBCache.i18nMap = i18nMap;
			SportBBCache.ip_ver = inplaySport.getVersion();
			SportBBCache.td_ver = todaySport.getVersion();
			SportBBCache.er_ver = earlySport.getVersion();
			SportBBCache.rver = inplaySport.getVersion();
			SportBBCache.inplayLeagues = inplayLeagues;
			SportBBCache.inplayMatchMap = inplayMatchMap;
			SportBBCache.inplayMTLMap = inplayMTLMap;
			SportBBCache.todayLeagues = todayLeagues;
			SportBBCache.todayMatchMap = todayMatchMap;
			SportBBCache.todayMuLeagues = todayMuLeagues;
			SportBBCache.todayMuMatchMap = todayMuMatchMap;
			SportBBCache.todayMTLMap = todayMTLMap;
			SportBBCache.earlyLeagues = earlyLeagues;
			SportBBCache.earlyMatchMap = earlyMatchMap;
			SportBBCache.earlyMuLeagues = earlyMuLeagues;
			SportBBCache.earlyMuMatchMap = earlyMuMatchMap;
			SportBBCache.earlyMTLMap = earlyMTLMap;
		} catch (Exception e) {
			log.error(" >> 拉取体育-篮球盘口数据异常，原因：体育后台维护中或接口数据结构有调整...");
			log.debug("Sport BasketballFullTask handle error:", e);
		}
		// 执行10次打一次日志
		if (count % 10 == 0) {
			log.info("Sport BasketballFullTask count:" + count + " handle time:" + (System.currentTimeMillis() - start));
		}
		count++;
	}
}
