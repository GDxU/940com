package com.vinbet.mobile.service.portal;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;

import com.vinbet.mobile.entity.portal.Currency;
import com.vinbet.mobile.entity.portal.Dict;
import com.vinbet.mobile.entity.portal.EasyPayment;
import com.vinbet.mobile.entity.portal.FreezeCount;
import com.vinbet.mobile.entity.portal.NavigationApp;
import com.vinbet.mobile.entity.portal.PaymentPlatform;
import com.vinbet.mobile.entity.portal.SystemParm;
import com.vinbet.mobile.entity.portal.WalletCategory;
import com.vinbet.mobile.sys.AppCache;
import com.vinbet.mobile.sys.CEPMgrCenterClient;
import com.vinbet.mobile.util.Constants;
import com.vinbet.mobile.util.XMLBean;

/**
 * 数据字典业务类。
 * 
 * <pre>
 * <功能详细描述>
 * </pre>
 * 
 * @author cjp
 * @version [Ver 1.0]
 * @since 2015-4-7 上午10:55:19
 */
@IocBean
public class DictServiceImpl {
	@Inject
	private CEPMgrCenterClient cEPMgrCenterClient;
	@Inject
	private SyncDataForDict syncDataForDict;
	private static final Logger logger = LogManager.getLogger(DictServiceImpl.class);

