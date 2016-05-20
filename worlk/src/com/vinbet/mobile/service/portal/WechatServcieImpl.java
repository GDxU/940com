package com.vinbet.mobile.service.portal;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.Map.Entry;
import java.util.Set;

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

import com.alibaba.fastjson.JSONObject;
import com.vinbet.mobile.action.portal.CommonAction;
import com.vinbet.mobile.domain.UserInfo;
import com.vinbet.mobile.entity.portal.BankCard;
import com.vinbet.mobile.entity.portal.CheckInfo;
import com.vinbet.mobile.entity.portal.Dict;
import com.vinbet.mobile.entity.portal.Financer;
import com.vinbet.mobile.entity.portal.NavigationApp;
import com.vinbet.mobile.entity.portal.TotalWallet;
import com.vinbet.mobile.entity.portal.UserActivityInfo;
import com.vinbet.mobile.entity.portal.WalletCategory;
import com.vinbet.mobile.entity.portal.WalletInfo;
import com.vinbet.mobile.sys.AppCache;
import com.vinbet.mobile.sys.CEPMgrCenterClient;
import com.vinbet.mobile.sys.CEPPromotionCenterClient;
import com.vinbet.mobile.sys.CEPUserCenterIceClient;
import com.vinbet.mobile.sys.PropertiesLoader;
import com.vinbet.mobile.util.Constants;
import com.vinbet.mobile.util.CreateXmlUtil;
import com.vinbet.mobile.util.JsonResult;
import com.vinbet.mobile.util.StringUtil;
import com.vinbet.mobile.util.XMLBean;
import com.vinbet.mobile.util.Constants.DepositDrawTerminal;
import com.vinbet.mobile.util.wechatpay.CommonUtil;

/**
 * 用户中心服务层
 * 
 */
@IocBean
public class WechatServcieImpl {
	@Inject
	private PropertiesLoader propertiesLoader;
	private Log log = Logs.getLog(WechatServcieImpl.class);
	@Inject
	private CEPUserCenterIceClient cEPUserCenterIceClient;
	@Inject
	private CEPMgrCenterClient cEPMgrCenterClient;

