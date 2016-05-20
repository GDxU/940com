package com.vinbet.mobile.action.sport;

import com.alibaba.fastjson.JSON;
import com.vinbet.mobile.action.portal.CommonAction;
import com.vinbet.mobile.domain.SportUser;
import com.vinbet.mobile.domain.UserInfo;
import com.vinbet.mobile.entity.sport.*;
import com.vinbet.mobile.sys.AppStatusCheckFilter;
import com.vinbet.mobile.sys.PropertiesLoader;
import com.vinbet.mobile.sys.sport.SportFBCache;
import com.vinbet.mobile.util.*;
import com.vinbet.mobile.util.Constants.USER_STATUS;

import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.Mvcs;
import org.nutz.mvc.annotation.*;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import java.io.ByteArrayInputStream;
import java.text.Collator;
import java.text.DecimalFormat;
import java.util.*;

/**
 * Created by ray on 15/3/7.
 */
@IocBean(singleton = false)
@Filters({ @By(type = CheckSession.class, args = { "SPORT_USER_SESSION", "/timeout" }), @By(type = AppStatusCheckFilter.class) })
@At("/sport/fb")
public class FootballAction extends CommonAction {

	private Log log = Logs.getLog(FootballAction.class);

	@Inject
	private PropertiesLoader propertiesLoader;

	private HashMap<String, Object> map = new HashMap<String, Object>();

	@At("/")
	@Ok("jsp:page.sport.fb.league")
	public Object toLeagueListPage() {
		map.put("cd1", propertiesLoader.getInt("vinbet.sport.inplay.countdown"));
		map.put("cd2", propertiesLoader.getInt("vinbet.sport.today.countdown"));
		map.put("cd3", propertiesLoader.getInt("vinbet.sport.early.countdown"));
		return map;
	}

	@At("/t/?/mu/?/h/?")
	@Ok("json")
	public Object leagueList(String t, String mu, String h, HttpSession session) {
		SportUser su = (SportUser) session.getAttribute(Constants.SPORT_USER_SESSION);
		String lng = Mvcs.getLocalizationKey().toUpperCase();
		if (lng == null || !",ZH,EN,".contains(lng)) {
			lng = "EN";
		}
		getMatchCount();
		List<League> leagues = null;
		if (t.equals("1")) {
			leagues = SportFBCache.inplayLeagues;
		} else if (t.equals("2")) {
			if (mu.equals("1")) {
				leagues = SportFBCache.todayMuLeagues;

			} else {
				leagues = SportFBCache.todayLeagues;
			}
		} else if (t.equals("3")) {
			if (mu.equals("1")) {
				leagues = SportFBCache.earlyMuLeagues;
			} else {
				leagues = SportFBCache.earlyLeagues;
			}
		}

		if (h.equals("1")) {
			List<League> tls = new ArrayList<League>();
			for (League league : leagues) {
				if (league.getIsHot().equals("1")) {
					tls.add(league);
				}
			}
			leagues = tls;
		}

		try {
			List<Object[]> nls = new ArrayList<Object[]>();
			if (leagues != null) {
				List<League> tnls = new ArrayList<League>(Arrays.asList(new League[leagues.size()]));
				Collections.copy(tnls, leagues);
				HashMap<String, League> tmap = new HashMap<String, League>();
				List<String> tlist = new ArrayList<String>();
				for (League tnl : tnls) {
					String name = SportFBCache.i18nMap.get(lng + "-" + tnl.getId());
					tnl.setName(name);
					tlist.add(name);
					tmap.put(name, tnl);
				}
				if (lng.equalsIgnoreCase("zh")) {
					Collator collatorChinese = Collator.getInstance(java.util.Locale.CHINA);
					Collections.sort(tlist, collatorChinese);
					tnls = new ArrayList<League>();
					for (String s : tlist) {
						tnls.add(tmap.get(s));
					}
				} else {
					Collections.sort(tnls);
				}
				for (League tnl : tnls) {
					Object[] ss = new Object[3];
					ss[0] = tnl.getId();
					ss[1] = tnl.getName();
					ss[2] = tnl.getMatches().size();
					nls.add(ss);
				}
			}
			map.put("c", 0);
			map.put("d", nls);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("c", 1);
			map.put("e", e.getMessage());
		}
		return map;
	}