	/**
	 * 查询所有数据字典
	 * */
	public List<Dict> findAllDictList() {
		// 一、获取基础数据字典。
		String dictReqXML = syncDataForDict.getDictReqXML(Constants.DICT_BASE);// 构造数据字典表请求报文
		logger.info("【手机前端调用管理中心ICE获取所有数据字典请求报文为：】" + dictReqXML);
		String dictResXML = this.cEPMgrCenterClient.getSyncPrmtData(dictReqXML);// 调用管理中心ice获取所有数据字典报文。
		logger.info("【手机前端调用管理中心ICE获取所有数据字典报文为：】" + dictResXML);
		// 二、构造货币数据字典。
		String currencyReqDictXML = syncDataForDict.getDictReqXML(Constants.DICT_CURRENCY);// 构造手机支持的货币表请求报文
		logger.info("【手机前端调用管理中心ICE获取手机支持的货币表请求报文为：】" + currencyReqDictXML);
		String currencyResDictXML = this.cEPMgrCenterClient.getSyncPrmtData(currencyReqDictXML);// 调用管理中心ice获取手机支持的货币数据字典报文。
		logger.info("【手机前端调用管理中心ICE获取手机支持的货币表报文为：】" + currencyResDictXML);
		// 三、构造数据字典：1、用户添加提款方式时候可选择的银行和支付机构名称。2、用户线下银行转账的时候用户可选的银行名称。
		String bankNameReqDictXML = syncDataForDict.getDictReqXML(Constants.DICT_BANKNAME);// 构造银行名称表请求报文
		logger.info("【手机前端调用管理中心ICE获取用户线下存款可用的银行名称和添加提款方式用户可用的银行和机构表请求报文为：】" + bankNameReqDictXML);
		String bankNameResDictXML = this.cEPMgrCenterClient.getSyncPrmtData(bankNameReqDictXML);// 调用管理中心ice获取银行名称报文。
		//bankNameResDictXML = "<?xml version='1.0' encoding='UTF-8'?><resp st='1' msg='成功'><rec wdoId='1' wdoName='中国农业银行' wdoNameBak='' iid='692' wdoLogo='/images/wdologo/abc.png' wdoType='7' wdoTypeDesc='' status='1' statusDesc='' createBy='0' createDate='2015-09-19 14:54:47' suppCurrency='CNY' url='http://www.abchina.com' sortNo='1' isCommon='1'/><rec wdoId='2' wdoName='中国工商银行' wdoNameBak='' iid='693' wdoLogo='/images/wdologo/icbc.png' wdoType='7' wdoTypeDesc='' status='1' statusDesc='' createBy='0' createDate='2015-09-19 14:54:47' suppCurrency='CNY' url='http://www.icbc.com.cn' sortNo='2' isCommon='1'/><rec wdoId='3' wdoName='中国建设银行' wdoNameBak='' iid='694' wdoLogo='/images/wdologo/ccb.png' wdoType='7' wdoTypeDesc='' status='1' statusDesc='' createBy='0' createDate='2015-09-19 14:54:47' suppCurrency='CNY' url='http://www.ccb.com' sortNo='3' isCommon='1'/><rec wdoId='4' wdoName='招商银行' wdoNameBak='' iid='695' wdoLogo='/images/wdologo/cmbchina.png' wdoType='7' wdoTypeDesc='' status='1' statusDesc='' createBy='0' createDate='2015-09-19 14:54:47' suppCurrency='CNY' url='http://www.cmbchina.com' sortNo='4' isCommon='1'/><rec wdoId='5' wdoName='泰华农民银行' wdoNameBak='' iid='696' wdoLogo='/images/wdologo/bankOfThaiHua.jpg' wdoType='7' wdoTypeDesc='' status='1' statusDesc='' createBy='0' createDate='2015-09-19 14:54:47' suppCurrency='THB' url='http://www.kasikornbank.com/' sortNo='5' isCommon='0'/><rec wdoId='6' wdoName='包商银行' wdoNameBak='' iid='697' wdoLogo='/images/wdologo/bsb.jpg' wdoType='7' wdoTypeDesc='' status='1' statusDesc='' createBy='0' createDate='2015-09-19 14:54:47' suppCurrency='CNY' url='http://www.bsb.com.cn' sortNo='6' isCommon='0'/><rec wdoId='7' wdoName='北京农商银行' wdoNameBak='' iid='698' wdoLogo='/images/wdologo/basb.jpg' wdoType='7' wdoTypeDesc='' status='1' statusDesc='' createBy='0' createDate='2015-09-19 14:54:48' suppCurrency='CNY' url='http://www.bjrcb.com' sortNo='7' isCommon='0'/><rec wdoId='8' wdoName='北京银行' wdoNameBak='' iid='699' wdoLogo='/images/wdologo/bjb.png' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-09-19 14:54:48' suppCurrency='CNY' url='http://www.bankofbeijing.com.cn' sortNo='8' isCommon='0'/><rec wdoId='9' wdoName='渤海银行' wdoNameBak='' iid='700' wdoLogo='/images/wdologo/bohb.png' wdoType='7' wdoTypeDesc='' status='1' statusDesc='' createBy='0' createDate='2015-09-19 14:54:48' suppCurrency='CNY' url='http://www.cbhb.com.cn' sortNo='9' isCommon='0'/><rec wdoId='10' wdoName='赣州银行' wdoNameBak='' iid='701' wdoLogo='/images/wdologo/gzb.png' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-09-19 14:54:48' suppCurrency='CNY' url='http://www.gzccb.com' sortNo='10' isCommon='0'/><rec wdoId='11' wdoName='广东发展银行' wdoNameBak='' iid='702' wdoLogo='/images/wdologo/gfb.png' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-09-19 14:54:48' suppCurrency='CNY' url='http://www.cgbchina.com.cn' sortNo='11' isCommon='0'/><rec wdoId='12' wdoName='广东南粤银行' wdoNameBak='' iid='703' wdoLogo='/images/wdologo/gdny.jpg' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-09-19 14:54:48' suppCurrency='CNY' url='http://www.zjcbank.com' sortNo='12' isCommon='0'/><rec wdoId='13' wdoName='广州银行' wdoNameBak='' iid='704' wdoLogo='/images/wdologo/gzb.jpg' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-09-19 14:54:48' suppCurrency='CNY' url='http://www.gzcb.com.cn' sortNo='13' isCommon='0'/><rec wdoId='14' wdoName='汉口银行' wdoNameBak='' iid='705' wdoLogo='/images/wdologo/hkb.png' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-09-19 14:54:48' suppCurrency='CNY' url='http://www.hkbchina.com' sortNo='14' isCommon='0'/><rec wdoId='15' wdoName='杭州银行' wdoNameBak='' iid='706' wdoLogo='/images/wdologo/hzb.jpg' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-09-19 14:54:48' suppCurrency='CNY' url='http://www.hzbank.com.cn' sortNo='15' isCommon='0'/><rec wdoId='16' wdoName='河北银行' wdoNameBak='' iid='707' wdoLogo='/images/wdologo/hbb.png' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-09-19 14:54:48' suppCurrency='CNY' url='http://www.hebbank.com' sortNo='16' isCommon='0'/><rec wdoId='17' wdoName='恒丰银行' wdoNameBak='' iid='708' wdoLogo='/images/wdologo/hfb.png' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-09-19 14:54:48' suppCurrency='CNY' url='http://www.egbank.com.cn' sortNo='17' isCommon='0'/><rec wdoId='18' wdoName='华夏银行' wdoNameBak='' iid='709' wdoLogo='/images/wdologo/hxb.png' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-09-19 14:54:48' suppCurrency='CNY' url='http://www.hxb.com.cn' sortNo='18' isCommon='0'/><rec wdoId='19' wdoName='江苏江阴农村商业银行' wdoNameBak='' iid='710' wdoLogo='/images/wdologo/jsasb.jpg' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-09-19 14:54:48' suppCurrency='CNY' url='http://www.jybank.com.cn' sortNo='19' isCommon='0'/><rec wdoId='20' wdoName='江苏银行' wdoNameBak='' iid='711' wdoLogo='/images/wdologo/jsub.png' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-09-19 14:54:48' suppCurrency='CNY' url='http://www.jsbchina.cn' sortNo='20' isCommon='0'/><rec wdoId='21' wdoName='交通银行' wdoNameBak='' iid='712' wdoLogo='/images/wdologo/jtb.png' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-09-19 14:54:48' suppCurrency='CNY' url='http://www.bankcomm.com' sortNo='21' isCommon='1'/><rec wdoId='22' wdoName='南昌银行' wdoNameBak='' iid='713' wdoLogo='/images/wdologo/ncb.jpg' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-09-19 14:54:48' suppCurrency='CNY' url='http://www.nccbank.com.cn' sortNo='22' isCommon='0'/><rec wdoId='23' wdoName='南京银行' wdoNameBak='' iid='714' wdoLogo='/images/wdologo/njb.jpg' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-09-19 14:54:48' suppCurrency='CNY' url='http://www.njcb.com.cn' sortNo='23' isCommon='0'/><rec wdoId='24' wdoName='宁波银行' wdoNameBak='' iid='715' wdoLogo='/images/wdologo/lbb.png' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-09-19 14:54:48' suppCurrency='CNY' url='http://www.nbcb.com.cn' sortNo='24' isCommon='0'/><rec wdoId='25' wdoName='平安银行' wdoNameBak='' iid='716' wdoLogo='/images/wdologo/pab.png' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-09-19 14:54:48' suppCurrency='CNY' url='http://bank.pingan.com' sortNo='25' isCommon='1'/><rec wdoId='26' wdoName='上海农商银行' wdoNameBak='' iid='717' wdoLogo='/images/wdologo/shamb.jpg' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-09-19 14:54:48' suppCurrency='CNY' url='http://www.srcb.com' sortNo='26' isCommon='0'/><rec wdoId='27' wdoName='上海浦东发展银行' wdoNameBak='' iid='718' wdoLogo='/images/wdologo/spdb.png' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-09-19 14:54:48' suppCurrency='CNY' url='http://www.spdb.com.cn' sortNo='27' isCommon='0'/><rec wdoId='28' wdoName='上海银行' wdoNameBak='' iid='719' wdoLogo='/images/wdologo/shhb.png' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-09-19 14:54:48' suppCurrency='CNY' url='http://www.bankofshanghai.com' sortNo='28' isCommon='0'/><rec wdoId='29' wdoName='天津银行' wdoNameBak='' iid='720' wdoLogo='/images/wdologo/tjb.png' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-09-19 14:54:48' suppCurrency='CNY' url='http://www.tccb.com.cn' sortNo='29' isCommon='0'/><rec wdoId='30' wdoName='威海市商业银行' wdoNameBak='' iid='721' wdoLogo='/images/wdologo/whshyb.png' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-09-19 14:54:48' suppCurrency='CNY' url='http://www.whccb.com' sortNo='30' isCommon='0'/><rec wdoId='31' wdoName='微商银行' wdoNameBak='' iid='722' wdoLogo='/images/wdologo/hshb.png' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-09-19 14:54:48' suppCurrency='CNY' url='http://www.hsbank.com.cn' sortNo='31' isCommon='0'/><rec wdoId='32' wdoName='温州银行' wdoNameBak='' iid='723' wdoLogo='/images/wdologo/wzb.jpg' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-09-19 14:54:48' suppCurrency='CNY' url='http://www.wzcb.com.cn' sortNo='32' isCommon='0'/><rec wdoId='33' wdoName='乌鲁木齐市商业银行' wdoNameBak='' iid='724' wdoLogo='//images/wdologo/wlmqb.png' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-09-19 14:54:48' suppCurrency='CNY,csb' url='http://www.uccb.com.cn' sortNo='33' isCommon='0'/><rec wdoId='34' wdoName='兴业银行' wdoNameBak='' iid='725' wdoLogo='/images/wdologo/cib.png' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-09-19 14:54:48' suppCurrency='CNY' url='http://www.cib.com.cn' sortNo='34' isCommon='0'/><rec wdoId='35' wdoName='中国民生银行' wdoNameBak='' iid='726' wdoLogo='/images/wdologo/cmbc.png' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-09-19 14:54:48' suppCurrency='CNY' url='http://www.cmbc.com.cn' sortNo='35' isCommon='1'/><rec wdoId='36' wdoName='中国银行' wdoNameBak='' iid='727' wdoLogo='/images/wdologo/boc.png' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-09-19 14:54:48' suppCurrency='CNY' url='http://www.boc.cn' sortNo='36' isCommon='1'/><rec wdoId='37' wdoName='中国邮政储蓄银行' wdoNameBak='' iid='728' wdoLogo='/images/wdologo/psbc.png' wdoType='7' wdoTypeDesc='' status='1' statusDesc='' createBy='0' createDate='2015-09-19 14:54:48' suppCurrency='CNY' url='http://www.psbc.com' sortNo='37' isCommon='1'/><rec wdoId='38' wdoName='中信银行' wdoNameBak='' iid='729' wdoLogo='/images/wdologo/ecitic.png' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-09-19 14:54:48' suppCurrency='CNY' url='http://bank.ecitic.com' sortNo='38' isCommon='0'/><rec wdoId='39' wdoName='重庆银行' wdoNameBak='' iid='730' wdoLogo='/images/wdologo/chqb.png' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-09-19 14:54:48' suppCurrency='CNY' url='http://www.cqcbank.com' sortNo='39' isCommon='0'/><rec wdoId='40' wdoName='盘谷银行' wdoNameBak='' iid='734' wdoLogo='/images/wdologo/bankOfPanGu.jpg' wdoType='7' wdoTypeDesc='' status='1' statusDesc='' createBy='0' createDate='2015-09-19 14:54:49' suppCurrency='THB' url='http://www.bangkokbank.com/' sortNo='40' isCommon='0'/><rec wdoId='41' wdoName='泰京银行' wdoNameBak='' iid='735' wdoLogo='/images/wdologo/bankOfThaiJing.jpg' wdoType='7' wdoTypeDesc='' status='1' statusDesc='' createBy='0' createDate='2015-09-19 14:54:49' suppCurrency='THB' url='http://www.ktb.co.th/' sortNo='41' isCommon='0'/><rec wdoId='42' wdoName='泰商银行' wdoNameBak='' iid='736' wdoLogo='/images/wdologo/bankOfThaiShang.jpg' wdoType='7' wdoTypeDesc='' status='1' statusDesc='' createBy='0' createDate='2015-09-19 14:54:49' suppCurrency='THB' url='http://www.scb.co.th/' sortNo='42' isCommon='0'/><rec wdoId='43' wdoName='泰华农民银行' wdoNameBak='' iid='737' wdoLogo='/images/wdologo/bankOfThaiHua.jpg' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-09-19 14:54:49' suppCurrency='THB' url='http://www.kasikornbank.com/' sortNo='43' isCommon='0'/><rec wdoId='44' wdoName='大城银行' wdoNameBak='' iid='738' wdoLogo='/images/wdologo/bankOfDaCheng.jpg' wdoType='7' wdoTypeDesc='' status='1' statusDesc='' createBy='0' createDate='2015-09-19 14:54:49' suppCurrency='THB' url='http://www.krungsri.com/' sortNo='44' isCommon='0'/><rec wdoId='45' wdoName='政府储蓄银行' wdoNameBak='' iid='739' wdoLogo='/images/wdologo/GovernmentSavingsBank.jpg' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-09-19 14:54:49' suppCurrency='THB' url='http://www.gsb.or.th/index.php' sortNo='45' isCommon='0'/><rec wdoId='46' wdoName='泰国军人银行' wdoNameBak='' iid='740' wdoLogo='/images/wdologo/bankOfHhaiArmy.jpg' wdoType='7' wdoTypeDesc='' status='1' statusDesc='' createBy='0' createDate='2015-09-19 14:54:49' suppCurrency='THB' url='https://www.tmbbank.com' sortNo='46' isCommon='0'/><rec wdoId='47' wdoName='泰国中央银行' wdoNameBak='' iid='741' wdoLogo='/images/wdologo/BankofThailand.jpg' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-09-19 14:54:49' suppCurrency='THB' url='http://www.bot.or.th' sortNo='47' isCommon='0'/><rec wdoId='49' wdoName='丰业银行' wdoNameBak='' iid='743' wdoLogo='/images/wdologo/ThanachartBank.jpg' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-09-19 14:54:49' suppCurrency='THB' url='http://www.thanachartbank.co.th/' sortNo='49' isCommon='0'/><rec wdoId='50' wdoName='渣打银行' wdoNameBak='' iid='744' wdoLogo='/images/wdologo/zhdb.png' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-09-19 14:54:49' suppCurrency='THB' url='https://www.sc.com/th/en/' sortNo='50' isCommon='0'/><rec wdoId='51' wdoName='大华银行' wdoNameBak='' iid='745' wdoLogo='//images/wdologo/bankOfDaHua.jpg' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-09-19 14:54:49' suppCurrency='THB' url='http://www.uob.co.th/' sortNo='51' isCommon='1'/><rec wdoId='52' wdoName='支付宝' wdoNameBak='' iid='751' wdoLogo='/images/wdologo/alipay.jpg' wdoType='10' wdoTypeDesc='' status='1' statusDesc='' createBy='0' createDate='2016-01-23 17:41:36' suppCurrency='CNY' url='https://www.alipay.com/' sortNo='52' isCommon='0'/><rec wdoId='1505' wdoName='九江银行' wdoNameBak='' iid='' wdoLogo='//images/wdologo/20151028171311.jpg' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-10-28 16:31:13' suppCurrency='CNY' url='www.baidu.com' sortNo='52' isCommon='0'/><rec wdoId='1500' wdoName='农村信用社' wdoNameBak='' iid='' wdoLogo='/images/wdologo/20151023200427.jpg' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-10-23 20:04:29' suppCurrency='CNY' url='啊打发' sortNo='99' isCommon='0'/><rec wdoId='2501' wdoName='测123' wdoNameBak='' iid='' wdoLogo='/images/wdologo/20160129222253.jpg' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2016-01-29 22:13:13' suppCurrency='CNY' url='1132' sortNo='99' isCommon='0'/><rec wdoId='1502' wdoName='广州农商银行' wdoNameBak='' iid='' wdoLogo='/images/wdologo/20151023200534.jpg' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-10-23 20:05:41' suppCurrency='CNY' url='daf' sortNo='99' isCommon='0'/><rec wdoId='1503' wdoName='深圳农商银行' wdoNameBak='' iid='' wdoLogo='/images/wdologo/20151023200551.jpg' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-10-23 20:05:56' suppCurrency='CNY' url='fda' sortNo='99' isCommon='0'/><rec wdoId='1504' wdoName='东莞农商银行' wdoNameBak='' iid='' wdoLogo='/images/wdologo/20151023200611.jpg' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-10-23 20:06:17' suppCurrency='CNY' url='afd' sortNo='99' isCommon='0'/><rec wdoId='2500' wdoName='测试玩玩' wdoNameBak='' iid='' wdoLogo='/images/wdologo/20160129215717.jpg' wdoType='7' wdoTypeDesc='' status='1' statusDesc='' createBy='0' createDate='2016-01-29 21:47:41' suppCurrency='CNY' url='123' sortNo='99' isCommon='0'/><rec wdoId='1506' wdoName='九江银行' wdoNameBak='' iid='' wdoLogo='/images/wdologo/20151028172022.jpg' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-10-28 17:20:33' suppCurrency='CNY' url='测试2' sortNo='99' isCommon='0'/><rec wdoId='1507' wdoName='深圳农村商业信用社' wdoNameBak='' iid='' wdoLogo='/images/wdologo/20151102204520.jpg' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-11-02 20:45:21' suppCurrency='CNY' url='test' sortNo='99' isCommon='0'/><rec wdoId='2000' wdoName='手机测试1220' wdoNameBak='' iid='' wdoLogo='/images/wdologo/20151220092628.png' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-12-20 09:26:55' suppCurrency='CNY' url='www.baidu.com' sortNo='99' isCommon='0'/><rec wdoId='2001' wdoName='测试一哈' wdoNameBak='' iid='' wdoLogo='/images/wdologo/20151223202653.png' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-12-23 20:27:09' suppCurrency='cd,csb' url='ww.baidu.com' sortNo='99' isCommon='0'/><rec wdoId='2002' wdoName='测试测试看卡1234' wdoNameBak='' iid='' wdoLogo='//images/wdologo/20151223204438.jpg' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-12-23 20:44:54' suppCurrency='CNY' url='123' sortNo='99' isCommon='0'/><rec wdoId='2003' wdoName='只是测试银行1234' wdoNameBak='' iid='' wdoLogo='/images/wdologo/20151224175143.jpg' wdoType='7' wdoTypeDesc='' status='1' statusDesc='' createBy='0' createDate='2015-12-24 17:52:07' suppCurrency='CNY' url='123' sortNo='99' isCommon='0'/><rec wdoId='2004' wdoName='151461546789' wdoNameBak='' iid='' wdoLogo='///images/wdologo/20151226162752.jpg' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-12-26 16:27:59' suppCurrency='CNY' url='123101' sortNo='99' isCommon='0'/><rec wdoId='1000' wdoName='支付宝' wdoNameBak='' iid='' wdoLogo='/images/wdologo/20151017201257.png' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-09-26 21:53:22' suppCurrency='CNY' url='https://www.alipay.com/' sortNo='99' isCommon='0'/><rec wdoId='1501' wdoName='光大银行' wdoNameBak='' iid='' wdoLogo='/images/wdologo/20151023200507.jpg' wdoType='7' wdoTypeDesc='' status='0' statusDesc='' createBy='0' createDate='2015-10-23 20:05:18' suppCurrency='CNY' url='打发' sortNo='99' isCommon='0'/></resp>";
		logger.info("【手机前端调用管理中心ICE获取银行名称表报文为：】" + bankNameResDictXML);

		// 四、构造手机号码类型数据字典。
		String mobileTypeReqDictXML = syncDataForDict.getDictReqXML(Constants.DICT_MOBILETYPE);// 手机号码类型表请求报文
		logger.info("【手机前端调用管理中心ICE获取手机号码类型表请求报文为：】" + mobileTypeReqDictXML);
		String mobileTypeResDictXML = this.cEPMgrCenterClient.getSyncPrmtData(mobileTypeReqDictXML);// 调用管理中心ice获取手机号码类型报文。
		logger.info("【手机前端调用管理中心ICE获取手机号码类型表报文为：】" + mobileTypeResDictXML);

		// 五、构造本地银行转账银行名称数据字典。
		String localBankReqDictXML = syncDataForDict.getDictReqXML(Constants.DICT_COMPANYBANKACC);// 公司本地银行转账的收款账户表请求报文 T_COMPANYBANKACC
		logger.info("【手机前端调用管理中心ICE获取公司本地银行转账的收款账户表请求报文为：】" + localBankReqDictXML);
		String localBankResDictXML = this.cEPMgrCenterClient.getSyncPrmtData(localBankReqDictXML);
		//localBankResDictXML = "<resp st='1' msg='成功'><rec cbaId='61' bankName='中国农业银行' accountName='黄付茂' cardNumber='6228480629739539175' openingOutlets='广东湛江支行' icon='////images/bankacclogo/abc.png' status='0' statusDesc='' createBy='0' createDate='2015-09-21 07:04:32' suppCurrency='CNY' bankCode='ABCHINA'/><rec cbaId='1025' bankName='中国农业银行' accountName='郭钊' cardNumber='6228480086693876475' openingOutlets='广州江南西路支行' icon='' status='1' statusDesc='' createBy='103' createDate='2015-12-21 16:36:39' suppCurrency='CNY' bankCode='ABCHINA'/><rec cbaId='1017' bankName='中国农业银行' accountName='王光锋' cardNumber='6228480809219243973' openingOutlets='湖南衡东县支行' icon='' status='0' statusDesc='' createBy='168' createDate='2015-12-02 07:33:51' suppCurrency='CNY' bankCode='ABCHINA'/><rec cbaId='1016' bankName='中国农业银行' accountName='王光锋' cardNumber='6228480809219243973' openingOutlets='6228480809219243973' icon='' status='0' statusDesc='' createBy='170' createDate='2015-11-26 14:36:19' suppCurrency='CNY' bankCode='ABCHINA'/><rec cbaId='1011' bankName='中国农业银行' accountName='刘冬连' cardNumber='6228480086182601673' openingOutlets='广州白云京溪支行' icon='' status='0' statusDesc='' createBy='173' createDate='2015-10-23 21:58:47' suppCurrency='CNY' bankCode='ABCHINA'/><rec cbaId='62' bankName='中国工商银行' accountName='梁友晴' cardNumber='6212262015006702639' openingOutlets='湛江瑞云北路支行' icon='///images/bankacclogo/icbc.png' status='0' statusDesc='' createBy='0' createDate='2015-09-21 07:04:32' suppCurrency='CNY' bankCode='ICBC'/><rec cbaId='1501' bankName='中国工商银行' accountName='李志红' cardNumber='6212263602065193278' openingOutlets='广州番禺平康支行' icon='/images/bankacclogo/20160130160626.PNG' status='0' statusDesc='' createBy='176' createDate='2016-01-30 16:06:38' suppCurrency='CNY' bankCode='ICBC'/><rec cbaId='1028' bankName='中国工商银行' accountName='李波' cardNumber='6212264000046163552' openingOutlets='深圳星河支行' icon='/images/bankacclogo/20160105024249.png' status='0' statusDesc='' createBy='176' createDate='2016-01-05 02:43:35' suppCurrency='CNY' bankCode='ICBC'/><rec cbaId='1024' bankName='中国工商银行' accountName='宋燕燕' cardNumber='6212264000046157315' openingOutlets='深圳国贸支行' icon='/images/bankacclogo/20151221160649.png' status='1' statusDesc='' createBy='176' createDate='2015-12-21 16:07:25' suppCurrency='CNY' bankCode='ICBC'/><rec cbaId='1023' bankName='中国工商银行' accountName='郭钊' cardNumber='6212263602068645704' openingOutlets='广州工业大道支行  ' icon='/images/bankacclogo/20151221155547.png' status='0' statusDesc='' createBy='176' createDate='2015-12-21 15:56:16' suppCurrency='CNY' bankCode='ICBC'/><rec cbaId='1022' bankName='中国工商银行' accountName='郭利' cardNumber='6212263602068645704' openingOutlets='广州工业大道支行  ' icon='/images/bankacclogo/20151221155333.png' status='0' statusDesc='' createBy='176' createDate='2015-12-21 15:54:03' suppCurrency='CNY' bankCode='ICBC'/><rec cbaId='1021' bankName='中国工商银行' accountName='曹娜娜' cardNumber='6212264000046151318' openingOutlets='深圳市罗湖支行' icon='/images/bankacclogo/20151220194334.png' status='0' statusDesc='' createBy='176' createDate='2015-12-20 19:43:54' suppCurrency='CNY' bankCode='ICBC'/><rec cbaId='2500' bankName='中国建行银行' accountName='曹志刚' cardNumber='6217007200034952641' openingOutlets='深圳城东支行' icon='' status='1' statusDesc='' createBy='168' createDate='2016-02-20 17:28:26' suppCurrency='CNY' bankCode='CCB'/><rec cbaId='1008' bankName='中国建设银行' accountName='丘林' cardNumber='6217003130004176257' openingOutlets='广东廉江建达财富广场支行' icon='//images/bankacclogo/20151004202220.jpg' status='0' statusDesc='' createBy='110' createDate='2015-10-04 20:22:51' suppCurrency='CNY' bankCode='CCB'/><rec cbaId='1019' bankName='中国建设银行' accountName='张霞' cardNumber='6217007200035452260 ' openingOutlets='深圳城东支行' icon='/images/bankacclogo/20151205220022.png' status='0' statusDesc='' createBy='176' createDate='2015-12-05 22:01:09' suppCurrency='CNY' bankCode='CCB'/><rec cbaId='63' bankName='中国建设银行' accountName='王贤伟' cardNumber='6210817200017694579' openingOutlets='深圳宝安支行' icon='///images/bankacclogo/ccb.png' status='0' statusDesc='' createBy='0' createDate='2015-09-21 07:04:33' suppCurrency='CNY' bankCode='CCB'/><rec cbaId='1018' bankName='中国建设银行' accountName='张霞' cardNumber='6217007200035452260 ' openingOutlets=' ' icon='/images/bankacclogo/20151205215749.png' status='0' statusDesc='' createBy='176' createDate='2015-12-05 21:58:35' suppCurrency='CNY' bankCode='CCB'/><rec cbaId='1009' bankName='中国建设银行' accountName='梁艳萍' cardNumber='6217003110011102561' openingOutlets='广东佛山三水支行' icon='' status='0' statusDesc='' createBy='168' createDate='2015-10-22 14:43:34' suppCurrency='CNY' bankCode='CCB'/><rec cbaId='1013' bankName='中国建设银行' accountName='毛明湘' cardNumber='6236682950001531743' openingOutlets='湖南衡东支行营业部' icon='/images/bankacclogo/20151122183012.png' status='0' statusDesc='' createBy='176' createDate='2015-11-22 18:41:55' suppCurrency='CNY' bankCode='CCB'/><rec cbaId='1014' bankName='中国建设银行' accountName='冼朝武' cardNumber='6236683130000806607' openingOutlets='湛江遂溪支行' icon='/images/bankacclogo/20151124181045.png' status='0' statusDesc='' createBy='176' createDate='2015-11-24 18:11:44' suppCurrency='CNY' bankCode='CCB'/><rec cbaId='1030' bankName='中国建设银行' accountName='郭钊' cardNumber='6236683320009108119' openingOutlets='广州长提支行  ' icon='/images/bankacclogo/20160119190119.png' status='0' statusDesc='' createBy='273' createDate='2016-01-19 19:02:09' suppCurrency='CNY' bankCode='CCB'/><rec cbaId='1500' bankName='中国建设银行' accountName='宋燕燕' cardNumber='6217007200035523334' openingOutlets='深圳城东支行' icon='/images/bankacclogo/20160128172044.png' status='0' statusDesc='' createBy='273' createDate='2016-01-28 17:21:23' suppCurrency='CNY' bankCode='CCB'/><rec cbaId='1026' bankName='中国邮政储蓄银行' accountName='龚国驰' cardNumber='6217995910001326231' openingOutlets='湛江市军民路邮政储蓄所' icon='/images/bankacclogo/20151222185130.png' status='1' statusDesc='' createBy='176' createDate='2015-12-22 18:56:22' suppCurrency='CNY' bankCode='ABCHINA'/><rec cbaId='64' bankName='招商银行' accountName='黄桂龙' cardNumber='6214837590369843' openingOutlets='广东省湛江分行营业部' icon='/images/bankacclogo/cmbchina.png' status='0' statusDesc='' createBy='0' createDate='2015-09-21 07:04:33' suppCurrency='CNY' bankCode='CMBCHINA'/><rec cbaId='1010' bankName='招商银行' accountName='冯显仪' cardNumber='6214837590390278' openingOutlets=' 湛江分行营业部 ' icon='' status='0' statusDesc='' createBy='168' createDate='2015-10-22 14:45:15' suppCurrency='CNY' bankCode='CMBCHINA'/><rec cbaId='1020' bankName='招商银行' accountName='曹娜娜' cardNumber='6214837807455823' openingOutlets='深圳市罗湖支行' icon='/images/bankacclogo/20151217155932.png' status='1' statusDesc='' createBy='176' createDate='2015-12-17 16:00:43' suppCurrency='CNY' bankCode='CMBCHINA'/><rec cbaId='65' bankName='泰华农民银行' accountName='น.ส.อุดม บุญประเสริฐ' cardNumber='0572 0143 73' openingOutlets=' ' icon='/images/bankacclogo/bankOfThaiHua.jpg' status='0' statusDesc='' createBy='0' createDate='2015-09-21 07:04:34' suppCurrency='THB' bankCode='KASIKORNBANK'/></resp>";
		logger.info("【手机前端调用管理中心ICE获取公司本地银行转账的收款账户表报文为：】" + localBankResDictXML);

		// 六、构造地区资料数据字典
		String areainfoReqDictXML = syncDataForDict.getDictReqXML(Constants.DICT_AREAINFO);
		logger.info("【手机前端调用管理中心ICE获取地区资料表请求报文为：】" + areainfoReqDictXML);
		String areainfoResDictXML = this.cEPMgrCenterClient.getSyncPrmtData(areainfoReqDictXML);
		logger.info("【手机前端调用管理中心ICE获取地区资料表报文为：】" + areainfoResDictXML);
		
		// 七、构造互联网支付方式数据字典
		String aliPayReqDictXML = syncDataForDict.getDictReqXML(Constants.DICT_ALIPAYINFO);
		logger.info("【手机前端调用管理中心ICE获取互联网支付方式请求报文为：】" + aliPayReqDictXML);
		String aliPayResDictXML = this.cEPMgrCenterClient.getSyncPrmtData(aliPayReqDictXML);
		//aliPayResDictXML = "<?xml version='1.0' encoding='UTF-8'?><resp st='1' msg='成功'><rec apId='3503' name='支付宝112' unUpdName='' icon='//images/alipaylogo/20151212150157.jpg' type='10' url='www.baidu.com1' status='1' statusDesc='' createDate='2015-12-11 14:21:16' createBy='0' modifyDate='2015-12-11 22:17:52' suppCurrency='' accountName='' accountNum=''/></resp>";
		logger.info("【手机前端调用管理中心ICE获取互联网支付方式报文为：】" + aliPayResDictXML);
		
		// 八、构造互联网支付方式账号数据字典
		XMLBean xmlREQ = new XMLBean("req");
		xmlREQ.addttribute("tbnm", Constants.DICT_ALIPAYACCINFO);
		xmlREQ.addttribute("type", "11");
		String aliPayAccReqDictXML = xmlREQ.toXML();
		//String aliPayAccReqDictXML = syncDataForDict.getDictReqXML(Constants.DICT_ALIPAYACCINFO);
		logger.info("【手机前端调用管理中心ICE获取互联网支付方式请求报文为：】" + aliPayAccReqDictXML);
		String aliPayAccResDictXML = this.cEPMgrCenterClient.getSyncPrmtData(aliPayAccReqDictXML);
		logger.info("【手机前端调用管理中心ICE获取互联网支付方式报文为：】" + aliPayAccResDictXML);

		List<Dict> list = null;
		try {
			list = syncDataForDict.parseBaseDictXML(dictResXML);// 获取管理中心所有的数据字典。
			syncDataForDict.parseCurrencyXML(list, currencyResDictXML);// 构造手机支持的货币的数据字典项。
			syncDataForDict.parseCurrencyXMLtoCache(currencyResDictXML); // 将数据手机支持的货币添加到内存中
			syncDataForDict.parseBankNameXML(list, bankNameResDictXML);// 构造银行名称数据字典项。
			syncDataForDict.parseMobileTypeXML(list, mobileTypeResDictXML);// 构造银行名称数据字典项。
			syncDataForDict.parseLocalBankXML(list, localBankResDictXML);// 构造公司本地银行转账的收款账户数据字典。
			syncDataForDict.parseAreaInfoXML(list, areainfoResDictXML);// 构造地区资料数据字典。
			syncDataForDict.parseAliPayXML(list, aliPayResDictXML);//构造互联网支付机构数据字典
			syncDataForDict.parseAliPayAccXML(list, aliPayAccResDictXML);//构造互联网支付机构账号数据字典
		} catch (final Exception e) {
			logger.error(e.getMessage(), e);
		}
		return list;
	}

