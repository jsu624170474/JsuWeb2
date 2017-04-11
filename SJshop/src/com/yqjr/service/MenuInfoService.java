package com.yqjr.service;

import com.yqjr.entity.MenuInfoDO;

import java.util.List;
import java.util.Map;

public interface MenuInfoService {
	public List<MenuInfoDO> queryMenu(String userId);
	public List<Map<String,Object>> queryAllMenu(int userId);
	public List<MenuInfoDO> queryMenuByUser(int userId);
	//我的工作台 》快捷菜单
	public List<MenuInfoDO> queryShortCutMenu(Map<String, Object> map);
}
