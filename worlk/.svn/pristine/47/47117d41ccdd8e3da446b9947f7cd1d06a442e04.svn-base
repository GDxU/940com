package com.vinbet.mobile.service.portal;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;

import com.alibaba.fastjson.JSONObject;
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
import com.vinbet.mobile.util.StringUtil;

/**
 * 用户中心服务层
 * 
 */
@IocBean
public class UserServcieImpl {
	@Inject
	private PropertiesLoader propertiesLoader;
	private Log log = Logs.getLog(UserServcieImpl.class);
	@Inject
	private CEPUserCenterIceClient cEPUserCenterIceClient;
	@Inject
	private CEPMgrCenterClient cEPMgrCenterClient;
	@Inject
	private CEPPromotionCenterClient cEPPromotionCenterClient;

	/**
	 * 获取用户基本信息
	 * 
	 * @param userName
	 * @param userType
	 *            1 为现金用户 2是信用用户
	 * @return userInfo 系统异常返回null
	 */
	public UserInfo getUserInfo(String userName, int userType) {
		UserInfo userInfo = null;
		try {
			// 组装报文
			String reqXml = getUserInfoXml(userName, userType);
			String response = cEPUserCenterIceClient.baseManagerZreocSrvIPrx("userinfoQuery", reqXml);
			if (response != null && !response.equals("")) {
				Document doc = DocumentHelper.parseText(response);
				Element root = doc.getRootElement();
				String resultCode = root.attributeValue("st");

				if (resultCode.equals(Constants.SUCCESS)) {

					List<Element> childNodes = root.elements();
					if (childNodes.size() > 0) {
						Element reqElm = (Element) childNodes.get(0);
						userInfo = new UserInfo();
						userInfo.setUserId(reqElm.attributeValue("uid"));
						userInfo.setAccoutName(reqElm.attributeValue("unm"));
						userInfo.setBirthdate(reqElm.attributeValue("bthdy"));
						userInfo.setCountry(reqElm.attributeValue("ntlty"));
						List<Dict> ls = AppCache.getI18nDictListByType(Constants.NATIONALITY);
						for (Dict dict : ls) {
							if (dict.getDictCode().equals(userInfo.getCountry())) {
								userInfo.setCountryName(dict.getDictName());
							}
						}

						userInfo.setCreateIp(reqElm.attributeValue("regip"));
						String currencyname = reqElm.attributeValue("mnt");
						userInfo.setCurrencyName(currencyname);
						if (currencyname.equals("CNY")) {
							userInfo.setCurrencyType(1);
						} else if (currencyname.equals("THB")) {
							userInfo.setCurrencyType(2);
						}
						userInfo.setEmail(reqElm.attributeValue("eml"));
						userInfo.setEmailStatus(reqElm.attributeValue("emlmrk"));
						userInfo.setMobile(reqElm.attributeValue("phnm"));
						userInfo.setMobileStatus(reqElm.attributeValue("phmrk"));
						userInfo.setInterTelCode(reqElm.attributeValue("arcd"));
						userInfo.setUserStatus(Integer.parseInt(reqElm.attributeValue("ust")));
						List<Dict> status = AppCache.getI18nDictListByType("account_status");
						for (Dict dict : status) {
							if (Integer.parseInt(dict.getDictCode()) == userInfo.getUserStatus()) {
								userInfo.setStatusName(dict.getDictName());
							}
						}
						userInfo.setRegistTime(reqElm.attributeValue("regtm"));
						userInfo.setLastLoginTime(reqElm.attributeValue("lsttm"));
						userInfo.setLastLoginIp(reqElm.attributeValue("lstip"));
						userInfo.setUserType(Integer.parseInt(reqElm.attributeValue("utyp")));
						userInfo.setFundPwd(reqElm.attributeValue("mnpwd"));
						userInfo.setTrueName(reqElm.attributeValue("lstnm") + reqElm.attributeValue("fstnm"));
						userInfo.setNickName(reqElm.attributeValue("ncknm"));
						userInfo.setAddress(reqElm.attributeValue("pro"));
						userInfo.setSex(reqElm.attributeValue("sex"));
						userInfo.setSurName(reqElm.attributeValue("lstnm"));
						userInfo.setGivenName(reqElm.attributeValue("fstnm"));
						userInfo.setAppauth(reqElm.attributeValue("appauth"));
						userInfo.setIsNameChanged(reqElm.attributeValue("nmchg"));
						userInfo.setIsSetFundPwd(reqElm.attributeValue("mnymrk"));
						userInfo.setRef(reqElm.attributeValue("ref"));
					} else {
						log.error("调用[platform]手机服务端[用户查询userinfoQuery]请求报文：" + reqXml + "接口返回数据:" + response.replace("\n", ""));
					}
				} else {
					log.error("调用[platform]手机服务端[用户查询userinfoQuery]请求报文：" + reqXml + "接口返回数据:" + response);
				}
			} else {
				log.error("调用[platform]手机服务端[用户查询userinfoQuery]请求报文：" + reqXml + "接口返回数据:" + response);
			}
		} catch (Exception e) {
			log.error("调用[platform]手机服务端[用户查询userinfoQuery]接口处理异常.", e);
		}
		return userInfo;
	}

