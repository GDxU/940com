package com.vinbet.mobile.service.portal;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.nutz.ioc.loader.annotation.IocBean;

import com.vinbet.mobile.entity.portal.BankCard;
import com.vinbet.mobile.entity.portal.Currency;
import com.vinbet.mobile.entity.portal.Dict;
import com.vinbet.mobile.entity.portal.EasyPayment;
import com.vinbet.mobile.entity.portal.NavigationApp;
import com.vinbet.mobile.entity.portal.PaymentPlatform;
import com.vinbet.mobile.entity.portal.SystemParm;
import com.vinbet.mobile.entity.portal.WalletCategory;
import com.vinbet.mobile.entity.portal.WechatPayAcc;
import com.vinbet.mobile.sys.AppCache;
import com.vinbet.mobile.util.Constants;
import com.vinbet.mobile.util.StringUtil;
import com.vinbet.mobile.util.XMLBean;

/**
 * 对数据字典功能模块进行解析报文、组装报文。 </pre>
 * 
 * @author cjp
 * @version [Ver 1.0]
 * @since 2014-10-31 下午2:08:56
 */

@IocBean
public class SyncDataForDict {
	private Log logger = LogFactory.getLog(this.getClass());

	/**
	 * 获取指定参数表的数据字典的请求报文。 </pre>
	 * 
	 * @author cjp
	 * @return
	 * @since 2015-4-7 上午11:33:59
	 */
	public String getDictReqXML(String table) {
		XMLBean xmlREQ = new XMLBean("req");
		xmlREQ.addttribute("tbnm", table);
		String resXML = xmlREQ.toXML();
		return resXML;
	}

	/*
	 * 将管理中心返回的获取数据字典dict表的报文解析为数据字典对象。
	 */
	@SuppressWarnings("unchecked")
	public List<Dict> parseBaseDictXML(String xml) throws DocumentException, Exception {
		try {
			Document dom = DocumentHelper.parseText(xml);
			List<Dict> dictList = new ArrayList<Dict>();
			List<Element> eleList = dom.getRootElement().elements();
			Element elementRoot = dom.getRootElement();// 获取根节点。
			String st = elementRoot.attribute("st").getValue();// 获取是否成功标识。SUCCESS("1","成功"),EXCEPTION("0","未知异常"),INVALID_XML("1001001","报文格式错误"),INVALID_XML_DATA("1001002","报文数据有误"),DB_EXCEPTION("1002001","数据库调用异常"),TABLE_NOT_EXISTS("1002002","数据库表不存在");
			if (!StringUtil.isEmpty(st) && Constants.SUCCESS.equals(st)) {
				for (Element element : eleList) {
					Dict dict = new Dict();
					dict.setDictCode(element.attribute("dictCode") == null ? "" : element.attribute("dictCode").getValue());// 字典代码
					dict.setDictName(element.attribute("dictName") == null ? "" : element.attribute("dictName").getValue());// 字典名称
					dict.setDictTypeId(element.attribute("dictTypeId") == null ? "" : element.attribute("dictTypeId").getValue());
					dict.setDictTypeName(element.attribute("dictTypeName") == null ? "" : element.attribute("dictTypeName").getValue());
					if (!StringUtil.isEmpty(element.attribute("sortNo")) && StringUtil.isInteger(element.attribute("sortNo").getValue())) {
						dict.setSortNo(Integer.valueOf(element.attribute("sortNo").getValue()));
					} else {
						dict.setSortNo(0);
					}
					if (!StringUtil.isEmpty(element.attribute("status")) && StringUtil.isInteger(element.attribute("status").getValue())) {
						dict.setStatus(Integer.valueOf(element.attribute("status").getValue()));
					} else {
						dict.setStatus(Constants.DICT_STATUS_N);
					}
					// 特殊处理 存放到数据库中的数据
					if (Constants.NATIONALITY.equals(dict.getDictTypeId())) {
						if (!StringUtil.isEmpty(element.attribute("iid"))) {
							dict.setDictCode(element.attribute("iid").getValue());
						}
					}
					if (!StringUtil.isEmpty(element.attribute("iid"))) {
						dict.setIid(element.attribute("iid").getValue());
					}
					dict.setIcon(element.attribute("icon") == null ? "" : element.attribute("icon").getValue());
					dict.setRemark(element.attribute("remark") == null ? "" : element.attribute("remark").getValue());
					dict.setDictTypeRemark(element.attribute("typeRemark") == null ? "" : element.attribute("typeRemark").getValue());
					dictList.add(dict);
				}
			} else {
				logger.info("平台前端ICE调用管理中心获取数据字典返回报文：" + xml);
			}
			return dictList;

		} catch (DocumentException de) {
			throw de;

		} catch (Exception e) {
			throw e;
		}

	}

	/*
	 * 将管理中心返回的获取平台支持的货币表的报文解析为数据字典对象。
	 */
	@SuppressWarnings("unchecked")
	public void parseCurrencyXML(List<Dict> list, String xml) throws DocumentException, Exception {
		try {
			Document dom = DocumentHelper.parseText(xml);
			List<Element> eleList = dom.getRootElement().elements();
			Element elementRoot = dom.getRootElement();// 获取根节点。
			String st = elementRoot.attribute("st").getValue();// 获取是否成功标识。SUCCESS("1","成功"),EXCEPTION("0","未知异常"),INVALID_XML("1001001","报文格式错误"),INVALID_XML_DATA("1001002","报文数据有误"),DB_EXCEPTION("1002001","数据库调用异常"),TABLE_NOT_EXISTS("1002002","数据库表不存在");
			if (!StringUtil.isEmpty(st) && Constants.SUCCESS.equals(st)) {
				for (Element element : eleList) {
					if (Constants.CURRENCY_STATUS_EFFECTUAL.equals(element.attribute("status").getValue())) {
						// 获取生效的货币
						Dict dict = new Dict();
						dict.setDictTypeName("前端根据表currency自定义");
						dict.setDictTypeId(Constants.CURRENCY_DAG);// 设置字典类型，标签通过此调用。
						dict.setStatus(Integer.valueOf(Constants.DICT_STATUS_Y));// 数据字典为启用状态。
						dict.setDictCode(element.attribute("currency").getValue());// 货币类型设置为字典代码
						dict.setDictName(element.attribute("name").getValue() + "(" + element.attribute("currency").getValue() + ")");// 设置字典名称，样式如：
																																		// 人民币(CNY)
						dict.setRemark("");
						dict.setDictTypeRemark("个人中心根据货币表currency构造");
						dict.setSortNo(0);
						list.add(dict);

					}
				}
			} else {
				logger.info("平台前端ICE调用管理中心获取平台支持的货币表数据返回报文：" + xml);
			}

		} catch (DocumentException de) {
			throw de;

		} catch (Exception e) {
			throw e;
		}

	}

