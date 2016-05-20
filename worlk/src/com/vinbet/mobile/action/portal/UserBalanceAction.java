package com.vinbet.mobile.action.portal;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.MessageFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.By;
import org.nutz.mvc.annotation.Filters;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import com.vinbet.mobile.domain.UserInfo;
import com.vinbet.mobile.entity.portal.Activity;
import com.vinbet.mobile.entity.portal.CheckInfo;
import com.vinbet.mobile.entity.portal.Dict;
import com.vinbet.mobile.entity.portal.Financer;
import com.vinbet.mobile.entity.portal.FreezeCount;
import com.vinbet.mobile.entity.portal.MsgForActivityEnd;
import com.vinbet.mobile.entity.portal.NavigationApp;
import com.vinbet.mobile.entity.portal.RespBeanForActivityEnd;
import com.vinbet.mobile.entity.portal.RespBeanForActivityJoin;
import com.vinbet.mobile.entity.portal.TotalWallet;
import com.vinbet.mobile.entity.portal.UserActivityInfo;
import com.vinbet.mobile.entity.portal.WalletCategory;
import com.vinbet.mobile.entity.portal.WalletInfo;
import com.vinbet.mobile.service.portal.ActivityHandleServiceImpl;
import com.vinbet.mobile.service.portal.UserServcieImpl;
import com.vinbet.mobile.sys.AppCache;
import com.vinbet.mobile.sys.CEPMgrCenterClient;
import com.vinbet.mobile.sys.CEPUserCenterIceClient;
import com.vinbet.mobile.util.ArithUtil;
import com.vinbet.mobile.util.BASE64Util;
import com.vinbet.mobile.util.CheckSession;
import com.vinbet.mobile.util.Constants;
import com.vinbet.mobile.util.Constants.DepositDrawTerminal;
import com.vinbet.mobile.util.Constants.TransferSource;
import com.vinbet.mobile.util.CreateXmlUtil;
import com.vinbet.mobile.util.JsonResult;
import com.vinbet.mobile.util.MD5Util;
import com.vinbet.mobile.util.PasswordEncoder;
import com.vinbet.mobile.util.RSAUtil;

@IocBean(singleton = false)
@Filters(@By(type = CheckSession.class, args = { "USER_SESSION", "/timeout" }))
public class UserBalanceAction extends CommonAction {
	private Log log = Logs.getLog(UserBalanceAction.class);
	@Inject
	private CEPUserCenterIceClient cEPUserCenterIceClient;
	@Inject
	private UserServcieImpl userServcieImpl;
	@Inject
	private CreateXmlUtil createXmlUtil;
	@Inject
	private ActivityHandleServiceImpl activityHandleServiceImpl;
	@Inject
	private CEPMgrCenterClient cEPMgrCenterClient;

	/**
	 * 获取用户余额信息
	 * 
	 * @param gid
	 * @return
	 */
	@At("/user/getUserBalance")
	@Ok("json")
	public JsonResult getUserBalance(@Param("walletType") String walletType, HttpServletRequest request, HttpSession session) {
		JsonResult jsonResult = JsonResult.createSuccess();
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		UserInfo user = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
		Map<String, WalletCategory> walletDict = AppCache.getWalletCategoryMap();
		TotalWallet totalWallet;
		for (String key : walletDict.keySet()) {
			String iid = walletDict.get(key).getIid();
			String oldName = walletDict.get(key).getWalletName();
			String name = AppCache.getI18nInfo(iid, oldName);
			try {
				walletDict.get(key).setWalletName(BASE64Util.getBASE64(name));
			} catch (UnsupportedEncodingException e) {
			}
		}

		HashMap<String, String> req = new HashMap<String, String>();
		HashMap<String, String> rec = new HashMap<String, String>();
		rec.put("uid", user.getUserId());
		if (walletType != null) {
			rec.put("watyp", walletType);
		}
		rec.put("utyp", String.valueOf(user.getUserType()));
		rec.put("lg", "zh");
		rec.put("unm", user.getAccoutName());
		String reqXml = CreateXmlUtil.createPublicReqXML(req, rec);
		if (walletType != null) {
			totalWallet = userServcieImpl.getBalance(reqXml, walletType, user);
		} else {
			totalWallet = createTotalWallet(user);
		}
		Map<String, Object> data = new HashMap<String, Object>();
		if (totalWallet != null) {
			data.put("totalWallet", totalWallet);
			data.put("walletDict", walletDict);
			jsonResult.setData(data);
		} else {
			jsonResult = jsonResult.createFalied();
		}
		return jsonResult;
	}

