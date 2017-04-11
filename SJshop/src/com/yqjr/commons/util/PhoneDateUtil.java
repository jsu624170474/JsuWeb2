package com.yqjr.commons.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class PhoneDateUtil {

	/**
	 * 
	 * @Title: getBeforeMonthStr 
	 * @Description:获取当前月份的前i个月的第一天
	 * @param i
	 * @return
	 */
	public static String getBeforeMonthStr(int i) {
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.MONTH, -i);
		calendar.set(Calendar.DAY_OF_MONTH, 1); 
		return new SimpleDateFormat("yyyy-MM-dd").format(calendar.getTime());
	}
	
	/**
	 * 
	 * @Title: getOneMonthLast 
	 * @Description:获取当前月份前i个月份 的最后一天日期
	 * @param i
	 * @return
	 */
	public static String getBeforeMonthLast(int i){
		Calendar calendar = Calendar.getInstance();  
		int month = calendar.get(Calendar.MONTH);
		calendar.set(Calendar.MONTH, month-i);
		calendar.set(Calendar.DAY_OF_MONTH,calendar.getActualMaximum(Calendar.DAY_OF_MONTH));  
		return new SimpleDateFormat("yyyy-MM-dd").format(calendar.getTime());
	}
}
