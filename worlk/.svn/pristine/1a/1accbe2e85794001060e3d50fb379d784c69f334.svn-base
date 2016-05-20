package com.vinbet.mobile.action.portal;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
import org.nutz.mvc.view.JspView;
import org.nutz.mvc.view.ViewWrapper;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.vinbet.mobile.domain.UserInfo;
import com.vinbet.mobile.entity.portal.BankCard;
import com.vinbet.mobile.entity.portal.CheckInfo;
import com.vinbet.mobile.entity.portal.Dict;
import com.vinbet.mobile.entity.portal.FreezeCount;
import com.vinbet.mobile.service.portal.UserServcieImpl;
import com.vinbet.mobile.sys.AppCache;
import com.vinbet.mobile.sys.CEPUserCenterIceClient;
import com.vinbet.mobile.sys.PropertiesLoader;
import com.vinbet.mobile.util.BASE64Util;
import com.vinbet.mobile.util.CheckSession;
import com.vinbet.mobile.util.Constants;
import com.vinbet.mobile.util.Constants.PlatformReturnCode;
import com.vinbet.mobile.util.CreateXmlUtil;
import com.vinbet.mobile.util.DateUtil;
import com.vinbet.mobile.util.HttpClientUtil;
import com.vinbet.mobile.util.JsonResult;
import com.vinbet.mobile.util.MD5Util;
import com.vinbet.mobile.util.PasswordEncoder;
import com.vinbet.mobile.util.RSAUtil;
import com.vinbet.mobile.util.StringUtil;

/**
 * 个人资料
 * 
 * @author cjp
 * 
 */
@IocBean(singleton = false)
@Filters(@By(type = CheckSession.class, args = { "USER_SESSION", "/timeout" }))
public class InformationAction extends CommonAction {
	private Log log = Logs.getLog(InformationAction.class);
	@Inject
	private PropertiesLoader propertiesLoader;
	@Inject
	private UserServcieImpl userServcieImpl;
	@Inject
	private CEPUserCenterIceClient cEPUserCenterIceClient;

	/**
	 * 个人资料
	 * 
	 * @return
	 */
	@SuppressWarnings("unused")
	@At("/user/information")
	@Ok("jsp:page.portal.myInformation")
	public Object myCenter(HttpServletRequest request, HttpSession session) {
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		HashMap<String, Object> obj = new HashMap<String, Object>();
		UserInfo onlineUser = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
		UserInfo userInfo = userServcieImpl.getUserInfo(onlineUser.getAccoutName(), 1);
		List<BankCard> bankCard = userServcieImpl.getBankInfo(onlineUser.getUserId(), null);
		List<Dict> proLs = AppCache.getI18nDictListByType("arealevel2_" + userInfo.getCountry());
		if (bankCard != null) {
			for (BankCard bankCard2 : bankCard) {
				for (Dict dict : proLs) {
					if (dict.getDictCode().equals(bankCard2.getProvincial())) {
						bankCard2.setProvinceName(dict.getDictName());
					}
				}
			}
		}
		if (userInfo != null) {
			obj.put("user", userInfo);
			/*
			 * List<Dict> banks = AppCache.getDictListByTypeId(Constants.BANKNAME_DAG); String array =JSONArray.toJSONString(banks);
			 * obj.put("banksel",array);
			 */
			// obj.put("citys", i18n.get("dict.city_" + userInfo.getCurrencyType()));
			obj.put("banklist", bankCard);
			obj.put("isCNYuser", userInfo.getCurrencyName().equals("CNY") ? 1 : 2);
			obj.put("maxCardNum", AppCache.getSystemParm(Constants.MAX_BANKCARD));
			boolean showalipay = true;
			List<Dict> aldt = AppCache.getDictListByTypeId(Constants.ALIPAY_DRAW_DAG);
			if(aldt==null||aldt.size()==0){
				showalipay =false;
			}
			obj.put("isShowAlipay", showalipay);
			return obj;
		} else {
			return new ViewWrapper(new JspView("page.tips"), i18n.get("msg.common.systemError"));
		}
	}