	/**
	 * 将平台支持的货币添加到内存中
	 * 
	 * @author cjp
	 * @param xml
	 * @throws DocumentException
	 * @throws Exception
	 * @since 2015-4-6 下午8:55:03
	 */
	@SuppressWarnings("unchecked")
	public void parseCurrencyXMLtoCache(String xml) throws DocumentException, Exception {
		try {
			Document dom = DocumentHelper.parseText(xml);
			List<Element> eleList = dom.getRootElement().elements();
			Element elementRoot = dom.getRootElement();// 获取根节点。
			String st = elementRoot.attribute("st").getValue();// 获取是否成功标识。SUCCESS("1","成功"),EXCEPTION("0","未知异常"),INVALID_XML("1001001","报文格式错误"),INVALID_XML_DATA("1001002","报文数据有误"),DB_EXCEPTION("1002001","数据库调用异常"),TABLE_NOT_EXISTS("1002002","数据库表不存在");
			if (!StringUtil.isEmpty(st) && Constants.SUCCESS.equals(st)) {
				for (Element element : eleList) {
					if (Constants.CURRENCY_STATUS_EFFECTUAL.equals(element.attribute("status").getValue())) {
						// 获取生效的货币
						Currency currency = new Currency();
						currency.setCurrency(element.attribute("currency").getValue());
						currency.setSymbol(element.attribute("symbol").getValue());
						currency.setName(element.attribute("name").getValue());
						currency.setIsdefault(element.attributeValue("isDefault") == null ? "" : element.attributeValue("isDefault"));
						currency.setStatus(element.attributeValue("status") == null ? "" : element.attributeValue("status"));
						currency.setApprovalresult(element.attributeValue("approvalResult") == null ? "" : element.attributeValue("approvalResult"));
						currency.setMinimumDeposit(Double.parseDouble(element.attribute("miniMumDeposit").getValue())); // 存款最低限额
						currency.setMinimumWithdrawal(Double.parseDouble(element.attribute("miniMumWithdrawal").getValue())); // 提款最低限额
						currency.setCreateBy(element.attributeValue("createBy") == null ? "" : element.attributeValue("createBy"));
						currency.setCreateDate(element.attributeValue("createDate") == null ? "" : element.attributeValue("createDate"));
						currency.setWithdrawalTimes(Integer.parseInt(element.attribute("withdrawalTimes").getValue())); // 每天提款次数
						currency.setPerservicecharges(element.attributeValue("perServiceCharges") == null ? "" : element.attributeValue("perServiceCharges"));
						currency.setMaxservicecharges(element.attributeValue("maxServiceCharges") == null ? "" : element.attributeValue("maxServiceCharges"));
						AppCache.setCurrencyMap(currency.getCurrency(), currency);
					}
				}
			} else {
				logger.info("平台前端ICE调用管理中心获取平台支持的货币表数据返回报文：" + xml);
			}

		} catch (DocumentException de) {
			throw de;

		} catch (Exception e) {
			throw e;
		}

	}

	/**
	 * 解析易支付存款公司易支付银行帐号和机构报文。
	 * 
	 * @since 2015-3-26 下午3:57:04
	 */
	public List<EasyPayment> parseEasyPaymentXML(String xml) throws DocumentException, Exception {
		try {
			List<EasyPayment> list = new ArrayList<EasyPayment>();
			Document dom = DocumentHelper.parseText(xml);
			List<Element> eleList = dom.getRootElement().elements();
			Element elementRoot = dom.getRootElement();// 获取根节点。
			String st = elementRoot.attribute("st").getValue();// 获取是否成功标识。SUCCESS("1","成功"),EXCEPTION("0","未知异常"),INVALID_XML("1001001","报文格式错误"),INVALID_XML_DATA("1001002","报文数据有误"),DB_EXCEPTION("1002001","数据库调用异常"),TABLE_NOT_EXISTS("1002002","数据库表不存在");
			if (!StringUtil.isEmpty(st) && Constants.SUCCESS.equals(st)) {// 返回报文成功标识
				for (Element element : eleList) {
					if (Constants.SHOW_HIDE_STATUS_SHOW.equals(element.attribute("orgStatus").getValue()) && Constants.EASY_ACCSTATUS_SHOW.equals(element.attribute("accStatus").getValue())) {// 获取机构状态为显示的并且获取帐号状态为显示的
						// 获取生效的货币
						EasyPayment easyPayment = new EasyPayment();
						easyPayment.setEasyPayAccId(element.attribute("epaId").getValue());
						easyPayment.setEasyPayORGId(element.attribute("epoId").getValue());
						easyPayment.setName(element.attribute("name").getValue());
						easyPayment.setAccount(element.attribute("account").getValue());
						easyPayment.setEasyPayORGName(element.attribute("epoName").getValue());
						easyPayment.setAccSpec(element.attribute("accSpec").getValue());
						easyPayment.setIcon(element.attribute("icon") == null ? "" : element.attribute("icon").getValue());
						easyPayment.setUrl(element.attribute("url").getValue());
						easyPayment.setOpeningOutlets(element.attribute("openingOutlets") == null ? "" : element.attribute("openingOutlets").getValue());
						easyPayment.setSuppCurrency(element.attribute("suppCurrency") == null ? "" : element.attribute("suppCurrency").getValue());
						list.add(easyPayment);
					}
				}
				return list;
			} else {
				logger.info("平台前端ICE调用管理中心获取平台支持的货币表数据返回报文：" + xml);
			}

		} catch (DocumentException de) {
			throw de;

		} catch (Exception e) {
			throw e;
		}
		return null;

	}

