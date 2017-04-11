package com.yqjr.commons.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 
 * @Description:日期基类
 * @author:xud
 * @date 2015-11-13 下午1:45:40
 * 
 */
public class DateUtil {

	public static final String YYYY_MM_DD = "yyyy-MM-dd";
	public static final String YYYY_MM_DD_ZH = "yyyy年MM月dd日";
	public static final String YYYY_MM_DD_HHMMSS = "yyyy-MM-dd HH:mm:ss";
	public static final String YYYYMMDD = "yyyyMMdd";
	public static final String YYYYMMDDHHMMSS = "yyyyMMdd HH:mm:ss";

	public static final String YYYYMMDDHHMMSS_CONTINUOUS = "yyMMddHHmmss";
	/**
	 * 以正斜杠分割的年/月
	 */
	public static final String YYYY_MM_BACKSLASH = "yyyy/MM";
	/**
	 * 以正斜杠分割的年/月/日
	 */
	public static final String YYYY_MM_dd_BACKSLASH = "yyyy/MM/dd";

	/**
	 * 
	 * @Title: date2Str
	 * @Description:将时间类型转换为字符串
	 * @param date
	 *            传入的时间
	 * @param format
	 *            返回字符串格式
	 * @return
	 */
	public static String date2Str(Date date, String format) {
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		return sdf.format(date);
	}

	/**
	 * 
	 * @Title: str2Date
	 * @Description:将字符串改为时间
	 * @param dateStr
	 *            传入的字符串
	 * @param format
	 *            对应的格式
	 * @return
	 */
	public static Date str2Date(String dateStr, String format) {
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		try {
			return sdf.parse(dateStr);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 
	 * @Title: str2Str
	 * @Description: TODO(转换日期的显示格式)
	 * @param date
	 *            需要转换的日期
	 * @param formatBefore
	 *            转换之前日期的格式
	 * @param formatAfter
	 *            转换之后日期的格式
	 * @return
	 */
	public static String str2Str(String date, String formatBefore, String formatAfter) {
		SimpleDateFormat sdf = new SimpleDateFormat(formatBefore);
		try {
			Date tmpDate = sdf.parse(date);
			sdf = new SimpleDateFormat(formatAfter);
			return sdf.format(tmpDate);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 
	 * @Title: getNow
	 * @Description:获取当前日期
	 * @return
	 */
	public static String getNow() {
		return date2Str(new Date(), YYYY_MM_DD);
	}

	/**
	 * 
	 * @Title: getNow
	 * @Description:获取当前时间
	 * @return
	 */
	public static String getNowTime() {
		return date2Str(new Date(), YYYY_MM_DD_HHMMSS);
	}

	/**
	 * 
	 * @Title: addNow
	 * @Description:获取今天新增天数之后的日期
	 * @param addDay
	 *            新增的天数
	 * @return
	 */
	public static Date addNow(Integer addDay) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		calendar.add(Calendar.DAY_OF_MONTH, addDay);
		return calendar.getTime();
	}

	/**
	 * 获取1900年1月1日新增天数后的日期
	 * 
	 * @param addDay
	 * @return
	 */
	public static Date add1900(Integer addDay) {
		Calendar calendar = Calendar.getInstance();
		calendar.set(1900, 0, 1);
		calendar.add(Calendar.DAY_OF_MONTH, addDay);
		return calendar.getTime();
	}

	/**
	 * 按照所给格式进行日期转换
	 * 
	 * @param format
	 * @return
	 */
	public static String getDate(String format) {
		Date date = new Date();
		SimpleDateFormat sf = new SimpleDateFormat(format);
		return sf.format(date);
	}

	/**
	 * 
	 * @Title: getCurrTime
	 * @Description:获取时分秒信息
	 * @return
	 */
	public static String getCurrTime() {
		return getDate("HHmmss");
	}

	
	/**
	 * 获取时间增加指定天数后的日期
	 * @param addDay
	 * @return
	 */
	public static Date addDay(Date oldDate, Integer addDay) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(oldDate);
		calendar.add(Calendar.DAY_OF_MONTH, addDay);
		return calendar.getTime();
	}
	
	/**
	 * 
	 * @Title: addMonth
	 * @Description:获取时间增加月份后的日期
	 * @param oldDate
	 * @param addMonth
	 * @return
	 */
	public static Date addMonth(Date oldDate, Integer addMonth) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(oldDate);
		calendar.add(Calendar.MONTH, addMonth);
		return calendar.getTime();
	}
	
	public static Date addMinute(Date oldDate, Integer addMinute) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(oldDate);
		calendar.add(Calendar.MINUTE, addMinute);
		return calendar.getTime();
	}

