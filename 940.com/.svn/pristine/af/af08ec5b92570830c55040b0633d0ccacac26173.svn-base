package com.chuangdun.jsl.lab;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.httpclient.util.HttpURLConnection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.chuangdun.jsl.bean.Article;

public class EditUtil {

	public static String getTypeById(String typeId) {
		System.out.println();
		// 1：开店流程 2：开店技巧 3：干货分享 4：常见问题 5： 网店推广 6:成功案例 7:视频教程
		if (typeId.equals("1")) {
			return "开店流程";
		} else if (typeId.equals("2")) {
			return "开店技巧";
		} else if (typeId.equals("3")) {
			return "干货分享";
		} else if (typeId.equals("4")) {
			return "常见问题";
		} else if (typeId.equals("5")) {
			return "网店推广";
		} else if (typeId.equals("6")) {
			return "成功案例";
		} else if (typeId.equals("7")) {
			return "视频教程";
		}
		return "未知分类";
	}
	
	

	public static String getVideoTypeById(String typeId) {
		// 1：开店流程 2：开店技巧 3：干货分享 4：常见问题 5： 网店推广 6:成功案例 7:视频教程

		if (typeId.equals("1")) {
			return "会员";
		} else if (typeId.equals("2")) {
			return "免费";
		} else if (typeId.equals("3")) {
			return "热门";
		} else if (typeId.equals("4")) {
			return "最新";
		}
		return "未知分类";
	}

	public static String getClassByIndex(int index) {
		if (index == 3)
			return "淘宝美工班";

		if (index == 6)
			return "淘宝美工班";
		if (index == 7)
			return "淘宝美工班";

		if (index == 10)
			return "高级运营班";

		if (index == 13)
			return "淘宝美工班";
		if (index == 17)
			return "高级运营班";

		return "新手开店班";
	}
	
	public static String getTeacherLevelStr(int levelInt) {
		if (levelInt == 0)
			return "普通讲师";

		if (levelInt == 1)
			return "金牌讲师";
		return "普通讲师";
	}

	public static String getGroupById(String id) {
		if (id.equals("0")) {
			return "免费";
		} else if (id.equals("1")) {
			return "初级班";
		} else if (id.equals("2")) {
			return "中级班";
		} else if (id.equals("3")) {
			return "高级班";
		} else if (id.equals("4")) {
			return "总裁班";
		}
		return "未知分类";
	}

	public static String getStatusById(String statusId) {
		// 0：隐藏 1：显示 2：首页：
		if (statusId.equals("0")) {
			return "隐藏";
		} else if (statusId.equals("1")) {
			return "显示";
		} else if (statusId.equals("2")) {
			return "首页";
		}
		return "未知";
	}

	public static String getTypeDirById(String typeId) {
		// 1：开店流程 2：开店技巧 3：干货分享 4：常见问题 5： 网店推广 6:成功案例 7:视频教程
		if (typeId.equals("1")) {
			return "shop/liucheng";
		} else if (typeId.equals("2")) {
			return "shop/jiqiao";
		} else if (typeId.equals("3")) {
			return "shop/fenxiang";
		} else if (typeId.equals("4")) {
			return "shop/wenti";
		} else if (typeId.equals("5")) {
			return "shop/tuiguang";
		} else if (typeId.equals("6")) {
			return "case";
		}
		return "";
	}

//	public static String getUrlByArticle(Article article) {
//		if (article == null)
//			return "";
//		String typeId = article.getType();
//		String dir = getTypeDirById(typeId);
//
//		String url = dir + "/details.jsp?id=" + article.getId();
//		return url;
//	}
	public static String getUrlByArticle(Article article) {
		if (article == null)
			return "";
		String typeId = article.getType();
		String dir = getTypeDirById(typeId);

		String url = dir + "/" + article.getId()+".html";
		return url;
	}
	
	
	
	public static String getHideUserName(String userName) {
		int length = userName.length();
		if (userName.length() >= 3) {
			String start = userName.substring(0, 1);
			String end = userName.substring(length - 1, length);
			String midStr = getHideStrByLenth(length - 2);
			String result = start + midStr + end;
			return result;
		} else {
			return "*" + userName.substring(length - 1, length);
		}
	}

	public static String getHidePhone(String phone) {

		int length = phone.length();
		if (length < 11)
			return phone;
		String start = phone.substring(0, 2);
		String end = phone.substring(length - 4, length);
		return start + getHideStrByLenth(4) + end;
	}

	private static String getHideStrByLenth(int i) {
		StringBuilder sb = new StringBuilder();
		for (int j = 0; j < i; j++) {
			sb.append("*");
		}
		return sb.toString();
	}

	public static ArrayList<String> getPageArray(int pageCount, int pageNum) {
		int page_total = 13;
		int flag = 5;
		int temp_int = flag;
		int temp_end_int = 10;
		System.out.println("pageCount:" + pageCount + " pageNum:" + pageNum);
		ArrayList<String> pageNums = new ArrayList<String>();

		if (pageCount <= page_total) {
			for (int i = 1; i <= pageCount; i++) {
				pageNums.add(i + "");
			}
		} else {
			for (int i = 0; i < page_total; i++) {
				if (i == 0) {
					pageNums.add((i + 1) + "");
				} else if (i == page_total - 1) {
					pageNums.add(pageCount + "");
				} else if (i == 1) {
					if (pageNum - flag > 1 && pageNum > 7)
						pageNums.add("...");
					else
						pageNums.add((i + 1) + "");
				} else if (i == page_total - 2) {
					if (pageNum + flag <= pageCount && pageCount - pageNum >= 7
							|| pageCount - pageNum == 6) {
						pageNums.add("...");
					} else {
						pageNums.add((pageCount - 1) + "");
					}
				} else {
					if (pageNum <= 7) {
						pageNums.add((i + 1) + "");
					} else if (pageNum > 7 && pageCount - pageNum >= 7) {
						pageNums.add((pageCount - temp_int) + "");
						temp_int--;
					} else {
						pageNums.add((pageCount - temp_end_int) + "");
						temp_end_int--;
					}
				}
			}

		}
		return pageNums;
	}