	/*
	 * 将管理中心返回的获取用户存款或提款时可以使用的机构表的报文解析为数据字典对象。
	 */
	@SuppressWarnings("unchecked")
	public void parseBankNameXML(List<Dict> list, String xml) throws DocumentException, Exception {
		try {
			Document dom = DocumentHelper.parseText(xml);
			List<Element> eleList = dom.getRootElement().elements();
			Element elementRoot = dom.getRootElement();// 获取根节点。
			String st = elementRoot.attribute("st").getValue();// 获取是否成功标识。SUCCESS("1","成功"),EXCEPTION("0","未知异常"),INVALID_XML("1001001","报文格式错误"),INVALID_XML_DATA("1001002","报文数据有误"),DB_EXCEPTION("1002001","数据库调用异常"),TABLE_NOT_EXISTS("1002002","数据库表不存在");
			if (!StringUtil.isEmpty(st) && Constants.SUCCESS.equals(st)) {
				for (Element element : eleList) {
					if (Constants.SHOW_HIDE_STATUS_SHOW.equals(element.attribute("status").getValue())) {
						// 获取显示状态的银行名称
						Dict dict = new Dict();
						String wdoType = element.attribute("wdoType").getValue();// 机构类别,6-中介机构,7-银行机构
						dict.setRules(element.attribute("suppCurrency").getValue()); //支持货币
						if (Constants.WITHDRAWAL_WAY_BANK.equals(wdoType)) {
							dict.setDictTypeId(Constants.BANKNAME_DAG);// 设置字典类型为银行名称标签，标签通过此调用。
							dict.setStatus(Integer.valueOf(Constants.DICT_STATUS_Y));// 数据字典为启用状态。
							dict.setDictCode(element.attribute("wdoId").getValue());// 银行或机构id设置为字典代码
							dict.setDictName(element.attribute("wdoName").getValue());// 设置字典名称：银行、机构
							dict.setIcon(element.attribute("wdoLogo") == null ? "" : element.attribute("wdoLogo").getValue());
							dict.setIid(element.attribute("iid") == null ? "" : element.attribute("iid").getValue());
							dict.setDictTypeRemark("个人中心根据用户提款表withdrawalorg构造银行");
							dict.setDictTypeName("前端根据表withdrawalorg自定义银行");
							dict.setSortNo(0);
							dict.setRemark(element.attribute("url") == null ? "" : element.attribute("url").getValue());// 银行的网址暂设置到备注中。
							list.add(dict);
						} else if (Constants.WITHDRAWAL_WAY_ORG.equals(wdoType)) {
							dict.setDictTypeId(Constants.ORG_DAG);// 设置字典类型为第三方支付机构名称标签。
							dict.setStatus(Integer.valueOf(Constants.DICT_STATUS_Y));// 数据字典为启用状态。
							dict.setDictCode(element.attribute("wdoId").getValue());// 银行或机构id设置为字典代码
							dict.setDictName(element.attribute("wdoName").getValue());// 设置字典名称：银行、机构
							dict.setIcon(element.attribute("wdoLogo") == null ? "" : element.attribute("wdoLogo").getValue());
							dict.setIid(element.attribute("iid") == null ? "" : element.attribute("iid").getValue());
							dict.setDictTypeRemark("个人中心根据用户提款表withdrawalorg构造支付机构");
							dict.setDictTypeName("前端根据表withdrawalorg自定义支付机构");
							dict.setSortNo(0);
							list.add(dict);
						} else if (Constants.WITHDRAWAL_WAY_ALIPAY.equals(wdoType)) {
							dict.setDictTypeId(Constants.ALIPAY_DRAW_DAG);// 设置字典类型为第三方支付机构名称标签。
							dict.setStatus(Integer.valueOf(Constants.DICT_STATUS_Y));// 数据字典为启用状态。
							dict.setDictCode(element.attribute("wdoId").getValue());// 银行或机构id设置为字典代码
							dict.setDictName(element.attribute("wdoName").getValue());// 设置字典名称：银行、机构
							dict.setIcon(element.attribute("wdoLogo") == null ? "" : element.attribute("wdoLogo").getValue());
							dict.setIid(element.attribute("iid") == null ? "" : element.attribute("iid").getValue());
							dict.setDictTypeRemark("个人中心根据用户提款表withdrawalorg构造支付宝机构");
							dict.setDictTypeName("前端根据表withdrawalorg自定义支付宝机构");
							dict.setSortNo(0);
							list.add(dict);
						} else if (Constants.WITHDRAWAL_WAY_WECHATPAY.equals(wdoType)) {
							dict.setDictTypeId(Constants.WECHATPAY_DRAW_DAG);// 设置字典类型为第三方支付机构名称标签。
							dict.setStatus(Integer.valueOf(Constants.DICT_STATUS_Y));// 数据字典为启用状态。
							dict.setDictCode(element.attribute("wdoId").getValue());// 银行或机构id设置为字典代码
							dict.setDictName(element.attribute("wdoName").getValue());// 设置字典名称：银行、机构
							dict.setIcon(element.attribute("wdoLogo") == null ? "" : element.attribute("wdoLogo").getValue());
							dict.setIid(element.attribute("iid") == null ? "" : element.attribute("iid").getValue());
							dict.setDictTypeRemark("个人中心根据用户提款表withdrawalorg构造微信机构");
							dict.setDictTypeName("前端根据表withdrawalorg自定义微信机构");
							dict.setSortNo(0);
							list.add(dict);
						}

					}
				}
			} else {
				logger.info("平台前端ICE调用管理中心获取银行名称表数据返回报文：" + xml);
			}

		} catch (DocumentException de) {
			throw de;

		} catch (Exception e) {
			throw e;
		}

	}

	/*
	 * 将管理中心返回的存款方式表的报文解析为PaymentPlatform对象。
	 */
	@SuppressWarnings("unchecked")
	public List<PaymentPlatform> parsePaymentPlatXML(String xml) throws DocumentException, Exception {
		try {
			List<PaymentPlatform> paymentList = new ArrayList<PaymentPlatform>();
			Document dom = DocumentHelper.parseText(xml);
			List<Element> eleList = dom.getRootElement().elements();
			Element elementRoot = dom.getRootElement();// 获取根节点。
			String st = elementRoot.attribute("st").getValue();// 获取是否成功标识。SUCCESS("1","成功"),EXCEPTION("0","未知异常"),INVALID_XML("1001001","报文格式错误"),INVALID_XML_DATA("1001002","报文数据有误"),DB_EXCEPTION("1002001","数据库调用异常"),TABLE_NOT_EXISTS("1002002","数据库表不存在");
			if (!StringUtil.isEmpty(st) && Constants.SUCCESS.equals(st)) {
				for (Element element : eleList) {
					if (Constants.SHOW_HIDE_STATUS_SHOW.equals(element.attribute("accStatus").getValue()) && Constants.SHOW_HIDE_STATUS_SHOW.equals(element.attribute("platStatus").getValue())) {
						// 获取显示状态的支付平台。
						PaymentPlatform paymentPlat = new PaymentPlatform();
						paymentPlat.setPaymentPlatId(element.attribute("ppId").getValue());// 支付平台ID
						paymentPlat.setPaymentPlatAccId(element.attribute("ppaId").getValue());// 支付平台ID
						paymentPlat.setAccountNumber(element.attribute("accountNumber").getValue());// 支付平台账号
						paymentPlat.setPasswd(element.attribute("passwd").getValue());// 支付平台密钥
						paymentPlat.setPasswd2(element.attribute("passwd2") == null ? "" : element.attribute("passwd2").getValue());
						paymentPlat.setPasswd3(element.attribute("passwd3") == null ? "" : element.attribute("passwd3").getValue());
						paymentPlat.setIsautoconfirm(element.attribute("isautoconfirm") == null ? "" : element.attribute("isautoconfirm").getValue());
						paymentPlat.setUrl(element.attribute("url") == null ? "" : element.attribute("url").getValue());// 支付平台接入地址
						paymentPlat.setAccStatus(element.attribute("accStatus").getValue());
						paymentPlat.setIcon((element.attribute("icon") == null ? "" : element.attribute("icon").getValue()));// 支付平台图标路径
						paymentPlat.setName(element.attribute("name").getValue());// 支付平台名称
						paymentPlat.setPlatStatus(element.attribute("platStatus").getValue());// 支付平台名称
						paymentPlat.setSuppCurrency(element.attribute("suppCurrency") == null ? "" : element.attribute("suppCurrency").getValue());// 货币单位,如CNY、USD等
						paymentPlat.setDepositUrl(element.attribute("depositUrl") == null ? "" : element.attribute("depositUrl").getValue());// 存款接口地址。
						paymentPlat.setQueryUrl(element.attribute("queryUrl") == null ? "" : element.attribute("queryUrl").getValue());// 存款记录查询接口地址
						paymentPlat.setRefundUrl(element.attribute("refundUrl") == null ? "" : element.attribute("refundUrl").getValue());// 退款接口地址
						AppCache.paymentPlatformAccMap.put(paymentPlat.getPaymentPlatAccId(), paymentPlat);
						paymentList.add(paymentPlat);
					}
				}
				return paymentList;
			} else {
				logger.info("平台前端ICE调用管理中心获取平台支持的第三方支付平台返回报文：" + xml);
			}

		} catch (DocumentException de) {
			throw de;

		} catch (Exception e) {
			throw e;
		}
		return null;

	}

