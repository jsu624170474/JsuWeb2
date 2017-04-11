package com.yqjr.commons.util;

public class HTMLDecoder {

	public static String decode(String str) {
		String[] tmp = str.split(";&#|&#|;");
		StringBuffer sb = new StringBuffer("");
		for (int i = 0; i < tmp.length; i++) {
			if (tmp[i].matches("\\d{5}")) {
				sb.append((char) Integer.parseInt(tmp[i]));
			} else {
				sb.append(tmp[i]);
			}
		}
		return sb.toString();
	}
}
