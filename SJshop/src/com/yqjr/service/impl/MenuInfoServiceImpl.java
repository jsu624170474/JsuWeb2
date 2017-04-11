package com.yqjr.service.impl;

import com.yqjr.dao.MenuInfoDao;
import com.yqjr.entity.MenuInfoDO;
import com.yqjr.entity.UserInfoDO;
import com.yqjr.service.MenuInfoService;
import com.yqjr.service.UserInfoService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service("menuInfoService")
public class MenuInfoServiceImpl implements MenuInfoService {
	@Autowired
	MenuInfoDao menuInfoDao;
	@Autowired
    UserInfoService userInfoService;

	@Override
	public List<MenuInfoDO> queryMenu(String userId) {
		// TODO Auto-generated method stub
		UserInfoDO infoDO = null;
		infoDO = userInfoService.queryUserInfo(userId);
		if (infoDO == null) { // 如果没查到用户返回空数据
			return new ArrayList<MenuInfoDO>();
		}
		return menuInfoDao.queryMenu(infoDO.getUserId());
	}

	@Override
	public List<Map<String, Object>> queryAllMenu(int userId) {
		// TODO Auto-generated method stub
		if (userId == -1) {
			return menuInfoDao.queryAllMenuMap();
		} else {
			return menuInfoDao.queryAllMenu(userId);
		}
	}

	@Override
	public List<MenuInfoDO> queryMenuByUser(int userId) {
		// TODO Auto-generated method stub
		return menuInfoDao.queryMenu(userId);
	}

	// 我的工作台 》快捷菜单
	@Override
	public List<MenuInfoDO> queryShortCutMenu(Map<String, Object> map) {
		return menuInfoDao.queryShortCutMenu(map);
	}

}