	private TotalWallet createTotalWallet(UserInfo user) {
		TotalWallet totalWallet = new TotalWallet();
		totalWallet.setFreezeMoney("0.0");
		totalWallet.setTotalBalance("0.0");
		totalWallet.setSumAllStatistics("0.0");
		totalWallet.setDrawableMoneyStatistics("0.0");
		totalWallet.setActivityMoneyStatistics("0.0");
		List<WalletInfo> walletInfos = new ArrayList<WalletInfo>();
		/*
		 * Map<String, WalletCategory> walletCategoryMap =AppCache.getWalletCategoryMap(); for (String key:walletCategoryMap.keySet()) {
		 * 
		 * WalletInfo walletInfo = new WalletInfo(); walletInfo.setWalletStatus("-1");
		 * walletInfo.setWalletCategory(walletCategoryMap.get(key).getWalletCategory());
		 * if(walletInfo.getWalletCategory().equals(Constants.WALLLET_TYPE_CENTER)){ walletInfos.add(walletInfo); } } for (String
		 * key:walletCategoryMap.keySet()) {
		 * 
		 * WalletInfo walletInfo = new WalletInfo(); walletInfo.setWalletStatus("-1");
		 * walletInfo.setWalletCategory(walletCategoryMap.get(key).getWalletCategory());
		 * if(!walletInfo.getWalletCategory().equals(Constants.WALLLET_TYPE_CENTER)){ walletInfos.add(walletInfo); } }
		 */
		List<Dict> desc = AppCache.getI18nDictListByType(Constants.WALLETCATEGORY_DAG);
		Map<String, NavigationApp> map = AppCache.getNavigationAppMap();
		for (Dict dict : desc) {
			try {
				dict.setDictName("{[{" + BASE64Util.getBASE64(dict.getDictName()) + "}]}");
			} catch (UnsupportedEncodingException e) {
			}
			if (dict.getDictCode().equals(Constants.WALLLET_TYPE_CENTER)) {
				WalletInfo walletInfo = new WalletInfo();
				walletInfo.setWalletStatus("-1");
				walletInfo.setWalletCategory(dict.getDictCode());
				walletInfos.add(walletInfo);
			}
			String[] auth = user.getAppauth().split(",");
			for (String str : auth) {
				NavigationApp navigationApp = map.get(str.trim() + Constants.USERTYPE_CASH);
				if (navigationApp != null) {
					if (!com.vinbet.mobile.util.Constants.USERTYPE_CREDIT.equals(navigationApp.getApptype())) {
						if (navigationApp.getAppmark().equals(str.trim())) {
							WalletCategory wallet = AppCache.getWalletCategoryMap().get(navigationApp.getWalletcategory());
							if (wallet != null) {
								if (wallet.getWalletCategory().equals(dict.getDictCode())) {
									if (wallet.getCurrency().contains(user.getCurrencyName())) {
										// 判断钱包状态是否为维护中
										if (wallet.getStatus().equals("1")) {
											WalletInfo walletInfo = new WalletInfo();
											walletInfo.setWalletStatus("-1");
											walletInfo.setWalletCategory(dict.getDictCode());
											walletInfos.add(walletInfo);
										}
									}
								}
							}
						}
					}
				}
			}
		}

		totalWallet.setWalletInfo(walletInfos);
		return totalWallet;
	}