	/**
	 * 修改个人附加信息
	 * 
	 * @param userInfo
	 * @param session
	 * @return
	 */
	@At("/user/upSubjoinInfo")
	@Ok("json")
	public Object upSubjoinInfo(@Param("..") UserInfo userInfo, HttpSession session, HttpServletRequest request) {
		JsonResult jsonResult = JsonResult.createSuccess();
		String iterface = "cashUserRegister";
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		try {
			UserInfo onlineUser = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
			if (onlineUser.getUserStatus() == Constants.USER_STATUS.USERSTATUS_FREEZE.getCode()) {
				return JsonResult.createFalied(i18n.get("msg.common.userStsFreeze"));
			}
			String userid = onlineUser.getUserId();
			String userlv = onlineUser.getUserLv();
			String nickname = userInfo.getNickName();
			String address = userInfo.getAddress();
			Document outDoc = DocumentHelper.createDocument();// 需要输出的xml节点
			Element rootElm = outDoc.addElement("req");
			rootElm.addAttribute("opt", "2");// 操作 1、新增 2、修改
			Element recElm = rootElm.addElement("rec");
			recElm.addAttribute("uid", userid);// 用户ID
			recElm.addAttribute("lv", userlv);// 用户级别
			recElm.addAttribute("pro", address);// 地址
			recElm.addAttribute("ncknm", nickname);// 昵称
			String xml = outDoc.asXML();
			String response = cEPUserCenterIceClient.baseManagerZreocSrvIPrx(iterface, xml);
			if (response != null && !response.equals("")) {

				Document doc = DocumentHelper.parseText(response);
				Element root = doc.getRootElement();
				String resultCode = root.attributeValue("st");
				if (!resultCode.equals(Constants.SUCCESS)) {
					if (resultCode.equals(Constants.ERROR_PASSWORD)) {
						jsonResult = JsonResult.createFalied(i18n.get("msg.portal.currentPwdError"));
					} else if (resultCode.equals(Constants.DRAWPWDNOTSAMEUPWDUNM)) {
						jsonResult = JsonResult.createFalied(i18n.get("msg.portal.fundpwdSameLoginpwd"));
					} else if (resultCode.equals(Constants.NOUSER)) {
						jsonResult = JsonResult.createFalied(i18n.get("msg.portal.noUser"));
					} else {
						return JsonResult.createFalied(i18n.get("msg.common.systemError"));
					}
					log.error("调用[platform]手机服务端[" + iterface + "]请求报文：" + xml + "接口返回数据:" + response);
				}
			} else {
				jsonResult = JsonResult.createFalied(i18n.get("msg.common.systemError"));
				log.error("调用[platform]手机服务端[" + iterface + "]请求报文：" + xml + "接口返回数据为空");
			}
		} catch (Exception e) {
			jsonResult = JsonResult.createFalied(i18n.get("msg.common.systemError"));
			log.error("调用[platform]手机服务端[" + iterface + "]接口处理异常.", e);
		}
		return jsonResult;
	}