	public static String getPageStr(Page articlePage, int pageNum) {

		int totalCount = articlePage.getTotalCount();
		int pageSize = articlePage.getPageSize();
		int pageCount = 0;
		if (totalCount > 0) {
			if(totalCount%pageSize==0)
				pageCount = totalCount / pageSize;
			 else 
				 pageCount = totalCount / pageSize + 1;
		}
		if(pageCount==0)
			pageCount = 1;
		int page_total = 13;
		int flag = 5;
		int temp_int = flag;
		int temp_end_int = 10;
		System.out.println("pageSize:" + pageSize + " totalCount:" +totalCount+" pageCount:" + pageCount + " pageNum:" + pageNum);
		ArrayList<String> pageNums = new ArrayList<String>();

		if (pageCount <= page_total) {
			for (int i = 1; i <= pageCount; i++) {
				pageNums.add(i + "");
			}
		} else {
			for (int i = 0; i < page_total; i++) {
				if (i == 0) {
					pageNums.add((i + 1) + "");
				} else if (i == page_total - 1) {
					pageNums.add(pageCount + "");
				} else if (i == 1) {
					if (pageNum - flag > 1 && pageNum > 7)
						pageNums.add("...");
					else
						pageNums.add((i + 1) + "");
				} else if (i == page_total - 2) {
					if (pageNum + flag <= pageCount && pageCount - pageNum >= 7
							|| pageCount - pageNum == 6) {
						pageNums.add("...");
					} else {
						pageNums.add((pageCount - 1) + "");
					}
				} else {
					if (pageNum <= 7) {
						pageNums.add((i + 1) + "");
					} else if (pageNum > 7 && pageCount - pageNum >= 7) {
						pageNums.add((pageNum - temp_int) + "");
						temp_int--;
					} else {
						pageNums.add((pageCount - temp_end_int) + "");
						temp_end_int--;
					}
				}
			}

		}

		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < pageNums.size(); i++) {
			String str = pageNums.get(i);
			if (str.contains("...")) {
				sb.append("<span>" + str + "</span>");
			} else {
				int index = Integer.parseInt(str);
				if (index == articlePage.getCurrentPage()) {

					String s = "<a class='act'	 href=\"manager_index.jsp?go="
							+ articlePage.getPageStr() + "&page=" + index
							+ "&search=" + articlePage.getSearchStr()
							+ "&type=" + articlePage.getType() + "&status="
							+ articlePage.getStatus() + "\">" + index + "</a>";
					sb.append(s);
				} else {
					String s = "<a  href=\"manager_index.jsp?go="
							+ articlePage.getPageStr() + "&page=" + index
							+ "&search=" + articlePage.getSearchStr()
							+ "&type=" + articlePage.getType() + "&status="
							+ articlePage.getStatus() + "\">" + index + "</a>";
					sb.append(s);
				}
			}
		}
		return sb.toString();

	}

	public static String getShopPageStr(Page articlePage) {
		int pageNum = articlePage.getCurrentPage();
		int totalCount = articlePage.getTotalCount();
		int pageSize = articlePage.getPageSize();
		
		int pageCount = 0;
		if (totalCount > 0) {
			if(totalCount%pageSize==0)
				pageCount = totalCount / pageSize;
			 else 
				 pageCount = totalCount / pageSize + 1;
		}

		int page_total = 13;
		int flag = 5;
		int temp_int = flag;
		int temp_end_int = 10;
		System.out.println("pageCount:" + pageCount + " pageNum:" + pageNum);
		ArrayList<String> pageNums = new ArrayList<String>();

		if (pageCount <= page_total) {
			
			for (int i = 1; i <= pageCount; i++) {
				pageNums.add(i + "");
			}
			
		} else {
			for (int i = 0; i < page_total; i++) {
				if (i == 0) {
					pageNums.add((i + 1) + "");
				} else if (i == page_total - 1) {
					pageNums.add(pageCount + "");
				} else if (i == 1) {
					if (pageNum - flag > 1 && pageNum > 7)
						pageNums.add("...");
					else
						pageNums.add((i + 1) + "");
				} else if (i == page_total - 2) {
					if (pageNum + flag <= pageCount && pageCount - pageNum >= 7
							|| pageCount - pageNum == 6) {
						pageNums.add("...");
					} else {
						pageNums.add((pageCount - 1) + "");
					}
				} else {
					if (pageNum <= 7) {
						pageNums.add((i + 1) + "");
					} else if (pageNum > 7 && pageCount - pageNum >= 7) {
						pageNums.add((pageNum - temp_int) + "");
						temp_int--;
					} else {
						pageNums.add((pageCount - temp_end_int) + "");
						temp_end_int--;
					}
				}
			}

		}

		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < pageNums.size(); i++) {
			String str = pageNums.get(i);
			if (str.contains("...")) {
				sb.append("<span>" + str + "</span>");
			} else {
				int index = Integer.parseInt(str);
				if (index == articlePage.getCurrentPage()) {

					String s = "<span class='current' href=\"index.jsp?page="
							+ index + "\">" + index + "</span>";
					sb.append(s);
				} else {
					String s = "<a class='tcdNumber' href=\"index.jsp?page="
							+ index + "\">" + index + "</a>";
					sb.append(s);
				}
			}
		}
		return sb.toString();

	}

}
