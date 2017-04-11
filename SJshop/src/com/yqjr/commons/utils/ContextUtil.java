package com.yqjr.commons.utils;


import com.yqjr.entity.UserInfoDO;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ContextUtil {

	/**
	 * 获取容器SERVLET对象
	 *
	 * @return HttpServletReqeust
	 */
	public static HttpServletRequest getRequest() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
		return request;
	}

	/**
	 * 获取容器SESSION对象
	 *
	 * @return HttpSession
	 */
	public static HttpSession getCurrentSession() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
		return request.getSession();
	}

	/**
	 * 获取容器RESPONSE对象
	 *
	 * @return HttpServletResponse
	 *//*
	public static HttpServletResponse getResponse() {
		HttpServletResponse response = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getResponse();
		return response;
	}*/

	/**
	 * 获取当前登录用户
	 * 
	 * @return
	 */
	public static UserInfoDO getCurrentUser() {
		HttpSession session = getCurrentSession();
		Object object = session.getAttribute(GlobalConfig.sessionUser);
		UserInfoDO user = null;
		if (object != null)
			user = (UserInfoDO) object;
		return user;
	}

	/**
	 * 获取项目路径
	 * 
	 * @return
	 */
	public static String getContextPath() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
		return request.getContextPath();
	}
}
