package com.yqjr.dao;

import com.yqjr.entity.MenuInfoDO;

import java.util.List;
import java.util.Map;

public interface MenuInfoDao {
	public List<MenuInfoDO> queryMenu(int userId);
	public List<Map<String,Object>> queryAllMenu(int userId);
	public List<Map<String,Object>> queryAllMenuMap();
	
	//我的工作台 》快捷菜单
	public List<MenuInfoDO> queryShortCutMenu(Map<String, Object> map);
	
}