	@At("/league/?")
	@Ok("jsp:page.sport.fb.match")
	public Object toMatchListPage(String lid) {
		map.put("cd1", propertiesLoader.getInt("vinbet.sport.inplay.countdown"));
		map.put("cd2", propertiesLoader.getInt("vinbet.sport.today.countdown"));
		map.put("cd3", propertiesLoader.getInt("vinbet.sport.early.countdown"));
		String lng = Mvcs.getLocalizationKey().toUpperCase();
		if (lng == null || !",ZH,EN,".contains(lng)) {
			lng = "EN";
		}
		map.put("n", SportFBCache.i18nMap.get(lng + "-" + lid));
		map.put("lid", lid);
		return map;
	}

	@At("/league/?/?/?/?")
	@Ok("json")
	public Object matchList(String t, String mu, String mt, String lid, HttpServletRequest req, HttpSession session) {
		SportUser su = (SportUser) session.getAttribute(Constants.SPORT_USER_SESSION);
		String lng = Mvcs.getLocalizationKey().toUpperCase();
		if (lng == null || !",ZH,EN,".contains(lng)) {
			lng = "EN";
		}
		getMatchCount();
		try {
			List<League> leagues = null;
			if (t.equals("1")) {
				leagues = SportFBCache.inplayLeagues;
			} else if (t.equals("2")) {
				if (mu.equals("1")) {
					leagues = SportFBCache.todayMuLeagues;
				} else {
					leagues = SportFBCache.todayLeagues;
				}
			} else if (t.equals("3")) {
				if (mu.equals("1")) {
					leagues = SportFBCache.earlyMuLeagues;
				} else {
					leagues = SportFBCache.earlyLeagues;
				}
			}

			League league = null;
			if (leagues != null) {
				for (int i = 0; i < leagues.size(); i++) {
					if (leagues.get(i).getId().equals(lid)) {
						league = leagues.get(i);
					}
				}
			}

			if (league != null) {
				List<Match> matchs = league.getMatches();
				Collections.sort(matchs);
				List<Object[]> mos = new ArrayList<Object[]>();

				for (int i = 0; i < matchs.size(); i++) {
					Object[] mo = new Object[6];
					Match mi = matchs.get(i);
					mo[0] = mi.getId();
					mo[1] = SportFBCache.i18nMap.get(lng + "-" + mi.getId());
					Calendar c = Calendar.getInstance();
					c.setTime(mi.getStart());
					c.add(Calendar.HOUR_OF_DAY, 8);
					if (t.equals("2")) {
						mo[2] = SportFBCache.inplaySDF.format(c.getTime());
					} else {
						mo[2] = SportFBCache.normalSDF.format(c.getTime());
					}
					mo[3] = mi.getSroll().equals("1") ? Mvcs.getMessage(req, "label.sport.fb.live") : "";
					mo[4] = mi.getGames().size();
					if (t.equals("1")) {
						MatchReal mr = SportFBCache.mrMap.get(mi.getId());
						if (mr != null) {
							mo[2] = mr.getGt();
							if (mi.getItype().equals("1")) {
								mo[3] = mr.getHg() + " - " + mr.getAg();
							} else if (mi.getItype().equals("2")) {
								mo[3] = mr.getHc() + " - " + mr.getAc();
							}
						} else {
							mo[3] = "0 - 0";
						}
					}
					Game g1 = null;
					Game g2 = null;
					List<GameDto> gameDtos = new ArrayList<GameDto>();
					for (int j = 0; j < mi.getGames().size(); j++) {
						gameDtos.add(GameToGameDto(mi.getGames().get(j)));
					}
					Collections.sort(gameDtos);
					for (int j = 0; j < gameDtos.size(); j++) {
						GameDto gi = gameDtos.get(j);
						if (g1 == null && gi != null && gi.getPid().equals("2") && gi.getDr().equals("1")) {
							g1 = GameDtoToGame(gi);
						}
						if (g2 == null && gi != null && gi.getPid().equals("3") && gi.getDr().equals("1")) {
							g2 = GameDtoToGame(gi);
						}
					}
					String[] ns = SportFBCache.i18nMap.get(lng + "-" + mi.getId()).toUpperCase().split(" VS ");
					List<Object[]> ios = new ArrayList<Object[]>();
					Object[] io1 = new Object[13];
					Object[] io2 = new Object[13];
					io1[0] = ns[0] + "  " + (mi.getTt().equals("1") ? Mvcs.getMessage(req, "label.sport.fb.zhongli") : "");
					io2[0] = ns[1];
					if (g1 != null) {
						io1[1] = g1.getItems().get(0).getId();
						String i1n = SportFBCache.i18nMap.get(lng + "-" + g1.getItems().get(0).getId());
						io1[11] = i1n;
						String[] i1ns = i1n.split(" ");
						io1[2] = i1ns[i1ns.length - 1].contains("+") ? "" : i1ns[i1ns.length - 1];

						try {
							if (mu.equals("1")) {
								io1[3] = SportFBCache.rdMap.get(g1.getItems().get(0).getId())[1];
							} else {
								io1[3] = getRatio(g1, su, mt, SportFBCache.rdMap.get(g1.getItems().get(0).getId())[0]);
							}
						} catch (NullPointerException e) {
							io1[3] = "0";
							log.error(mt + "-" + g1.getItems().get(0).getId() + " no have ratio!");
						}
						io1[4] = getGameName(req, g1);
						io1[5] = g1.getPid();

						io2[1] = g1.getItems().get(1).getId();
						String i2n = SportFBCache.i18nMap.get(lng + "-" + g1.getItems().get(1).getId());
						io2[11] = i2n;
						String[] i2ns = i2n.split(" ");
						io2[2] = i2ns[i2ns.length - 1].contains("+") ? "" : i2ns[i2ns.length - 1];
						try {
							if (mu.equals("1")) {
								io2[3] = SportFBCache.rdMap.get(g1.getItems().get(1).getId())[1];
							} else {
								io2[3] = getRatio(g1, su, mt, SportFBCache.rdMap.get(g1.getItems().get(1).getId())[0]);
							}
						} catch (NullPointerException e) {
							io2[3] = "0";
							log.error(mt + "-" + g1.getItems().get(1).getId() + " no have ratio!");
						}
						io2[4] = getGameName(req, g1);
						io2[5] = g1.getPid();
					} else {
						io1[1] = "";
						io1[2] = "";
						io1[3] = "";
						io1[4] = "";
						io1[5] = "";

						io2[1] = "";
						io2[2] = "";
						io2[3] = "";
						io2[4] = "";
						io2[5] = "";
					}
					if (g2 != null) {
						io1[6] = g2.getItems().get(0).getId();
						io1[7] = SportFBCache.i18nMap.get(lng + "-" + g2.getItems().get(0).getId());
						try {
							if (mu.equals("1")) {
								io1[8] = SportFBCache.rdMap.get(g2.getItems().get(0).getId())[1];
							} else {
								io1[8] = getRatio(g2, su, mt, SportFBCache.rdMap.get(g2.getItems().get(0).getId())[0]);
							}
						} catch (NullPointerException e) {
							io1[8] = "0";
							log.error(mt + "-" + g2.getItems().get(0).getId() + " no have ratio!");
						}
						io1[9] = getGameName(req, g2);
						io1[10] = g2.getPid();

						io2[6] = g2.getItems().get(1).getId();
						io2[7] = SportFBCache.i18nMap.get(lng + "-" + g2.getItems().get(1).getId());
						try {
							if (mu.equals("1")) {
								io2[8] = SportFBCache.rdMap.get(g2.getItems().get(1).getId())[1];
							} else {
								io2[8] = getRatio(g2, su, mt, SportFBCache.rdMap.get(g2.getItems().get(1).getId())[0]);
							}
						} catch (NullPointerException e) {
							io2[8] = "0";
							log.error(mt + "-" + g2.getItems().get(1).getId() + " no have ratio!");
						}
						io2[9] = getGameName(req, g2);
						io2[10] = g2.getPid();
					} else {
						io1[6] = "";
						io1[7] = "";
						io1[8] = "";
						io1[9] = "";
						io1[10] = "";

						io2[6] = "";
						io2[7] = "";
						io2[8] = "";
						io2[9] = "";
						io2[10] = "";
					}
					if (t.equals("1")) {
						try {
							io1[12] = SportFBCache.mrMap.get(mi.getId()).getHred();
							io2[12] = SportFBCache.mrMap.get(mi.getId()).getAred();
						} catch (Exception e) {
							io1[12] = 0;
							io2[12] = 0;
						}
					} else {
						io1[12] = 0;
						io2[12] = 0;
					}
					ios.add(io1);
					ios.add(io2);
					mo[5] = ios;
					mos.add(mo);
				}
				map.put("c", 0);
				map.put("d", mos);
			} else {
				map.put("c", 1);
				map.put("e", "not found this league!");
			}
		} catch (Exception e) {
			e.printStackTrace();
			map.put("c", 1);
			map.put("e", "system error!");
		}
		return map;
	}