	/*
	 * 将管理中心返回的手机号码类型表的报文解析为数据字典对象。
	 */
	@SuppressWarnings("unchecked")
	public void parseMobileTypeXML(List<Dict> list, String xml) throws DocumentException, Exception {
		try {
			Document dom = DocumentHelper.parseText(xml);
			List<Element> eleList = dom.getRootElement().elements();
			Element elementRoot = dom.getRootElement();// 获取根节点。
			String st = elementRoot.attribute("st").getValue();// 获取是否成功标识。SUCCESS("1","成功"),EXCEPTION("0","未知异常"),INVALID_XML("1001001","报文格式错误"),INVALID_XML_DATA("1001002","报文数据有误"),DB_EXCEPTION("1002001","数据库调用异常"),TABLE_NOT_EXISTS("1002002","数据库表不存在");
			if (!StringUtil.isEmpty(st) && Constants.SUCCESS.equals(st)) {
				for (Element element : eleList) {
					if (Constants.SHOW_HIDE_STATUS_SHOW.equals(element.attribute("status").getValue())) {
						// 获取显示状态的手机号码类型
						Dict dict = new Dict();
						dict.setDictTypeId(Constants.MOBILETYPE_DAG);// 设置字典类型，标签通过此调用。
						dict.setStatus(Integer.valueOf(Constants.DICT_STATUS_Y));// 数据字典为启用状态。

						dict.setDictCode(element.attribute("callingCode").getValue());// 货币类型设置为字典代码
						dict.setDictName(element.attribute("countryRegion").getValue() + " (" + element.attribute("callingCode").getValue() + ")");// 设置字典名称，样式如：
																																					// 中国
																																					// (+86)
						dict.setRules(element.attribute("rules").getValue());// 手机号码,正则表达式
						dict.setIcon(element.attribute("icon").getValue());
						dict.setSortNo(0);
						dict.setDictTypeRemark("个人中心根据手机号码类型表mobiletype构造");
						dict.setDictTypeName("前端根据手机号码类型表mobiletype生成数据字典");
						list.add(dict);

					}
				}
			} else {
				logger.info("平台前端ICE调用管理中心获取手机号码类型表数据返回报文：" + xml);
			}

		} catch (DocumentException de) {
			throw de;

		} catch (Exception e) {
			throw e;
		}

	}

	/**
	 * 解析公司本地银行转账的收款账户返回报文。
	 * 
	 * @author cjp
	 * @param list
	 * @param xml
	 * @throws DocumentException
	 * @throws Exception
	 * @since 2015-4-4 上午9:40:56
	 */
	@SuppressWarnings("unchecked")
	public void parseLocalBankXML(List<Dict> list, String xml) throws DocumentException, Exception {
		try {
			Map<String,BankCard> map = new HashMap<String, BankCard>();
			Document dom = DocumentHelper.parseText(xml);
			List<Element> eleList = dom.getRootElement().elements();
			Element elementRoot = dom.getRootElement();// 获取根节点。
			String st = elementRoot.attribute("st").getValue();// 获取是否成功标识。SUCCESS("1","成功"),EXCEPTION("0","未知异常"),INVALID_XML("1001001","报文格式错误"),INVALID_XML_DATA("1001002","报文数据有误"),DB_EXCEPTION("1002001","数据库调用异常"),TABLE_NOT_EXISTS("1002002","数据库表不存在");
			if (!StringUtil.isEmpty(st) && Constants.SUCCESS.equals(st)) {
				for (Element element : eleList) {
					if (Constants.SHOW_HIDE_STATUS_SHOW.equals(element.attribute("status").getValue())) {
						// 获取显示状态的手机号码类型
						Dict dict = new Dict();
						dict.setRules(element.attribute("suppCurrency").getValue()); //支持货币
						dict.setDictTypeId(Constants.LOCALBANK_TRANSFER_COMPANYBANKACC_DAG);// 设置字典类型，标签通过此调用。
						dict.setStatus(Integer.valueOf(Constants.DICT_STATUS_Y));// 数据字典为启用状态。

						dict.setDictCode(element.attribute("cbaId").getValue());// T_COMPANYBANKACC表的id
						dict.setDictName(element.attribute("bankName").getValue());// 设置字典名称，
						dict.setIcon(element.attribute("icon") == null ? "" : element.attribute("icon").getValue());

						dict.setSortNo(0);
						dict.setDictTypeRemark("个人中心T_COMPANYBANKACC构造");
						dict.setDictTypeName("个人中心T_COMPANYBANKACC构造");
						list.add(dict);
						BankCard bankCard = new BankCard();
						bankCard.setBankId(element.attribute("cbaId").getValue());
						bankCard.setBankName(element.attribute("bankName").getValue());
						bankCard.setCardNumber(element.attribute("cardNumber").getValue());
						bankCard.setName(element.attribute("accountName").getValue());
						bankCard.setOpeningOutlets(element.attribute("openingOutlets").getValue());
						map.put(bankCard.getBankId(), bankCard);
					}
				}
				AppCache.initLocalBankMap(map);
			} else {
				logger.info("平台前端ICE调用管理中心获取[公司本地银行转账的收款账户表]数据返回报文：" + xml);
			}

		} catch (DocumentException de) {
			throw de;

		} catch (Exception e) {
			throw e;
		}

	}

