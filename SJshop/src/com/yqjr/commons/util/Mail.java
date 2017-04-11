package com.yqjr.commons.util;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

/**
 * 邮件对象
 * 
 * @author leimeng
 * 
 */
public class Mail {

	// 邮件类型
	private String mailType;

	// 邮件发送器
	private String fromMailSmtp;
	// 发件人邮箱
	private String fromMailName;
	// 发件人密码
	private String fromMailPass;

	// 收件人邮箱
	private String toMail;
	// 标题
	private String title;
	// 内容
	private String content;

	// 附件列表
	private Map<String, File> files = new HashMap<String, File>();
	// 图片列表
	private Map<String, File> imgs = new HashMap<String, File>();

	// VM模版名
	private String template;
	// VM键值对
	private Map<String, Object> keyValue = new HashMap<String, Object>();

	public Mail() {
		super();
	}

	public Mail(String mailType, String fromMailSmtp, String fromMailName, String fromMailPass, String toMail, String title, String content, Map<String, File> files,
			Map<String, File> imgs, String template, Map<String, Object> keyValue) {
		this.mailType = mailType;
		this.fromMailSmtp = fromMailSmtp;
		this.fromMailName = fromMailName;
		this.fromMailPass = fromMailPass;
		this.toMail = toMail;
		this.title = title;
		this.content = content;
		this.files = files;
		this.imgs = imgs;
		this.template = template;
		this.keyValue = keyValue;
	}

	public String getMailType() {
		return mailType;
	}

	public void setMailType(String mailType) {
		this.mailType = mailType;
	}

	public String getFromMailSmtp() {
		return fromMailSmtp;
	}

	public void setFromMailSmtp(String fromMailSmtp) {
		this.fromMailSmtp = fromMailSmtp;
	}

	public String getFromMailName() {
		return fromMailName;
	}

	public void setFromMailName(String fromMailName) {
		this.fromMailName = fromMailName;
	}

	public String getFromMailPass() {
		return fromMailPass;
	}

	public void setFromMailPass(String fromMailPass) {
		this.fromMailPass = fromMailPass;
	}

	public String getToMail() {
		return toMail;
	}

	public void setToMail(String toMail) {
		this.toMail = toMail;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Map<String, File> getFiles() {
		return files;
	}

	public void setFiles(Map<String, File> files) {
		this.files = files;
	}

	public Map<String, File> getImgs() {
		return imgs;
	}

	public void setImgs(Map<String, File> imgs) {
		this.imgs = imgs;
	}

	public String getTemplate() {
		return template;
	}

	public void setTemplate(String template) {
		this.template = template;
	}

	public Map<String, Object> getKeyValue() {
		return keyValue;
	}

	public void setKeyValue(Map<String, Object> keyValue) {
		this.keyValue = keyValue;
	}

}
