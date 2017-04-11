package com.yqjr.commons.cache;

import java.util.HashMap;
import java.util.Map;

/**
 * 公共缓存
 * @author suian
 *
 */
public class CachePool {

	/** 首页缓存 - 对象 */
	public static Map<String, Object> HOME_PHONE_MAP = new HashMap<String, Object>(); // 容器
	public static String HOME_PHONE_SALES = "home_salesList";			// 促销
	public static String HOME_PHONE_RECOMMEND = "home_recommendList";	// 推荐
	public static String HOME_PHONE_HOT = "home_hotList";				// 热销
	
	/**
	 * 重置首页缓存对象
	 * @param key
	 * @param obj
	 */
	public static void setHomePhone(String key, Object obj){
		if(HOME_PHONE_MAP==null){
			HOME_PHONE_MAP = new HashMap<String, Object>(); 
		}
		HOME_PHONE_MAP.put(key, obj);
	}
	
	/**
	 * 获取首页缓存对象
	 * @param key
	 * @return
	 */
	public static Object getHomePhone(String key){
		if(HOME_PHONE_MAP!=null){
			return HOME_PHONE_MAP.get(key);
		}
		return null;
	}
}