	/**
	 * 解析地区资料返回报文。
	 * <p>
	 * 为国籍、省份、地区分别创建数据字典
	 * </p>
	 * 
	 * @author jagger
	 * @param list
	 * @param xml
	 * @throws DocumentException
	 * @throws Exception
	 * @since 2015-4-4 上午9:40:56
	 */
	@SuppressWarnings("unchecked")
	public void parseAreaInfoXML(List<Dict> list, String xml) throws DocumentException, Exception {
		try {
			Document dom = DocumentHelper.parseText(xml);
			List<Element> eleList = dom.getRootElement().elements();
			Element elementRoot = dom.getRootElement();// 获取根节点。
			String st = elementRoot.attribute("st").getValue();
			if (!StringUtil.isEmpty(st) && Constants.SUCCESS.equals(st)) {
				// key:id,value:iid
				final Map<String, String> idds = new HashMap<String, String>();
				for (Element element : eleList) {
					String id = element.attribute("id").getValue();
					String iid = element.attribute("iid").getValue();
					idds.put(id, iid);
				}
				for (Element element : eleList) {
					if (Constants.SHOW_HIDE_STATUS_SHOW.equals(element.attribute("status").getValue())) {
						// String id = element.attribute("id").getValue();
						String iid = element.attribute("iid").getValue();
						// idds.put(id, iid);
						Dict dict = new Dict();
						String areaLevel = element.attribute("arealevel").getValue();
						if (areaLevel.equals("1")) {// 国籍
							dict.setDictTypeId(Constants.NATIONALITY);// 设置字典类型，标签通过此调用。
						} else if (areaLevel.equals("2")) {// 省份
							dict.setDictTypeId("arealevel2_" + idds.get(element.attribute("parentid").getValue()));
						} else if (areaLevel.equals("3")) {// 地区
							dict.setDictTypeId("arealevel3_" + idds.get(element.attribute("parentid").getValue()));
						}
						dict.setStatus(Integer.valueOf(Constants.DICT_STATUS_Y));// 数据字典为启用状态。
						dict.setDictCode(iid);
						dict.setIid(iid);
						dict.setDictName(element.attribute("areaname").getValue());// 设置字典名称，
						dict.setSortNo(0);
						list.add(dict);
					}
				}
			} else {
				logger.info("平台前端ICE调用管理中心获取[公司本地银行转账的收款账户表]数据返回报文：" + xml);
			}

		} catch (DocumentException de) {
			throw de;

		} catch (Exception e) {
			throw e;
		}

	}

