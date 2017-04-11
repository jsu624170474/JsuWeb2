package com.yqjr.service.phoneFront;

import javax.servlet.http.HttpServletRequest;

/**
 * 首页服务类
 * @author suian
 *
 */
public interface HomeService {

	
	/**
	 * 重置首页信息到缓存里
	 * @return
	 */
	public boolean initContent(HttpServletRequest request);
	
	/**
	 * 获取首页指定信息
	 * @param request
	 * @param key
	 * @return
	 */
	public Object getContent(HttpServletRequest request, String key);	
}
