package com.vinbet.mobile.action.portal;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
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
import com.vinbet.mobile.entity.portal.Dict;
import com.vinbet.mobile.entity.portal.FundDetail;
import com.vinbet.mobile.entity.portal.WalletCategory;
import com.vinbet.mobile.sys.AppCache;
import com.vinbet.mobile.sys.CEPUserCenterIceClient;
import com.vinbet.mobile.sys.PropertiesLoader;
import com.vinbet.mobile.util.BASE64Util;
import com.vinbet.mobile.util.CheckSession;
import com.vinbet.mobile.util.Constants;
import com.vinbet.mobile.util.Constants.DepositDrawTerminal;
import com.vinbet.mobile.util.CreateXmlUtil;
import com.vinbet.mobile.util.JsonResult;

/**
 * Created by Ray on 2014/12/13.
 */
@IocBean(singleton = false)
@At("/user/history")
@Filters(@By(type = CheckSession.class, args = { "USER_SESSION", "/timeout" }))
public class HistoryAction {
	@Inject
	private PropertiesLoader propertiesLoader;
	@Inject
	private CreateXmlUtil createXmlUtil;
	@Inject
	private CEPUserCenterIceClient cEPUserCenterIceClient;
	private Log log = Logs.getLog(UserAction.class);

	@At("/")
	@Ok("jsp:page.portal.history")
	public Object history() {
		HashMap<String, Object> obj = new HashMap<String, Object>();
		List<Dict> status = AppCache.getI18nDictListByType("fundsStatus");
		obj.put("status", status);
		List<Dict> actionType = AppCache.getI18nDictListByType("actionType");
		obj.put("actionType", actionType);
		return obj;
	}

	@At("/api/?/?/?/?")
	@Ok("json")
	public Object api(String type, String bt, String et, int page, HttpSession session) {
		if (bt == null || bt.equals("") || "undefined".equals(bt) || et == null || et.equals("") || "undefined".equals(et)) {
			log.info("资金明细查询时间段为空,导致查询失败.");
			return JsonResult.createFalied();
		}
		UserInfo user = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
		String iterface = "fundDetail";
		HashMap<String, String> req = new HashMap<String, String>();
		HashMap<String, String> rec = new HashMap<String, String>();
		List<FundDetail> fundDetails = new ArrayList<FundDetail>();
		JsonResult jsonResult = JsonResult.createSuccess();
		req.put("lg", "zh");
		rec.put("uid", user.getUserId());
		if (!type.equals("4")) {
			// 1_W_SSC 时时彩钱包,1_W_HK 香港彩钱包,0_W_FCT 翡翠厅钱包,0_W_HJT 皇家厅钱包,0_W_CENTER 中心钱包,1_W_HDYX 测试游戏钱包
			rec.put("watyp", Constants.WALLLET_TYPE_CENTER);
		}
		rec.put("otyp", type);// 1.存款/提款2.存款3.提款4.划入/划出5.划入6.划出7.余额修正
		// rec.put("optst", "");//1.申请中2.支付中3.待定4.通过5.不通过6.通过异常
		rec.put("bgtm", bt + " 0:0:0");// 申请开始时间
		rec.put("pndtm", et + " 23:59:59");// 申请结束时间
		rec.put("pgnm", String.valueOf(page < 1 ? 1 : page));
		rec.put("pgsz", "200");
		rec.put("unm", user.getAccoutName());
		rec.put("utyp", String.valueOf(user.getUserType()));
		String reqXml = CreateXmlUtil.createPublicReqXML(req, rec);
		// log.info("fundDetail===>" + reqXml);
		String response = cEPUserCenterIceClient.baseManagerZreocSrvIPrx(iterface, reqXml);
		try {
			if (response != null && !response.equals("")) {
				Document doc = DocumentHelper.parseText(response);
				Element root = doc.getRootElement();
				String resultCode = root.attributeValue("st");
				if (resultCode.equals(Constants.SUCCESS)) {
					List<Element> childNodes = root.elements();
					if (childNodes.size() > 0) {
						for (Element reqElm : childNodes) {
							FundDetail fundDetail = new FundDetail();
							fundDetail.setApplyTime(reqElm.attributeValue("prctm"));
							fundDetail.setProcTime(reqElm.attributeValue("ppytm"));
							fundDetail.setOptType(reqElm.attributeValue("optp"));
							fundDetail.setOptType(type);
							fundDetail.setOptMoney(reqElm.attributeValue("optmy"));
							fundDetail.setChangeMoney(reqElm.attributeValue("rgmny"));
							fundDetail.setRealMoney(reqElm.attributeValue("rlmny"));
							fundDetail.setBalance(reqElm.attributeValue("ftmny"));
							fundDetail.setRemark(reqElm.attributeValue("rmk"));
							fundDetail.setStatus(reqElm.attributeValue("st"));
							fundDetail.setOpter(reqElm.attributeValue("optr"));
							fundDetail.setOrderId(reqElm.attributeValue("strnm"));
							fundDetail.setUtacc(reqElm.attributeValue("utacc"));
							fundDetail.setInacc(reqElm.attributeValue("inacc"));
							fundDetail.setAccmny(reqElm.attributeValue("accmny"));

							fundDetails.add(fundDetail);
						}
					}
				}
			} else {
				log.error("调用[platform]手机服务端[" + iterface + "]请求报文：" + reqXml + "接口返回数据为空");
				return JsonResult.createFalied();
			}
		} catch (DocumentException e) {
			log.error("调用[platform]手机服务端[" + iterface + "]请求报文：" + reqXml + "接口返回数据");
		}
		jsonResult.setList(fundDetails);
		Map<String, WalletCategory> walletDict = AppCache.getWalletCategoryMap();
		Map<String, WalletCategory> newWalletDict = new HashMap<String, WalletCategory>();
		for (String key : walletDict.keySet()) {
			newWalletDict.put(key, new WalletCategory());
			String iid = walletDict.get(key).getIid();
			String oldName = walletDict.get(key).getWalletName();
			String name = AppCache.getI18nInfo(iid, oldName);
			try {
				newWalletDict.get(key).setWalletName("{[{" + BASE64Util.getBASE64(name) + "}]}");
			} catch (UnsupportedEncodingException e) {
			}
		}
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("walletDict", newWalletDict);
		jsonResult.setData(data);
		return jsonResult;
	}

