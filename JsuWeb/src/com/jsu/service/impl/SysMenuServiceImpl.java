package com.jsu.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jsu.dao.SysUserMenuDao;
import com.jsu.entity.SysMenuInfoDO;
import com.jsu.service.SysMenuService;

@Service("SysMenuService")
public class SysMenuServiceImpl implements SysMenuService {

	@Autowired
	SysUserMenuDao sysUserMenuDao;
	
	@Override
	public List<SysMenuInfoDO> listUserMenu(int userId) {
		
		List<SysMenuInfoDO> allMenulist = sysUserMenuDao.listMenuByUserid(userId);
		
		/** 遍历子菜单 */
		List<SysMenuInfoDO> retList=new ArrayList<>();
		// 一级
		List<SysMenuInfoDO> firstLevel = this.getLevelMenu("", 3, allMenulist);
		for(SysMenuInfoDO menuInfo : firstLevel){
			// 二级
			menuInfo.setSubMenuList(this.getLevelMenu(menuInfo.getMenuOrder(), 6, allMenulist));
			
			retList.add(menuInfo);
		}
		
		return retList;
	}
	
	
	/**
	 * 获取指定级别的菜单
	 * @param upId			上级菜单ID
	 * @param level			级别：3-一级，6-二级
	 * @param allMenulist
	 * @return
	 */
	private List<SysMenuInfoDO> getLevelMenu(String upId, int level, List<SysMenuInfoDO> allMenulist){
		List<SysMenuInfoDO> list = new ArrayList<>();
		
		for(SysMenuInfoDO menuInfo : allMenulist){
			if(menuInfo.getMenuOrder().startsWith(upId) && 
					menuInfo.getMenuOrder().length()==level){
				list.add(menuInfo);
			}
		}
		
		return list;
	}

}