	/**
	 * 获取单个银行卡信息
	 * 
	 * @param userInfo
	 * @param session
	 * @return
	 */
	@At("/user/getCardInfo")
	@Ok("json")
	public Object getCardInfo(@Param("cardID") String cardID, @Param("fundPwd") String fundPwd, HttpServletRequest request, HttpSession session) {
		JsonResult jsonResult = JsonResult.createSuccess();
		String iterface = "bankCardQuery";
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			UserInfo onlineUser = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
			if (onlineUser.getUserStatus() == Constants.USER_STATUS.USERSTATUS_FREEZE.getCode()) {
				return JsonResult.createFalied(i18n.get("msg.common.userStsFreeze"));
			}
			// 检测资金密码输入错误次数，超过次数则冻结账户
			if (AppCache.userFundPwdErrorRecord.containsKey(onlineUser.getUserId())) {
				int failedCount = AppCache.userFundPwdErrorRecord.get(onlineUser.getUserId()).getCount();
				int maxError = Integer.parseInt(AppCache.getSystemParm(Constants.FUND_PWD_ERROR_CONUT));
				if (failedCount >= maxError) {
					AppCache.userFundPwdErrorRecord.get(onlineUser.getUserId()).setFreezeTimer(System.currentTimeMillis());
					AppCache.writeFreezeFile(AppCache.userFundPwdErrorRecord);
					HashMap<String, String> req = new HashMap<String, String>();
					HashMap<String, String> rec = new HashMap<String, String>();
					req.put("opt", "2");// 1、新增，2、修改
					rec.put("uid", onlineUser.getUserId());// 用户ID
					rec.put("ust", "3");// 用户状态 3冻结
					rec.put("frzrs", "248");// 冻结原因 248资金密码错误
					String xml = CreateXmlUtil.createPublicReqXML(req, rec);
					String response = cEPUserCenterIceClient.baseManagerZreocSrvIPrx("cashUserRegister", xml);
					onlineUser.setUserStatus(Constants.USER_STATUS.USERSTATUS_FREEZE.getCode());
					return JsonResult.createFalied(i18n.get("msg.portal.fundPwdErrorMore"));
				}
			}
			if (fundPwd != null && !fundPwd.equals("")) {
				fundPwd = RSAUtil.decrypt(fundPwd);
				fundPwd = PasswordEncoder.encode(onlineUser.getAccoutName(), MD5Util.md5(fundPwd));
				//fundPwd = PasswordEncoder.encode(onlineUser.getAccoutName(), fundPwd);
				// 从用户中心获取用户信息用于校验资金密码
				UserInfo currentUserInfo = userServcieImpl.getUserInfo(onlineUser.getAccoutName(), 1);
				if (currentUserInfo != null) {
					if (!currentUserInfo.getFundPwd().equals(fundPwd)) {
						// 记录登录失败次数
						if (AppCache.userFundPwdErrorRecord.containsKey(onlineUser.getUserId())) {
							int failedCount = AppCache.userFundPwdErrorRecord.get(onlineUser.getUserId()).getCount();
							FreezeCount count = AppCache.userFundPwdErrorRecord.get(onlineUser.getUserId());
							count.setCount(failedCount + 1);
							AppCache.userFundPwdErrorRecord.put(onlineUser.getUserId(), count);
							AppCache.writeFreezeFile(AppCache.userFundPwdErrorRecord);
						} else {
							FreezeCount count = new FreezeCount();
							count.setCount(1);
							count.setFirstTimer(System.currentTimeMillis());
							AppCache.userFundPwdErrorRecord.put(onlineUser.getUserId(), count);
							AppCache.writeFreezeFile(AppCache.userFundPwdErrorRecord);
						}
						return JsonResult.createFalied(i18n.get("msg.portal.currentPwdError"));
					}
				}
			}
			// 清除失敗記錄
			if (AppCache.userFundPwdErrorRecord.containsKey(onlineUser.getUserId())) {
				AppCache.userFundPwdErrorRecord.remove(onlineUser.getUserId());
			}
			String userid = onlineUser.getUserId();
			List<BankCard> bankCards = userServcieImpl.getBankInfo(userid, cardID);
			if (bankCards != null && bankCards.size() > 0) {
				data.put("cardInfo", bankCards.get(0));
				jsonResult.setData(data);

			} else {
				jsonResult = JsonResult.createFalied(i18n.get("msg.common.systemError"));
				log.error("调用[platform]手机服务端[" + iterface + "]接口返回数据为空");
			}
		} catch (Exception e) {
			jsonResult = JsonResult.createFalied(i18n.get("msg.common.systemError"));
			log.error("调用[platform]手机服务端[" + iterface + "]接口处理异常.", e);
		}
		return jsonResult;
	}

	/**
	 * 添加银行卡资料
	 * 
	 * @param userInfo
	 * @param session
	 * @return
	 */
	@At("/user/addBankCardInfo")
	@Ok("json")
	public Object addBankCardInfo(@Param("bankname") String bankname, @Param("province") String province, @Param("city") String city, @Param("branchDetail") String branchDetail,
			@Param("cardNo") String cardNo, @Param("bankid") String bankid, @Param("accsp") String accsp, @Param("orgname") String orgname, @Param("orgAccount") String orgAccount,
			@Param("orgId") String orgId, HttpServletRequest request, HttpSession session) {
		JsonResult jsonResult = JsonResult.createSuccess();
		String iterface = "operateBankCard";
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");

		UserInfo onlineUser = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
		UserInfo userInfo = userServcieImpl.getUserInfo(onlineUser.getAccoutName(), 1);
		if (onlineUser.getUserStatus() == Constants.USER_STATUS.USERSTATUS_FREEZE.getCode()) {
			return JsonResult.createFalied(i18n.get("msg.common.userStsFreeze"));
		}
		cardNo = BASE64Util.getFromBASE64(cardNo).replace(" ", "");
		String userid = onlineUser.getUserId();
		String result[] = this.operateBankCard(bankname, province, city, branchDetail, cardNo, null, bankid, userid, accsp, null, null, 1, orgname, orgAccount, orgId).split(",");
		String resultCode = result[0];

		if (!resultCode.equals(Constants.SUCCESS)) {
			if (resultCode.equals(Constants.EXISTBANKCARDNUMBER)) {
				jsonResult = JsonResult.createFalied(i18n.get("msg.portal.existBankNum"));
			} else if (resultCode.equals(Constants.NOUSER)) {
				jsonResult = JsonResult.createFalied(i18n.get("msg.portal.noUser"));
			} else if (resultCode.equals(Constants.MAX_CARD_NUM_LIMIT)) {
				jsonResult = JsonResult.createFalied(i18n.get("msg.portal.maxCardLimit"));
			} else {
				return JsonResult.createFalied(i18n.get("msg.common.systemError"));
			}
			log.error("调用[platform]手机服务端[" + iterface + "]接口返回数据:" + resultCode);
		} else {
			String cardid = result[1];
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("cardid", cardid);
			jsonResult.setData(map);
		}

		return jsonResult;
	}

	/**
	 * 修改银行卡资料
	 * 
	 * @param userInfo
	 * @param session
	 * @return
	 */
	@At("/user/updateBankCardInfo")
	@Ok("json")
	public Object updateBankCardInfo(@Param("bankname") String bankname, @Param("province") String province, @Param("city") String city, @Param("branchDetail") String branchDetail,
			@Param("cardId") String cardID, @Param("cardNo") String cardNo, @Param("trueName") String trueName, @Param("bankid") String bankid, @Param("accsp") String accsp,
			@Param("orgname") String orgname, @Param("orgAccount") String orgAccount, @Param("orgId") String orgId, HttpServletRequest request, HttpSession session) {
		JsonResult jsonResult = JsonResult.createSuccess();
		String iterface = "operateBankCard";
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");

		UserInfo onlineUser = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
		UserInfo userInfo = userServcieImpl.getUserInfo(onlineUser.getAccoutName(), 1);
		if (onlineUser.getUserStatus() == Constants.USER_STATUS.USERSTATUS_FREEZE.getCode()) {
			return JsonResult.createFalied(i18n.get("msg.common.userStsFreeze"));
		}
		cardNo = BASE64Util.getFromBASE64(cardNo).replace(" ", "");
		String userid = onlineUser.getUserId();
		String fundPwd = userInfo.getFundPwd();
		String resultCode = this.operateBankCard(bankname, province, city, branchDetail, cardNo, trueName, bankid, userid, accsp, cardID, null, 2, orgname, orgAccount, orgId);
		if (!resultCode.equals(Constants.SUCCESS)) {
			if (resultCode.equals(Constants.EXISTBANKCARDNUMBER)) {
				jsonResult = JsonResult.createFalied(i18n.get("msg.portal.existBankNum"));
			} else if (resultCode.equals(Constants.NOUSER)) {
				jsonResult = JsonResult.createFalied(i18n.get("msg.portal.noUser"));
			} else {
				return JsonResult.createFalied(i18n.get("msg.common.systemError"));
			}
			log.error("调用[platform]手机服务端[" + iterface + "]接口返回数据:" + resultCode);
		}

		return jsonResult;
	}

	/**
	 * 删除银行卡资料
	 * 
	 * @param userInfo
	 * @param session
	 * @return
	 */
	@At("/user/delBankCard")
	@Ok("json")
	public Object delBankCard(@Param("cardID") String cardId, HttpServletRequest request, HttpSession session) {
		JsonResult jsonResult = JsonResult.createSuccess();
		String iterface = "operateBankCard";
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");

		UserInfo onlineUser = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
		if (onlineUser.getUserStatus() == Constants.USER_STATUS.USERSTATUS_FREEZE.getCode()) {
			return JsonResult.createFalied(i18n.get("msg.common.userStsFreeze"));
		}
		String resultCode = this.operateBankCard(null, null, null, null, null, null, null, null, null, cardId, null, 4, null, null, null);
		if (!resultCode.equals(Constants.SUCCESS)) {
			if (resultCode.equals(Constants.EXISTBANKCARDNUMBER)) {
				jsonResult = JsonResult.createFalied(i18n.get("msg.portal.existBankNum"));
			} else if (resultCode.equals(Constants.NOUSER)) {
				jsonResult = JsonResult.createFalied(i18n.get("msg.portal.noUser"));
			} else {
				return JsonResult.createFalied(i18n.get("msg.common.systemError"));
			}
			log.error("调用[platform]手机服务端[" + iterface + "]接口返回数据:" + resultCode);
		}

		return jsonResult;
	}

	private String operateBankCard(String bankname, String province, String city, String branchDetail, String cardNo, String trueName, String bankid, String userid, String accsp, String bankCardId,
			String fundPwd, int opt, String orgname, String orgAccount, String orgId) {
		String iterface = "operateBankCard";
		String resultCode = "";
		try {
			Document outDoc = DocumentHelper.createDocument();// 需要输出的xml节点
			Element rootElm = outDoc.addElement("req");
			rootElm.addAttribute("t", opt + "");// 操作说明 1、新增 2、修改 3、删除
			Element recElm = rootElm.addElement("rec");
			if (!StringUtil.isEmpty(userid)) {
				recElm.addAttribute("uid", userid);// 用户ID
			}
			if (!StringUtil.isEmpty(branchDetail)) {
				recElm.addAttribute("subnm", branchDetail);// 支行名称
			}
			if (!StringUtil.isEmpty(province)) {
				recElm.addAttribute("pro", province);// 省，州，府
			}
			if (!StringUtil.isEmpty(city)) {
				recElm.addAttribute("cty", city);// 城市
			}
			if (!StringUtil.isEmpty(cardNo)) {
				recElm.addAttribute("crdnm", cardNo.replace(" ", ""));// 银行卡号
			}
			if (!StringUtil.isEmpty(accsp)) {
				recElm.addAttribute("accsp", accsp);// 提款方式6、中介机构7、银行机构
			}
			if (!StringUtil.isEmpty(bankid)) {
				recElm.addAttribute("bnkid", bankid);// 银行ID
				recElm.addAttribute("bnknm", bankname);// 银行名称
			}
			if (!StringUtil.isEmpty(bankCardId)) {
				recElm.addAttribute("crid", bankCardId);// 银行ID
			}
			if (!StringUtil.isEmpty(fundPwd)) {
				recElm.addAttribute("mnpwd", fundPwd);// 资金密码
			}
			if (!StringUtil.isEmpty(orgAccount)) {
				recElm.addAttribute("crdnm", orgAccount);// 机构帐号
			}
			if (!StringUtil.isEmpty(orgId)) {
				recElm.addAttribute("bnkid", orgId);// 机构ID
				recElm.addAttribute("bnknm", orgname);// 机构名称
			}
			String xml = outDoc.asXML();
			String response = cEPUserCenterIceClient.baseManagerZreocSrvIPrx(iterface, xml);
			if (response != null && !response.equals("")) {

				Document doc = DocumentHelper.parseText(response);
				Element root = doc.getRootElement();
				resultCode = root.attributeValue("st");
				if (!resultCode.equals(Constants.SUCCESS)) {
					log.info("调用[platform]手机服务端[" + iterface + "]请求报文：" + xml + "接口返回数据:" + response);
				} else {
					List<Element> childNodes = root.elements();
					if (childNodes.size() > 0) {
						Element reqElm = (Element) childNodes.get(0);
						if (reqElm.attributeValue("crid") != null && !reqElm.attributeValue("crid").equals("")) {
							resultCode += "," + reqElm.attributeValue("crid");
						}
					}
				}
			} else {
				log.error("调用[platform]手机服务端[" + iterface + "]请求报文：" + xml + "接口返回数据为空");
			}
		} catch (DocumentException e) {
			log.error("调用[platform]手机服务端[" + iterface + "]异常" + e);
		}
		return resultCode;
	}

	/**
	 * 修改银行卡资料时验证资金密码
	 * 
	 */
	@At("/user/valiFundPwd")
	@Ok("json")
	public Object valiFundPwd(@Param("fundPwd") String fundPwd, HttpServletRequest request, HttpSession session) {
		JsonResult jsonResult = JsonResult.createSuccess();
		String iterface = "operateBankCard";
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");

		UserInfo onlineUser = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
		if (onlineUser.getUserStatus() == Constants.USER_STATUS.USERSTATUS_FREEZE.getCode()) {
			return JsonResult.createFalied(i18n.get("msg.common.userStsFreeze"));
		}
		try {
			fundPwd = RSAUtil.decrypt(fundPwd);
		} catch (Exception e) {
			log.error("验证资金密码>>RSAUtil解码失败,用户名:" + onlineUser.getAccoutName() + ",密文:" + fundPwd, e);
		}
		fundPwd = PasswordEncoder.encode(onlineUser.getAccoutName(), MD5Util.md5(fundPwd));
		//fundPwd = PasswordEncoder.encode(onlineUser.getAccoutName(), fundPwd);
		// 从用户中心获取用户信息用于校验资金密码
		UserInfo currentUserInfo = userServcieImpl.getUserInfo(onlineUser.getAccoutName(), 1);
		if (currentUserInfo != null) {
			if (!currentUserInfo.getFundPwd().equals(fundPwd)) {
				return JsonResult.createFalied(i18n.get("msg.portal.currentPwdError"));
			}
		}

		return jsonResult;
	}

	/**
	 * 获取城市下拉框
	 * 
	 * @param userInfo
	 * @param session
	 * @return
	 */
	@At("/user/getCity")
	@Ok("json")
	public Object getCity(@Param("province") String province, HttpServletRequest request, HttpSession session) {
		JsonResult jsonResult = JsonResult.createSuccess();
		List<Dict> ls = AppCache.getI18nDictListByType(province);
		jsonResult.setList(ls);
		return jsonResult;
	}
	
	/**
	 * 检测银行卡信息是否使用
	 * 
	 * @param phoneNum
	 * @return
	 */
	@At("/out/user/checkCardExist")
	@Filters
	@Ok("raw")
	public boolean checkCardExist(String cardNum,String bankId,HttpSession session) {
		UserInfo onlineUser = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
		boolean exist = false;// 默认表示存在该账号
		if(cardNum==null||cardNum.equals("")||bankId==null||bankId.equals("")){
			return false;
		}
		HashMap<String, String> req = new HashMap<String, String>();
		HashMap<String, String> rec = new HashMap<String, String>();
		req.put("t", "7");// 操作说明 检测类接口 7、检测银行卡信息是否使用
		rec.put("crdnm", cardNum);// 银行卡号码
		rec.put("uid", onlineUser.getUserId());//用户ID
		rec.put("bnkid", bankId);//银行ID
		

		CheckInfo checkInfo = userServcieImpl.checkUserInfo(req, rec);
		if (checkInfo.getResultCode().equals(com.vinbet.mobile.util.Constants.SUCCESS)) {
			int isexist = Integer.parseInt(checkInfo.getIsExist());// 是否使用 0、未使用 1、已使用
			if (isexist == 0) {
				exist = true;
			}
		}
		return exist;
	}
}
