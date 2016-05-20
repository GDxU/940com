package com.vinbet.mobile.util;

import java.io.UnsupportedEncodingException;
import java.text.MessageFormat;
import java.util.Date;
import java.util.Map;
import java.util.Properties;
import java.util.ResourceBundle;
import java.util.concurrent.ConcurrentLinkedQueue;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;

import com.vinbet.mobile.entity.portal.EmailInfo;
import com.vinbet.mobile.sys.AppCache;
import com.vinbet.mobile.sys.PropertiesLoader;

/**
 * 邮件服务类
 * 
 * <pre>
 * <功能详细描述>
 * </pre>
 * 
 * @author cjp
 * @version [Ver 1.0]
 * @since 2015-3-15 下午3:25:43
 */
@IocBean
public class MailUtil {

	private Log logger = LogFactory.getLog(this.getClass());

	private static ConcurrentLinkedQueue<EmailInfo> emailQueue = new ConcurrentLinkedQueue<EmailInfo>();

	@Inject
	private PropertiesLoader propertiesLoader;

	public MailUtil() {
	}

	public void init() {
		EmailThread emailThread = new EmailThread();
		emailThread.start();
	}

	public void sendEmail(String toEmail, String templateName, Map<String, String> map, String locale, String userid, String code) {

		EmailInfo emailInfo = new EmailInfo();
		emailInfo.setLocale(locale);
		emailInfo.setTo(toEmail);
		emailInfo.setParameters(map);
		emailInfo.setTemplateName(templateName);
		emailInfo.setServer(DesUtils.decode(propertiesLoader.getTrim("vinbet.email.server")));
		emailInfo.setPort(DesUtils.decode(propertiesLoader.getTrim("vinbet.email.port")));
		emailInfo.setFrom(DesUtils.decode(propertiesLoader.getTrim("vinbet.email.sender")));
		emailInfo.setPassword(DesUtils.decode(propertiesLoader.getTrim("vinbet.email.passWord")));
		emailInfo.setUserid(userid);
		emailInfo.setCode(code);
		emailQueue.add(emailInfo);
		synchronized (emailQueue) {
			emailQueue.notifyAll();
		}
	}

	/**
	 * 使用邮件模板发送邮件
	 * 
	 * <pre>
	 * <功能详细描述>
	 * </pre>
	 * 
	 * @author cjp
	 * @param toEmail
	 *            会员电子邮箱地址
	 * @param subject
	 *            邮件标题
	 * @param body
	 *            邮件内容
	 * @param TemplateName
	 *            模板名称不包含后缀
	 * @param map
	 *            要替换的内容
	 * @param locale
	 *            语言
	 * @since 2015-3-14 上午10:08:58
	 */
	private void sendEmail(EmailInfo emailInfo) {
		//TODO
		try {
			logger.info("邮件发送--------------开始 toEmail：" + StringUtil.getStarEmail(emailInfo.getTo()));
			Properties props = new Properties();
			props.put("mail.smtp.host", emailInfo.getServer());
			props.put("mail.smtp.socketFactory.port", String.valueOf(emailInfo.getPort()));
			// props.put("mail.smtp.socketFactory.class",
			// "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.socketFactory.fallback", "false");
			props.put("mail.smtp.port", String.valueOf(emailInfo.getPort()));
			props.put("mail.smtp.auth", "true");
			Transport transport = null;
			Session session = Session.getDefaultInstance(props, null);
			transport = session.getTransport("smtp");
			transport.connect(emailInfo.getServer(), emailInfo.getFrom(), emailInfo.getPassword());
			MimeMessage msg = new MimeMessage(session);
			msg.setSentDate(new Date());
			InternetAddress fromAddress = new InternetAddress(emailInfo.getFrom());
			msg.setFrom(fromAddress);
			InternetAddress[] toAddress = new InternetAddress[1];
			toAddress[0] = new InternetAddress(emailInfo.getTo());
			msg.setRecipients(Message.RecipientType.TO, toAddress);
			// 使用模板
			String code = emailInfo.getCode();
			String subject = null;
			String body = null;
			// 需要把配置放到msg.properties文件中

			ResourceBundle resource = null;
			try {
				resource = ResourceBundle.getBundle("i18n.portal." + emailInfo.getLocale() + ".msg");
			} catch (Exception e) {
			}
			if (resource == null) {
				resource = ResourceBundle.getBundle("i18n.portal.zh.msg");
			}
			// 读取subject国际化配置
			subject = resource.getString("msg.checkcode.subject");
			if (subject != null) {
				// subject = new String(subject.getBytes("ISO-8859-1"), "UTF-8");
				subject = BASE64Util.getFromBASE64(subject);
			}
			// 读取body国际化配置
			body = resource.getString("msg.checkcode.body");
			if (body != null) {
				// body = new String(body.getBytes("ISO-8859-1"), "UTF-8");
				body = BASE64Util.getFromBASE64(body);

			}
			body = MessageFormat.format(body, code);
			AppCache.setEmialvCode(emailInfo.getUserid(), code, emailInfo.getTo(), System.currentTimeMillis());
			msg.setSubject(subject);

			// 采用XML模板，可以让邮件带有HTML的格式
			MimeBodyPart mbpBody = new MimeBodyPart();
			mbpBody.setContent(body, "text/html;charset=utf-8");
			MimeMultipart mp = new MimeMultipart();
			mp.addBodyPart(mbpBody);

			// 添加附件图片
			// MimeBodyPart mbpImage = null;
			// FileDataSource fds =null;
			// DataHandler dh = null;
			// File[]
			// files=templateFactory.getImages(emailInfo.getTemplateName());
			// if(null!=files){
			// for (int i = 0; i < files.length; i++) {
			// mbpImage = new MimeBodyPart();
			// fds = new FileDataSource(files[i]);
			// dh = new DataHandler(new FileDataSource(files[i]));
			// mbpImage.setDataHandler(dh);
			// mbpImage.setContentID(i+"");
			// mbpImage.setFileName(MimeUtility.encodeText(fds.getName()));
			// mp.addBodyPart(mbpImage);
			// }
			// }
			mp.setSubType("related"); // 设置正文与图片的关系
			msg.setContent(mp);
			msg.setSubject(subject, "UTF-8");
			msg.saveChanges();
			transport.sendMessage(msg, msg.getAllRecipients());
			logger.info("邮件发送--------------完成 toEmail：" + StringUtil.getStarEmail(emailInfo.getTo()) + "---验证码：" + code);
		} catch (Exception e) {
			logger.error("邮件发送失败");
			e.printStackTrace();
		}
	}

