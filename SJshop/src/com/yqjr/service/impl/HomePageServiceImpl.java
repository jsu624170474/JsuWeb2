package com.yqjr.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.yqjr.service.HomePageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class HomePageServiceImpl implements HomePageService {

	@Override
	public Map<String, String> getResultStat(String date) {
		Map<String, String> todayResultMap = new HashMap<String, String>();
		double total = 0;		// 总量
		double success = 0; 	// 通过
		double fail = 0; 		// 不通过
		double exception = 0;	//异常
		
		DecimalFormat dfCount = new DecimalFormat(",###,###");
		DecimalFormat dfRate = new DecimalFormat("####0.00");
		
		todayResultMap.put("total", dfCount.format(total));	// 总量
		todayResultMap.put("success", dfCount.format(success));	// 通过
		todayResultMap.put("successRate", dfRate.format(total==0 ? 0 : (success/total*100)));	// 通过率
		todayResultMap.put("fail", dfCount.format(fail));	// 不通过
		todayResultMap.put("failRate", dfRate.format(total==0 ? 0 : (fail/total*100)));	// 不通过率
		todayResultMap.put("exception", dfCount.format(exception));	// 异常
		todayResultMap.put("exceptionRate", dfRate.format(total==0 ? 0 : (exception/total*100)));	// 异常率
		
		return todayResultMap;
	}

	@Override
	public Map<String, String> getStatusStat(String date) {
		
		double CreateTask=0;		// 建立任务
		double Login=0;				// 营业厅登录
		double GrabDate=0;			// 数据采集
		double CalcTarget=0;		// 计算指标
		double CalcStrategy=0;		// 计算策略

		DecimalFormat dfCount = new DecimalFormat(",###,###");
		Map<String, String> todayStatusMap = new HashMap<String, String>();
		todayStatusMap.put("CreateTask", dfCount.format(CreateTask)); 	// 建立任务
		todayStatusMap.put("Login", dfCount.format(Login)); 			// 营业厅登录
		todayStatusMap.put("GrabDate", dfCount.format(GrabDate)); 		// 数据采集
		todayStatusMap.put("CalcTarget", dfCount.format(CalcTarget)); 	// 计算指标
		todayStatusMap.put("CalcStrategy", dfCount.format(CalcStrategy)); // 计算策略
		
		
		return todayStatusMap;
	}

	@Override
	public JSONObject getRegionResult(String beginDate, String endDate) {
		JSONObject resultJson = new JSONObject(); 
		JSONArray successArray = new JSONArray(); 	// 通过
		JSONArray failArray = new JSONArray();		// 不通过
		
//		List<Map<String, String>> list = riskResultInfoDao.getRegionResultStat(beginDate, endDate);
		
		return resultJson;
	}

}
