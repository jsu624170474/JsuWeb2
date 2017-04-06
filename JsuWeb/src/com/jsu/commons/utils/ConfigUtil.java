package com.jsu.commons.utils;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ConfigUtil {
	private static Properties props = null;
	private static String CONFIG_NAME = "configuration.properties";
	protected static Logger	logger	= LoggerFactory.getLogger(ConfigUtil.class);
	
	public static final String THIRD_PARTY_REQUEST_CHARSET = "UTF-8";
	public static final String THIRD_PARTY_RETURN_SUCCESS = "IPS0000";
	
	static{
		iniProper();
	}
	
	/**
	 * 初始化参数到内存中
	 * @author lizk
	 */
	public static void  iniProper(){
		InputStream in;
		logger.debug("初始化参数开始");
		props = new Properties();
		try {
			
			in = Thread.currentThread().getContextClassLoader().getResourceAsStream(CONFIG_NAME);
			props.load(in);
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		logger.debug("初始化参数结束");
	}
	
	/**
	 * 获取参数值
	 * @author lizk
	 * @param  key
	 * @return
	 */
	public static String get(String key){
		String value = null;
		value = (String) props.get(key);
		if(value==null){
			iniProper();
			value = (String) props.get(key);
		}
		return value;
	}
	/**
	 * 
	 * @Title: main
	 * @Description: TODO(密钥生成代码)
	 * @param args
	 */
	public static void main(String[] args) {
		System.out.println(ConfigUtil.get("config.initPasswd"));
	}
}