	/**
	 * 修改支付中状态
	 * 
	 * @param
	 * @return
	 */
	@At("/updatePayStatus")
	@Ok("json")
	public JsonResult updatePayStatus(@Param("strnm") String strnm, @Param("status") String status, HttpServletRequest request, HttpSession session) {
		JsonResult jsonResult = JsonResult.createSuccess();
		String iterface = "cashUserInOutMoney";
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		UserInfo user = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
		/*
		 * if (user.getUserStatus() == Constants.USER_STATUS.USERSTATUS_FREEZE.getCode()) { return
		 * JsonResult.createFalied(i18n.get("msg.common.userStsFreeze")); }
		 */
		if (!status.equals("1") && !status.equals("7")) {
			return JsonResult.createFalied(i18n.get("msg.common.systemError"));
		}
		try {
			Document outDoc = DocumentHelper.createDocument();// 需要输出的xml节点
			Element rootElm = outDoc.addElement("req");
			rootElm.addAttribute("t", Constants.DEPOSIT_CHANGE_STATUS);// 操作 1、存款 2、取款 3、修改支付中的状态
			Element recElm = rootElm.addElement("rec");
			recElm.addAttribute("uid", user.getUserId());// 用户ID
			recElm.addAttribute("nm", user.getTrueName());// 真实姓名
			recElm.addAttribute("st", status);// 1、申请中
			recElm.addAttribute("strnm", strnm);// 订单号
			recElm.addAttribute("optid", user.getUserId());// 操作员ID
			recElm.addAttribute("optnm", user.getAccoutName());// 操作员帐号
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
						jsonResult = JsonResult.createFalied(i18n.get("msg.portal.DepositforNoInRules"));
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

}