	/**
	 * 查询系统支持的第三方支付手机数据
	 **/

	public List<PaymentPlatform> findAllPaymentPlatList() {
		String paymentPlatReqDictXML = syncDataForDict.getDictReqXML(Constants.DICT_PAYMENTPLATFORM);// 构造获取系统支持的第三方支付手机请求报文
		logger.info("【手机前端调用管理中心ICE获取系统支持的第三方支付手机请求报文为：】" + paymentPlatReqDictXML);
		String paymentPlatResDictXML = this.cEPMgrCenterClient.getSyncPrmtData(paymentPlatReqDictXML);// 调用管理中心ice获取银行名称报文。
		logger.info("【手机前端调用管理中心ICE获取系统支持的第三方支付手机报文为：】" + paymentPlatResDictXML);

		List<PaymentPlatform> list = null;
		try {
			list = syncDataForDict.parsePaymentPlatXML(paymentPlatResDictXML);// 获取管理中心所有的数据字典。
			this.addPaymentPlatNameToDict(list);// 向内存数据字典中添加系统支持的支付手机名称。
		} catch (final Exception e) {
			logger.error(e.getMessage(), e);
		}
		return list;
	}

	/* 获取管理中心设置的公司易支付中所有的银行帐号信息和支付机构信息 */
	public List<EasyPayment> findAllEasyPaymentList() {
		// 获取系统易支付开户的各个支付宝帐号和银行帐号，构造为内存对象，供前端用户充值的时候系统随机分配给客户存款。
		String easyPayReqDictXML = syncDataForDict.getDictReqXML(Constants.DICT_EASYPAY);
		logger.info("【手机前端调用管理中心ICE获取易支付所有支付宝银行帐号请求报文为：】" + easyPayReqDictXML);
		String easyPayBankORG_ResXML = this.cEPMgrCenterClient.getSyncPrmtData(easyPayReqDictXML);
		logger.info("【手机前端调用管理中心ICE获取易支付所有支付宝银行帐号返回报文为：】" + easyPayBankORG_ResXML);

		List<EasyPayment> list = null;
		try {
			list = syncDataForDict.parseEasyPaymentXML(easyPayBankORG_ResXML);// 解析易支付机构报文。
			this.addEasyPayORGNameToDict(list);// 向内存数据字典中添加易支付银行名称和第三方支付机构名称。
		} catch (final Exception e) {
			logger.error(e.getMessage(), e);
		}
		return list;
	}