	public static Date addSecond(Date oldDate, Integer addSecond) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(oldDate);
		calendar.add(Calendar.SECOND, addSecond);
		return calendar.getTime();
	}

	/**
	 * 
	 * @Title: addMonth
	 * @Description:获取时间增加月份后的日期并修改月中的日
	 * @param oldDate
	 * @param addMonth
	 * @return
	 */
	public static Date changeDayAndAddMonth(Date oldDate, Integer addMonth, Integer day) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(oldDate);
		calendar.set(Calendar.DAY_OF_MONTH, day);
		calendar.add(Calendar.MONTH, addMonth);
		return calendar.getTime();
	}

	/**
	 * 
	 * @Title: getLastNow
	 * @Description:获取今天的截止时间 即:yyyy-MM-dd 23:59:59
	 * @return
	 */
	public static Date getLastNow() {
		String nowStr = getNow();
		String newNowStr = nowStr + " 23:59:59";
		return str2Date(newNowStr, "yyyy-MM-dd HH:mm:ss");
	}


	public static Date getNowDate() {
		String nowStr = getNowTime();
		return str2Date(nowStr, "yyyy-MM-dd HH:mm:ss");
	}

	/**
	 * 
	 * @Title: minusDate
	 * @Description:比较两个日期的时间间隔天数 开始日期 - 截止日期
	 * @param startDate
	 *            开始日期
	 * @param endDate
	 *            截止日期
	 * @return
	 */
	public static Integer minusDate(Date startDate, Date endDate) {
		int result = 0;
		Calendar startCal = Calendar.getInstance();
		Calendar endCal = Calendar.getInstance();
		startCal.setTime(startDate);
		endCal.setTime(endDate);
		while (startCal.after(endCal)) {
			endCal.add(Calendar.DATE, 1);
			result++;
		}
		return result == 0 ? 0 : result - 1;
	}

	/**
	 * 计算两个日期之间相差的天数
	 * 
	 * @param smdate
	 *            较小的时间
	 * @param bdate
	 *            较大的时间
	 * @return 相差天数
	 * @throws ParseException
	 */
	public static int daysBetween(Date smdate, Date bdate) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		smdate = sdf.parse(sdf.format(smdate));
		bdate = sdf.parse(sdf.format(bdate));
		Calendar cal = Calendar.getInstance();
		cal.setTime(smdate);
		long time1 = cal.getTimeInMillis();
		cal.setTime(bdate);
		long time2 = cal.getTimeInMillis();
		long between_days = (time2 - time1) / (1000 * 3600 * 24);

		return Integer.parseInt(String.valueOf(between_days));
	}

	/**
	 * 获取参数时间到当前时间的时间数
	 * 
	 * @param dateTime
	 * @return
	 */
	public static Integer minusMinute(String dateTime) {
		int result = 0;
		Calendar startCal = Calendar.getInstance();
		startCal.setTime(new Date());
		Calendar endCal = Calendar.getInstance();
		endCal.setTime(str2Date(dateTime, "yyyy-MM-dd HH:mm:ss"));
		while (startCal.after(endCal)) {
			endCal.add(Calendar.MINUTE, 1);
			result++;
		}
		return result == 0 ? 0 : result - 1;
	}

	/**
	 * 
	 * @Title: getDayByCalendar
	 * @Description: TODO(获取日期)
	 * @param date
	 * @return
	 */
	public static int getDayByCalendar(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		int day = cal.get(Calendar.DATE);// 获取日
		return day;
	}

	public static int compareDate(String date1, String date2) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		try {
			Date dt1 = df.parse(date1);
			Date dt2 = df.parse(date2);
			if (dt1.getTime() > dt2.getTime()) {
				return 1;
			} else if (dt1.getTime() < dt2.getTime()) {
				return -1;
			} else {
				return 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public static int compareDate(Date date1, Date date2) {
		try {
			if (date1.getTime() > date2.getTime()) {
				return 1;
			} else if (date1.getTime() < date2.getTime()) {
				return -1;
			} else {
				return 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
}