	@At("/match/?")
	@Ok("jsp:page.sport.fb.detail")
	public Object toMatchDetailPage(String mid) {
		map.put("cd1", propertiesLoader.getInt("vinbet.sport.inplay.countdown"));
		map.put("cd2", propertiesLoader.getInt("vinbet.sport.today.countdown"));
		map.put("cd3", propertiesLoader.getInt("vinbet.sport.early.countdown"));
		String lng = Mvcs.getLocalizationKey().toUpperCase();
		if (lng == null || !",ZH,EN,".contains(lng)) {
			lng = "EN";
		}
		map.put("n", SportFBCache.i18nMap.get(lng + "-" + mid));
		map.put("mid", mid);
		return map;
	}

	@At("/match/?/?/?/?")
	@Ok("json")
	public Object matchDetail(String t, String mu, String mt, String mid, HttpServletRequest req, HttpSession session) {
		SportUser su = (SportUser) session.getAttribute(Constants.SPORT_USER_SESSION);
		String lng = Mvcs.getLocalizationKey().toUpperCase();
		if (lng == null || !",ZH,EN,".contains(lng)) {
			lng = "EN";
		}
		getMatchCount();
		String lid = null;
		try {
			List<League> leagues = null;
			if (t.equals("1")) {
				leagues = SportFBCache.inplayLeagues;
				lid = SportFBCache.inplayMTLMap.get(mid);
			} else if (t.equals("2")) {
				if (mu.equals("1")) {
					leagues = SportFBCache.todayMuLeagues;
				} else {
					leagues = SportFBCache.todayLeagues;
				}
				lid = SportFBCache.todayMTLMap.get(mid);
			} else if (t.equals("3")) {
				if (mu.equals("1")) {
					leagues = SportFBCache.earlyMuLeagues;
				} else {
					leagues = SportFBCache.earlyLeagues;
				}
				lid = SportFBCache.earlyMTLMap.get(mid);
			}

			League league = null;
			if (leagues != null && lid != null) {
				for (int i = 0; i < leagues.size(); i++) {
					if (leagues.get(i).getId().equals(lid)) {
						league = leagues.get(i);
					}
				}
			}
			Match match = null;
			if (league != null) {
				for (int i = 0; i < league.getMatches().size(); i++) {
					if (league.getMatches().get(i).getId().equals(mid)) {
						match = league.getMatches().get(i);
					}
				}
			}
			if (match != null) {
				Object[] mo = new Object[6];
				MatchReal mr = SportFBCache.mrMap.get(match.getId());
				mo[0] = match.getId();
				mo[1] = match.getItype();
				if (t.equals("1")) {
					String[] ns = SportFBCache.i18nMap.get(lng + "-" + match.getId()).toUpperCase().split(" VS ");
					String hn = ns[0];
					String gn = ns[1];
					if (mr != null) {
						String hr = mr.getHred();
						String ar = mr.getAred();
						if (hr != null && !hr.isEmpty() && !hr.equals("0")) {
							hn += "<span class='red-style'>" + hr + "</span>";
						}
						if (ar != null && !ar.isEmpty() && !ar.equals("0")) {
							gn += "<span class='red-style'>" + ar + "</span>";
						}
					}
					mo[2] = hn + " VS " + gn + "  " + (match.getTt().equals("1") ? Mvcs.getMessage(req, "label.sport.fb.zhongli") : "");
				} else {
					mo[2] = SportFBCache.i18nMap.get(lng + "-" + match.getId()) + "  " + (match.getTt().equals("1") ? Mvcs.getMessage(req, "label.sport.fb.zhongli") : "");
				}
				Calendar c = Calendar.getInstance();
				c.setTime(match.getStart());
				c.add(Calendar.HOUR_OF_DAY, 8);
				mo[3] = SportFBCache.normalSDF.format(c.getTime());
				mo[4] = match.getSroll().equals("1") ? Mvcs.getMessage(req, "label.sport.fb.live") : "";
				if (t.equals("1")) {
					if (mr != null) {
						mo[3] = mr.getGt();
						if (match.getItype().equals("1")) {
							mo[4] = mr.getHg() + " - " + mr.getAg();
						} else if (match.getItype().equals("2")) {
							mo[4] = mr.getHc() + " - " + mr.getAc();
						}
					} else {
						mo[4] = "0 - 0";
					}
				}
				List<Game> games = match.getGames();
				Collections.sort(games);
				List<Game> ngs = new ArrayList<Game>();
				Game og;
				for (int i = 0; i < games.size(); i++) {
					og = games.get(i);
					Game ng = null;
					for (Game game : ngs) {
						if (game.getPid().equals(og.getPid()) && game.getDr().equals(og.getDr())) {
							ng = game;
						}
					}
					if (ng != null) {
						ng.getItems().addAll(og.getItems());
					} else {
						ng = new Game();
						ng.setId("v");
						List<Item> tnis = new ArrayList<Item>(Arrays.asList(new Item[og.getItems().size()]));
						Collections.copy(tnis, og.getItems());
						ng.setItems(tnis);
						ng.setLet(og.getLet());
						ng.setPid(og.getPid());
						ng.setDr(og.getDr());
						ng.setInum("v");
						ng.setMid(og.getMid());
						ngs.add(ng);
					}
				}

				List<Object[]> gos = new ArrayList<Object[]>();
				for (int i = 0; i < ngs.size(); i++) {
					Game gi = ngs.get(i);
					Object[] go = new Object[5];
					go[0] = gi.getPid();
					go[1] = gi.getDr();
					go[2] = gi.getInum();
					go[3] = getGameName(req, gi);
					List<Object[]> ios = new ArrayList<Object[]>();
					for (Item item : gi.getItems()) {
						Object[] io = new Object[4];
						io[0] = item.getId();
						io[1] = SportFBCache.i18nMap.get(lng + "-" + item.getId());
						io[2] = go[2];
						try {
							if (mu.equals("1")) {
								io[3] = SportFBCache.rdMap.get(item.getId())[1];
							} else {
								io[3] = getRatio(gi, su, mt, SportFBCache.rdMap.get(item.getId())[0]);
							}
						} catch (NullPointerException e) {
							io[3] = "0";
							log.error(mt + "-" + item.getId() + " no have ratio!");
						}
						ios.add(io);
					}
					go[4] = ios;
					gos.add(go);
				}
				mo[5] = gos;
				map.put("c", 0);
				map.put("d", mo);
			} else {
				map.put("c", 1);
				map.put("e", "match not found!");
			}
		} catch (Exception e) {
			e.printStackTrace();
			map.put("c", 1);
			map.put("e", "system error!");
		}
		return map;
	}