	/* 向内存数据字典中添加易支付银行名称和第三方支付机构名称。 */
	public void addEasyPayORGNameToDict(List<EasyPayment> easyList) {
		Map<String, List<Dict>> easyPaydictMap = new HashMap<String, List<Dict>>();
		List<Dict> bank = new ArrayList<Dict>();
		List<Dict> org = new ArrayList<Dict>();
		Map<String, Dict> bankTempMap = new HashMap<String, Dict>();
		Map<String, Dict> orgTempMap = new HashMap<String, Dict>();
		for (final EasyPayment item : easyList) {
			Dict dict = new Dict();
			if (Constants.WITHDRAWAL_WAY_BANK.equals(item.getAccSpec())) {
				// 创建易支付银行名称数据字典。
				dict.setDictTypeName("自定义易支付银行数据字典");
				dict.setDictTypeId(Constants.EASY_PAY_BANK_DAG);// 设置字典类型，标签通过此调用。
				dict.setStatus(Integer.valueOf(Constants.DICT_STATUS_Y));// 数据字典为启用状态。
				dict.setDictName(item.getEasyPayORGName());
				dict.setDictCode(item.getEasyPayORGId());
				dict.setIcon(item.getIcon() == null ? "" : item.getIcon());
				dict.setDictTypeRemark("个人中心自定义");
				dict.setRules(item.getSuppCurrency());
				dict.setSortNo(0);
				bankTempMap.put(item.getEasyPayORGId(), dict);
			} else if (Constants.WITHDRAWAL_WAY_ORG.equals(item.getAccSpec())) {
				// 创建易支付第三方支付机构名称数据字典。
				dict.setDictTypeName("自定义易支付支付机构数据字典");
				dict.setDictTypeId(Constants.EASY_PAY_ORG_DAG);// 设置字典类型，标签通过此调用。
				dict.setStatus(Integer.valueOf(Constants.DICT_STATUS_Y));// 数据字典为启用状态。
				dict.setDictName(item.getEasyPayORGName());
				dict.setDictCode(item.getEasyPayORGId());
				dict.setIcon(item.getIcon() == null ? "" : item.getIcon());
				dict.setDictTypeRemark("个人中心自定义");
				dict.setSortNo(0);
				orgTempMap.put(item.getEasyPayORGId(), dict);
			}
		}
		for (Map.Entry<String, Dict> item : bankTempMap.entrySet()) {
			bank.add(item.getValue());
		}
		for (Map.Entry<String, Dict> item : orgTempMap.entrySet()) {
			org.add(item.getValue());
		}
		easyPaydictMap.put(Constants.EASY_PAY_BANK_DAG, bank);
		easyPaydictMap.put(Constants.EASY_PAY_ORG_DAG, org);
		AppCache.setDictMap(easyPaydictMap);
	}

