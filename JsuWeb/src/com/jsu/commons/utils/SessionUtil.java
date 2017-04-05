package com.jsu.commons.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.jsu.commons.constants.Constants;
import com.jsu.entity.SysUserInfoDO;

public class SessionUtil {

	
	/**
	 * 获取当前登录用户ID
	 * @return
	 */
	public static Integer getCurrnetUserId(){
		
		SysUserInfoDO userInfoDo = getCurrentUser();
		if(userInfoDo!=null){
			return userInfoDo.getUserId();
		}
		
		return null;
	}
	
	/**
	 * 获取当前登录用户对象
	 * @return
	 */
	public static SysUserInfoDO getCurrentUser(){
		
		Object curObject = getSession().getAttribute(Constants.CURRENT_USER);
		if(curObject==null){
			return null;
		}
		
		return (SysUserInfoDO)curObject;
	}
	
	public static HttpSession getSession() {
		HttpSession session = null;
		try {
			session = getRequest().getSession();
		} catch (Exception e) {
		}
		return session;
	}

	public static HttpServletRequest getRequest() {
		ServletRequestAttributes attrs = (ServletRequestAttributes) RequestContextHolder
				.getRequestAttributes();
		return attrs.getRequest();
	}
}
