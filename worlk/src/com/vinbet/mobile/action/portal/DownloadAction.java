package com.vinbet.mobile.action.portal;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.annotation.At;

import com.vinbet.mobile.sys.AppCache;
import com.vinbet.mobile.sys.CEPUserCenterIceClient;
import com.vinbet.mobile.util.Constants;
import com.vinbet.mobile.util.CreateXmlUtil;

@IocBean(singleton = false)
public class DownloadAction {
	//@Inject
	//private PropertiesLoader propertiesLoader;
	@Inject
	private CEPUserCenterIceClient cEPUserCenterIceClient;
	private static final Logger logger = LogManager.getLogger(DownloadAction.class);

	@At("/download")
	public void download(HttpServletRequest request, HttpServletResponse respone) {
		String userAgent = request.getHeader("User-Agent");
		String apkUrl = AppCache.getSystemParm(Constants.ANDROID_DOWNLOAD_URL).replaceAll("\\\\", "").replace("amp;", "");
		String ipaUrl = AppCache.getSystemParm(Constants.IOS_DOWNLOAD_URL).replaceAll("\\\\", "").replace("amp;", "");
		String agentName = "vinbet";
		String serName = request.getServerName();
		String contents[] = serName.split("\\.");
		// serName = serName.substring(serName.indexOf(".") + 1, serName.length());
		serName = contents[1] + "." + contents[2];
		HashMap<String, String> rec = new HashMap<String, String>();
		rec.put("dm", serName);
		rec.put("pgnm", "1");
		rec.put("pgsz", "100");
		String reqXml = CreateXmlUtil.createPublicReqXML(null, rec);
		String resp = cEPUserCenterIceClient.baseManagerZreocSrvIPrx("queryAgentDomain", reqXml);
		if (resp != null && resp.length() != 0) {
			try {
				Document dom = DocumentHelper.parseText(resp);
				Element root = dom.getRootElement();
				Element recElement = root.element("rec");
				if (recElement != null) {
					if (root.attributeValue("st").equals("1") && recElement.attributeValue("dmst").equals("1")) {
						agentName = recElement.attributeValue("acnt");
					}
				}
			} catch (DocumentException e) {
				logger.error("解析代理的域名信息异常", e);
			}
		}
		if (userAgent.toLowerCase().indexOf("android") > -1) {
			try {
				int code = getResponseCode(apkUrl + agentName + ".apk");
				if (code == 200) {
					logger.info("android download url:" + apkUrl + agentName + ".apk");
					respone.sendRedirect(apkUrl + agentName + ".apk");
				} else {
					logger.info("android download url:" + apkUrl + "vinbet.apk");
					respone.sendRedirect(apkUrl + "vinbet.apk");
				}
			} catch (IOException e) {
				logger.error("android app download fail:", e);
				printError("用户网络无法连接到服务器，请联系客服!", respone);
			}
		} else if (userAgent.toLowerCase().indexOf("iphone") > -1 || userAgent.toLowerCase().indexOf("ipad") > -1) {
			try {
				logger.info("ios download url:" + ipaUrl + agentName + ".plist");
				String plistStr = ipaUrl + agentName + ".plist";
				int code = getResponseCode(plistStr.substring(plistStr.indexOf("https")).replace("https", "http"));
				if (code == 200) {
					logger.info("ios download url:" + ipaUrl + agentName + ".plist");
					respone.sendRedirect(ipaUrl + agentName + ".plist");
				} else {
					logger.info("ios download url:" + ipaUrl + "vinbet.plist");
					respone.sendRedirect(ipaUrl + "vinbet.plist");
				}
			} catch (IOException e) {
				logger.error("ios app download fail:", e);
				printError("用户网络无法连接到服务器，请联系客服!", respone);
			}
		} else {
			printError("对不起，该APP暂时只支持iOS和Android设备!", respone);
		}
	}

	private void printError(String msg, HttpServletResponse respone) {
		PrintWriter out = null;
		try {
			respone.setCharacterEncoding("UTF-8");
			respone.setContentType("text/html; charset=UTF-8");
			out = respone.getWriter();
			out.print("<script type='text/javascript'>alert('" + msg + "');" + "</script>");
			return;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (out != null) {
				out.close();
			}
		}
	}

	public static int getResponseCode(String urlString) throws MalformedURLException, IOException {
		URL u = new URL(urlString);
		HttpURLConnection huc = (HttpURLConnection) u.openConnection();
		huc.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.155 Safari/537.36");
		huc.setRequestMethod("GET");
		huc.connect();
		return huc.getResponseCode();
	}

}