	/**
	 * 应用间划账入口
	 * 
	 * @param
	 * @return
	 * @throws IOException
	 * @throws FileNotFoundException
	 */
	@At("/user/apptransfer")
	@Ok("json")
	public JsonResult apptransfer(@Param("money") double money, @Param("pw") String pw, @Param("fid") String fid, @Param("tid") String tid, @Param("anmoney") String anmoney, HttpSession session,
			HttpServletRequest request) throws FileNotFoundException, IOException {
		JsonResult jsonResult = JsonResult.createSuccess();
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		UserInfo user = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
		if (user.getUserStatus() == Constants.USER_STATUS.USERSTATUS_FREEZE.getCode()) {
			return JsonResult.createFalied(i18n.get("msg.common.userStsFreeze"));
		}
		// 检测资金密码输入错误次数，超过次数则冻结账户
		/*
		 * if (AppCache.userFundPwdErrorRecord.containsKey(user.getUserId())) { int failedCount =
		 * AppCache.userFundPwdErrorRecord.get(user.getUserId()).getCount(); int maxError =
		 * Integer.parseInt(AppCache.getSystemParm(Constants.FUND_PWD_ERROR_CONUT)); if (failedCount >= maxError) {
		 * AppCache.userFundPwdErrorRecord.get(user.getUserId()).setFreezeTimer(System.currentTimeMillis());
		 * AppCache.writeFreezeFile(AppCache.userFundPwdErrorRecord); HashMap<String, String> req = new HashMap<String, String>(); HashMap<String,
		 * String> rec = new HashMap<String, String>(); req.put("opt", "2");// 1、新增，2、修改 rec.put("uid", user.getUserId());// 用户ID rec.put("ust",
		 * "3");// 用户状态 3冻结 rec.put("frzrs", "248");// 冻结原因 248资金密码错误 String xml = CreateXmlUtil.createPublicReqXML(req, rec); String response =
		 * cEPUserCenterIceClient.baseManagerZreocSrvIPrx("cashUserRegister", xml);
		 * user.setUserStatus(Constants.USER_STATUS.USERSTATUS_FREEZE.getCode()); return
		 * JsonResult.createFalied(i18n.get("msg.portal.fundPwdErrorMore")); } } try { pw = RSAUtil.decrypt(pw); } catch (Exception e) {
		 * log.error("划账>>RSAUtil解码失败,用户名:" + user.getAccoutName() + ",密文:" + pw, e); } pw = PasswordEncoder.encode(user.getAccoutName(),
		 * MD5Util.md5(pw)); // 从用户中心获取用户信息用于校验资金密码 UserInfo currentUserInfo = userServcieImpl.getUserInfo(user.getAccoutName(), 1); if
		 * (currentUserInfo != null) { if (!currentUserInfo.getFundPwd().equals(pw)) { // 记录登录失败次数 if
		 * (AppCache.userFundPwdErrorRecord.containsKey(user.getUserId())) { int failedCount =
		 * AppCache.userFundPwdErrorRecord.get(user.getUserId()).getCount(); FreezeCount count =
		 * AppCache.userFundPwdErrorRecord.get(user.getUserId()); count.setCount(failedCount + 1);
		 * AppCache.userFundPwdErrorRecord.put(user.getUserId(), count); AppCache.writeFreezeFile(AppCache.userFundPwdErrorRecord); } else {
		 * FreezeCount count = new FreezeCount(); count.setCount(1); count.setFirstTimer(System.currentTimeMillis());
		 * AppCache.userFundPwdErrorRecord.put(user.getUserId(), count); AppCache.writeFreezeFile(AppCache.userFundPwdErrorRecord); } return
		 * JsonResult.createFalied(i18n.get("msg.portal.currentPwdError")); } }
		 */

		// 开始划账的业务处理，先进行活动中心的业务处理。
		// 1、检测用户在划出钱包的子应用中是否参加有活动。如果没有参加任何正在活动中的活动，则进行下一步和用户中心交互进行划账。如果有参加正在活动中的活动，则需要进行相应的业务处理。
		List<UserActivityInfo> userActivityList = activityHandleServiceImpl.findUserActivityList(fid, user.getUserId());
		try {
			if (userActivityList.size() == 0) {
				// 用户在转出的子应用中没有参加任何活动中的活动,开始下一步转账操作。
				jsonResult = this.executeStockArrives(user, fid, tid, money, String.valueOf(0), request);
			} else {
				// 如果有参加正在活动中的活动，则需要将参加的所有活动都调用活动中心结束活动接口，对活动进行结束。1：如果有的活动无法结束，则要终止划账。2：如果活动都可以正常结束，则进行下一步和用户中心交互划账。
				// 3:活动可以结束，但需要扣除活动金额，这需要和用户交互，让用户确认。
				List<String> actNoList = new ArrayList<String>();
				for (UserActivityInfo userActivity : userActivityList) {
					actNoList.add(userActivity.getActivityNo());
				}
				RespBeanForActivityEnd respBean = activityHandleServiceImpl.activityEnd(actNoList, user, anmoney, money);
				if (Constants.ACTIVITY_END_ST_YES.equals(respBean.getSt())) {
					// st=0则表示活动正常被结束,用户可以下一步进行划账。
					jsonResult = this.executeStockArrives(user, fid, tid, money, String.valueOf(0), request);
				} else if (Constants.ACTIVITY_END_ST_NO.equals(respBean.getSt())) {
					// st=1表示活动无法结束，用户无法转款，则终止用户转款。
					String systemMessage = i18n.get("msg.portal.noEndActivity");
					if ("pc.end.fail.wash".equals(respBean.getMsg())) {
						systemMessage = MessageFormat.format(i18n.get("msg.activity.turnoverInsufficient"), respBean.getWash()) + "，"
								+ MessageFormat.format(i18n.get("msg.activity.insistTransfer"), respBean.getBack());
					} else if ("pc.end.fail.rewash".equals(respBean.getMsg())) {
						double temp = Double.parseDouble(anmoney) - Double.parseDouble(respBean.getBack());
						if (temp > 0) {
							systemMessage = MessageFormat.format(i18n.get("msg.activity.turnoverInsufficientForRebate"), respBean.getWash()) + "，"
									+ MessageFormat.format(i18n.get("msg.activity.lowerWithdrawAmt"), String.valueOf(temp)) + i18n.get("msg.activity.tryAgain");
						} else {
							systemMessage = MessageFormat.format(i18n.get("msg.activity.turnoverInsufficientForRebate"), respBean.getWash());
						}
					}
					return JsonResult.createFalied(systemMessage);
				} else if (Constants.ACTIVITY_END_ST_INSIST.equals(respBean.getSt())) {
					// st=2则表示需要强制结束活动方可转款，并给出了强制转出会扣除多少钱，提示用户是否选择强制转出，如果用户确认同意强制转出，
					// 则设置报文force=”1”调用活动中心结束用户活动的接口，在返回报文中获取back金额，增加到转账报文中活动金扣除属性上，送用户中心在转出时扣除活动金。
					Double activityMoney = Double.parseDouble(respBean.getBack());// 强转要扣掉的活动费。
					Double lastWalletOutMoney = ArithUtil.add(money, activityMoney);// 强转最终的转出款。
					String actNosForEnd = this.makeActNosForEnd(respBean);// 用户确认强转后，需要结束的活动。
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("activityMoney", activityMoney);// 强转要扣掉的活动费。
					map.put("lastWalletOutMoney", lastWalletOutMoney);// 强转最终的转出款。
					map.put("actNosForEnd", actNosForEnd);
					map.put("walletOut", fid);
					map.put("walletIn", tid);
					map.put("balance", money);
					jsonResult.setData(map);
					jsonResult.setM("stockArrivesInsist");
				}
			}
		} catch (Exception e) {
			log.error("划账异常！" + e.getMessage(), e);
			jsonResult = JsonResult.createFalied(i18n.get("msg.common.systemError"));
		}
		return jsonResult;
	}

