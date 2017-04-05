package com.jsu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jsu.dao.SysUserInfoDao;
import com.jsu.entity.SysUserInfoDO;
import com.jsu.service.SysUserInfoService;

@Service("SysUserInfoService")
public class SysUserInfoServiceImpl implements SysUserInfoService {

	@Autowired
	SysUserInfoDao sysUserInfoDao;
	
	@Override
	public SysUserInfoDO getUserByLoginname(String loginName) {
		
		SysUserInfoDO userInfoDo = new SysUserInfoDO();
		userInfoDo.setLoginName(loginName);
		List<SysUserInfoDO> list = sysUserInfoDao.selectSelective(userInfoDo);
		if(list!=null && list.size()>0){
			return list.get(0);
		}
		
		return null;
	}

}
