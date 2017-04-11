package com.yqjr.commons.util;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class GlobalConfig {
	private static Properties props = null;
	private static String CONFIG_NAME = "config.properties";
	protected static Logger	logger	= LoggerFactory.getLogger(GlobalConfig.class);
	
	public static final String HTTP_REQUEST_TIMEOUT = "REQUEST_TIMEOUT";
	
	public static final int VERIFY_CODE_VALID_MINUTE = 5;
	
	public static final int VERIFY_CODE_MAX_TIME = 10;
	
	public static final String THIRD_PARTY_REQUEST_CHARSET = "UTF-8";
	public static final String THIRD_PARTY_RETURN_SUCCESS = "IPS0000";
	
	
	/**
	 * 版本号
	 */
	public static final String THIRD_PARTY_REQUEST_VERSION = "1.0";
	
	/**
	 * 身份证
	 */
	public static final String THIRD_PARTY_REQUEST_IDTYPE_00 = "00";
	
	/**
	 * 04：四要素认证
	 */
	public static final String THIRD_PARTY_REQUEST_CHKTYPE_04 = "04";
	
	/**
	 * 签名方式
	 */
	public static final String THIRD_PARTY_REQUEST_SIGNTYPE_04 = "MD5";
	
	
	
	
	//对账步骤说明
	public static final String CHECK_STEP_ONE="日终对账开始,FTP文件下载解压";
	public static final String CHECK_STEP_TWO="解析FTP文件并入库";
	public static final String CHECK_STEP_THREE="对账总记录";
	public static final String CHECK_STEP_FOUR="对账明细并同步还款计划表";
	public static final String CHECK_STEP_FIVE="移入对账明细历史表";
	public static final String CHECK_STEP_SIX="日终更新还款计划表状态,日终对账处理结束";
	
	//对账步骤状态0-初始,1-成功,2-失败
	public static final String CHECK_STEP_INIT="0";
	public static final String CHECK_STEP_SUCCESS="1";
	public static final String CHECK_STEP_FAILURE="2";
	
	/**
	 * 签约代收支付
	 * interfaceName
	 * notifyUrl
	 * validTime
	 * reqUrl 测试：http://119.254.111.198:8050/ips/mercExp/gwExpress/pay
	 * 		      正式：https://payment.shanqb.com/ips/mercExp/gwExpress/pay
	 */
	public static final String GWPAY_INTERFACENAME = "gwNoSmsSignPay";
	public static final String GWPAY_VALIDTIME = "1m";
	
	/**
	 * 代收支付结果查询
	 * interfaceName
	 * reqUrl  测试：http://119.254.111.198:8050/ips/mercExp/gwExpress/queryOrder
	 * 		        正式：https://payment.shanqb.com/ips/mercExp/gwExpress/queryOrder
	 */
	public static final String GWQRYORDER_INTERFACENAME = "gwQryOrderExpressOffline";
	
	
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
		System.out.println(MD5Util.getMd5("yuqian"));
	}
}
