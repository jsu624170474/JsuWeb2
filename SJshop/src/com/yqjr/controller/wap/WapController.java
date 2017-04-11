package com.yqjr.controller.wap;


import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.yqjr.commons.base.BaseController;
import com.yqjr.commons.helper.SpringContextHolder;
import com.yqjr.service.wap.WapService;

@Controller
@RequestMapping("/wap")
public class WapController extends BaseController{

	/**
	 * 统一接口实现方式
	 * @param signature
	 * @param ifn
	 * @param organid
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value ="{ifn}",produces = { "application/json;charset=utf-8" })
	public String main(String signature,@PathVariable String ifn,String organid,HttpServletRequest request,HttpServletResponse response){
		response.setHeader("Access-Control-Allow-Origin", "*");
		logger.debug("===================>calling interface ["+ifn+"]<=================================================");
		printParam(request);
		JSONObject retJson = new JSONObject();
		try {
			retJson = JSONObject.parseObject(((WapService)SpringContextHolder.getBean(ifn)).execute(request,response));
		} catch (Exception e) {
			retJson.put("retCode", "F");
			retJson.put("msg", e.getMessage());
		}

//		JSONArray retArray = new JSONArray();
//		retArray.add(retJson.toJSONString());
//		logger.info(DigestUtils.md5Hex(retJson.toJSONString()));
//		retArray.add(DigestUtils.md5Hex(retJson.toJSONString()));
		logger.debug(retJson.toJSONString());
		logger.debug("===================>["+ifn+"]"+" have been executed<=============================================");
		return retJson.toJSONString();

	}
	/**
	 * 打印上传参数
	 * @param request
	 */
	@SuppressWarnings("unchecked")
	private void printParam(HttpServletRequest request){
		Map<String, String[]> map = request.getParameterMap();
		for(String key :map.keySet()){
			String[] values = map.get(key);
			String log = "参数:"+key + "=";
			String logValue = null;
			for(int i = 0 ;i < values.length ; i ++){
				if(logValue == null){
					logValue = values[i] ;
				}else{
					logValue = logValue + "," +values[i];	
				}
			}
			logger.debug(log+logValue);
		}
	}
	
	public static String ArrayToXml(Map<String, String> arr) {
	    String xml = "<xml>";
	    Iterator<Entry<String, String>> iter = arr.entrySet().iterator();
	    while (iter.hasNext()) {
	        Entry<String, String> entry = iter.next();
	        String key = entry.getKey();
	        String val = entry.getValue();
	        if (IsNumeric(val)) {
	            xml += "<" + key + ">" + val + "</" + key + ">";
	        } else
	            xml += "<" + key + "><![CDATA[" + val + "]]></" + key + ">";
	    }
	    xml += "</xml>";
	    return xml;
	}
	
	public static boolean IsNumeric(String str) {
	    if (str.matches("\\d *")) {
	        return true;
	    } else {
	        return false;
	    }
	}
	
}