	@At("/order")
	@Ok("jsp:page.sport.fb.order")
	public void toOrderPage() {

	}

	// ---------------func-------------

	@At("/func/ci/?/?/?/?")
	@Ok("json")
	public Object checkItem(String tids, String m, String roll, String mu, HttpSession session) {
		SportUser su = (SportUser) session.getAttribute(Constants.SPORT_USER_SESSION);
		String lng = Mvcs.getLocalizationKey().toUpperCase();
		if (lng == null || !",ZH,EN,".contains(lng)) {
			lng = "EN";
		}
		HashMap<String, String> param = new HashMap<String, String>();
		try {
			param.put("l", lng);
			param.put("uid", su.getUserIdInSport());
			param.put("sid", su.getSessionid());
			param.put("tids", tids);
			param.put("roll", roll);
			param.put("m", m);
			param.put("mu", mu);
			log.debug("cip:" + JSON.toJSONString(param));
			String xml = HttpClientUtil.doGetString(propertiesLoader.getTrim("vinbet.sport.url") + "/core/apiUser.checkItem.do", param);
			log.debug("ci:" + xml);
			HashMap<String, String> kvMap = parseXml(xml);
			DecimalFormat df = new DecimalFormat("0.00");
			kvMap.put("money", df.format(OddsUtil.formatDouble(su.getBalance())));
			if (kvMap.get("errcode") != null && kvMap.get("errcode").equals("1015")) {
				session.invalidate();
			}
			map.put("c", 0);
			map.put("d", kvMap);
		} catch (Exception e) {
			map.put("c", 1);
			map.put("e", e.getMessage());
		}
		return map;
	}

