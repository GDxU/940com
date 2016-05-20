package com.vinbet.mobile.sys.jms;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;

import org.apache.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;

import com.vinbet.mobile.entity.portal.Dict;
import com.vinbet.mobile.service.portal.DictServiceImpl;
import com.vinbet.mobile.service.portal.SyncDataForDict;
import com.vinbet.mobile.sys.AppCache;
import com.vinbet.mobile.util.Constants;


/**
 * 管理中心基础数据同步：同步管理中心基础数据JMS队列MC_Topic_BaseData监听业务类。
 * @author  cjp
 * @version  [Ver 1.0]
 * @since 2015-6-21 下午4:48:32
 */
@IocBean
public class BaseDataListener implements MessageListener{
	private static Logger log = Logger.getLogger(BaseDataListener.class);
	@Inject
	private DictServiceImpl dictServiceImpl;
	@Inject
	private SyncDataForDict syncDataForDict;
    @SuppressWarnings("unchecked")
	@Override
    public void onMessage(Message message) { 
    	try{
	    	TextMessage tmsg = (TextMessage) message;
	        String StringMsg = null;
	        String opt=null;
	        String type=null;
	        try {
	        	this.waitForRetard(3*1000);//等待5s再向管理中心同步数据，防止管理中心的修改数据事务未提交完毕，以至于取到的数据失真。
	        	StringMsg = tmsg.getText();
	            Document dom = DocumentHelper.parseText(StringMsg);
	    		Element eleRoot= dom.getRootElement(); 
	    		List<Element> eleList = dom.getRootElement().elements();
	    		if(eleRoot!=null){
	        		type=eleRoot.attribute("type")==null?"":eleRoot.attribute("type").getValue(); //数据类别标示
	        		opt=eleRoot.attribute("act")==null?"":eleRoot.attribute("act").getValue(); //1增加，2修改，3删除
	    		}
	    		
	    		if(Constants.DATA_TYPE_DICT.equals(type)){
	    			//数据字典同步报文。
	    			if(Constants.BASE_DATA_ADD.equals(opt)){
	    				addDictForCache(eleList);
	    			}else if(Constants.BASE_DATA_UPDATE.equals(opt)){
	    				updateDictForCache(eleList);        			
	        		}else if(Constants.BASE_DATA_DELETE.equals(opt)){
	        			deleteDictForCache(eleList); 
	        		}    			
	    		}else if(Constants.DATA_TYPE_INTERNATION.equals(type)){
	    			//国际化信息的同步报文
	    			if(Constants.BASE_DATA_ADD.equals(opt)){
	    				addOrUpdateInternationForCache(eleList);
	    			}else if(Constants.BASE_DATA_UPDATE.equals(opt)){
	    				addOrUpdateInternationForCache(eleList);   			
	        		}else if(Constants.BASE_DATA_DELETE.equals(opt)){
	        			deleteInternationForCache(eleList);
	        		}  
	    		}else if(Constants.DATA_TYPE_PAYMENTPLATFORM.equals(type) || Constants.DATA_TYPE_PAYMENTPLATFORMACC.equals(type)){
	    			//只要有支付平台数据变化的报文，就初始化一下支付平台的内存数据。支付平台数据少，每次初始化一下，对性能没有任何影响。        			
	    			AppCache.initPaymentPlat(dictServiceImpl.findAllPaymentPlatList());//将系统支持的第三方支付平台加载到内存中。
	    		}/*else if(Constants.DATA_TYPE_EXCHANGERATE.equals(type)){
	    			//汇率数据的同步报文    	    			
	    			AppCache.initExchangeRateMap(dictService.findExchangeRateList()); //初始化货币汇率数据
	    		}*/else if(Constants.DATA_TYPE_SYSTEMPARM.equals(type)){
	    			//系统参数的同步报文    	
	    			 AppCache.initSystemParm(dictServiceImpl.findAllSystemParmList());//初始化系统参数到内存中。
	    		}else if(Constants.DATA_TYPE_WALLETCATEGORYDTO.equals(type)){
	    			//钱包类别的同步报文
	    			AppCache.initWalletCategoryMap(dictServiceImpl.findAllWalletCategoryList());//初始化钱包类别数据
	    		}else if(Constants.DATA_TYPE_NAVIGATIONAPP.equals(type)){
	    			//导航栏的同步报文
	    			AppCache.initNavigationAppList(dictServiceImpl.findAllNavigationAppList());//初始化导航菜单
	    		}else if(Constants.DATA_TYPE_CURRENCY.equals(type)){
	    			//平台支持的货币报文
	    			AppCache.setDictMap(dictServiceImpl.findCurrencyDictMap());//构造货币数据字典。
	    			AppCache.initCurrencyMap(dictServiceImpl.findCurrencyMap()); //将数据平台支持的货币添加到内存中
	   		    }else if(Constants.DATA_TYPE_BANKNAME.equals(type) || Constants.DATA_TYPE_BANKNAMESUPPCURR.equals(type)){
	    			//构造数据字典：1、用户添加提款方式时候可选择的银行和支付机构名称。2、用户线下银行转账的时候用户可选的银行名称。
	   		    	AppCache.setDictMap(dictServiceImpl.findBankNameDictMap());
	   		    }/*else if(Constants.DATA_TYPE_MOBILETYPE.equals(type)){
	    			//构造手机号码类型数据字典。
	   		    	AppCache.setDictMap(dictService.findMobileTypeDictMap());//构造手机号码类型数据字典。
	   		    }*/else if(Constants.DATA_TYPE_COMPANYBANK.equals(type) || Constants.DATA_TYPE_COMPANYBANKSUPPCURR.equals(type)){
	    			//构造本地银行转账银行名称数据字典。
	   		    	AppCache.setDictMap(dictServiceImpl.findCompanyBankAccDictMap());
	   		    }else if(Constants.DATA_TYPE_EASYPAYMENTACC.equals(type)){
	    			//获取系统易支付开户的各个支付宝帐号和银行帐号，构造为内存对象，供前端用户充值的时候系统随机分配给客户存款。
	   		    	AppCache.initEasyPayment(dictServiceImpl.findAllEasyPaymentList());
	   		    }else if(Constants.DATA_TYPE_AREAINFO.equals(type)){
	    			//同步地区信息
	    			//AppCache.initDict(dictServiceImpl.findAllDictList());// 将所有数据字典加载到内存中。
	    			//AppCache.initWalletCategoryMap(dictServiceImpl.findAllWalletCategoryList());//初始化钱包类别数据
	   		    	AppCache.initAreaMap(dictServiceImpl.findAreaDictMap());
	   		    }else if(Constants.DATA_TYPE_ALIPAYINFO.equals(type)){
	    			//同步支付宝信息
	   		    	AppCache.setAlipayDictMap(dictServiceImpl.findAlipayDictMap());
	   		    }else if(Constants.DATA_TYPE_WECHATPAYINFO.equals(type)){
	    			//同步微信账号信息
	   		    	dictServiceImpl.findWechatpayDictMap();
	   		    }
	        	
	        } catch (JMSException e){
	            log.error("\n\n从管理中心消息队列【"+Constants.MC_TOPIC_BASEDATA+"]获取消息报文错误。\n\n", e);
	            return;
	        }catch (Exception e){
				log.error(e.getMessage());
			}
	        log.info("\n\n从管理中心消息队列【"+Constants.MC_TOPIC_BASEDATA+"]获取消息报文："+StringMsg+"\n\n");
    	}finally{
	        try {
	        	message.acknowledge();
	        } catch (JMSException e2) {
	            log.error("消息响应失败。", e2);
	        }
    	}
    }
    
