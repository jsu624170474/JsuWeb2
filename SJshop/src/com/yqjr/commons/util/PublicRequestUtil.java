package com.yqjr.commons.util;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 
 * @Description:后台发送http请求信息
 * @author:xud
 * @date 2015-11-26 上午9:39:09 
 *
 */
public class PublicRequestUtil {
	private static final Logger log = LoggerFactory.getLogger(PublicRequestUtil.class);

	/**
	 * 
	 * @Title: readContentFromGet
	 * @Description:get()请求
	 * @param getURL 请求路径
	 * @throws IOException
	 */
	public static String readContentFromGet(String getURL) throws IOException {
		String result = null;
		URL getUrl = new URL(getURL);
		// 根据拼凑的URL，打开连接，URL.openConnection函数会根据URL的类型，
		// 返回不同的URLConnection子类的对象，这里URL是一个http，因此实际返回的是HttpURLConnection
		HttpURLConnection connection = (HttpURLConnection) getUrl
				.openConnection();
		// 进行连接，但是实际上get request要在下一句的connection.getInputStream()函数中才会真正发到
		// 服务器
		connection.connect();
		// 取得输入流，并使用Reader读取 设置编码,否则中文乱码
		BufferedReader reader = new BufferedReader(new InputStreamReader(
				connection.getInputStream(), "utf-8"));
		log.info("Contents of get request");
		String lines;
		while ((lines = reader.readLine()) != null) {
			result += lines;
		}
		reader.close();
		// 断开连接
		connection.disconnect();
		log.info("Contents of get request ends");
		return result;
	}
	
	/**
	 * 
	 * @Title: readContentFromPost
	 * @Description:post()请求
	 * @param postURL 请求路径
	 * @param content 正文，正文内容其实跟get的URL中'?'后的参数字符串一致
	 * @throws IOException
	 */
	public static String readContentFromPost(String postURL,
			String content) throws IOException {
		String result = "";
		URL postUrl = new URL(postURL);
		HttpURLConnection connection = (HttpURLConnection) postUrl
				.openConnection();
		connection.setDoOutput(true);
		connection.setDoInput(true);
		connection.setRequestMethod("POST");
		connection.setUseCaches(false);
		connection.setInstanceFollowRedirects(true);
		connection.setRequestProperty("Content-Type",
				"application/x-www-form-urlencoded");
		connection.connect();
		DataOutputStream out = new DataOutputStream(
				connection.getOutputStream());
		out.writeBytes(content);
		out.flush();
		out.close();
		BufferedReader reader = new BufferedReader(new InputStreamReader(
				connection.getInputStream(), "utf-8"));
		String line;
		log.info("Contents of post request");
		while ((line = reader.readLine()) != null) {
			result += line;
		}
		log.info("Contents of post request ends");
		reader.close();
		connection.disconnect();
		return result;
	}

	/**
	 *
	 * @Title: getInstance
	 * @Description:创建对象
	 * @return
	 */
	public static PublicRequestUtil getNewInstance(){
		return new PublicRequestUtil();
	}

}
