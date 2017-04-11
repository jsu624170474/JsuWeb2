package com.yqjr.commons.util;

import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;
import org.apache.velocity.app.VelocityEngine;
import org.apache.velocity.exception.ParseErrorException;
import org.apache.velocity.exception.ResourceNotFoundException;

/**
 * 生成PDF工具类,基于wkhtmltopdf软件生成,适用Linux和Windows服务器
 * 
 * @author leim
 * 
 */
public class Html2PdfUtil {
	/**
	 * 将HTML生成PDF文件
	 * 
	 * @param wkhtmltopdfPath
	 *            软件安装路径
	 * @param htmlTempPath
	 *            需转换的html文件路径
	 * @param pdfName
	 *            生成后的pdf文件路径
	 * @param headerCenter
	 *            生成的页眉的内容
	 */
	public static void Html2Pdf(String wkhtmltopdfPath, String htmlTempPath, String pdfSavePath, String headerCenter) {
		// String wkhtmltopdfPath = "/usr/local/bin/wkhtmltopdf";
		// wkhtmltopdf安装路径，根据自己的安装路径换上即可
		String command = wkhtmltopdfPath + " --header-center " + headerCenter
				+ " --header-font-size 9 --header-spacing 5 --outline --header-line --margin-top 2cm --footer-center 第[page]页-共[topage]页 " + htmlTempPath + " " + pdfSavePath;
		try {
			System.out.println("执行生成PDF命令:"+command);
			Runtime.getRuntime().exec(command);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 通过Velocity模版填充值生成HTML
	 * 
	 * @param contextMap
	 *            需填充的的内容
	 * @param velocityTempPath
	 *            模版的文件路径
	 * @param velocityTempName
	 *            模版的文件名称
	 * @param htmlSavePath
	 *            生成的html文件路径
	 */
	public static void Velocity2Html(Map<String, String> contextMap, String velocityTempPath, String velocityTempName, String htmlSavePath) {
		try {
			// 初始化vm模板
			VelocityEngine ve = new VelocityEngine();
			Properties properties = new Properties();
			properties.setProperty(Velocity.FILE_RESOURCE_LOADER_PATH, velocityTempPath);
			properties.setProperty(Velocity.OUTPUT_ENCODING, "UTF-8");
			properties.setProperty(Velocity.INPUT_ENCODING, "UTF-8");
			ve.init(properties);
			Template template = ve.getTemplate(velocityTempName, "UTF-8");
			// 初始化上下文
			VelocityContext context = new VelocityContext();
			// 添加数据到上下文中
			Set<String> keys = contextMap.keySet();
			for (String key : keys) {
				context.put(key, contextMap.get(key));
			}
			// 生成html页面
			// PrintWriter writer = new PrintWriter(htmlSavePath);
			BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(htmlSavePath), "UTF-8"));
			template.merge(context, writer);
			// ve.mergeTemplate(htmlSavePath,"UTF-8", context, writer);
			// 关闭流
			writer.flush();
			writer.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (ResourceNotFoundException e) {
			e.printStackTrace();
		} catch (ParseErrorException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void mVelocity2Html(Map<String, Object> contextMap, String velocityTempPath, String velocityTempName, String htmlSavePath) {
		try {
			// 初始化vm模板
			VelocityEngine ve = new VelocityEngine();
			Properties properties = new Properties();
			properties.setProperty(Velocity.FILE_RESOURCE_LOADER_PATH, velocityTempPath);
			properties.setProperty(Velocity.OUTPUT_ENCODING, "UTF-8");
			properties.setProperty(Velocity.INPUT_ENCODING, "UTF-8");
			ve.init(properties);
			Template template = ve.getTemplate(velocityTempName, "UTF-8");
			// 初始化上下文
			VelocityContext context = new VelocityContext();
			// 添加数据到上下文中
			Set<String> keys = contextMap.keySet();
			for (String key : keys) {
				context.put(key, contextMap.get(key));
			}
			// 生成html页面
			// PrintWriter writer = new PrintWriter(htmlSavePath);
			BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(htmlSavePath), "UTF-8"));
			template.merge(context, writer);
			// ve.mergeTemplate(htmlSavePath,"UTF-8", context, writer);
			// 关闭流
			writer.flush();
			writer.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (ResourceNotFoundException e) {
			e.printStackTrace();
		} catch (ParseErrorException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