    private void waitForRetard(int second) throws InterruptedException{ 
		byte[] b=new byte[0];
		synchronized (b) {
			b.wait(second);
		}
    }
    
	private void addDictForCache(List<Element> eleList){ 
        List<Dict> dictList=syncDataForDict.parseDictXMLToList(eleList); 
		Dict dict=dictList.get(0);//报文每次传来就是单个的数据。
		List<Dict> dictListCache=AppCache.getDictListByTypeId(dict.getDictTypeId());
		synchronized (dictListCache){
			if(dictListCache.size()==0){
				//内存中未存在该数据字典项
				List<Dict> dictListNew=new ArrayList<Dict>();
				dictListNew.add(dict);
				AppCache.getDictMap().put(dict.getDictTypeId(), dictListNew); 
			}else{
				//向内存中添加该数据字典。
				dictListCache.add(dict);
			}	
		}
	    
    }
	
	private void updateDictForCache(List<Element> eleList){ 
        List<Dict> dictList=syncDataForDict.parseDictXMLToList(eleList); 
		Dict dictNew=dictList.get(0);//报文每次传来就是单个的数据。 
		List<Dict> dictListCache=AppCache.getDictListByTypeId(dictNew.getDictTypeId());
		synchronized (dictListCache){
			if(dictListCache.size()==0){
				//内存中未存在该数据字典项
				List<Dict> dictListNew=new ArrayList<Dict>();
				dictListNew.add(dictNew);
				AppCache.getDictMap().put(dictNew.getDictTypeId(), dictListNew); 
			}else{
				//向内存中添加该数据字典。
				boolean flag=false;
				for(Dict dictCache:dictListCache){
					if(dictCache.getDictCode().equals(dictNew.getDictCode())){ 
						dictListCache.remove(dictCache);
						dictListCache.add(dictNew);
						flag=true;
						break;
					}
				}
				if(flag==false){
					//不存在该数据项
					dictListCache.add(dictNew);
				}
				
			}
		}
	
	}
	