	/** 用户强制划账 */
	@At("/user/stockArrivesInsist")
	@Ok("json")
	public JsonResult stockArrivesInsist(String actNosForEnd, double money, String walletOut, String walletIn, String activityMoney, HttpSession session, HttpServletRequest request) {
		JsonResult jsonResult = JsonResult.createSuccess();
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		UserInfo userInfoInSession = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
		String ip = this.getClientIp(request);
		try {
			List<Activity> actNoList = new ArrayList<Activity>();
			log.info("\n\nactNosForEndSt:[" + actNosForEnd + "]\n\n");
			if (actNosForEnd != null) {
				String[] actNoAndsts = actNosForEnd.split(",");
				for (String actNo : actNoAndsts) {
					String[] actNoAndst = actNo.split("~");
					Activity actTemp = new Activity();
					actTemp.setCurrActivityNo(actNoAndst[0]);
					actTemp.setSt(actNoAndst[1]);
					actNoList.add(actTemp);
				}
			}
			jsonResult = this.executeStockArrives(userInfoInSession, walletOut, walletIn, money, activityMoney, request);
			if ("stockArrivesSuccess".equals(jsonResult.getM())) {
				// 转账成功。调用结束用户活动状态的接口
				activityHandleServiceImpl.commonSrv(userInfoInSession, actNoList);
			} else {
				jsonResult = JsonResult.createFalied(i18n.get("msg.portal.noEnoughMoney"));
			}

		} catch (final Exception e) {
			log.error(e.getMessage(), e);
			jsonResult = JsonResult.createFalied(i18n.get("msg.common.systemError"));
		}
		return jsonResult;
	}

