package com.yqjr.service.wap.impl;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.util.StringUtils;

import com.alibaba.fastjson.JSONObject;
import com.yqjr.commons.constants.ErrorCode;
import com.yqjr.commons.util.StringUtil;

/**
 * 外围接口公共抽象处理类
 * @author suian
 *
 */
public class WapServiceAbs {
	
	
	/**
	 * 校验所有基本规则
	 * 	1:渠道是否存在
	 * 	2:签名验证
	 * @param reqJson
	 * @return
	 */
	protected String checkAll(JSONObject reqJson){
		
		return "S";
	}
	
	
	/**
	 * 校验是否开通此渠道
	 * @param reqJson
	 * @return
	 */
	protected JSONObject existChannel(JSONObject reqJson){
		String retCode = "S";
		String channelId = reqJson.getString("channelId");
		String privateKey = "";
		
		/* 渠道编号为空检查 */
		if(StringUtils.isEmpty(channelId)){
			retCode = ErrorCode.E0012.getCode();
		}

		
		JSONObject retJson = new JSONObject();
		retJson.put("retCode", retCode);
		retJson.put("privateKey", privateKey);
		return retJson;
	}
	
	/**
	 * 验证签名
	 * @param reqJson
	 * @param privateKey	加密KEY
	 * @return
	 */
	protected boolean checkSign(JSONObject reqJson, String privateKey){
		
		// 获取报文签名
		String reqSign = StringUtil.nullToString(reqJson.getString("signature"));
		
		// 计算签名
		String sign = this.getSign(reqJson, privateKey);
		
		// 签名对比
		if(!reqSign.equals(sign)){
			return false;
		}
		
		return true;
	}
	
	/**
	 * 计算加密签名
	 * @param reqJson
	 * @param privateKey
	 * @return
	 */
	protected String getSign(JSONObject reqJson, String privateKey){
		String signature = "";
		Map<String, String> reqMap = this.jsonToMap(reqJson);
		for(String key : StringUtil.sortMapByKey(reqMap).keySet()){
			if(!key.equals("signature")){ // 排除签名字段
				signature += reqMap.get(key);
			}
		}
		signature = DigestUtils.md5Hex(signature+privateKey);
		
		return signature;
	}
	
	
	/**
	 * JSON转化为MAP
	 * @param json
	 * @return
	 */
	protected Map<String, String> jsonToMap(JSONObject json){
		Map<String, String> retMap = new HashMap<String, String>();
		
		for(String key : json.keySet()){
			retMap.put(key, StringUtil.nullToString(json.getString(key)));
		}
		
		return retMap;
	}
	
	
	/**
	 * 获取入参参数
	 * @param request
	 * @return
	 */
	protected JSONObject getRequestParam(HttpServletRequest request){
		JSONObject reqJson = new JSONObject();
		
		@SuppressWarnings("unchecked")
		Map<String, String[]> map = request.getParameterMap();
		for(String key :map.keySet()){
			reqJson.put(key, paramTrade(request.getParameter(key)));
		}
		
		return reqJson;
	}
	
	
	/**
	 * 乱码处理
	 * @param str
	 * @return
	 */
	protected String paramTrade(String str){
		String tmp = "";
		
		try {
			tmp = new String(str.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return tmp; 
	}
}
