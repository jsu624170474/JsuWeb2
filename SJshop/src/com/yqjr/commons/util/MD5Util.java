package com.yqjr.commons.util;

import org.apache.commons.codec.digest.DigestUtils;

import com.infosight.open.api.utils.MD5;

public class MD5Util {
	public static String getMd5(String ... args){
		StringBuffer argStr = new StringBuffer();
		for (String str : args) {
			argStr.append(str);
		}
		return MD5.sign(argStr.toString(),GlobalConfig.get("third_party_request_interkey"), GlobalConfig.THIRD_PARTY_REQUEST_CHARSET);
	}
}