	private void deleteDictForCache(List<Element> eleList){ 
        List<Dict> dictList=syncDataForDict.parseDictXMLToList(eleList); 
		Dict dictNew=dictList.get(0);//报文每次传来就是单个的数据。 
		List<Dict> dictListCache=AppCache.getDictListByTypeId(dictNew.getDictTypeId());
		synchronized (dictListCache){
			if(dictListCache.size()>0){
				for(Dict dictCache:dictListCache){
					if(dictCache.getDictCode().equals(dictNew.getDictCode())){ 
						dictListCache.remove(dictCache);
						break;
					}
				}
			}
		}

	}
	
	/**添加和修改的逻辑一样*/
	private void addOrUpdateInternationForCache(List<Element> eleList){ 
		List<Map<String, String>> list=syncDataForDict.parseInternationXMLToList(eleList);
		Map<String, String> internationNew=list.get(0);//报文每次传来就是单个的数据。 
		String iid=internationNew.get("id");
		Map<String, String> internationMapCache=AppCache.getInternationMap().get(iid); 
		if(internationMapCache==null){
			AppCache.getInternationMap().put(iid, internationNew);
		}else{
			synchronized (AppCache.getInternationMap()){
				AppCache.getInternationMap().remove(iid);
				AppCache.getInternationMap().put(iid, internationNew);
			}
		}
	}
	
