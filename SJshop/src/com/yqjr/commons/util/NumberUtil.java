package com.yqjr.commons.util;

import java.sql.Array;
import java.text.DecimalFormat;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang3.StringUtils;

public class NumberUtil {
	
	/**
	 * 
	 * @Title: isNumber 
	 * @Description:判断字符串是否是数字
	 * @param str
	 * @return
	 */
	public static boolean isNumber(String str){
		Pattern pattern = Pattern.compile("[0-9]*");
		Matcher isNum = pattern.matcher(str);
		if(isNum.matches()){
			return true;
		}
		return false;
	}
	
	/**
	 * 
	 * @Title: getNumber 
	 * @Description:获取一个字符串中的所有的数字
	 * @param str
	 * @return
	 */
	public static Integer getNumber(String str){
		String regEx="[^0-9]";   
		Pattern p = Pattern.compile(regEx);   
		Matcher m = p.matcher(str);
		String numStr = m.replaceAll("").trim();
		if(StringUtils.isNotBlank(numStr)){
			return Integer.valueOf(numStr);
		}else{
			return null;
		}
	}
	
	/**
	 * 
	 * @Title: scientificToStr 
	 * @Description:将科学计数转换为字符串
	 * @param value
	 * @return
	 */
	public static String scientificToStr(double value){
		DecimalFormat dFormat = new DecimalFormat("#############0.00");
		return dFormat.format(value);
	}

	/**
	 * 判断数组中连续小于-0.1的数值是否连续大于等于2个
	 * @param c
	 * @return
	 */
	public static int count(float c[]){
		int count=1;
		for (int i=0;i<c.length;i++){
            if(c[i]<-0.1 && c[i+1]<-0.1){
				count++;
			}
		}
		return count;
	}
}