	/**
	 * 调用用户中心开始转账。转账后查找用户在转入的子应用上面可以参加的活动。
	 * 
	 * @author cjp
	 * @param userInfoInSession
	 * @param walletOut
	 *            转出钱包
	 * @param walletIn
	 *            转入钱包
	 * @param balance
	 *            金额
	 * @param otmny
	 *            扣除活动金额
	 * @return
	 * @throws Exception
	 * @since 2015-6-24 下午8:38:09
	 */
	@Ok("json")
	private JsonResult executeStockArrives(UserInfo user, String walletOut, String walletIn, double balance, String otmny, HttpServletRequest request) throws Exception {
		JsonResult jsonResult = JsonResult.createSuccess();
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		String iterface = "fundMove";
		HashMap<String, String> req = new HashMap<String, String>();
		HashMap<String, String> rec = new HashMap<String, String>();
		rec.put("uid", user.getUserId());
		rec.put("utyp", String.valueOf(user.getUserType()));
		rec.put("utacc", walletOut);
		rec.put("inacc", walletIn);
		rec.put("opttm", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		rec.put("optid", user.getUserId());
		rec.put("mny", String.valueOf(balance));
		rec.put("unm", user.getAccoutName());
		rec.put("optnm", user.getAccoutName());
		rec.put("mnt", user.getCurrencyName());
		String ip = this.getClientIp(request);
		rec.put("uip", ip);
		rec.put("surc", TransferSource.H5.getVal());
		rec.put("otmny", otmny);
		String reqXml = CreateXmlUtil.createPublicReqXML(req, rec);
		try {
			String response = cEPUserCenterIceClient.moneyManagerZreocSrvIPrx(iterface, reqXml);
			if (response != null && !response.equals("")) {
				Document doc = DocumentHelper.parseText(response);
				Element root = doc.getRootElement();
				String resultCode = root.attributeValue("st");
				if (!resultCode.equals(Constants.SUCCESS)) {
					if (resultCode.equals(Constants.NETWORK_ERROR)) {
						jsonResult = JsonResult.createFalied(i18n.get("msg.portal.networkError"));
					} else if (resultCode.equals(Constants.NOUSER)) {
						jsonResult = JsonResult.createFalied(i18n.get("msg.portal.noUser"));
					} else {
						jsonResult = JsonResult.createFalied(i18n.get("msg.portal.transferFailure"));
					}
				} else {// 划账成功。 去获取用户可以参加的活动列表。
					List<Activity> userOkActivityList = activityHandleServiceImpl.findUserOkActivityList(walletIn, Constants.ACTIVITY_TRIGGER_WEB_TRANS, user, balance);
					if (userOkActivityList.size() > 0) {
						String actNosForWaive = "";
						for (Activity act : userOkActivityList) {
							actNosForWaive += act.getCurrActivityNo() + ",";
						}
						Map<String, Object> map = new HashMap<String, Object>();
						map.put("userOkActivityList", userOkActivityList);
						map.put("actNosForWaive", actNosForWaive);
						jsonResult.setData(map);
					}
					jsonResult.setM("stockArrivesSuccess");
				}
			} else {
				jsonResult = JsonResult.createFalied(i18n.get("msg.common.systemError"));
				log.error("调用[platform]手机服务端[" + iterface + "]请求报文：" + reqXml + "接口返回数据为空");
			}
		} catch (DocumentException e) {
			jsonResult = JsonResult.createFalied(i18n.get("msg.common.systemError"));
			log.error("调用[platform]手机服务端[" + iterface + "]接口处理异常.", e);
		}
		return jsonResult;

	}

	/** 用户参加活动 */
	@At("/user/joinActivity")
	@Ok("json")
	public JsonResult joinActivity(@Param("money") String money, @Param("acNoRadio") String acNoRadio, HttpSession session, HttpServletRequest request) {
		JsonResult jsonResult = JsonResult.createSuccess();
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		UserInfo userInfoInSession = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
		String ip = this.getClientIp(request);
		try {
			RespBeanForActivityJoin respBean = activityHandleServiceImpl.joinActivity(userInfoInSession, ip, Double.valueOf(money), acNoRadio);
			if (!Constants.ACTIVITY_JOIN_ST_YES.equals(respBean.getSt())) {
				if (Constants.ACTIVITY_JOIN_MSG_REPT.equals(respBean.getMsg())) {
					jsonResult = JsonResult.createFalied(i18n.get("msg.portal.repIpPhoneEmail"));
				} else if (Constants.ACTIVITY_JOIN_MSG_NOIN.equals(respBean.getMsg())) {
					jsonResult = JsonResult.createFalied(i18n.get("msg.portal.noPayInfo"));
				} else if (Constants.ACTIVITY_JOIN_MSG_FIRST.equals(respBean.getMsg())) {
					jsonResult = JsonResult.createFalied(i18n.get("msg.portal.noFirstTrans"));
				} else if (Constants.ACTIVITY_JOIN_MSG_NOACT.equals(respBean.getMsg())) {
					jsonResult = JsonResult.createFalied(i18n.get("msg.portal.noEnableAct"));
				}
			}
		} catch (final Exception e) {
			log.error(e.getMessage(), e);
			jsonResult = JsonResult.createFalied(i18n.get("msg.common.systemError"));
		}
		return jsonResult;
	}

	/** 用户放弃活动 */
	@At("/user/waiveAllActivity")
	@Ok("json")
	public JsonResult waiveAllActivity(@Param("money") String money, @Param("actNosForWaive") String actNosForWaive, HttpSession session, HttpServletRequest request) {
		JsonResult jsonResult = JsonResult.createSuccess();
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		UserInfo userInfoInSession = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
		String ip = this.getClientIp(request);
		try {
			activityHandleServiceImpl.waiveActivity(userInfoInSession, ip, Double.valueOf(money), actNosForWaive);
		} catch (final Exception e) {
			log.error(e.getMessage(), e);
			jsonResult = JsonResult.createFalied(i18n.get("msg.common.systemError"));
		}
		return jsonResult;
	}

	private String makeActNosForEnd(RespBeanForActivityEnd respBean) {
		List<MsgForActivityEnd> MsgList = respBean.getMsgList();
		String actNosForEnd = "";
		for (MsgForActivityEnd msgBean : MsgList) {
			actNosForEnd += msgBean.getActNo() + "~" + msgBean.getSt() + ",";// 例子：5001~2,5002~2，... ...
		}
		return actNosForEnd;
	}

	/**
	 * 获取上次提款记录
	 * 
	 * @param
	 * @return
	 */
	/*
	 * @At("/user/lastDrawInfo")
	 * 
	 * @Ok("json") public JsonResult lastDrawInfo(HttpSession session) { JsonResult jsonResult = JsonResult.createSuccess(); String url = new
	 * StringBuilder(propertiesLoader.getTrim("vinbet.platform.url")).append("/user-drawmobileapi!lastDrawInfo.shtml").toString(); UserInfo user =
	 * (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION); Map<String, String> parameters = new HashMap<String, String>();
	 * parameters.put("userName", user.getAccoutName()); parameters.put("uuid", UUID.randomUUID().toString()); String ts = String.valueOf(new
	 * Date().getTime()); parameters.put("ts", ts); parameters.put("valideTime", propertiesLoader.getTrim("vinbet.platform.valideTime"));
	 * parameters.put("sipsession", MD5Util.md5Hex(propertiesLoader.getTrim("vinbet.token.platform") + ts)); String response =
	 * HttpClientUtil.doGetString(url, parameters); //
	 * {"testlimi":{"logID":"1410","userId":"55190","userName":"testlimi","trueName":"李密","cardType":"1", //
	 * "bankName":"工商银行","cardNo":"1234 8856 4589 3578","nameOnCard":"李密", //
	 * "branchName":",浙江省,金华市,萨瓦迪卡swdk","amount":"500.0","transferFee":"0.0","status"
	 * :"1","createTime":"2014-12-31 14:09:09.0","type":"0","isFirst":"0","remark":"null","currencytype":1},"code":160000,"description":"success"} if
	 * (response != null && !response.equals("")) { try { JSONObject jsonObject = JSON.parseObject(response); int resultCode =
	 * jsonObject.getIntValue("code"); if (resultCode == PlatformReturnCode.FAILED.getCode()) { jsonResult = JsonResult.createFalied(); } else {
	 * String userStr = jsonObject.getString(user.getAccoutName()); if (null != userStr && !"".equals(userStr)) { JSONObject jo =
	 * JSON.parseObject(userStr); Map<String, Object> map = new HashMap<String, Object>(); map.put("trueName", jo.getString("trueName"));
	 * map.put("bankName", jo.getString("bankName")); map.put("cardNo", jo.getString("cardNo")); map.put("branchName", jo.getString("branchName"));
	 * jsonResult.setData(map); } } } catch (Exception e) { jsonResult = JsonResult.createFalied(); log.error("获取上次提款记录异常", e); } } else { jsonResult
	 * = JsonResult.createFalied(); log.error("获取上次提款记录,调用手机服务端[user-drawmobileapi!lastDrawInfo.shtml]接口返回空数据."); } return jsonResult; }
	 */

	/**
	 * 检测提款手续费
	 * 
	 * @param mny
	 * @return
	 */
	@At("/user/checkCounterFee")
	@Ok("json")
	public JsonResult checkCounterFee(double mny, HttpSession session, HttpServletRequest request) {
		UserInfo userInfoInSession = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
		JsonResult jsonResult = JsonResult.createSuccess();
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		HashMap<String, String> req = new HashMap<String, String>();
		HashMap<String, String> rec = new HashMap<String, String>();
		req.put("t", "20");// 操作说明 检测类接口20、检查用户的提款手续费
		rec.put("uid", userInfoInSession.getUserId());// 用户ID

		/*
		 * CheckInfo checkInfo = userServcieImpl.checkUserInfo(req, rec); if
		 * (checkInfo.getResultCode().equals(com.vinbet.mobile.util.Constants.SUCCESS)) { if (mny < Double.parseDouble(checkInfo.getDrwfee())) {
		 * return JsonResult.createFalied(i18n.get("msg.portal.lessThenFee")); } else { Map<String, Object> map = new HashMap<String, Object>();
		 * map.put("info", checkInfo); jsonResult.setData(map); } } else { jsonResult = JsonResult.createFalied(i18n.get("msg.common.systemError")); }
		 */
		CheckInfo checkInfo = new CheckInfo();
		checkInfo.setDrwfee("0.0");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("info", checkInfo);
		jsonResult.setData(map);
		return jsonResult;
	}
	
	/**
	 * 检测支付宝账号当日可否提款
	 * 
	 * @param mny
	 * @return
	 */
	@At("/user/checkIsAlipayDraw")
	@Ok("json")
	public JsonResult checkIsAlipayDraw(double mny, HttpSession session, HttpServletRequest request) {
		UserInfo userInfoInSession = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
		JsonResult jsonResult = JsonResult.createSuccess();
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		HashMap<String, String> mgrReq = new HashMap<String, String>();
		mgrReq.put("amount", String.valueOf(mny));
		mgrReq.put("tbnm", "DepositByZFB");
		String mgrXml = CreateXmlUtil.createPublicReqXML(mgrReq, null);
		log.info("【手机前端调用管理中心ICE推送本次存款消耗的额度请求报文为：】" + mgrXml);
		String mgrResXML = this.cEPMgrCenterClient.getSyncPrmtData(mgrXml);// 调用管理中心ice推送本次存款消耗的额度
		log.info("【手机前端调用管理中心ICE推送本次存款消耗的额度返回报文为：】" + mgrResXML);
		try {
			Document mgrDoc = DocumentHelper.parseText(mgrResXML);
			Element mgrRoot = mgrDoc.getRootElement();
			String mgrResultCode = mgrRoot.attributeValue("st");
			if (!mgrResultCode.equals(Constants.SUCCESS)) {
				jsonResult = JsonResult.createFalied("支付宝当日提款限额已经用完,请选择银行卡提款");
			}
		} catch (DocumentException e) {
			e.printStackTrace();
			jsonResult = JsonResult.createFalied(i18n.get("msg.common.systemError"));
		}
		return jsonResult;
	}

	/**
	 * 提款
	 * 
	 * @param
	 * @return
	 * @throws IOException
	 * @throws FileNotFoundException
	 */
	@At("/user/drawMoney")
	@Ok("json")
	public JsonResult drawMoney(@Param("drawMoneyInfo") String drawMoneyInfo, @Param("cardNo") String cardNo, @Param("branchDetail") String branchDetail, @Param("cardId") String cardId,
			@Param("fundPwd") String fundPwd, @Param("bankId") String bankId, @Param("accsp") String accsp, HttpServletRequest request, HttpSession session) throws FileNotFoundException, IOException {
		JsonResult jsonResult = JsonResult.createSuccess();
		String iterface = "cashUserInOutMoney";
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		UserInfo user = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
		if (user.getUserStatus() == Constants.USER_STATUS.USERSTATUS_FREEZE.getCode()) {
			return JsonResult.createFalied(i18n.get("msg.common.userStsFreeze"));
		}
		// 检测资金密码输入错误次数，超过次数则冻结账户
		if (AppCache.userFundPwdErrorRecord.containsKey(user.getUserId())) {
			int failedCount = AppCache.userFundPwdErrorRecord.get(user.getUserId()).getCount();
			int maxError = Integer.parseInt(AppCache.getSystemParm(Constants.FUND_PWD_ERROR_CONUT));
			if (failedCount >= maxError) {
				AppCache.userFundPwdErrorRecord.get(user.getUserId()).setFreezeTimer(System.currentTimeMillis());
				AppCache.writeFreezeFile(AppCache.userFundPwdErrorRecord);
				HashMap<String, String> req = new HashMap<String, String>();
				HashMap<String, String> rec = new HashMap<String, String>();
				req.put("opt", "2");// 1、新增，2、修改
				rec.put("uid", user.getUserId());// 用户ID
				rec.put("ust", "3");// 用户状态 3冻结
				rec.put("frzrs", "248");// 冻结原因 248资金密码错误
				String xml = CreateXmlUtil.createPublicReqXML(req, rec);
				String response = cEPUserCenterIceClient.baseManagerZreocSrvIPrx("cashUserRegister", xml);
				user.setUserStatus(Constants.USER_STATUS.USERSTATUS_FREEZE.getCode());
				return JsonResult.createFalied(i18n.get("msg.portal.fundPwdErrorMore"));
			}
		}
		/*
		 * try { fundPwd = RSAUtil.decrypt(fundPwd); } catch (Exception e) { log.error("提款>>RSAUtil解码失败,用户名:" + user.getAccoutName() + ",密文:" +
		 * fundPwd, e); } fundPwd = PasswordEncoder.encode(user.getAccoutName(), MD5Util.md5(fundPwd));
		 */
		fundPwd = PasswordEncoder.encode(user.getAccoutName(), fundPwd);
		// 从用户中心获取用户信息用于校验资金密码
		UserInfo currentUserInfo = userServcieImpl.getUserInfo(user.getAccoutName(), 1);
		if (currentUserInfo != null) {
			if (!currentUserInfo.getFundPwd().equals(fundPwd)) {
				// 记录登录失败次数
				if (AppCache.userFundPwdErrorRecord.containsKey(user.getUserId())) {
					int failedCount = AppCache.userFundPwdErrorRecord.get(user.getUserId()).getCount();
					FreezeCount count = AppCache.userFundPwdErrorRecord.get(user.getUserId());
					count.setCount(failedCount + 1);
					AppCache.userFundPwdErrorRecord.put(user.getUserId(), count);
					AppCache.writeFreezeFile(AppCache.userFundPwdErrorRecord);
				} else {
					FreezeCount count = new FreezeCount();
					count.setCount(1);
					count.setFirstTimer(System.currentTimeMillis());
					AppCache.userFundPwdErrorRecord.put(user.getUserId(), count);
					AppCache.writeFreezeFile(AppCache.userFundPwdErrorRecord);
				}
				return JsonResult.createFalied(i18n.get("msg.portal.currentPwdError"));
			}
		}
		// 清除失敗記錄
		if (AppCache.userFundPwdErrorRecord.containsKey(user.getUserId())) {
			AppCache.userFundPwdErrorRecord.remove(user.getUserId());
		}
		if(accsp.equals("10")){
			HashMap<String, String> mgrReq = new HashMap<String, String>();
			mgrReq.put("amount", String.valueOf(drawMoneyInfo));
			mgrReq.put("tbnm", "DepositByZFB");
			String mgrXml = CreateXmlUtil.createPublicReqXML(mgrReq, null);
			log.info("【手机前端调用管理中心ICE推送本次存款消耗的额度请求报文为：】" + mgrXml);
			String mgrResXML = this.cEPMgrCenterClient.getSyncPrmtData(mgrXml);// 调用管理中心ice推送本次存款消耗的额度
			log.info("【手机前端调用管理中心ICE推送本次存款消耗的额度返回报文为：】" + mgrResXML);
			try {
				Document mgrDoc = DocumentHelper.parseText(mgrResXML);
				Element mgrRoot = mgrDoc.getRootElement();
				String mgrResultCode = mgrRoot.attributeValue("st");
				if (!mgrResultCode.equals(Constants.SUCCESS)) {
					jsonResult = JsonResult.createFalied("支付宝当日提款限额已经用完,请选择银行卡提款");
					return jsonResult;
				}
			} catch (DocumentException e) {
				e.printStackTrace();
				jsonResult = JsonResult.createFalied(i18n.get("msg.common.systemError"));
				return jsonResult;
			}
		}
		
		
		
		HashMap<String, String> req = new HashMap<String, String>();
		HashMap<String, String> rec = new HashMap<String, String>();
		req.put("t", "8");// 操作说明 检测类接口8、检测提款次数接口
		rec.put("uid", user.getUserId());// 用户ID
		CheckInfo checkInfo = userServcieImpl.checkUserInfo(req, rec);
		int mgrTime = AppCache.getCurrencyMap().get(user.getCurrencyName()).getWithdrawalTimes();
		if (Integer.parseInt(checkInfo.getDrawCount()) >= mgrTime) {
			return JsonResult.createFalied(i18n.get("msg.portal.drawTimeDayLimit"));
		}

		Financer financer = userServcieImpl.getFinancer(accsp, bankId);
		if (financer == null) {
			return JsonResult.createFalied(i18n.get("msg.portal.noOnlineFinancer"));
		}
		try {
			Document outDoc = DocumentHelper.createDocument();// 需要输出的xml节点
			Element rootElm = outDoc.addElement("req");
			rootElm.addAttribute("t", Constants.DRAWAL_APPLY);// 操作 1、存款 2、取款 3、修改支付中的状态
			Element recElm = rootElm.addElement("rec");
			recElm.addAttribute("uid", currentUserInfo.getUserId());// 用户ID
			recElm.addAttribute("nm", currentUserInfo.getTrueName());// 真实姓名
			recElm.addAttribute("blsur", Constants.DRAWAL_FROM_WAY);// 存提款来源,1-用户存款、2-公司修改(存款)、3-公司存入(客服代存)、4-公司提款(客服代提)、5-用户提款、6-公司修改(提款)
			if (accsp.equals("10")) {
				recElm.addAttribute("bltyp", Constants.BALANCE_TYPE_ALIPAY);// 存款类型,1-本地银行转账,2-支付平台,3-易支付 提款也必须加
			} else {
				recElm.addAttribute("bltyp", Constants.BALANCE_TYPE_LOCAL);// 存款类型,1-本地银行转账,2-支付平台,3-易支付 提款也必须加
			}
			recElm.addAttribute("paywy", accsp);// 支付方式,1-网银转账、2-跨行转账、3-ATM柜员机、4-银行柜台、5-手机银行、6-中介机构、7-银行机构、8-在线存款、9-其他
			recElm.addAttribute("mnt", currentUserInfo.getCurrencyName());// 币种
			recElm.addAttribute("mny", drawMoneyInfo);// 存取款金额
			recElm.addAttribute("st", Constants.DRAWAL_APPLY_STATUS_APPLYING);// 1、申请中
			recElm.addAttribute("drwacc", cardId);// 提款帐号ID
			recElm.addAttribute("trsu", financer.getId());// 财务员ID
			recElm.addAttribute("trsunm", financer.getName());// 财务员账户名
			recElm.addAttribute("trmnl", DepositDrawTerminal.H5.getVal());
			String xml = outDoc.asXML();
			String response = cEPUserCenterIceClient.moneyManagerZreocSrvIPrx(iterface, xml);
			if (response != null && !response.equals("")) {

				Document doc = DocumentHelper.parseText(response);
				Element root = doc.getRootElement();
				String resultCode = root.attributeValue("st");
				if (!resultCode.equals(Constants.SUCCESS)) {
					if (resultCode.equals(Constants.NO_AVAILABLE_BALANCE)) {
						jsonResult = JsonResult.createFalied(i18n.get("msg.portal.walletNoAvailMoney"));
					} else if (resultCode.equals(Constants.DRAWAL_STATUS_APPLYING)) {
						jsonResult = JsonResult.createFalied(i18n.get("msg.portal.withdrawalProcessed"));
					} else if (resultCode.equals(Constants.NOUSER)) {
						jsonResult = JsonResult.createFalied(i18n.get("msg.portal.noUser"));
					} else if (resultCode.equals(Constants.DEPOSIT_NO_INRULES)) {
						jsonResult = JsonResult.createFalied(i18n.get("msg.portal.drawNoInRules"));
					} else if (resultCode.equals(Constants.APP_COUNT_ERROR)) {
						jsonResult = JsonResult.createFalied(i18n.get("msg.portal.appCountError"));
					} else {
						jsonResult = JsonResult.createFalied(i18n.get("msg.common.systemError"));
					}
					log.error("调用[platform]手机服务端[" + iterface + "]请求报文：" + xml + "接口返回数据:" + response);
				}
			} else {
				jsonResult = JsonResult.createFalied(i18n.get("msg.common.systemError"));
				log.error("调用[platform]手机服务端[" + iterface + "]请求报文：" + xml + "接口返回数据为空");
			}
		} catch (DocumentException e) {
			jsonResult = JsonResult.createFalied(i18n.get("msg.common.systemError"));
			log.error("调用[platform]手机服务端[" + iterface + "]接口处理异常.", e);
		}
		return jsonResult;
	}

	/**
	 * 获取用户可提款余额
	 * 
	 * @param session
	 * @param request
	 * @return
	 */
	@At("/user/getDrawBalance")
	@Ok("json")
	public Object getDrawBalance(HttpSession session, HttpServletRequest request) {
		JsonResult jsonResult = JsonResult.createSuccess();
		UserInfo user = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
		HashMap<String, String> req = new HashMap<String, String>();
		HashMap<String, String> rec = new HashMap<String, String>();
		rec.put("uid", user.getUserId());
		rec.put("watyp", Constants.WALLLET_TYPE_CENTER);// 1_W_SSC 时时彩钱包,1_W_HK 香港彩钱包,0_W_FCT 翡翠厅钱包,0_W_HJT 皇家厅钱包,0_W_CENTER 中心钱包,1_W_HDYX 测试游戏钱包
		rec.put("utyp", String.valueOf(user.getUserType()));
		rec.put("lg", "zh");
		rec.put("unm", user.getAccoutName());
		String reqXml = CreateXmlUtil.createPublicReqXML(req, rec);
		TotalWallet totalWallet = userServcieImpl.getBalance(reqXml, Constants.WALLLET_TYPE_CENTER, user);
		String drawMoney = null;
		if (totalWallet != null) {
			if (totalWallet.getWalletInfo().size() > 0) {
				drawMoney = totalWallet.getWalletInfo().get(0).getDrawableMoney();
			}
		} else {
			jsonResult = JsonResult.createFalied();
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("drawMoney", drawMoney);
		jsonResult.setData(map);
		return jsonResult;

	}

}
