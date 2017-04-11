package com.yqjr.commons.util;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.Map;
import java.util.TreeMap;

public class StringUtil {
    
	private static Logger logger = LoggerFactory.getLogger(StringUtil.class);
	/**
	 * 字符右填充
	 * 
	 * @param source
	 * @param len
	 * @param padStr
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public static String rightPad(String source, int len, String padStr) {
		if (padStr == null || padStr.equals("")) {
			padStr = "  ";
		}
		if (source == null)
			source = "";
		StringBuffer ss = new StringBuffer(source);
		int slen = 0;
		try {
			slen = source.getBytes("GBK").length;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		int dlen = padStr.length();
		while (true) {
			if (slen >= len)
				break;
			if ((len - slen) > dlen) {
				ss.append(padStr);
				slen += dlen;
			} else {
				ss.append(padStr.substring(0, len - slen));
				break;
			}
		}
		return ss.toString();
	}
	
	public static String rightSubPad(String source, int len, String padStr) {
		if (padStr == null || padStr.equals("")) {
			padStr = " ";
		}
		if (source == null)
			source = "";
		if (source.length() > len) {
			source = source.substring(0, len);
		}
		StringBuffer ss = new StringBuffer(source);
		int slen = 0;
		try {
			slen = source.getBytes("GBK").length;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		int dlen = padStr.length();
		while (true) {
			if (slen >= len)
				break;
			if ((len - slen) > dlen) {
				ss.append(padStr);
				slen += dlen;
			} else {
				ss.append(padStr.substring(0, len - slen));
				break;
			}
		}
		return ss.toString();
	}
	/**
	 * 字符右对齐左填充
	 * 
	 * @param source
	 * @param len
	 * @param padStr
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public static String leftPad(String source, int len, String padStr) {
		if (padStr == null || padStr.equals("")) {
			padStr = "  ";
		}
		if (source == null)
			source = "";
		StringBuffer ss = new StringBuffer(source);
		int slen = 0;
		try {
			slen = source.getBytes("GBK").length;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		int dlen = padStr.length();
		while (true) {
			if (slen >= len)
				break;
			if ((len - slen) > dlen) {
				ss.insert(0, padStr);
				slen += dlen;
			} else {
				ss.insert(0, padStr.substring(0, len - slen));
				break;
			}
		}
		return ss.toString();
	}
	public static String leftSubPad(String source, int len, String padStr) {
		if (padStr == null || padStr.equals("")) {
			padStr = " ";
		}
		if (source == null)
			source = "";
		if (source.length() > len) {
			source = source.substring(0, len);
		}
		StringBuffer ss = new StringBuffer(source);
		int slen = 0;
		try {
			slen = source.getBytes("GBK").length;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		int dlen = padStr.length();
		while (true) {
			if (slen >= len)
				break;
			if ((len - slen) > dlen) {
				ss.insert(0, padStr);
				slen += dlen;
			} else {
				ss.insert(0, padStr.substring(0, len - slen));
				break;
			}
		}
		return ss.toString();
	}
	/**
	 * 转换为utf-8编码
	 * @param s
	 * @return
	 */
	public static String toUtf8String(String s) {

		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < s.length(); i++) {
			char c = s.charAt(i);
			if (c >= 0 && c <= 255) {
				sb.append(c);
			} else {
				byte[] b;
				try {
					b = String.valueOf(c).getBytes("utf-8");
				} catch (Exception ex) {
					ex.printStackTrace();
					b = new byte[0];
				}
				for (int j = 0; j < b.length; j++) {
					int k = b[j];
					if (k < 0)
						k += 256;
					sb.append("%" + Integer.toHexString(k).toUpperCase());
				}
			}
		}
		return sb.toString();
	}
	/**
	 * 判断是否为空
	 * @param value
	 * @return
	 */
	public static boolean isBlank(String value){
		if(value!=null&&!value.equals("")){
			return false;
		}else{
			return true;
		}
	}
	
	
	/**
	 * 处理空字符
	 * @param str
	 * @return
	 */
	public static String nullToString(Object str){
		if(str==null){
			return "";
		}
		
		return String.valueOf(str);
	}
	
	/**
	 * 
	 * @Title: trimStr 
	 * @Description:去掉字符串中的空格
	 * @param value
	 * @return
	 */
	public static String trimStr(String value){
		String result = "";
		if(StringUtils.isNotBlank(value)){
			result = value.trim();
		}
		return result;
	}
	
	/**
	 * 
	 * @Title: transNo 
	 * @Description:设置字符串 格式为: 年月日时分+当前时间的后6位
	 * @return
	 */
	public static String transNo(){
		String ranStr = String.valueOf(System.currentTimeMillis());
		return DateUtil.date2Str(new Date(), "yyyyMMddHHmm")+ranStr.substring(ranStr.length()-6);
	}
	
	/**
	 * 
	 * @Title: formatParamMapToStr
	 * @Description: TODO(将参数的Map转换成字符串的参数形式)
	 * @param paramMap	参数的Map
	 * @return	字符串参数形式的Map
	 */
	public static String formatParamMapToStr(Map<String,Object> paramMap){
		StringBuilder paramSb =  new StringBuilder();
		for (String key : paramMap.keySet()) {
			paramSb.append(key+"="+paramMap.get(key)+"&");
		}
		return paramSb.substring(0, paramSb.length()-1).toString();
	}
	
	/**
	 * 
	 * @Title: transTime 
	 * @Description:将秒数转换为时分秒
	 * @param time 
	 * @return
	 */
	public static String transTime(int time){
		String timeStr = null;  
        int hour = 0;  
        int minute = 0;  
        int second = 0;  
        if (time <= 0)  
            return "00:00";  
        else {  
            minute = time / 60;  
            if (minute < 60) {  
                second = time % 60;  
                timeStr = "00:"+unitFormat(minute) + ":" + unitFormat(second);  
            } else {  
                hour = minute / 60;  
                if (hour > 999)  
                    return "999:59:59";  
                minute = minute % 60;  
                second = time - hour * 3600 - minute * 60;  
                timeStr = unitFormat(hour) + ":" + unitFormat(minute) + ":" + unitFormat(second);  
            }  
        }  
        return timeStr;  
	}
	
	public static String unitFormat(int i) {  
        String retStr = null;  
        if (i >= 0 && i < 10)  
            retStr = "0" + Integer.toString(i);  
        else  
            retStr = "" + i;  
        return retStr;  
    }
	
	/**
	 * 
	 * @Title: formatDouble 
	 * @Description:格式化金额，保留两位小数
	 * @param amt
	 * @return
	 */
	public  static String formatDouble(double amt){
		DecimalFormat df = new DecimalFormat("######0.00");
		return df.format(amt);
	}
	
	public static void main(String[] args) {
		System.out.println(formatDouble(10.432));
	}
	
	
	/**
	 * 
	 * @Title: mapToUrlParams 
	 * @Description:将map转换成字符串形式,同时包含对字符进行md5进行加密
	 * @param map
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public static String mapToUrlParams(Map<String, String> map ,String privateKey) throws UnsupportedEncodingException {
		StringBuilder buffer = new StringBuilder();
		String signature = "";
		for(String key : sortMapByKey(map).keySet()){
			signature += map.get(key);
		}
		signature = DigestUtils.md5Hex(signature+privateKey);
		buffer.append("sign=").append(signature);
		for (String key : map.keySet()) {
			 
			buffer.append("&");
			buffer.append(key).append("=").append(URLEncoder.encode(map.get(key)==null?"":String.valueOf(map.get(key)), "utf-8"));
		}
		
		return buffer.toString();
	}
	
	/**
	 * 
	 * @Title: checkMD5Inner 
	 * @Description:对内MD5加密检测
	 * @param request
	 * @return
	 */
	public static boolean checkMD5Inner(HttpServletRequest request){
		TreeMap<String, Object> treeMap = new TreeMap<String, Object>();
		Map<String, String[]> map = request.getParameterMap();
		//获取传入的参数，并将参数放入到TreeMap中(sign除外)
		for(String key :map.keySet()){
			if("sign".equals(key) || "datetime".equals(key)){
				continue;
			}
			String[] values = map.get(key);
			String logValue = null;
			for(int i = 0 ;i < values.length ; i ++){
				if(logValue == null){
					logValue = values[i] ;
				}else{
					logValue = logValue + "," +values[i];	
				}
			}
			treeMap.put(key, logValue);
		}
		String[] signs = map.get("sign");
		String sign = "";
		if(signs != null && signs.length > 0){
			for(int i=0;i<signs.length;i++){
				sign+= signs[i];
			}
		}
		logger.info("sign1:"+sign);
		String signature = "";
		for(String key:treeMap.keySet()){
			signature += String.valueOf(treeMap.get(key));
		}
		logger.info("sign:"+signature);
		logger.info("MD5:"+DigestUtils.md5Hex(signature));
		if(sign.equals(DigestUtils.md5Hex(signature))){
			return true;
		}else{
			return false;
		}
	}

	/**
	 *
	 * @Title: checkMD5Inner
	 * @Description:对内MD5加密检测
	 * @param request
	 * @return
	 */
	public static boolean checkMD5private(HttpServletRequest request,String privateKey){
		TreeMap<String, String> treeMap = new TreeMap<String, String>();
		Map<String, String[]> map = request.getParameterMap();

		//获取传入的参数，并将参数放入到TreeMap中(sign除外)
		for(String key :map.keySet()){
			if("sign".equals(key) || "datetime".equals(key)){
				continue;
			}
			String[] values = map.get(key);
			String logValue = null;
			for(int i = 0 ;i < values.length ; i ++){
				if(logValue == null){
					logValue = values[i] ;
				}else{
					logValue = logValue + "," +values[i];
				}
			}
			treeMap.put(key, logValue);
		}
		String[] signs = map.get("sign");
		String sign = "";
		if(signs != null && signs.length > 0){
			for(int i=0;i<signs.length;i++){
				sign+= signs[i];
			}
		}
		logger.info("sign:"+sign);
		String signature = "";
		for(String key:sortMapByKey(treeMap).keySet()){
			signature += String.valueOf(treeMap.get(key));
		}
		logger.info("signature:"+signature);
		logger.info("MD5:"+DigestUtils.md5Hex(signature));
		if(sign.equals(DigestUtils.md5Hex(signature+privateKey))){
			return true;
		}else{
			return false;
		}
	}

	public static Map<String, String> sortMapByKey(Map<String, String> map) {
		if (map == null || map.isEmpty()) {
			return null;
		}
		Map<String, String> sortMap = new TreeMap<String, String>(new MapKeyComparator());
		sortMap.putAll(map);
		return sortMap;
	}

	/**
	 * 将字符串指定位置的字符替换为指定字符
	 * @param source	被替换字符串
	 * @param start		起始位置
	 * @param length	长度
	 * @param replaceStr替换为
	 * @return
	 */
	public static String replaceStr(String source, int start, int length, String replaceStr){
		if(isBlank(source)){
			return "";
		}
		if(source.length()<start || source.length()<(start+length)){
			return source;
		}
		
		String before = source.substring(0,start);
		String end = source.substring(start+length, source.length());
		
		return before.concat(replaceStr).concat(end);
	}
	
}