	/**
	 * 解析国际化信息返回报文
	 * 
	 * @author cjp
	 * @param xml
	 * @return
	 * @throws DocumentException
	 * @throws Exception
	 * @since 2015-3-21 上午10:33:25
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, String>> parseInternationXML(String xml) throws DocumentException, Exception {
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		try {
			Document dom = DocumentHelper.parseText(xml);
			List<Element> eleList = dom.getRootElement().elements();
			Element elementRoot = dom.getRootElement();// 获取根节点。
			String st = elementRoot.attribute("st").getValue();// 获取是否成功标识。SUCCESS("1","成功"),EXCEPTION("0","未知异常"),INVALID_XML("1001001","报文格式错误"),INVALID_XML_DATA("1001002","报文数据有误"),DB_EXCEPTION("1002001","数据库调用异常"),TABLE_NOT_EXISTS("1002002","数据库表不存在");
			if (!StringUtil.isEmpty(st) && Constants.SUCCESS.equals(st)) {
				for (Element element : eleList) {
					if (!StringUtil.isEmpty(element.attribute("id"))) {
						Map<String, String> mapTemp = new HashMap<String, String>();
						mapTemp.put("id", element.attribute("id").getValue());
						mapTemp.put("zh", element.attribute("zh") == null ? "" : element.attribute("zh").getValue());
						mapTemp.put("en", element.attribute("en") == null ? "" : element.attribute("en").getValue());
						mapTemp.put("zh_tw", element.attribute("zh_tw") == null ? "" : element.attribute("zh_tw").getValue());
						mapTemp.put("th", element.attribute("th") == null ? "" : element.attribute("th").getValue());
						mapTemp.put("ri", element.attribute("ri") == null ? "" : element.attribute("ri").getValue());
						mapTemp.put("vi", element.attribute("vi") == null ? "" : element.attribute("vi").getValue());
						mapTemp.put("de", element.attribute("de") == null ? "" : element.attribute("de").getValue());
						mapTemp.put("fr", element.attribute("fr") == null ? "" : element.attribute("fr").getValue());
						mapTemp.put("jp", element.attribute("jp") == null ? "" : element.attribute("jp").getValue());
						mapTemp.put("ko", element.attribute("ko") == null ? "" : element.attribute("ko").getValue());
						mapTemp.put("es", element.attribute("es") == null ? "" : element.attribute("es").getValue());
						mapTemp.put("it", element.attribute("it") == null ? "" : element.attribute("it").getValue());
						list.add(mapTemp);
					}
				}
			} else {
				logger.info("平台前端ICE调用管理中心获取[国际化表]数据返回报文：" + xml);
			}

		} catch (DocumentException de) {
			throw de;

		} catch (Exception e) {
			throw e;
		}
		return list;
	}

	/**
	 * 解析系统参数报文。
	 * 
	 * @author cjp
	 * @param xml
	 * @throws DocumentException
	 * @throws Exception
	 * @since 2015-3-28 上午11:17:42
	 */
	@SuppressWarnings("unchecked")
	public List<SystemParm> parseSystemParmXML(String xml) throws DocumentException, Exception {
		try {
			List<SystemParm> list = new ArrayList<SystemParm>();
			Document dom = DocumentHelper.parseText(xml);
			List<Element> eleList = dom.getRootElement().elements();
			Element elementRoot = dom.getRootElement();// 获取根节点。
			String st = elementRoot.attribute("st") == null ? "" : elementRoot.attribute("st").getValue();// 获取是否成功标识。SUCCESS("1","成功"),EXCEPTION("0","未知异常"),INVALID_XML("1001001","报文格式错误"),INVALID_XML_DATA("1001002","报文数据有误"),DB_EXCEPTION("1002001","数据库调用异常"),TABLE_NOT_EXISTS("1002002","数据库表不存在");
			if (!StringUtil.isEmpty(st) && Constants.SUCCESS.equals(st)) {// 返回报文成功标识
				for (Element element : eleList) {
					SystemParm systemParm = new SystemParm();
					systemParm.setParameterCode(element.attribute("parameterCode") == null ? "" : element.attribute("parameterCode").getValue());
					systemParm.setParameterName(element.attribute("parameterName") == null ? "" : element.attribute("parameterName").getValue());
					systemParm.setParameterValue(element.attribute("parameterValue") == null ? "" : element.attribute("parameterValue").getValue());
					list.add(systemParm);
				}
				return list;
			} else {
				logger.info("平台前端ICE调用管理中心获取平台支持的货币表数据返回报文：" + xml);
			}

		} catch (DocumentException de) {
			throw de;

		} catch (Exception e) {
			throw e;
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public Map<String, WalletCategory> parseWalletCategoryXML(String xml) throws DocumentException, Exception {
		try {
			// 存放所有钱包类别数据
			Map<String, WalletCategory> walletCategoryMap = new ConcurrentHashMap<String, WalletCategory>();
			Document dom = DocumentHelper.parseText(xml);
			List<Element> eleList = dom.getRootElement().elements();
			Element elementRoot = dom.getRootElement();// 获取根节点。
			String st = elementRoot.attribute("st").getValue();// 获取是否成功标识。SUCCESS("1","成功"),EXCEPTION("0","未知异常"),INVALID_XML("1001001","报文格式错误"),INVALID_XML_DATA("1001002","报文数据有误"),DB_EXCEPTION("1002001","数据库调用异常"),TABLE_NOT_EXISTS("1002002","数据库表不存在");
			if (!StringUtil.isEmpty(st) && Constants.SUCCESS.equals(st)) {// 返回报文成功标识

				// 添加到数据字典中，方便页面做标签处理
				Map<String, List<Dict>> walletCategoryDictMap = new HashMap<String, List<Dict>>();
				List<Dict> walletCategoryList = new ArrayList<Dict>();

				for (Element element : eleList) {
					// 获取生效的货币
					WalletCategory walletCategory = new WalletCategory();
					String walletCategoryName = element.attribute("walletCategory").getValue();
					String fundsDetailURL = element.attribute("fundsDetailURL") == null ? "" : element.attribute("fundsDetailURL").getValue();
					walletCategory.setAppMark(element.attribute("appMark").getValue());
					walletCategory.setCurrency(element.attribute("currency").getValue());
					walletCategory.setDayInLimit(element.attribute("dayInLimit").getValue());
					walletCategory.setDayOutLimit(element.attribute("dayOutLimit").getValue());
					walletCategory.setIid(element.attribute("iid") == null ? "" : element.attribute("iid").getValue());
					walletCategory.setSingleInLimit(element.attribute("singleInLimit").getValue());
					walletCategory.setSingleOutLimit(element.attribute("singleOutLimit").getValue());
					walletCategory.setStatus(element.attribute("status").getValue());
					walletCategory.setWalletCategory(element.attribute("walletCategory").getValue());
					walletCategory.setWalletName(element.attribute("walletName").getValue());
					walletCategory.setWalletType(element.attribute("walletType").getValue());
					walletCategory.setFundsDetailUrl(fundsDetailURL);

					walletCategoryMap.put(walletCategoryName, walletCategory);

					// 添加到数据字典中，方便页面做标签处理
					Dict dict = new Dict();
					// 创建易支付银行名称数据字典。
					dict.setDictTypeName("自定义支付平台数据字典");
					dict.setDictTypeId(Constants.WALLETCATEGORY_DAG);// 设置字典类型，标签通过此调用。
					dict.setStatus(Integer.valueOf(Constants.DICT_STATUS_Y));// 数据字典为启用状态。
					dict.setDictName(walletCategory.getWalletName());// 支付平台名称
					dict.setDictCode(walletCategory.getWalletCategory());// 支付平台id.
					dict.setIid(walletCategory.getIid());
					dict.setRules(fundsDetailURL);// 资金明细地址保存这里，页面查询的时候通过下拉菜单中获取
					dict.setIcon("");
					dict.setDictTypeRemark("个人中心自定义");
					dict.setSortNo(0);
					walletCategoryList.add(dict);

				}

				// 添加到数据字典中，方便页面做标签处理
				if(walletCategoryList.size()>0){
					walletCategoryDictMap.put(Constants.WALLETCATEGORY_DAG, walletCategoryList);
					AppCache.setDictMap(walletCategoryDictMap);
				}

				return walletCategoryMap;
			} else {
				logger.info("平台前端ICE调用管理中心获取钱包类别表数据返回报文：" + xml);
			}

		} catch (DocumentException de) {
			throw de;

		} catch (Exception e) {
			throw e;
		}
		return null;
	}

	// 获取所有子菜单
	private void getAllChildMenu(List<NavigationApp> result, List<NavigationApp> menuList, NavigationApp parent) {
		result.add(parent);
		for (NavigationApp navigationApp : menuList) {
			if (navigationApp.getParentid() != null && navigationApp.getParentid().equals(parent.getId())) {
				getAllChildMenu(parent.getNavigationAppList(), menuList, navigationApp);
			}
		}

	}

	/**
	 * <一句话功能简述> 解析导航菜单数据 <功能详细描述> </pre>
	 * 
	 * @author cjp
	 * @param xml
	 * @return
	 * @throws DocumentException
	 * @throws Exception
	 * @since 2015-5-20 上午10:25:07
	 */
	@SuppressWarnings("unchecked")
	public List<NavigationApp> parseNavigationAppXML(String xml) throws DocumentException, Exception {
		try {
			// 存放所有子应用动态静态地址登录和退出时使用
			Map<String, NavigationApp> navigationAppMap = new ConcurrentHashMap<String, NavigationApp>();
			// 存放所有子应用对应导航栏数据
			List<NavigationApp> navigationAppList = new CopyOnWriteArrayList<NavigationApp>();
			Document dom = DocumentHelper.parseText(xml);
			List<Element> eleList = dom.getRootElement().elements();
			Element elementRoot = dom.getRootElement();// 获取根节点。
			String st = elementRoot.attribute("st").getValue();// 获取是否成功标识。SUCCESS("1","成功"),EXCEPTION("0","未知异常"),INVALID_XML("1001001","报文格式错误"),INVALID_XML_DATA("1001002","报文数据有误"),DB_EXCEPTION("1002001","数据库调用异常"),TABLE_NOT_EXISTS("1002002","数据库表不存在");
			if (!StringUtil.isEmpty(st) && Constants.SUCCESS.equals(st)) {// 返回报文成功标识

				Map<String, List<Dict>> appDictMap = new HashMap<String, List<Dict>>();
				List<Dict> appDictList = new ArrayList<Dict>();

				for (Element element : eleList) {
					// 获取生效 正常状态和维护状态下的菜单
					String status = element.attribute("status").getValue();

					NavigationApp navigationApp = new NavigationApp();
					navigationApp.setId(element.attribute("id").getValue());
					navigationApp.setAppmark(element.attribute("appMark").getValue());
					navigationApp.setApptype(element.attribute("appType").getValue());
					navigationApp.setParentid(element.attribute("parentId") == null ? "" : element.attribute("parentId").getValue());
					navigationApp.setIid(element.attribute("iid") == null ? "" : element.attribute("iid").getValue());
					navigationApp.setDynamicaddr(element.attribute("dynamicAddr").getValue());
					navigationApp.setStaticaddr(element.attribute("staticAddr").getValue());
					navigationApp.setAppsort(element.attribute("appSort").getValue());
					navigationApp.setWalletcategory(element.attribute("walletcategory") == null ? "" : element.attribute("walletcategory").getValue());
					navigationApp.setStatus(status);
					navigationAppList.add(navigationApp);

					navigationAppMap.put(element.attribute("appMark").getValue() + navigationApp.getApptype(), navigationApp);

					Dict dict = new Dict();
					// 创建易支付银行名称数据字典。
					dict.setDictTypeName("自定义支付平台数据字典");
					dict.setDictTypeId(Constants.APP_DICT);// 设置字典类型，标签通过此调用。
					dict.setStatus(Integer.valueOf(Constants.DICT_STATUS_Y));// 数据字典为启用状态。
					dict.setDictName(element.attribute("iid") == null ? "" : element.attribute("iid").getValue());// 子应用名称
					dict.setIid(element.attribute("iid") == null ? "" : element.attribute("iid").getValue());// 子应用名称
					dict.setDictCode(element.attribute("appMark").getValue());// 子应用标识码
					dict.setDictTypeRemark("个人中心自定义");
					dict.setSortNo(0);
					appDictList.add(dict);
				}

				appDictMap.put(Constants.APP_DICT, appDictList);
				AppCache.setDictMap(appDictMap);

				// 保存原始数据
				AppCache.setNavigationAppMap(navigationAppMap);

				// 转换成list层级结构保存
				List<NavigationApp> result = new CopyOnWriteArrayList<NavigationApp>();

				for (NavigationApp navigationApp : navigationAppList) {
					if (navigationApp.getParentid().equals("0")) {
						getAllChildMenu(result, navigationAppList, navigationApp);
					}
				}
				return result;
			} else {
				logger.info("平台前端ICE调用管理中心获取导航菜单表数据返回报文：" + xml);
			}

		} catch (DocumentException de) {
			throw de;

		} catch (Exception e) {
			throw e;
		}
		return null;
	}

	public List<Dict> parseDictXMLToList(List<Element> eleList) {
		List<Dict> dictList = new ArrayList<Dict>();
		for (Element element : eleList) {
			Dict dict = new Dict();
			dict.setDictCode(element.attribute("dictCode") == null ? "" : element.attribute("dictCode").getValue());// 字典代码
			dict.setDictName(element.attribute("dictName") == null ? "" : element.attribute("dictName").getValue());// 字典名称
			dict.setDictTypeId(element.attribute("dictTypeId") == null ? "" : element.attribute("dictTypeId").getValue());
			dict.setDictTypeName(element.attribute("dictTypeName") == null ? "" : element.attribute("dictTypeName").getValue());
			if (!StringUtil.isEmpty(element.attribute("sortNo")) && StringUtil.isInteger(element.attribute("sortNo").getValue())) {
				dict.setSortNo(Integer.valueOf(element.attribute("sortNo").getValue()));
			} else {
				dict.setSortNo(0);
			}
			if (!StringUtil.isEmpty(element.attribute("status")) && StringUtil.isInteger(element.attribute("status").getValue())) {
				dict.setStatus(Integer.valueOf(element.attribute("status").getValue()));
			} else {
				dict.setStatus(Constants.DICT_STATUS_N);
			}
			// 特殊处理 存放到数据库中的数据
			if (Constants.NATIONALITY.equals(dict.getDictTypeId())) {
				if (!StringUtil.isEmpty(element.attribute("iid"))) {
					dict.setDictCode(element.attribute("iid").getValue());
				}
			}
			if (!StringUtil.isEmpty(element.attribute("iid"))) {
				dict.setIid(element.attribute("iid").getValue());
			}
			dict.setIcon(element.attribute("icon") == null ? "" : element.attribute("icon").getValue());
			dict.setRemark(element.attribute("remark") == null ? "" : element.attribute("remark").getValue());
			dict.setDictTypeRemark(element.attribute("typeRemark") == null ? "" : element.attribute("typeRemark").getValue());
			dictList.add(dict);
		}
		return dictList;
	}

	public List<Map<String, String>> parseInternationXMLToList(List<Element> eleList) {
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		for (Element element : eleList) {
			if (!StringUtil.isEmpty(element.attribute("id"))) {
				Map<String, String> mapTemp = new HashMap<String, String>();
				mapTemp.put("id", element.attribute("id").getValue());
				mapTemp.put("zh", element.attribute("zh") == null ? "" : element.attribute("zh").getValue());
				mapTemp.put("en", element.attribute("en") == null ? "" : element.attribute("en").getValue());
				mapTemp.put("zh_hant", element.attribute("zh_hant") == null ? "" : element.attribute("zh_hant").getValue());
				mapTemp.put("th", element.attribute("th") == null ? "" : element.attribute("th").getValue());
				mapTemp.put("ri", element.attribute("ri") == null ? "" : element.attribute("ri").getValue());
				mapTemp.put("vi", element.attribute("vi") == null ? "" : element.attribute("vi").getValue());
				mapTemp.put("de", element.attribute("de") == null ? "" : element.attribute("de").getValue());
				mapTemp.put("fr", element.attribute("fr") == null ? "" : element.attribute("fr").getValue());
				mapTemp.put("jp", element.attribute("jp") == null ? "" : element.attribute("jp").getValue());
				mapTemp.put("ko", element.attribute("ko") == null ? "" : element.attribute("ko").getValue());
				mapTemp.put("es", element.attribute("es") == null ? "" : element.attribute("es").getValue());
				mapTemp.put("it", element.attribute("it") == null ? "" : element.attribute("it").getValue());
				list.add(mapTemp);
			}
		}
		return list;
	}
	
    /**
     * 将平台支持的货币添加到内存中 
     * @author  caibiao  
     * @param xml
     * @throws DocumentException
     * @throws Exception 
     * @since  2015-1-6 下午8:55:03
     */
    @SuppressWarnings("unchecked")
	public Map<String, Currency>  parseCurrencyXMLtoMap(String xml) throws DocumentException, Exception {
    	try{    		
            Document dom = DocumentHelper.parseText(xml);
			List<Element> eleList = dom.getRootElement().elements();
            Element elementRoot=dom.getRootElement();//获取根节点。
            String st=elementRoot.attribute("st").getValue();//获取是否成功标识。SUCCESS("1","成功"),EXCEPTION("0","未知异常"),INVALID_XML("1001001","报文格式错误"),INVALID_XML_DATA("1001002","报文数据有误"),DB_EXCEPTION("1002001","数据库调用异常"),TABLE_NOT_EXISTS("1002002","数据库表不存在");
            Map<String, Currency> currencyMap=new HashMap<String, Currency>();
            if(!StringUtil.isEmpty(st) && Constants.SUCCESS.equals(st)){            	
                for (Element element : eleList) {
                	if(Constants.CURRENCY_STATUS_EFFECTUAL.equals(element.attribute("status").getValue())){
                		//获取生效的货币
                		Currency currency=new Currency();
                		currency.setCurrency(element.attribute("currency").getValue());
                		currency.setSymbol(element.attribute("symbol").getValue());
                		currency.setName(element.attribute("name").getValue());
                		currency.setIsdefault(element.attributeValue("isDefault")==null?"":element.attributeValue("isDefault"));
                		currency.setStatus(element.attributeValue("status")==null?"":element.attributeValue("status") );
                		 currency.setApprovalresult(element.attributeValue("approvalResult")==null?"":element.attributeValue("approvalResult"));
                		currency.setMinimumDeposit(Double.parseDouble(element.attribute("miniMumDeposit").getValue()));  //存款最低限额
                		currency.setMinimumWithdrawal(Double.parseDouble(element.attribute("miniMumWithdrawal").getValue()));  //提款最低限额
                		currency.setCreateBy(element.attributeValue("createBy")==null?"":element.attributeValue("createBy"));
                		currency.setCreateDate(element.attributeValue("createDate")==null?"":element.attributeValue("createDate"));
                		currency.setWithdrawalTimes(Integer.parseInt(element.attribute("withdrawalTimes").getValue()));   //每天提款次数
                		currency.setPerservicecharges(element.attributeValue("perServiceCharges")==null?"":element.attributeValue("perServiceCharges"));
                		currency.setMaxservicecharges(element.attributeValue("maxServiceCharges")==null?"":element.attributeValue("maxServiceCharges"));
						currencyMap.put(currency.getCurrency(), currency);
                	}        		            
               }
            }else{
            	logger.info("平台前端ICE调用管理中心获取平台支持的货币表数据返回报文："+xml);
            }
            return currencyMap;
    		
    	}catch (DocumentException de) {
            throw de;

        }catch (Exception e) {
            throw e;
        }
    	
    }

    
	/*
	 * 将管理中心返回的互联网支付方式表的报文解析为数据字典对象。
	 */
	@SuppressWarnings("unchecked")
	public void parseAliPayXML(List<Dict> list, String xml) throws DocumentException, Exception {
		try {
			Document dom = DocumentHelper.parseText(xml);
			List<Element> eleList = dom.getRootElement().elements();
			Element elementRoot = dom.getRootElement();// 获取根节点。
			Map<String, Dict> aliPayMap = new ConcurrentHashMap<String, Dict>();
			String st = elementRoot.attribute("st").getValue();// 获取是否成功标识。SUCCESS("1","成功"),EXCEPTION("0","未知异常"),INVALID_XML("1001001","报文格式错误"),INVALID_XML_DATA("1001002","报文数据有误"),DB_EXCEPTION("1002001","数据库调用异常"),TABLE_NOT_EXISTS("1002002","数据库表不存在");
			if (!StringUtil.isEmpty(st) && Constants.SUCCESS.equals(st)) {
				for (Element element : eleList) {
					if (Constants.SHOW_HIDE_STATUS_SHOW.equals(element.attribute("status").getValue())) {
						// 获取显示状态的银行名称
						Dict dict = new Dict();
						dict.setRules(element.attribute("suppCurrency").getValue()); //支持货币
						dict.setStatus(Integer.valueOf(Constants.DICT_STATUS_Y));// 数据字典为启用状态。
						dict.setDictCode(element.attribute("apId").getValue());// 银行或机构id设置为字典代码
						dict.setDictName(element.attribute("name").getValue());// 设置字典名称：银行、机构
						dict.setIid(element.attribute("iid") == null ? "" : element.attribute("iid").getValue());
						dict.setUrl(element.attribute("url") == null ? "" : element.attribute("url").getValue());//微信支付统一下单地址
						dict.setCallbackAddr(element.attribute("callbackAddr") == null ? "" : element.attribute("callbackAddr").getValue());//微信支付回调地址
						dict.setQueryAddr(element.attribute("queryAddr") == null ? "" : element.attribute("queryAddr").getValue());//微信支付查询地址
						dict.setDictTypeName(element.attribute("type").getValue());
						dict.setSortNo(0);
						if(dict.getDictTypeName().equals("10")){
							dict.setDictTypeId(Constants.ALIPAY_DAG);// 设置字典类型为银行名称标签，标签通过此调用。
						}else if(dict.getDictTypeName().equals("11")){
							dict.setDictTypeId(Constants.WECHATPAY_DAG);// 设置字典类型为银行名称标签，标签通过此调用。
						}
						list.add(dict);
						aliPayMap.put(dict.getDictCode(),dict);
					}
				}
				//保存一份map格式的内存数据 以便使用
				//if(aliPayMap.size()>0){
					AppCache.setAliPayMap(aliPayMap);
				//}
			} else {
				logger.info("平台前端ICE调用管理中心获取银行名称表数据返回报文：" + xml);
			}

		} catch (DocumentException de) {
			throw de;

		} catch (Exception e) {
			throw e;
		}

	}
	
	
	/*
	 * 将管理中心返回的互联网支付方式账号表的报文解析为数据字典对象。
	 */
	@SuppressWarnings("unchecked")
	public void parseAliPayAccXML(List<Dict> list, String xml) throws DocumentException, Exception {
		try {
			Document dom = DocumentHelper.parseText(xml);
			List<Element> eleList = dom.getRootElement().elements();
			Element elementRoot = dom.getRootElement();// 获取根节点。
			Map<String, WechatPayAcc> aliPayAccMap = new ConcurrentHashMap<String, WechatPayAcc>();
			String st = elementRoot.attribute("st").getValue();// 获取是否成功标识。SUCCESS("1","成功"),EXCEPTION("0","未知异常"),INVALID_XML("1001001","报文格式错误"),INVALID_XML_DATA("1001002","报文数据有误"),DB_EXCEPTION("1002001","数据库调用异常"),TABLE_NOT_EXISTS("1002002","数据库表不存在");
			if (!StringUtil.isEmpty(st) && Constants.SUCCESS.equals(st)) {
				for (Element element : eleList) {
					if (Constants.SHOW_HIDE_STATUS_SHOW.equals(element.attribute("status").getValue())) {
						// 获取显示状态的银行名称
						/*Dict dict = new Dict();
						//dict.setRules(element.attribute("suppCurrency").getValue()); //支持货币
						dict.setDictTypeId(Constants.WECHATPAY_DAG);// 设置字典类型为银行名称标签，标签通过此调用。
						dict.setStatus(Integer.valueOf(Constants.DICT_STATUS_Y));// 数据字典为启用状态。
						dict.setDictCode(element.attribute("apaId").getValue());// 银行或机构id设置为字典代码
						dict.setDictName(element.attribute("accName").getValue());// 设置字典名称：银行、机构
						dict.setIid(element.attribute("iid") == null ? "" : element.attribute("iid").getValue());
						dict.setDictTypeName(element.attribute("type").getValue());
						dict.setSortNo(0);
						list.add(dict);*/
						WechatPayAcc acc = new WechatPayAcc();
						acc.setApaId(element.attribute("apaId").getValue());
						acc.setApId(element.attribute("apId").getValue());
						acc.setAppid(element.attribute("account").getValue());
						acc.setIsAutoConfirm(element.attribute("isautoconfirm").getValue());
						acc.setKey(element.attribute("apikey").getValue());
						acc.setMch_id(element.attribute("accName").getValue());
						aliPayAccMap.put(acc.getMch_id(),acc);
						
					}
				}
				//保存一份map格式的内存数据 以便使用
				//if(aliPayAccMap.size()>0){
					AppCache.setWechatAccMap(aliPayAccMap);
				//}
			} else {
				logger.info("平台前端ICE调用管理中心获取银行名称表数据返回报文：" + xml);
			}

		} catch (DocumentException de) {
			throw de;

		} catch (Exception e) {
			throw e;
		}

	}
}
