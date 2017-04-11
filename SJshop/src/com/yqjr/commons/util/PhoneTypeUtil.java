package com.yqjr.commons.util;

public class PhoneTypeUtil {
	
	/**
	 * 
	 * @Title: matchesPhoneNumber 
	 * @Description:通过电话号码判断其所属的运营商.1:移动;2:联通;3:电信;4:错误
	 * @param phone_number 电话号码
	 * @return
	 */
	public static int matchesPhoneNumber(String phone_number) {

		String cm = "^((13[4-9])|(147)|(15[0-2,7-9])|(18[2-3,7-8]))\\d{8}$";
		String cu = "^((13[0-2])|(145)|(15[5-6])|(186)|(176))\\d{8}$";
		String ct = "^((133)|(153)|(18[0,9])|(177))\\d{8}$";

		int flag = 0;
		if (phone_number.matches(cm)) {
			flag = 1;
		} else if (phone_number.matches(cu)) {
			flag = 2;
		} else if (phone_number.matches(ct)) {
			flag = 3;
		} else {
			flag = 4;
		}
		return flag;

	}

}