	/* 向内存数据字典中添加在线充值支付手机名称。 */

	public void addPaymentPlatNameToDict(List<PaymentPlatform> paymentPlatList) {
		Map<String, List<Dict>> paymentPlatNameDictMap = new HashMap<String, List<Dict>>();
		List<Dict> paymentPlatNameList = new ArrayList<Dict>();
		Map<String, Dict> paymentTempMap = new HashMap<String, Dict>();
		for (final PaymentPlatform item : paymentPlatList) {
			Dict dict = new Dict(); // 创建易支付银行名称数据字典。 dict.setDictTypeName("自定义支付手机数据字典");
			dict.setDictTypeId(Constants.PAYMENT_PLAT_MAP_DAG);// 设置字典类型，标签通过此调用。
																// dict.setStatus(Integer.valueOf(Constants.DICT_STATUS_Y));//数据字典为启用状态。
			dict.setDictName(item.getName());// 支付手机名称 dict.setDictCode(item.getPaymentPlatId());//支付手机id. dict.setIcon(item.getIcon());
			dict.setDictTypeRemark("个人中心自定义");
			dict.setSortNo(0);
			dict.setStatus(1);
			paymentTempMap.put(item.getPaymentPlatId(), dict);
		}
		for (Map.Entry<String, Dict> item : paymentTempMap.entrySet()) {
			paymentPlatNameList.add(item.getValue());
		}
		paymentPlatNameDictMap.put(Constants.PAYMENT_PLAT_MAP_DAG, paymentPlatNameList);
		AppCache.setDictMap(paymentPlatNameDictMap);
	}