	@At("/func/bet")
	@Ok("json")
	public Object bet(@Param("tids") String tids, @Param("amt") String amt, @Param("pid") String pid, @Param("roll") String roll, @Param("m") String m, HttpServletRequest request, HttpSession session) {
		UserInfo userInfo = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
		if (userInfo != null && userInfo.getUserStatus() == USER_STATUS.USERSTATUS_FREEZE.getCode()) {
			map.put("c", 1);
			map.put("e", " 您的用户状态已经被冻结！");
			return map;
		}
		SportUser su = (SportUser) session.getAttribute(Constants.SPORT_USER_SESSION);
		String lng = Mvcs.getLocalizationKey().toUpperCase();
		if (lng == null || !",ZH,EN,".contains(lng)) {
			lng = "EN";
		}
		HashMap<String, String> param = new HashMap<String, String>();
		try {
			param.put("l", lng);
			param.put("uid", su.getUserIdInSport());
			param.put("sid", su.getSessionid());
			param.put("ip", super.getClientIp(request));
			param.put("m", m);
			param.put("roll", roll);
			param.put("tids", tids);
			param.put("amt", amt);
			param.put("s", "1");
			if (!pid.equals("-1")) {
				param.put("pid", pid);
			} else {
				param.put("m", "4");
				param.put("mu", "1");
			}

			log.debug("betp:" + JSON.toJSONString(param));
			String xml = HttpClientUtil.doGetString(propertiesLoader.getTrim("vinbet.sport.url") + "/core/apiUser.bet.do", param);
			log.debug("bet:" + xml);
			HashMap<String, String> kvMap = parseXml(xml);
			if (kvMap.get("money") != null) {
				su.setBalance(Double.parseDouble(kvMap.get("money")));
			}
			if (kvMap.get("errcode") != null && kvMap.get("errcode").equals("1015")) {
				session.invalidate();
			}
			map.put("c", 0);
			map.put("d", kvMap);

			if (kvMap.get("bst").equals("1")) {
				try {
					Date now = new Date();
					SportOrder order = new SportOrder();
					order.setAmount(Integer.parseInt(amt));
					order.setDay(DateUtil.getDay(now));
					order.setMonth(DateUtil.getMonth(now));
					order.setYear(DateUtil.getYear(now));
					order.setSid("1");
					order.setPid(pid);
					order.setTime(DateUtil.getTime(now));
					order.setUname(su.getAccoutName());
					order.setNum(1);
					//OrderRecorder.recordSportOrder(order);
				} catch (Exception e) {
				}
			}
		} catch (Exception e) {
			map.put("c", 1);
			map.put("e", e.getMessage());
		}
		return map;
	}