	/**
	 * 微信扫码支付
	 * 
	 * @param params
	 * @param request
	 * @param session
	 * @return JsonResult 系统异常返回null
	 */
	public JsonResult wechatPay(Map<String, String> params, HttpServletRequest request, HttpSession session) {
		JsonResult jsonResult = JsonResult.createSuccess();
		String iterface = "cashUserInOutMoney";
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		try {
			UserInfo onlineUser = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
			TreeMap<String, String> wechatReq = new TreeMap<String, String>();
			String amt = params.get("amt");
			XMLBean xmlREQ = new XMLBean("req");
			xmlREQ.addttribute("tbnm", "GetPayAccount");
			xmlREQ.addttribute("type", "11"); //10、支付宝，11、微信扫码
			xmlREQ.addttribute("amount", amt);
			String mgrXml = xmlREQ.toXML();
			log.info("【手机前端调用管理中心ICE获取支付宝账号的请求报文为：】" + mgrXml);
			String mgrResXML = this.cEPMgrCenterClient.getSyncPrmtData(mgrXml);// 调用管理中心ice获取支付宝账号
			//mgrResXML = "<?xml version='1.0' encoding='UTF-8'?><resp st='1' msg='成功'><rec apaId='6501' apId='3503' account='422454541212152' accName='张飞飞' status='1' maxDepositAmt='218998' depositAmt='0' createDate='2015-12-11 14:21:16' createBy='0' modifyDate='2015-12-11 22:17:52' payType='10' payCurrency='CNY,THB,USD'/></resp>";
			log.info("【手机前端调用管理中心ICE获取支付宝账号的额度返回报文为：】" + mgrResXML);
			Document mgrDoc = DocumentHelper.parseText(mgrResXML);
			Element mgrRoot = mgrDoc.getRootElement();
			String mgrResultCode = mgrRoot.attributeValue("st");
			if (mgrResultCode.equals(Constants.SUCCESS)) {
				List<Element> childNodes = mgrRoot.elements();
				if (childNodes.size() > 0) {
					Element reqElm = (Element) childNodes.get(0);
					String mch_id = reqElm.attributeValue("accName");
					String appid = reqElm.attributeValue("account");
					String key = reqElm.attributeValue("apikey");
					String isAutoConfirm = reqElm.attributeValue("isautoconfirm");
					//Dict wechatDict = AppCache.getDictListByTypeId(Constants.WECHATPAY_DRAW_DAG).get(0);
					String apaId = reqElm.attributeValue("apaId");//微信账号ID
					String apId = reqElm.attributeValue("apId");//微信支付ID
					HashMap<String, String> req = new HashMap<String, String>();
					HashMap<String, String> rec = new HashMap<String, String>();
					req.put("t", Constants.DEPOSIT_APPLY);// 操作 1、存款 2、取款 3、修改支付中的状态
					rec.put("uid", onlineUser.getUserId());// 用户ID
					rec.put("nm", onlineUser.getTrueName());// 真实姓名
					rec.put("blsur", Constants.DEPOSIT_FROM_WAY);// 存提款来源,1-用户存款、2-公司修改(存款)、3-公司存入(客服代存)、4-公司提款(客服代提)、5-用户提款、6-公司修改(提款)
					rec.put("bltyp", Constants.BALANCE_TYPE_ALIPAY);// 存款类型,1-本地银行转账,2-支付平台,3-易支付,4-支付宝
					rec.put("paywy", "11");// 支付方式,1-网银转账、2-跨行转账、3-ATM柜员机、4-银行柜台、5-手机银行、6-中介机构、7-银行机构、8-在线存款、9-其他、10-支付宝、11-微信支付
					rec.put("mnt", onlineUser.getCurrencyName());// 币种
					rec.put("mny", amt);// 存取款金额
					rec.put("st", Constants.DRAWAL_APPLY_STATUS_PAYING);// 1、申请中5、支付中，此处填1
					rec.put("pytp", "1");// 支付类型 0-其它，1扫码支付
					rec.put("cmpbnk", apId);// 存入公司的银行或机构ID
					rec.put("bnkacc", apaId);// 存入公司的银行或机构帐号ID
					rec.put("trmnl", params.get("trmnl"));// 存款来源0-PC端，1-手机端
					String xml = CreateXmlUtil.createPublicReqXML(req, rec);
					String response = cEPUserCenterIceClient.moneyManagerZreocSrvIPrx(iterface, xml);
					if (response != null && !response.equals("")) {
						Document doc = DocumentHelper.parseText(response);
						Element root = doc.getRootElement();
						String resultCode = root.attributeValue("st");
						if (!resultCode.equals(Constants.SUCCESS)) {
							if (resultCode.equals(Constants.NO_AVAILABLE_BALANCE)) {
								jsonResult = JsonResult.createFalied(i18n.get("msg.portal.walletNoAvailMoney"));
							} else if (resultCode.equals(Constants.DRAWAL_STATUS_APPLYING)) {
								jsonResult = JsonResult.createFalied(i18n.get("msg.portal.norDepositProcessed"));
							} else if (resultCode.equals(Constants.NOUSER)) {
								jsonResult = JsonResult.createFalied(i18n.get("msg.portal.noUser"));
							} else if (resultCode.equals(Constants.DEPOSIT_NO_INRULES)) {
								jsonResult = JsonResult.createFalied(i18n.get("msg.portal.DepositforNoInRules"));
							} else {
								jsonResult = JsonResult.createFalied(i18n.get("msg.common.systemError"));
							}
							log.error("调用[platform]手机服务端[" + iterface + "]请求报文：" + xml + "接口返回数据:" + response);
						} else {
							String orderId = null;
							List<Element> dpChildNodes = root.elements();
							if (dpChildNodes.size() > 0) {
								Element dpreqElm = (Element) dpChildNodes.get(0);
								if (dpreqElm.attributeValue("strnm") != null && !dpreqElm.attributeValue("strnm").equals("")) {
									orderId = dpreqElm.attributeValue("strnm");
								}
							}
							try {
								HashMap<String, String> mgrReq = new HashMap<String, String>();
								mgrReq.put("amt", amt);
								mgrReq.put("tbnm", "weixinSubAmt");
								mgrReq.put("apaId", apaId);
								String submgrXml = CreateXmlUtil.createPublicReqXML(mgrReq, null);
								log.info("【手机前端调用管理中心ICE推送本次存款消耗的额度请求报文为：】" + submgrXml);
								String submgrResXML = this.cEPMgrCenterClient.getSyncPrmtData(submgrXml);// 调用管理中心ice推送本次存款消耗的额度
								log.info("【手机前端调用管理中心ICE推送本次存款消耗的额度返回报文为：】" + submgrResXML);
							} catch (Exception e) {
								log.info("手机前端调用管理中心ICE推送本次存款消耗的额度异常,异常订单号"+orderId);
								e.printStackTrace();
							}
							Dict wechatOrg = null;
							if(AppCache.getDictListByTypeId(Constants.WECHATPAY_DAG).size()>0){
								wechatOrg = AppCache.getDictListByTypeId(Constants.WECHATPAY_DAG).get(0);
							}
							if(wechatOrg==null){
								jsonResult =  JsonResult.createFalied(i18n.get("lable.portal.wechatDisable"));
								jsonResult.setR(5002081);
								return jsonResult;
							}
							String clientIp = CommonAction.getClientIp(request);
							wechatReq.put("mch_id", mch_id);//商户号
							wechatReq.put("appid", appid);//公众账号ID
							wechatReq.put("device_info", "WEB");//设备号 PC网页或公众号内支付请传"WEB"
							wechatReq.put("nonce_str", CommonUtil.createRandom(false, 32));//随机字符串
							wechatReq.put("body", orderId);//商品描述
							wechatReq.put("out_trade_no", orderId);//商户订单号
							wechatReq.put("total_fee", String.valueOf(Integer.parseInt(amt)*100));//总金额,单位为分 需*100转为元
							//wechatReq.put("total_fee", "1");//总金额,单位为分 需*100转为元
							wechatReq.put("spbill_create_ip", clientIp);//终端IP
							wechatReq.put("notify_url", wechatOrg.getCallbackAddr());//通知地址,接收微信支付异步通知回调地址，通知url必须为直接可访问的url，不能携带参数。
							wechatReq.put("trade_type", "NATIVE");//NATIVE 原生二维码支付
							wechatReq.put("product_id", orderId);//商户订单号
							wechatReq.put("key", key);//商户密钥
							String sign = CommonUtil.createSign(wechatReq);//根据密钥生成的签名
							wechatReq.put("sign", sign);//
							log.info("【手机前端调用微信API统一下单接口请求报文为：】" + wechatReq);
							String wechatRes = CommonUtil.httpsRequest(wechatOrg.getUrl(), "POST", CommonUtil.mapToXml(wechatReq)).toString();
							log.info("【手机前端调用微信API统一下单接口返回报文为：】" + wechatRes);
							Map<String,String> wechatMap = CommonUtil.xmlToMap(wechatRes);
							if(wechatMap.get("return_code").equals(Constants.WECHAT_SUCCESS)&&wechatMap.get("result_code").equals(Constants.WECHAT_SUCCESS)){
								String prepay_id = wechatMap.get("prepay_id");
								String code_url = wechatMap.get("code_url");
								Map<String, Object> mp = new HashMap<String, Object>();
								mp.put("code_url", code_url);
								mp.put("amt",amt);
								mp.put("orderid", orderId);
								jsonResult.setData(mp);
							}else{
								log.error("手机前端调用微信API统一下单接口异常,错误码："+wechatMap.get("return_code")+",错误信息："+wechatMap.get("return_msg"));
								 return jsonResult.createFalied("系统异常："+wechatMap.get("return_msg"));
							}
							/*Map<String, Dict> aliPayMap = AppCache.getAliPayMap();
							Dict aliPayDict = aliPayMap.get(params.get("thirdOrg"));
							depInfo.setOrderTime(System.currentTimeMillis());
							depInfo.setOrgName(aliPayDict.getDictName());
							depInfo.setNameOnCard(params.get("hbThirdTruename"));
							depInfo.setCardNo(params.get("hbThirdAccount"));
							depInfo.setSaveAmount(Double.parseDouble(params.get("thirdAmount")));
							depInfo.setCollectionType(1);
							AppCache.collecitonInfos.put(orderId, depInfo);*/
							// Map<String, Object> data = new HashMap<String,
							// Object>();
							// data.put("depInfo", depInfo);
							// jsonResult.setData(data);
						}
					} else {
						jsonResult = JsonResult.createFalied(i18n.get("msg.common.systemError"));
						log.error("调用[platform]手机服务端[" + iterface + "]请求报文：" + xml + "接口返回数据为空");
					}
				} else {
					jsonResult = JsonResult.createFalied(i18n.get("msg.portal.noAvailableAccount"));
					jsonResult.setR(5002080);
				}
			} else {
				jsonResult = JsonResult.createFalied(i18n.get("msg.portal.noAvailableAccount"));
				jsonResult.setR(5002080);
			}
			

		} catch (Exception e) {
			log.error("调用[platform]手机服务端[" + iterface + "]接口处理异常.", e);
			jsonResult = JsonResult.createFalied(i18n.get("msg.common.systemError"));
		}
		return jsonResult;
	}

	
}
