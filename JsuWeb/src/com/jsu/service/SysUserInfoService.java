package com.jsu.service;

import com.jsu.entity.SysUserInfoDO;

public interface SysUserInfoService {

	public SysUserInfoDO getUserByLoginname(String loginName);
	
}