	@At("/func/mr/?")
	@Ok("json")
	public Object getMr(String mids, HttpSession session) {
		String[] ss;
		try {

			if (mids.contains(",")) {
				ss = mids.split(",");
			} else {
				ss = new String[1];
				ss[0] = mids;
			}
			ArrayList<MatchReal> mrs = new ArrayList<MatchReal>();
			for (String mid : ss) {
				MatchReal mr = SportFBCache.mrMap.get(mid);
				if (mr != null) {
					mrs.add(mr);
				}
			}
			map.put("c", 0);
			map.put("d", mrs);
		} catch (Exception e) {
			map.put("c", 1);
			map.put("e", e.getMessage());
		}
		return map;
	}

	// -------------util-------------

	private double getRatio(Game game, SportUser su, String m, double rt) {
		String pid = "," + game.getPid() + ",";
		// 1X2只降水
		if (",1,".equals(pid)) {
			return OddsUtil.formatDouble(rt * su.getDiff(), 2);
		}
		// 让球，大小，单双，降水转盘
		if (",2,3,4,".contains(pid)) {
			return OddsUtil.oddsConversion(rt * su.getDiff2(), OddsUtil.ODDS_TYPE_HK, Integer.parseInt(m), 3);
		}
		// 其余的不处理
		return rt;
	}