	/* 向管理中心获取国际化表数据 */
	public List<Map<String, String>> findAllInternation() {
		String internationReqXML = syncDataForDict.getDictReqXML(Constants.DICT_INTERNATION);
		logger.info("【手机前端调用管理中心ICE获取国际化表请求报文为：】" + internationReqXML);
		String internation_ResXML = this.cEPMgrCenterClient.getSyncPrmtData(internationReqXML);
		logger.info("【手机前端调用管理中心ICE获取国际化表返回报文为：】" + internation_ResXML);
		List<Map<String, String>> list = null;
		try {
			list = syncDataForDict.parseInternationXML(internation_ResXML);// 解析国际化返回报文。
		} catch (final Exception e) {
			logger.error(e.getMessage(), e);
		}
		return list;
	}

	/* 向管理中心获取系统参数表数据 */
	public List<SystemParm> findAllSystemParmList() {
		String systemParmReqXML = syncDataForDict.getDictReqXML(Constants.DICT_SYSTEMPARAM);
		logger.info("【手机前端调用管理中心ICE获取系统参数表请求报文为：】" + systemParmReqXML);
		String systemParm_ResXML = this.cEPMgrCenterClient.getSyncPrmtData(systemParmReqXML);
		System.out.println(systemParm_ResXML);
		//systemParm_ResXML = "<?xml version='1.0' encoding='UTF-8'?><resp st='1' msg='成功'><rec parameterCode='StatusUpdateInterval' parameterName='存款状态由支付中自动改为申请中的时间间隔(分钟)' parameterValue='20' remark='现金用户存款记录状态由支付中自动改为申请中的时间间隔(分钟)' sortNo='1'/><rec parameterCode='WithdrawalChargeRate' parameterName='手续费比例(%)' parameterValue='100' remark='提款手续费比例(百分比)' sortNo='1'/><rec parameterCode='DepositBetRate' parameterName='投注比例(%)' parameterValue='100' remark='存款投注流水比例(百分比)' sortNo='1'/><rec parameterCode='saveMoneySpaceTime' parameterName='存款间隔时间(分钟)' parameterValue='0' remark='存款间隔时间(分钟)' sortNo='1'/><rec parameterCode='drawMoneySpaceTime' parameterName='提款时间间隔(分钟)' parameterValue='1' remark='提款时间间隔(分钟)' sortNo='1'/><rec parameterCode='userErrorPwdCount' parameterName='用户错误输入密码上限(次数)' parameterValue='3' remark='用户错误输入密码上限(次数)' sortNo='1'/><rec parameterCode='userBankCardQuantityLimit' parameterName='现金用户银行卡数量限制' parameterValue='4' remark='现金用户银行卡数量限制' sortNo='1'/><rec parameterCode='userUnlockTime' parameterName='账户锁定后自动解锁时间(分钟)' parameterValue='120' remark='账户锁定后自动解锁时间(分钟)' sortNo='1'/><rec parameterCode='errorPwdCountValidTime' parameterName='用户错误输入密码次数累计有效时间(分钟)' parameterValue='1' remark='用户错误输入密码次数累计有效时间(分钟)' sortNo='1'/><rec parameterCode='default_language' parameterName='管理中心默认语言' parameterValue='zh' remark='默认语言' sortNo='1'/><rec parameterCode='userFundPwdCount' parameterName='用户资金密码输错次数限制' parameterValue='3' remark='资金密码输错后冻结' sortNo='1'/><rec parameterCode='msgCodeInvalidTime' parameterName='验证码失效时间(秒)' parameterValue='61' remark='验证码在60秒内没输入则失效' sortNo='1'/><rec parameterCode='mailCodeInvalidTime' parameterName='邮箱验证码失效时间(分钟)' parameterValue='5' remark='验证码在5分钟内没输入则失效' sortNo='1'/><rec parameterCode='userFundPwdCountValidTime' parameterName='账户资金密码次数累计有效时间(分钟)' parameterValue='1' remark='用户错误输入资金密码次数累计有效时间(分钟)' sortNo='1'/><rec parameterCode='MgrWhiteList' parameterName='管理中心登录白名单' parameterValue=' ' remark='管理中心登录白名单' sortNo='1'/><rec parameterCode='userSendSCRCodeTimes' parameterName='用户每天发送验证码的最大次数' parameterValue='5' remark='用户每天发送验证码的最大次数' sortNo='1'/><rec parameterCode='userUnfreezeTime' parameterName='账户冻结后自动解冻时间(分钟)' parameterValue='1' remark='账户冻结后自动解冻时间(分钟)' sortNo='1'/><rec parameterCode='MgrStaticDomain' parameterName='管理中心静态域名(http://static.newvinbet.com/img/CEPMgrCenter)' parameterValue=' ' remark='管理中心静态域名' sortNo='1'/><rec parameterCode='webFrontCache' parameterName='前端网页缓存版本号' parameterValue='20151006' remark='用于前端系统自动刷新网页缓存，运维在每次更新系统涉及到css或js更新时，需修改' sortNo='1'/><rec parameterCode='mgrCenterCache' parameterName='管理中心网页缓存版本号' parameterValue='20151005' remark='用于管理中心系统自动刷新网页缓存，运维在每次更新系统涉及到css或js更新时，需修改' sortNo='1'/><rec parameterCode='localBankTransVisiableValve' parameterName='显示或隐藏本地银行转账的阀值' parameterValue='0' remark='显示或隐藏本地银行转账的阀值，默认为2' sortNo='1'/><rec parameterCode='androidVersion' parameterName='安卓版本号' parameterValue='1.0' remark='安卓版本号' sortNo='1'/><rec parameterCode='iOSVersion' parameterName='iOS版本号' parameterValue='1.0' remark='iOS版本号' sortNo='1'/><rec parameterCode='AlipayMaxSaveAmtSingle' parameterName='支付宝单笔存款最大金额' parameterValue='2000' remark='支付宝单笔存款最大金额' sortNo='1'/><rec parameterCode='AlipayMaxGetAmtSingle' parameterName='支付宝单笔提款最大金额' parameterValue='2000' remark='支付宝单笔提款最大金额' sortNo='1'/><rec parameterCode='AlipayGetAmtMax' parameterName='支付宝账号当日可提款总金额' parameterValue='200000' remark='支付宝账号当日可提款总金额' sortNo='1'/><rec parameterCode='AlipayGetAmtSum' parameterName='支付宝账号当日已提款总金额' parameterValue='0' remark='支付宝账号当日已提款总金额(系统自动更新，请勿修改)' sortNo='1'/><rec parameterCode='android_download_url' parameterName='安卓客户端下载地址' parameterValue='http://app.kutuba.cn/download/android/' remark='安卓客户端下载地址' sortNo='1'/><rec parameterCode='ios_download_url' parameterName='苹果客户端下载地址' parameterValue='itms-services://?action=download-manifest&amp;url=https://ios.kutuba.cn/download/ios/Vinbet.plist' remark='苹果客户端下载地址' sortNo='1'/><rec parameterCode='publicDomain4Outside' parameterName='只允许客服的外网域名' parameterValue=' ' remark='只允许客服的外网域名,多个域名以分号分隔' sortNo='1'/><rec parameterCode='cs_Interface_Url' parameterName='太阳花客服系统接口地址' parameterValue='http://www.lonecm.com/scsc/core/external.fetchUserState.do' remark='太阳花客服系统接口地址' sortNo='1'/><rec parameterCode='cs_Ccompany_Code' parameterName='太阳花客服系统接口公司编码' parameterValue='129710' remark='太阳花客服系统接口公司编码' sortNo='1'/></resp>";
		logger.info("【手机前端调用管理中心ICE获取系统参数表返回报文为：】" + systemParm_ResXML);
		List<SystemParm> list = null;
		try {
			list = syncDataForDict.parseSystemParmXML(systemParm_ResXML);// 解析系统参数表返回报文。
		} catch (final Exception e) {
			logger.error(e.getMessage(), e);
		}
		return list;
	}