	private void deleteInternationForCache(List<Element> eleList){
		String iid=null;
		for (Element element : eleList) {
			iid=element.attribute("val")==null?null:element.attribute("val").getValue();
			break;
		}
		Map<String, String> internationMapCache=AppCache.getInternationMap().get(iid); 
		if(internationMapCache!=null){
			AppCache.getInternationMap().remove(iid);
		}
	}
	
	
	/**地区jms同步添加*/
	private void addAreaForCache(List<Element> eleList){
		for (Element element : eleList) {
			if (Constants.SHOW_HIDE_STATUS_SHOW.equals(element.attribute("status").getValue())) {
				// String id = element.attribute("id").getValue();
				String iid = element.attribute("iid").getValue();
				// idds.put(id, iid);
				Dict dict = new Dict();
				String areaLevel = element.attribute("arealevel").getValue();
				if (areaLevel.equals("1")) {// 国籍
					dict.setDictTypeId(Constants.NATIONALITY);// 设置字典类型，标签通过此调用。
					dict.setStatus(Integer.valueOf(Constants.DICT_STATUS_Y));// 数据字典为启用状态。
					dict.setDictCode(iid);// 國際化表的id
					dict.setDictName(element.attribute("areaname").getValue());// 设置字典名称，
					dict.setSortNo(0);
				} else if (areaLevel.equals("2")) {// 省份
					dict.setDictTypeId("arealevel2_" + element.attribute("parentid").getValue());
					dict.setStatus(Integer.valueOf(Constants.DICT_STATUS_Y));// 数据字典为启用状态。
					dict.setDictCode(iid);
					dict.setDictName(element.attribute("areaname").getValue());// 设置字典名称，
					dict.setSortNo(0);
				} else if (areaLevel.equals("3")) {// 地区
					dict.setDictTypeId("arealevel3_" + element.attribute("parentid").getValue());
					dict.setStatus(Integer.valueOf(Constants.DICT_STATUS_Y));// 数据字典为启用状态。
					dict.setDictCode(iid);
					dict.setDictName(element.attribute("areaname").getValue());// 设置字典名称，
					dict.setSortNo(0);
				}
				List<Dict> dictListCache=AppCache.getDictListByTypeId(dict.getDictTypeId());
				synchronized (dictListCache){
					if(dictListCache.size()==0){
						//内存中未存在该数据字典项
						List<Dict> dictListNew=new ArrayList<Dict>();
						dictListNew.add(dict);
						AppCache.getDictMap().put(dict.getDictTypeId(), dictListNew); 
					}else{
						//向内存中添加该数据字典。
						dictListCache.add(dict);
					}	
				}
			}
		}
	}
	
	/**地区jms同步修改*/
	private void updateAreaForCache(List<Element> eleList){
		for (Element element : eleList) {
				// String id = element.attribute("id").getValue();
				String iid = element.attribute("iid").getValue();
				Dict dict = new Dict();
				String areaLevel = element.attribute("arealevel").getValue();
				String st = element.attribute("status").getValue();
				if (areaLevel.equals("1")) {// 国籍
					dict.setDictTypeId(Constants.NATIONALITY);// 设置字典类型，标签通过此调用。
				} else if (areaLevel.equals("2")) {// 省份
					dict.setDictTypeId("arealevel2_" + element.attribute("parentid").getValue());
				} else if (areaLevel.equals("3")) {// 地区
					dict.setDictTypeId("arealevel3_" + element.attribute("parentid").getValue());
				}
				dict.setStatus(Integer.valueOf(st));// 数据字典为启用状态。
				dict.setDictCode(iid);// 國際化表的id
				dict.setDictName(element.attribute("areaname").getValue());// 设置字典名称，
				dict.setSortNo(0);
				List<Dict> dictListCache=AppCache.getDictListByTypeId(dict.getDictTypeId());
				synchronized (dictListCache){
					if(dictListCache.size()==0){
						//内存中未存在该数据字典项
						if (Constants.SHOW_HIDE_STATUS_SHOW.equals(element.attribute("status").getValue())) {
							List<Dict> dictListNew=new ArrayList<Dict>();
							dictListNew.add(dict);
							AppCache.getDictMap().put(dict.getDictTypeId(), dictListNew); 
						}
					}else{
						//向内存中添加该数据字典。
						boolean insertFlag = false;
						for (int i=0;i<dictListCache.size();i++) {
							Dict dt = dictListCache.get(i);
							if(dt.getIid().equals(dict.getIid())){
								if (!Constants.SHOW_HIDE_STATUS_SHOW.equals(st)){
									dictListCache.remove(i);
								}else{
									dt=dict;
								}
								insertFlag = true;
							}
						}
						if(insertFlag){
							dictListCache.add(dict);
						}
						
					}	
				}
		}
	}
	
	private void deleteAreaForCache(List<Element> eleList){
		String iid=null;
		for (Element element : eleList) {
			iid=element.attribute("val")==null?null:element.attribute("val").getValue();
			break;
		}
		Map<String, String> internationMapCache=AppCache.getInternationMap().get(iid); 
		if(internationMapCache!=null){
			AppCache.getInternationMap().remove(iid);
		}
	}

}
