package com.yqjr.service.wap;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yqjr.commons.exception.ServiceException;

public interface WapService {
	/**
	 * wap 通用接口
	 * @param signature   密钥
	 * @param organid     商户ID
	 * @param request     
	 * @param response
	 * @return
	 * @throws IOException 
	 */
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServiceException;
}