	/**
	 * 新增数据字典。
	 */
	public void addCacheDict(Dict dict) {
		List<Dict> dictList = AppCache.getDictListByTypeId(dict.getDictTypeId());
		dictList.add(dict);
		Map<String, List<Dict>> dictMap = new HashMap<String, List<Dict>>();
		dictMap.put(dict.getDictTypeId(), dictList);
		AppCache.setDictMap(dictMap);

	}

	/**
	 * 根据字典类型id和字典代码获取该字典信息
	 */
	public Dict getDictByTypeIdAndCode(Dict dict) {
		List<Dict> dictList = AppCache.getDictListByTypeId(dict.getDictTypeId());
		for (Dict dictTemp : dictList) {
			if (dictTemp.getDictCode().equals(dict.getDictCode())) {
				return dictTemp;
			}
		}
		return null;
	}

	/**
	 * 删除指定的数据字典。
	 */
	public void delDictByTypeIdAndCode(Dict dict) {
		List<Dict> dictList = AppCache.getDictListByTypeId(dict.getDictTypeId());
		for (Dict dictTemp : dictList) {
			if (dictTemp.getDictCode().equals(dict.getDictCode())) {
				dictList.remove(dictTemp);
				break;
			}
		}
		Map<String, List<Dict>> dictMap = new HashMap<String, List<Dict>>();
		dictMap.put(dict.getDictTypeId(), dictList);
		AppCache.setDictMap(dictMap);

	}

	/*
	 * public void findAllDictTypeList(HashMap<String, Object> param, Pager pager){ Map<String, List<Dict>> dictMap=AppCache.getDictMap();
	 * List<DictType> dictTypeList=new ArrayList<DictType>(); for(Map.Entry<String, List<Dict>> item : dictMap.entrySet()){ DictType dictType=new
	 * DictType(); List<Dict> dictList=item.getValue(); for(Dict dict:dictList){ dictType.setDictTypeName(dict.getDictTypeName());
	 * dictType.setRemark(dict.getDictTypeRemark()); break; } dictType.setDictTypeId(item.getKey()); dictTypeList.add(dictType); }
	 * pager.setList(dictTypeList); }
	 */
	public List<Dict> findDictByTypeId(String dictTypeId) {
		List<Dict> dictList = AppCache.getDictListByTypeId(dictTypeId);
		return dictList;
	}

	public void SyncCacheData() {
		logger.info("手机前端手动向管理中心同步内存数据开始！--------------------------------------");
		AppCache.initDict(this.findAllDictList());// 将所有数据字典加载到内存中。
		// AppCache.initPaymentPlat(this.findAllPaymentPlatList());//将系统支持的第三方支付手机加载到内存中。
		// AppCache.initEasyPayment(this.findAllEasyPaymentList());//获取系统易支付开户的各个支付宝帐号和银行帐号，构造为内存对象，供前端用户充值的时候系统随机分配给客户存款。
		AppCache.initInternationInfo(this.findAllInternation());// 初始化国际化信息到内存中。
		logger.info("手机前端手动向管理中心同步内存数据成功！--------------------------------------");
	}

	/* 同步内存中易支付账户数据 */
	public void SyncEasyPayData() {
		logger.info("用户易支付存款时候手机前端向管理中心同步易支付内存数据开始！--------------------------------------");
		AppCache.initEasyPayment(this.findAllEasyPaymentList());// 获取系统易支付开户的各个支付宝帐号和银行帐号，构造为内存对象，供前端用户充值的时候系统随机分配给客户存款。
		logger.info("用户易支付存款时候手机前端向管理中心同步易支付内存数据成功！--------------------------------------");
	}

	public Map<String, WalletCategory> findAllWalletCategoryList() {

		String walletCategoryReqDictXML = syncDataForDict.getDictReqXML(Constants.DICT_WALLETCATEGORY);
		logger.info("【手机前端调用管理中心ICE获取钱包类别请求报文为：】" + walletCategoryReqDictXML);
		String walletCategory_ResXML = this.cEPMgrCenterClient.getSyncPrmtData(walletCategoryReqDictXML);
		logger.info("【手机前端调用管理中心ICE获取钱包类别返回报文为：】" + walletCategory_ResXML);

		Map<String, WalletCategory> map = null;
		try {
			// 返回数据保存到内存中，划帐时检查约束
			map = syncDataForDict.parseWalletCategoryXML(walletCategory_ResXML);// 解析钱包类别报文。

		} catch (final Exception e) {
			logger.error(e.getMessage(), e);
		}
		return map;
	}

	/**
	 * 查询所有导航菜单数据
	 */
	public List<NavigationApp> findAllNavigationAppList() {

		String navigationAppReqDictXML = syncDataForDict.getDictReqXML(Constants.DICT_NAVIGATIONAPP);
		logger.info("【手机前端调用管理中心ICE获取导航菜单请求报文为：】" + navigationAppReqDictXML);
		String NavigationApp_ResXML = this.cEPMgrCenterClient.getSyncPrmtData(navigationAppReqDictXML);
		logger.info("【手机前端调用管理中心ICE获取导航菜单返回报文为：】" + NavigationApp_ResXML);
		System.out.println(NavigationApp_ResXML);
		List<NavigationApp> list = null;
		try {
			list = syncDataForDict.parseNavigationAppXML(NavigationApp_ResXML);// 解析导航菜单报文。
		} catch (final Exception e) {
			logger.error(e.getMessage(), e);
		}
		return list;
	}

	/* 同步内存中易支付账户数据 */
	/*
	 * public void SyncEasyPayData(){ logger.info("\n\n用户易支付存款时候手机前端向管理中心同步易支付内存数据开始！--------------------------------------");
	 * AppCache.initEasyPayment(this.findAllEasyPaymentList());//获取系统易支付开户的各个支付宝帐号和银行帐号，构造为内存对象，供前端用户充值的时候系统随机分配给客户存款。
	 * logger.info("\n\n用户易支付存款时候手机前端向管理中心同步易支付内存数据成功！--------------------------------------"); }
	 */

	/* 同步内存中第三方支付数据 */
	/*
	 * public void SyncPaymentPlatData(){ logger.info("\n\n用户支付手机存款时候手机前端向管理中心同步支付手机内存数据开始！--------------------------------------");
	 * AppCache.initPaymentPlat(this.findAllPaymentPlatList());//将系统支持的第三方支付手机加载到内存中。
	 * logger.info("\n\n用户支付手机存款时候手机前端向管理中心同步支付手机内存数据成功！--------------------------------------"); }
	 */

