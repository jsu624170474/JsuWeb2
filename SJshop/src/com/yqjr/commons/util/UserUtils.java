package com.yqjr.commons.util;

import org.apache.shiro.SecurityUtils;

import com.yqjr.commons.constants.SessionConstants;
import com.yqjr.entity.UserInfoDO;

public class UserUtils {

	/**
	 * 获取当前用户ID
	 * @return
	 */
	public static String getCurrentUser(){
		return getSessionUser().getUserId().toString();
	}
	
	/**
	 * 获取当前登录用户对象
	 * @return
	 */
	public static UserInfoDO getSessionUser() {
		return (UserInfoDO) SecurityUtils.getSubject().getSession()
				.getAttribute(SessionConstants.CURRENT_USER);
	}
}