	/**
	 * 获取用户银行卡集合信息
	 * 
	 * @param userID
	 * @param cardID
	 *            银行卡ID
	 * @return userInfo 系统异常返回null
	 */
	public List<BankCard> getBankInfo(String userID, String cardID) {
		List<BankCard> bankCardList = null;
		try {
			// 组装报文
			String reqXml = getBankInfoXml(userID, cardID);
			String response = cEPUserCenterIceClient.baseManagerZreocSrvIPrx("bankCardQuery", reqXml);

			if (response != null && !response.equals("")) {
				Document doc = DocumentHelper.parseText(response);
				Element root = doc.getRootElement();
				String resultCode = root.attributeValue("st");

				if (resultCode.equals(Constants.SUCCESS)) {
					bankCardList = new ArrayList<BankCard>();
					List<Element> childNodes = root.elements();

					if (childNodes.size() > 0) {
						for (Element reqElm : childNodes) {
							BankCard bankCard = new BankCard();
							bankCard.setBankId(reqElm.attributeValue("bnkid"));
							bankCard.setBankName(reqElm.attributeValue("bnknm"));
							bankCard.setCardNumber(reqElm.attributeValue("crdnm"));
							bankCard.setCity(reqElm.attributeValue("cty"));
							bankCard.setProvincial(reqElm.attributeValue("pro"));
							bankCard.setWithdrawalWay(reqElm.attributeValue("accsp"));
							bankCard.setCreateDate(reqElm.attributeValue("crttm"));
							bankCard.setOpeningOutlets(reqElm.attributeValue("subnm"));
							bankCard.setId(reqElm.attributeValue("crdid"));
							bankCard.setCardNumFmt(StringUtil.formatCardNo(bankCard.getCardNumber()));
							bankCard.setIndex(reqElm.attributeValue("index"));
							bankCard.setOptpmt(reqElm.attributeValue("optpmt"));
							bankCardList.add(bankCard);
						}

					} else {
						log.error("调用[platform]手机服务端[bankCardQuery]请求报文：" + reqXml + "接口返回数据:" + response.replace("\n", ""));
					}
				}
			} else {
				log.error("调用[platform]手机服务端[bankCardQuery]请求报文：" + reqXml + "接口返回数据:" + response);
			}
		} catch (Exception e) {
			log.error("调用[platform]手机服务端[bankCardQuery]接口处理异常.", e);
		}
		return bankCardList;
	}