	public Map<String, List<Dict>> findBankNameDictMap() {
		// 构造数据字典：1、用户添加提款方式时候可选择的银行和支付机构名称。2、用户线下银行转账的时候用户可选的银行名称。
		String bankNameReqDictXML = syncDataForDict.getDictReqXML(Constants.DICT_BANKNAME);// 构造银行名称表请求报文
		logger.info("【手机前端调用管理中心ICE获取用户线下存款可用的银行名称和添加提款方式用户可用的银行和机构表请求报文为：】" + bankNameReqDictXML);
		String bankNameResDictXML = this.cEPMgrCenterClient.getSyncPrmtData(bankNameReqDictXML);// 调用管理中心ice获取银行名称报文。
		logger.info("【手机前端调用管理中心ICE获取银行名称表报文为：】" + bankNameResDictXML);
		List<Dict> list = new ArrayList<Dict>();
		try {
			syncDataForDict.parseBankNameXML(list, bankNameResDictXML);
		} catch (final Exception e) {
			logger.error(e.getMessage(), e);
		}

		List<Dict> Banklist = new ArrayList<Dict>();
		List<Dict> ORGlist = new ArrayList<Dict>();
		List<Dict> Alipaylist = new ArrayList<Dict>();
		for (Dict dict : list) {
			if (Constants.BANKNAME_DAG.equals(dict.getDictTypeId())) {
				Banklist.add(dict);
			} else if(Constants.ORG_DAG.equals(dict.getDictTypeId())){
				ORGlist.add(dict);
			} else if(Constants.ALIPAY_DRAW_DAG.equals(dict.getDictTypeId())){
				Alipaylist.add(dict);
			}
		}
		Map<String, List<Dict>> bankNameMap = new HashMap<String, List<Dict>>();
		bankNameMap.put(Constants.BANKNAME_DAG, Banklist);
		bankNameMap.put(Constants.ORG_DAG, ORGlist);
		bankNameMap.put(Constants.ALIPAY_DRAW_DAG, Alipaylist);
		return bankNameMap;
	}
    public Map<String, List<Dict>> findCurrencyDictMap(){ 
    	//构造货币数据字典。     	
    	String currencyResDictXML=getCurrencyRecXml();//调用管理中心ice获取平台支持的货币数据字典报文。    	
    	List<Dict> list=new ArrayList<Dict>();
    	try {
			syncDataForDict.parseCurrencyXML(list,currencyResDictXML);
		}catch (final Exception e) {
        	logger.error(e.getMessage(),e);
        }
    	Map<String, List<Dict>> currencyMap=new HashMap<String, List<Dict>>();
    	currencyMap.put(Constants.CURRENCY_DAG, list);
    	return currencyMap;
    }
    
    /**获取平台支持的货币报文*/
    private String getCurrencyRecXml(){
    	String currencyReqDictXML=syncDataForDict.getDictReqXML(Constants.DICT_CURRENCY);//构造平台支持的货币表请求报文
    	logger.info("【平台前端调用管理中心ICE获取平台支持的货币表请求报文为：】"+currencyReqDictXML);    	
    	String currencyResDictXML=this.cEPMgrCenterClient.getSyncPrmtData(currencyReqDictXML);//调用管理中心ice获取平台支持的货币数据字典报文。    	
    	logger.info("【平台前端调用管理中心ICE获取平台支持的货币表报文为：】"+currencyResDictXML); 
    	return currencyResDictXML;
    }
    
    public Map<String, Currency> findCurrencyMap(){ 
    	String currencyResDictXML=this.getCurrencyRecXml();
    	Map<String, Currency> currencyMap=null;
    	try {
    		currencyMap=syncDataForDict.parseCurrencyXMLtoMap(currencyResDictXML);
		} catch (final Exception e) {
        	logger.error(e.getMessage(),e);
        }
    	return currencyMap;
    }
    
    public Map<String, List<Dict>> findCompanyBankAccDictMap(){
    	//构造本地银行转账银行名称数据字典。
    	String localBankReqDictXML=syncDataForDict.getDictReqXML(Constants.DICT_COMPANYBANKACC);//公司本地银行转账的收款账户表请求报文 T_COMPANYBANKACC
    	logger.info("【平台前端调用管理中心ICE获取公司本地银行转账的收款账户表请求报文为：】"+localBankReqDictXML);
    	String localBankResDictXML=this.cEPMgrCenterClient.getSyncPrmtData(localBankReqDictXML);
    	logger.info("【平台前端调用管理中心ICE获取公司本地银行转账的收款账户表报文为：】"+localBankResDictXML);
    	List<Dict> list=new ArrayList<Dict>();
    	try {
			syncDataForDict.parseLocalBankXML(list,localBankResDictXML);
		}catch (final Exception e) {
        	logger.error(e.getMessage(),e);
        }
    	Map<String, List<Dict>> companyBankAccMap=new HashMap<String, List<Dict>>();
    	companyBankAccMap.put(Constants.LOCALBANK_TRANSFER_COMPANYBANKACC_DAG, list);
    	return companyBankAccMap;
    }  
    
    public List<Dict> findAreaDictMap(){
    	// 六、构造地区资料数据字典
		String areainfoReqDictXML = syncDataForDict.getDictReqXML(Constants.DICT_AREAINFO);
		logger.debug("【手机前端调用管理中心ICE获取地区资料表请求报文为：】" + areainfoReqDictXML);
		String areainfoResDictXML = this.cEPMgrCenterClient.getSyncPrmtData(areainfoReqDictXML);
		logger.debug("【手机前端调用管理中心ICE获取地区资料表报文为：】" + areainfoResDictXML);
    	List<Dict> list=new ArrayList<Dict>();
    	try {
    		syncDataForDict.parseAreaInfoXML(list, areainfoResDictXML);// 构造地区资料数据字典。
		}catch (final Exception e) {
        	logger.error(e.getMessage(),e);
        }
    	return list;
    }
    
    public List<Dict> findAlipayDictMap(){
    	// 六、构造支付宝存款数据字典
		String alipayinfoReqDictXML = syncDataForDict.getDictReqXML(Constants.DICT_ALIPAYINFO);
		logger.debug("【手机前端调用管理中心ICE获取支付宝机构表请求报文为：】" + alipayinfoReqDictXML);
		String alipayinfoResDictXML = this.cEPMgrCenterClient.getSyncPrmtData(alipayinfoReqDictXML);
		logger.debug("【手机前端调用管理中心ICE返回支付宝机构表报文为：】" + alipayinfoResDictXML);
    	List<Dict> list=new ArrayList<Dict>();
    	try {
    		syncDataForDict.parseAliPayXML(list, alipayinfoResDictXML);// 构造地区资料数据字典。
		}catch (final Exception e) {
        	logger.error(e.getMessage(),e);
        }
    	/*Map<String, List<Dict>> alipayMap=new HashMap<String, List<Dict>>();
    	alipayMap.put(Constants.ALIPAY_DAG, list);*/
    	return list;
    }
    
    public List<Dict> findWechatpayDictMap(){
    	// 构造微信存款数据字典
    	XMLBean xmlREQ = new XMLBean("req");
		xmlREQ.addttribute("tbnm", Constants.DICT_ALIPAYACCINFO);
		xmlREQ.addttribute("type", "11");
		String aliPayAccReqDictXML = xmlREQ.toXML();
		//String aliPayAccReqDictXML = syncDataForDict.getDictReqXML(Constants.DICT_ALIPAYACCINFO);
		logger.info("【手机前端调用管理中心ICE获取互联网支付方式请求报文为：】" + aliPayAccReqDictXML);
		String aliPayAccResDictXML = this.cEPMgrCenterClient.getSyncPrmtData(aliPayAccReqDictXML);
		logger.info("【手机前端调用管理中心ICE获取互联网支付方式报文为：】" + aliPayAccResDictXML);
    	List<Dict> list=new ArrayList<Dict>();
    	try {
    		syncDataForDict.parseAliPayAccXML(list, aliPayAccResDictXML);// 构造地区资料数据字典。
		}catch (final Exception e) {
        	logger.error(e.getMessage(),e);
        }
    	/*Map<String, List<Dict>> alipayMap=new HashMap<String, List<Dict>>();
    	alipayMap.put(Constants.ALIPAY_DAG, list);*/
    	return list;
    }
}
