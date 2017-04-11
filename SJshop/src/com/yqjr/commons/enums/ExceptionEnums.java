package com.yqjr.commons.enums;

import com.alibaba.fastjson.JSONObject;

public interface ExceptionEnums {
	/**
	 * 获取返回的成功或失败的信息
	 * @return 返回true or false
	 */
	public boolean getRetCode();
	/**
	 * 获取成功或失败的详细信息
	 * @return 返回详细信息的内容
	 */
	public String getMsg();
	/**
	 * 返回head头部信息
	 * @return	头部信息的JSONObject
	 */
	public JSONObject getJsonHead();
}
