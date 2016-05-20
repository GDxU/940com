package com.vinbet.mobile.entity.portal;

import java.util.List;
import java.util.Queue;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.CopyOnWriteArrayList;

/**
 * 导航栏应用信息表
 * <pre>
 * <功能详细描述>  
 * </pre>
 * @author  cjp
 * @version  [Ver 1.0]
 * @since 2015-4-19 下午4:55:46
 */
public class NavigationApp{

	/** 主键 */
	private String id; 
	/** 子应用标识码*/
	private String appmark;  
	/** 子应用类型  1现金 2信用 */
	private String apptype;  
	/** 父ID */
	private String parentid;  
	/** 国际化ID */
	private String iid;       
	/** 动态地址  */
	private String dynamicaddr;   
	/** 静态地址 */
	private String staticaddr;    
	/** 排序码 */
	private String appsort;  
	/**状态0 维护,1正常,2隐藏*/
	private String status;
	/**钱包类别标识*/ 
	private String walletcategory;	
	
	private List<NavigationApp> navigationAppList=new CopyOnWriteArrayList<NavigationApp>();
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAppmark() {
		return appmark;
	}
	public void setAppmark(String appmark) {
		this.appmark = appmark;
	}
	public String getApptype() {
		return apptype;
	}
	public void setApptype(String apptype) {
		this.apptype = apptype;
	}
	public String getParentid() {
		return parentid;
	}
	public void setParentid(String parentid) {
		this.parentid = parentid;
	}
	public String getIid() {
		return iid;
	}
	public void setIid(String iid) {
		this.iid = iid;
	}
	public String getDynamicaddr() {
		return dynamicaddr;
	}
	public void setDynamicaddr(String dynamicaddr) {
		this.dynamicaddr = dynamicaddr;
	}
	public String getStaticaddr() {
		return staticaddr;
	}
	public void setStaticaddr(String staticaddr) {
		this.staticaddr = staticaddr;
	}
	public String getAppsort() {
		return appsort;
	}
	public void setAppsort(String appsort) {
		this.appsort = appsort;
	}
	public List<NavigationApp> getNavigationAppList() {
		return navigationAppList;
	}
	public void setNavigationAppList(List<NavigationApp> navigationAppList) {
		this.navigationAppList = navigationAppList;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getWalletcategory() {
		return walletcategory;
	}
	public void setWalletcategory(String walletcategory) {
		this.walletcategory = walletcategory;
	}
 
 
}