	/**
	 * 处理获取用户信息接口，平台接口返回异常数据的问题
	 * <p>
	 * 异常数据：{"128":{"userName":"000200","currencyType":"1","email":"330635652@qq.com","emailIsValid":"0","iscash":"1","mobile":"13622370673",
	 * "trueName"
	 * :"杨海波","userStatus":"0","createIp":"119.126.147.44","createTime":"2015-01-14 00:49:01.0","agentId":"112493","userId":"166685","birthdate"
	 * :"null","address":"null,null","nationalNumber":"null","country":"null"},"code":160000,"description":"success"}
	 * </p>
	 * 
	 * @param jsonObject
	 * @return
	 */
	private String handleUserInfoAbnormal(JSONObject jsonObject) {
		for (String set : jsonObject.keySet()) {
			Object obj = jsonObject.get(set);
			if (obj instanceof JSONObject && ((JSONObject) obj).containsKey("userName")) {
				return obj.toString();
			}
		}
		return null;
	}

	private String getUserInfoXml(String username, int userType) {
		// 拼装返回结果
		Document outDoc = DocumentHelper.createDocument();// 需要输出的xml节点
		Element rootElm = outDoc.addElement("req");
		Element recElm = rootElm.addElement("rec");
		try {
			recElm.addAttribute("unm", username);// 货币单位
			recElm.addAttribute("utyp", userType + "");// 国籍
		} catch (Exception e) {
			log.error("组装[获取用户信息userinfoQuery]接口报文处理异常.", e);
		}
		return outDoc.asXML();
	}

	private String getBankInfoXml(String userID, String cardID) {
		// 拼装返回结果
		Document outDoc = DocumentHelper.createDocument();// 需要输出的xml节点
		Element rootElm = outDoc.addElement("req");
		Element recElm = rootElm.addElement("rec");
		try {
			recElm.addAttribute("uid", userID);// userid
			if (cardID != null) {
				recElm.addAttribute("id", cardID);// cardID
			}
			recElm.addAttribute("qal", "1");// 是否查询所有银行卡
		} catch (Exception e) {
			log.error("组装[获取获取银行卡信息getBankInfo]接口报文处理异常.", e);
		}
		return outDoc.asXML();
	}

	/**
	 * 获取财务员信息
	 * 
	 * @param orgName
	 * @param orgID
	 * @return userInfo 系统异常返回null
	 */
	public Financer getFinancer(String orgType, String orgID) {
		Financer financer = null;
		try {
			// 组装报文

			Document outDoc = DocumentHelper.createDocument();// 需要输出的xml节点
			Element rootElm = outDoc.addElement("req");
			Element recElm = rootElm.addElement("rec");
			try {
				rootElm.addAttribute("wdoid", orgID);// 机构ID
				rootElm.addAttribute("wdotype", orgType);// 机构类型
			} catch (Exception e) {
				log.error("组装[获取财务审核员retTreasureData]接口报文处理异常.", e);
			}

			String reqXml = outDoc.asXML();

			String response = cEPMgrCenterClient.retTreasureData(reqXml);

			if (response != null && !response.equals("")) {
				Document doc = DocumentHelper.parseText(response);
				Element root = doc.getRootElement();
				String resultCode = root.attributeValue("st");

				if (resultCode.equals(Constants.SUCCESS)) {

					List<Element> childNodes = root.elements();
					if (childNodes.size() > 0) {
						Element reqElm = (Element) childNodes.get(0);
						financer = new Financer();
						financer.setId(reqElm.attributeValue("userid"));
						financer.setName(reqElm.attributeValue("username"));

					} else {
						log.error("调用[platform]手机服务端[获取财务审核员retTreasureData]请求报文：" + reqXml + "接口返回数据:" + response.replace("\n", ""));
					}
				}
			} else {
				log.error("调用[platform]手机服务端[获取财务审核员retTreasureData]请求报文：" + reqXml + "接口返回数据:" + response);
			}
		} catch (Exception e) {
			log.error("调用[platform]手机服务端[用户查询userinfoQuery]接口处理异常.", e);
		}
		return financer;
	}