	private class EmailThread extends Thread {

		public void run() {
			while (true) {
				synchronized (emailQueue) {
					while (!emailQueue.isEmpty()) {
						sendEmail(emailQueue.poll());
					}
					try {
						emailQueue.wait();
					} catch (InterruptedException e) {
						logger.error(e.getMessage(), e);
					}
				}
			}
		}
	}

	public static void main(String[] args) {
		try {

			Properties props = new Properties();
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.socketFactory.fallback", "false");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.auth", "true");
			Transport transport = null;
			Session session = Session.getDefaultInstance(props, null);
			transport = session.getTransport("smtp");
			transport.connect("smtp.gmail.com", "cb1357085@gmail.com", "密码");
			MimeMessage msg = new MimeMessage(session);
			msg.setSentDate(new Date());
			InternetAddress fromAddress = new InternetAddress("cb1357085@gmail.com");
			msg.setFrom(fromAddress);
			InternetAddress[] toAddress = new InternetAddress[1];
			toAddress[0] = new InternetAddress("158695145@qq.com");
			msg.setRecipients(Message.RecipientType.TO, toAddress);

			// 使用模板
			String body = "123"; // templateFactory.getBodyHtmlFromFtl(emailInfo.getTemplateName(),
									// emailInfo.getParameters(),emailInfo.getLocale());
			String subject = "123";// templateFactory.getSubjectHtmlFromFtl(emailInfo.getTemplateName(),
									// emailInfo.getParameters(),
									// emailInfo.getLocale());

			msg.setSubject(subject);

			// 采用XML模板，可以让邮件带有HTML的格式
			MimeBodyPart mbpBody = new MimeBodyPart();
			mbpBody.setContent(body, "text/html;charset=utf-8");
			MimeMultipart mp = new MimeMultipart();
			mp.addBodyPart(mbpBody);

			// 添加附件图片
			MimeBodyPart mbpImage = null;
			FileDataSource fds = null;
			DataHandler dh = null;
			// File[]
			// files=templateFactory.getImages(emailInfo.getTemplateName());
			// if(null!=files){
			// for (int i = 0; i < files.length; i++) {
			// mbpImage = new MimeBodyPart();
			// fds = new FileDataSource(files[i]);
			// dh = new DataHandler(new FileDataSource(files[i]));
			// mbpImage.setDataHandler(dh);
			// mbpImage.setContentID(i+"");
			// mbpImage.setFileName(MimeUtility.encodeText(fds.getName()));
			// mp.addBodyPart(mbpImage);
			// }
			// }
			mp.setSubType("related"); // 设置正文与图片的关系
			msg.setContent(mp);
			msg.setSubject(subject, "UTF-8");
			msg.saveChanges();
			transport.sendMessage(msg, msg.getAllRecipients());

		} catch (Exception e) {

			e.printStackTrace();
		}
	}

}
