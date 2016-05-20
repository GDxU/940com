package com.vinbet.mobile.util;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.vinbet.mobile.domain.UserInfo;
import com.vinbet.mobile.entity.portal.Dict;
import com.vinbet.mobile.entity.portal.NavigationApp;
import com.vinbet.mobile.entity.portal.WalletCategory;
import com.vinbet.mobile.sys.AppCache;


/**
 * 获取用户权限
 */
public final class GetAppAuthUtil {

	public static String getIndexApp(UserInfo userInfo) {
		String applist = "";
		try {
			List<NavigationApp> list = AppCache.getNavigationAppList();
			for (NavigationApp item : list) {
				// 信用菜单不显示
				if (com.vinbet.mobile.util.Constants.USERTYPE_CREDIT.equals(item.getApptype())) {
					continue;
				}
				// 检查是否有权限访问应用，根据当前用户货币
				if (checkAccessPermission(userInfo, item.getWalletcategory())) {
					continue;
				}
				applist += item.getAppmark() + ",";
				for (Iterator<NavigationApp> iterator = item.getNavigationAppList().iterator(); iterator.hasNext();) {
					NavigationApp itemchild = iterator.next();

					// 信用菜单不显示
					if (com.vinbet.mobile.util.Constants.USERTYPE_CREDIT.equals(itemchild.getApptype())) {
						continue;
					}

					// 检查是否有权限访问应用，根据当前用户货币
					if (checkAccessPermission(userInfo, itemchild.getWalletcategory())) {
						continue;
					}
					applist += itemchild.getAppmark() + ",";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (applist.endsWith(",")) {
			applist = applist.substring(0, applist.length() - 1);
		}

		return applist;
	}

	/**
	 * 检查是否有权限访问应用，根据当前用户货币
	 * 
	 * @param walletType
	 * @return true 没有权限 false 有权限
	 */
	public static boolean checkAccessPermission(UserInfo userInfo, String walletType) {

		if (null != userInfo) {
			if (null != AppCache.getWalletCategoryMap().get(walletType)) {
				WalletCategory walletCategory = AppCache.getWalletCategoryMap().get(walletType);
				if (!walletCategory.getCurrency().contains(userInfo.getCurrencyName())) {
					return true;
				}
			}
		}
		return false;

	}
	
	
	public static String getWalletAutoStr(UserInfo user){
		String walletStr = "";
		List<Dict> src = AppCache.getI18nDictListByType(Constants.WALLETCATEGORY_DAG);
		List<Dict> desc = new ArrayList<Dict>(Arrays.asList(new Dict[src.size()]));
		Collections.copy(desc, src);
		Map<String, NavigationApp> map = AppCache.getNavigationAppMap();
		for (Dict dict : desc) {
			try {
				dict.setDictName("{[{" + BASE64Util.getBASE64(dict.getDictName()) + "}]}");
			} catch (UnsupportedEncodingException e) {
			}
			if (dict.getDictCode().equals(Constants.WALLLET_TYPE_CENTER)) {
				walletStr+=dict.getDictCode()+",";
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
											walletStr+=dict.getDictCode()+",";
										}
									}
								}
							}
						}
					}
				}
			}
		}
		if (walletStr.endsWith(",")) {
			walletStr = walletStr.substring(0, walletStr.length() - 1);
		}
		return walletStr;
	}

}