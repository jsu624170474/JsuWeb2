package com.yqjr.commons.util;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.springframework.mail.javamail.JavaMailSenderImpl;

/**
 * 邮件处理类
 * 
 * @author leimeng
 * 
 */
public class MailUtil {

	private static final String FROM_MAIL_SMTP = "smtp.qq.com";
	private static final String FROM_MAIL_NAME = "470929621@qq.com";
	private static final String FROM_MAIL_PASS = "111111111";

	/**
	 * 发送邮件
	 * 
	 * @param mailSender
	 *            发送器
	 * @param mail
	 *            邮件对象
	 */
	public static void sendMail(JavaMailSenderImpl mailSender, Mail mail) {
//		if (mail != null) {
//			try {
//
//				// 使用JavaMail的MimeMessage，支付更加复杂的邮件格式和内容
//				MimeMessage msg = mailSender.createMimeMessage();
//				// 创建MimeMessageHelper对象，处理MimeMessage的辅助类
//				MimeMessageHelper helper = new MimeMessageHelper(msg, true, "GBK");
//				helper.setFrom(mailSender.getUsername());
//				helper.setTo(mail.getToMail());
//				helper.setSubject(mail.getTitle());
//
//				if ("txt".equalsIgnoreCase(mail.getMailType())) {
//					helper.setText(mail.getContent());
//					Map<String, File> files = mail.getFiles();
//					for (String key : files.keySet()) {
//						FileSystemResource file = new FileSystemResource(files.get(key));// 加载文件资源，作为附件
//						helper.addAttachment(MimeUtility.encodeWord(key), file);// 加入附件
//					}
//				}
//
//				if ("img".equalsIgnoreCase(mail.getMailType())) {
//					helper.setText(mail.getContent(), true);
//					Map<String, File> imgs = mail.getImgs();
//					for (String key : imgs.keySet()) {
//						FileSystemResource img = new FileSystemResource(imgs.get(key));
//						helper.addInline(key, img);
//					}
//					Map<String, File> files = mail.getFiles();
//					for (String key : files.keySet()) {
//						FileSystemResource file = new FileSystemResource(files.get(key));// 加载文件资源，作为附件
//						helper.addAttachment(MimeUtility.encodeWord(key), file);// 加入附件
//					}
//
//				}
//				if ("template".equalsIgnoreCase(mail.getMailType())) {
//
//					// Velocity的参数，通过VelocityEngineFactoryBean创建VelocityEngine，也是推荐在配置文件中配置的
//					Properties properties = System.getProperties();
//					properties.setProperty(Velocity.FILE_RESOURCE_LOADER_PATH, "D:/kayakwork/base/WebRoot/WEB-INF/template");
//					properties.setProperty(Velocity.OUTPUT_ENCODING, "UTF-8");
//					properties.setProperty(Velocity.INPUT_ENCODING, "UTF-8");
//
//					VelocityEngineFactoryBean v = new VelocityEngineFactoryBean();
//					v.setVelocityProperties(properties);
//
//					VelocityEngine velocityEngine = v.createVelocityEngine();
//
//					// Spring提供的VelocityEngineUtils将模板进行数据填充，并转换成普通的String对象
//					String emailText = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine, mail.getTemplate(), mail.getKeyValue());
//					helper.setText(emailText, true);
//				}
//
//				// 发送邮件
//				mailSender.send(msg);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
	}

	/**
	 * 创建邮件发送器
	 * 
	 * @param smtp
	 *            邮箱服务商的smtp地址
	 * @param userName
	 *            用户名
	 * @param password
	 *            密码
	 * @return
	 */
	public static JavaMailSenderImpl getMailSender(Mail mail) {
		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
		mailSender.setHost(mail.getFromMailSmtp());
		mailSender.setUsername(mail.getFromMailName());
		mailSender.setPassword(mail.getFromMailPass());
		// setPort(int port);
		// setProtocol(String protocol);
		Properties properties = new Properties();
		properties.setProperty("mail.smtp.auth", "true");
		mailSender.setJavaMailProperties(properties);
		return mailSender;
	}

	/**
	 * 测试Mian方法
	 * 
	 * @param args
	 */
	public static void main(String[] args) {
		Mail mail = new Mail();
		mail.setFromMailSmtp(FROM_MAIL_SMTP);
		mail.setFromMailName(FROM_MAIL_NAME);
		mail.setFromMailPass(FROM_MAIL_PASS);
		JavaMailSenderImpl mailSender = MailUtil.getMailSender(mail);
		mail.setToMail("yumeng130@126.com");

		mail.setMailType("template");

		/**
		 * 1发送文本内容,可以带附件
		 */
		if ("txt".equals(mail.getMailType())) {
			mail.setMailType("txt");
			mail.setTitle("邮件txt测试");
			mail.setContent("这是测试邮件内容");
			Map<String, File> files = new HashMap<String, File>();// 附件列表
			files.put("D://MyEclipseGen.class", new File("D://MyEclipseGen.class"));
			files.put("D://BL_FQ_20141022000009.docx", new File("D://BL_FQ_20141022000009.docx"));
			mail.setFiles(files);
			MailUtil.sendMail(mailSender, mail);
		}

		/**
		 * 2发送图片,可以带附件
		 */
		if ("img".equals(mail.getMailType())) {
			mail.setMailType("img");
			mail.setTitle("邮件img测试");
			mail.setContent("<html><head><META http-equiv=Content-Type content='text/html; charset=GBK'></head><body><h1>漂亮不</h1><br/><img src=\"cid:aaa\"/><br/><img src=\"cid:bbb\"/></body></html>");
			Map<String, File> imgs = new HashMap<String, File>(); // 图片列表
			imgs.put("aaa", new File("D://1111.jpg"));// 与Content中的cid标签保持一致
			imgs.put("bbb", new File("D://2222.jpg"));// 与Content中的cid标签保持一致
			mail.setImgs(imgs);
			MailUtil.sendMail(mailSender, mail);
		}

		/**
		 * 3发送模版
		 */
		if ("template".equals(mail.getMailType())) {
			mail.setMailType("template");
			mail.setTitle("邮件template测试");
			mail.setTemplate("mailtemplate.vm");// 设置调用模版
			Map<String, Object> keyValue = new HashMap<String, Object>();// 模板中需替换的键值对
			keyValue.put("user", "张三");
			keyValue.put("content", "欢迎加入分期宝！");
			mail.setKeyValue(keyValue);
			MailUtil.sendMail(mailSender, mail);
		}
	}
}