	private String getGameName(HttpServletRequest req, Game game) {
		String ps = "";
		String drs = "";
		if (game.getDr().equals("1")) {
			drs = Mvcs.getMessage(req, "label.sport.fb.ft");
		} else if (game.getDr().equals("2")) {
			drs = Mvcs.getMessage(req, "label.sport.fb.fh");
		} else if (game.getDr().equals("3")) {
			drs = "下半场";
		}
		boolean isHTFT = false;
		if (game.getPid().equals("1")) {
			ps = "1X2";
		} else if (game.getPid().equals("2")) {
			ps = Mvcs.getMessage(req, "label.sport.fb.hdp");
		} else if (game.getPid().equals("3")) {
			ps = Mvcs.getMessage(req, "label.sport.fb.ou");
		} else if (game.getPid().equals("4")) {
			ps = Mvcs.getMessage(req, "label.sport.fb.oe");
		} else if (game.getPid().equals("5")) {
			ps = Mvcs.getMessage(req, "label.sport.fb.tg");
		} else if (game.getPid().equals("6")) {
			ps = "双重机会";
		} else if (game.getPid().equals("7")) {
			isHTFT = true;
			ps = Mvcs.getMessage(req, "label.sport.fb.htft");
		} else if (game.getPid().equals("8")) {
			ps = Mvcs.getMessage(req, "label.sport.fb.cs");
		}
		return ps + "  " + (isHTFT ? "" : drs);
	}

	private void getMatchCount() {
		int count = 0;
		for (int i = 0; i < SportFBCache.inplayLeagues.size(); i++) {
			League l = SportFBCache.inplayLeagues.get(i);
			count += l.getMatches().size();
		}
		map.put("mic", count);
		count = 0;
		for (int i = 0; i < SportFBCache.todayLeagues.size(); i++) {
			League l = SportFBCache.todayLeagues.get(i);
			count += l.getMatches().size();
		}
		map.put("mtc", count);
		count = 0;
		for (int i = 0; i < SportFBCache.todayMuLeagues.size(); i++) {
			League l = SportFBCache.todayMuLeagues.get(i);
			count += l.getMatches().size();
		}
		map.put("mtmc", count);
		count = 0;
		for (int i = 0; i < SportFBCache.earlyLeagues.size(); i++) {
			League l = SportFBCache.earlyLeagues.get(i);
			count += l.getMatches().size();
		}
		map.put("mec", count);
		count = 0;
		for (int i = 0; i < SportFBCache.earlyMuLeagues.size(); i++) {
			League l = SportFBCache.earlyMuLeagues.get(i);
			count += l.getMatches().size();
		}
		map.put("memc", count);
	}

	private GameDto GameToGameDto(Game g) {
		GameDto gd = new GameDto();
		gd.setId(g.getId());
		gd.setMid(g.getMid());
		gd.setPid(g.getPid());
		gd.setDr(g.getDr());
		gd.setInum(g.getInum());
		gd.setLet(g.getLet());
		gd.setItems(g.getItems());
		return gd;
	}

	private Game GameDtoToGame(GameDto gd) {
		Game g = new Game();
		g.setId(gd.getId());
		g.setMid(gd.getMid());
		g.setPid(gd.getPid());
		g.setDr(gd.getDr());
		g.setInum(gd.getInum());
		g.setLet(gd.getLet());
		g.setItems(gd.getItems());
		return g;
	}

	private HashMap<String, String> parseXml(String xml) {
		HashMap<String, String> kvMap = new HashMap<String, String>();
		try {
			SAXParserFactory factory = SAXParserFactory.newInstance();
			SAXParser parser = factory.newSAXParser();
			parser.parse(new ByteArrayInputStream(xml.getBytes("UTF-8")), new XmlHandle(kvMap));
		} catch (Exception e) {
			e.printStackTrace();
			log.debug("parseXml error! xml -> " + xml);
		}
		return kvMap;
	}

	class XmlHandle extends DefaultHandler {
		private HashMap<String, String> kvMap;

		public XmlHandle(HashMap<String, String> kvMap) {
			this.kvMap = kvMap;
		}

		@Override
		public void startElement(String uri, String localName, String qName, Attributes attrs) throws SAXException {
			for (int i = 0; i < attrs.getLength(); i++) {
				kvMap.put(attrs.getQName(i), attrs.getValue(i));
			}
		}
	}

}
