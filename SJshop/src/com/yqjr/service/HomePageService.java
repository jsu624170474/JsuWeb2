package com.yqjr.service;

import java.util.Map;

import com.alibaba.fastjson.JSONObject;

public interface HomePageService {
	
	/**
	 * 统计指定日期的各业务量通过情况
	 * @param date	日期，格式 yyyy-MM-dd
	 * @return
	 */
	public Map<String, String> getResultStat(String date);
	
	
	/**
	 * 统计指定日期的各环节业务量
	 * @param date	日期，格式 yyyy-MM-dd
	 * @return
	 */
	public Map<String, String> getStatusStat(String date);
	
	/**
	 * 统计近段时间各业务量通过情况
	 * @param date
	 * @return
	 */
	public JSONObject getRegionResult(String beginDate, String endDate);
}
