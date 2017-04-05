package com.jsu.service;

import java.util.List;

import com.jsu.entity.SysMenuInfoDO;

public interface SysMenuService {

	/**
	 * 查询用户可查看的菜单
	 * @param userId	用户ID
	 * @return
	 */
	public List<SysMenuInfoDO> listUserMenu(int userId);
}