	/**
	 * 获取资金概况
	 * 
	 * @param reqxml
	 * @return TotalWallet 系统异常返回null
	 */
	public TotalWallet getBalance(String reqxml, String walletType, UserInfo userInfo) {
		TotalWallet totalWallet = null;
		try {
			String response = cEPUserCenterIceClient.baseManagerZreocSrvIPrx("walletBalance", reqxml);

			if (response != null && !response.equals("")) {
				Document doc = DocumentHelper.parseText(response);
				Element root = doc.getRootElement();
				String resultCode = root.attributeValue("st");
				if (resultCode.equals(Constants.SUCCESS)) {
					processAct(doc, userInfo);
					totalWallet = new TotalWallet();
					List<Element> childNodes = root.elements();
					if (childNodes.size() > 0) {
						List<WalletInfo> walletInfos = new ArrayList<WalletInfo>();
						double sumall = 0;
						double sumdrw = 0;
						double sumact = 0;
						totalWallet.setFreezeMoney(root.attributeValue("fremny"));
						for (int i = 0; i < childNodes.size(); i++) {
							Element reqElm = childNodes.get(i);
							/*
							 * if(i==childNodes.size()-1){ //如果钱包类别为空，则表示获取所有钱包信息，需要获取合计信息 if(walletType==null){
							 * totalWallet.setTotalBalance(root.attributeValue("sumApp"));
							 * totalWallet.setSumAllStatistics(reqElm.attributeValue("sumall"));
							 * totalWallet.setDrawableMoneyStatistics(reqElm.attributeValue("sumdrw"));
							 * totalWallet.setActivityMoneyStatistics(reqElm.attributeValue("sumact")); break; } }
							 */
							WalletInfo walletInfo = new WalletInfo();
							walletInfo.setWalletCategory(reqElm.attributeValue("watyp"));
							walletInfo.setDrawableMoney(reqElm.attributeValue("abldrw"));
							walletInfo.setActivityMoney(reqElm.attributeValue("acmny"));
							walletInfo.setIid(reqElm.attributeValue("iid"));
							walletInfo.setTotalMoney(reqElm.attributeValue("summny"));
							walletInfo.setCurrency(reqElm.attributeValue("mnt"));
							walletInfo.setWalletStatus(reqElm.attributeValue("wst"));
							if (reqElm.attributeValue("watyp").equals(Constants.WALLLET_TYPE_CENTER)) {
								walletInfos.add(walletInfo);
								if (reqElm.attributeValue("wst") == null) {
									sumact += Double.parseDouble(walletInfo.getActivityMoney());
									sumdrw += Double.parseDouble(walletInfo.getDrawableMoney());
									sumall += Double.parseDouble(walletInfo.getTotalMoney());
								}
							} else {
								String[] auth = userInfo.getAppauth().split(",");
								Map<String, NavigationApp> map = AppCache.getNavigationAppMap();
								for (String str : auth) {
									NavigationApp navigationApp = map.get(str.trim() + Constants.USERTYPE_CASH);
									if (navigationApp != null) {
										if (!com.vinbet.mobile.util.Constants.USERTYPE_CREDIT.equals(navigationApp.getApptype())) {
											if (navigationApp.getAppmark().equals(str.trim())) {
												WalletCategory wallet = AppCache.getWalletCategoryMap().get(navigationApp.getWalletcategory());
												if (wallet != null) {
													if (wallet.getWalletCategory().equals(walletInfo.getWalletCategory())) {
														if (wallet.getCurrency().contains(userInfo.getCurrencyName())) {
															// 判断钱包状态是否为维护中
															if (wallet.getStatus().equals("1")) {
																walletInfos.add(walletInfo);
																if (reqElm.attributeValue("wst") == null) {
																	sumact += Double.parseDouble(walletInfo.getActivityMoney());
																	sumdrw += Double.parseDouble(walletInfo.getDrawableMoney());
																	sumall += Double.parseDouble(walletInfo.getTotalMoney());
																}
															}
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
						DecimalFormat decimalFormat = new DecimalFormat("0.00");
						totalWallet.setTotalBalance(String.valueOf(decimalFormat.format(sumall)));
						totalWallet.setSumAllStatistics(String.valueOf(decimalFormat.format(sumall)));
						totalWallet.setDrawableMoneyStatistics(String.valueOf(decimalFormat.format(sumdrw)));
						totalWallet.setActivityMoneyStatistics(String.valueOf(decimalFormat.format(sumact)));
					} else {
						log.error("调用[platform]手机服务端[获取钱包余额walletBalance]请求报文：" + reqxml + "接口返回数据:" + response.replace("\n", ""));
					}
				}
			} else {
				log.error("调用[platform]手机服务端[获取钱包余额walletBalance]请求报文：" + reqxml + "接口返回数据:" + response);
			}
		} catch (Exception e) {
			log.error("调用[platform]手机服务端[钱包余额walletBalance]接口处理异常.", e);
		}
		return totalWallet;
	}

	private void processAct(Document dom, UserInfo userInfo) {
		try {
			// 获取参该用户参与的活动curActMap
			Set<String> zeroBlns = new HashSet<String>();
			Map<String, Map<String, Double>> curActMap = markCurActMap(dom, userInfo, zeroBlns);
			if (!curActMap.isEmpty()) {
				log.info("processAct:获取到curActMap," + curActMap.toString());
				// 调用活动中心接口
				String reqXML = makeActBak1ReqXml(curActMap, userInfo, zeroBlns);
				log.info("processAct:调用活动中心," + reqXML);
				String resXML = cEPPromotionCenterClient.promotionCenterZreocSrvIPrx("bakFace1", reqXML);
				log.info("processAct:调用活动中心结果," + resXML);
				// 构建需要修正的金额项到wcChangeMap
				Map<String, String> retMap = makeRetMap(resXML);
				Map<String, Double> wcChangeMap = makeWcChangeMap(curActMap, retMap);
				log.info("processAct:需要修正的钱包以及金额," + wcChangeMap.toString());
				// 遍历wcChangeMap修改DOM模型
				if (!wcChangeMap.isEmpty()) {
					changeCapitalDom(dom, wcChangeMap);
				}
				log.info("processAct:修正后的DOM报文," + dom.asXML());
			}
		} catch (Exception e) {
			log.error("processAct:针对用户" + userInfo.getAccoutName() + "的活动情况，修正钱包金额出现异常，用户看到的资金概况可能不准确。忽略此问题继续处理。" + e.toString());
		}

	}

	private Map<String, Map<String, Double>> markCurActMap(Document dom, UserInfo userInfo, Set<String> zeroBlns) {
		Map<String, Map<String, Double>> curActMap = new HashMap<String, Map<String, Double>>();
		Map<String, Double> wcActMap = null;
		Map<String, List<UserActivityInfo>> userActMap = null;
		Iterator<Map.Entry<String, List<UserActivityInfo>>> iterUserActMap = null;
		List<UserActivityInfo> list = null;
		List<Element> eleList = dom.getRootElement().elements();
		double acmny = 0;
		Double actAmt = null;
		double bln = 0;
		for (Element rec : eleList) {
			acmny = Double.parseDouble(rec.attributeValue("acmny"));
			if (acmny > 0) {
				bln = Double.parseDouble(rec.attributeValue("summny"));
				wcActMap = curActMap.get(rec.attributeValue("watyp"));
				if (wcActMap == null) {
					wcActMap = new HashMap<String, Double>();
					curActMap.put(rec.attributeValue("watyp"), wcActMap);
				}
				userActMap = AppCache.getGameMap().get(rec.attributeValue("watyp"));
				iterUserActMap = userActMap.entrySet().iterator();
				while (iterUserActMap.hasNext()) {
					Map.Entry<java.lang.String, java.util.List<UserActivityInfo>> entry = (Map.Entry<java.lang.String, java.util.List<UserActivityInfo>>) iterUserActMap.next();
					list = entry.getValue();
					for (UserActivityInfo userActivityInfo : list) {
						if (userInfo.getUserId().equals(userActivityInfo.getUserId()) && "1".equals(userActivityInfo.getStatus())) {
							actAmt = wcActMap.get(userActivityInfo.getActivityNo());
							if (actAmt == null) {
								actAmt = new Double(0);
								wcActMap.put(userActivityInfo.getActivityNo(), actAmt);
							}
							wcActMap.put(userActivityInfo.getActivityNo(), actAmt.doubleValue() + Double.parseDouble(userActivityInfo.getAmt()));

							if (bln < 1 && !"-1".equals(rec.attributeValue("wst"))) {
								zeroBlns.add(userActivityInfo.getActivityNo());
							}
						}
					}
				}

			}
		}
		return curActMap;
	}

	private String makeActBak1ReqXml(Map<String, Map<String, Double>> curActMap, UserInfo userInfo, Set<String> zeroBlns) {
		Document document = DocumentHelper.createDocument();
		Element reqEle = document.addElement("req");
		reqEle.addAttribute("uid", userInfo.getUserId());
		reqEle.addAttribute("uname", userInfo.getAccoutName());
		reqEle.addAttribute("bln", "0");
		reqEle.addAttribute("trsc", "0");
		reqEle.addAttribute("cny", userInfo.getCurrencyName());
		Iterator<Entry<String, Map<String, Double>>> iterActs = curActMap.entrySet().iterator();

		Map<String, Double> wcActMap = null;
		Iterator<Entry<String, Double>> iterWcActMap = null;
		Element recEle = null;
		while (iterActs.hasNext()) {
			Map.Entry<java.lang.String, java.util.Map<java.lang.String, java.lang.Double>> entry = (Map.Entry<java.lang.String, java.util.Map<java.lang.String, java.lang.Double>>) iterActs.next();
			wcActMap = entry.getValue();
			iterWcActMap = wcActMap.entrySet().iterator();
			while (iterWcActMap.hasNext()) {
				Map.Entry<java.lang.String, java.lang.Double> entry2 = (Map.Entry<java.lang.String, java.lang.Double>) iterWcActMap.next();
				recEle = reqEle.addElement("rec");
				recEle.addAttribute("actNo", entry2.getKey());
				if (zeroBlns != null) {
					if (zeroBlns.contains(entry2.getKey())) {
						recEle.addAttribute("deficit", "1");
					}
				}
			}

		}
		return document.asXML();
	}

	private Map<String, Double> makeWcChangeMap(Map<String, Map<String, Double>> curActMap, Map<String, String> retMap) {
		Map<String, Double> wcChangeMap = new HashMap<String, Double>();
		Iterator<String> itercurActMapKey = curActMap.keySet().iterator();
		Map<String, Double> wcActMap = null;
		Iterator<Entry<String, Double>> iterWcActMap = null;
		String key = null;
		double totAmt = 0;
		while (itercurActMapKey.hasNext()) {
			totAmt = 0;
			key = (String) itercurActMapKey.next();
			wcActMap = curActMap.get(key);
			iterWcActMap = wcActMap.entrySet().iterator();
			while (iterWcActMap.hasNext()) {
				Map.Entry<java.lang.String, java.lang.Double> entry = (Map.Entry<java.lang.String, java.lang.Double>) iterWcActMap.next();
				if ("0".equals(retMap.get(entry.getKey()))) {
					totAmt += entry.getValue().doubleValue();
				}
			}
			if (totAmt > 0) {
				wcChangeMap.put(key, totAmt);
			}
		}
		return wcChangeMap;
	}

	private void changeCapitalDom(Document dom, Map<String, Double> wcChangeMap) {
		Iterator<String> iterWcChangeMapKeys = wcChangeMap.keySet().iterator();
		List<Element> recList = dom.getRootElement().elements();
		double actAmt = 0;
		double outAmt = 0;
		while (iterWcChangeMapKeys.hasNext()) {
			String wcMk = (String) iterWcChangeMapKeys.next();
			for (Element rec : recList) {
				if (wcMk.equals(rec.attributeValue("watyp"))) {
					actAmt = Double.parseDouble(rec.attributeValue("acmny")) - wcChangeMap.get(wcMk);
					actAmt = actAmt < 0 ? 0 : actAmt;
					outAmt = Double.parseDouble(rec.attributeValue("summny")) - actAmt;
					outAmt = outAmt < 0 ? 0 : outAmt;

					rec.addAttribute("acmny", String.valueOf(actAmt));
					rec.addAttribute("abldrw", String.valueOf(outAmt));
					break;
				}
			}
		}
	}

	private Map<String, String> makeRetMap(String resXML) throws DocumentException {
		Map<String, String> retMap = new HashMap<String, String>();
		Document respDom = DocumentHelper.parseText(resXML);
		List<Element> list = respDom.getRootElement().elements();
		for (Element rec : list) {
			retMap.put(rec.attributeValue("actNo"), rec.attributeValue("st"));
		}
		return retMap;
	}

	public CheckInfo checkUserInfo(Map<String, String> reqMap, Map<String, String> recMap) {
		String faceName = "检测类checkInfo";
		CheckInfo checkInfo = new CheckInfo();
		try {
			String xml = CreateXmlUtil.createPublicReqXML(reqMap, recMap);
			String response = cEPUserCenterIceClient.baseManagerZreocSrvIPrx("checkInfo", xml);
			if (response != null && !response.equals("")) {
				Document doc = DocumentHelper.parseText(response);
				Element root = doc.getRootElement();
				String resultCode = root.attributeValue("st");
				String msg = root.attributeValue("msg");
				String isExist = root.attributeValue("isu");
				checkInfo.setMsg(msg);
				checkInfo.setResultCode(resultCode);
				checkInfo.setIsExist(isExist);
				if (!resultCode.equals(com.vinbet.mobile.util.Constants.SUCCESS)) {
					log.error("调用[platform]手机服务端[" + faceName + "]请求报文：" + xml + "接口返回数据:" + response);
				} else {
					List<Element> childNodes = root.elements();
					if (childNodes.size() > 0) {
						for (int i = 0; i < childNodes.size(); i++) {
							Element reqElm = childNodes.get(i);
							checkInfo.setCardId(reqElm.attributeValue("crid") == null ? "" : reqElm.attributeValue("crid"));
							checkInfo.setDrawCount(reqElm.attributeValue("dwcunt") == null ? "" : reqElm.attributeValue("dwcunt"));
							checkInfo.setPhoneNum(reqElm.attributeValue("phnm") == null ? "" : reqElm.attributeValue("phnm"));
							checkInfo.setEmail(reqElm.attributeValue("eml") == null ? "" : reqElm.attributeValue("eml"));
							checkInfo.setDrwfee(reqElm.attributeValue("drwfee") == null ? "" : reqElm.attributeValue("drwfee"));
							checkInfo.setYtbet(reqElm.attributeValue("ytbet") == null ? "" : reqElm.attributeValue("ytbet"));
							checkInfo.setNdbet(reqElm.attributeValue("ndbet") == null ? "" : reqElm.attributeValue("ndbet"));
							checkInfo.setSvmny(reqElm.attributeValue("svmny") == null ? "" : reqElm.attributeValue("svmny"));
						}
					}
				}

			} else {
				log.error("调用[platform]手机服务端[" + faceName + "]请求报文：" + xml + "接口返回数据:" + response);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			log.error("调用[platform]手机服务端[" + faceName + "]接口异常:" + e);
		}
		return checkInfo;
	}
}
