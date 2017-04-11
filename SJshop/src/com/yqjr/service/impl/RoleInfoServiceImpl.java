package com.yqjr.service.impl;

import com.yqjr.commons.base.BaseService;
import com.yqjr.dao.RoleInfoDao;
import com.yqjr.entity.RoleInfoDO;
import com.yqjr.service.RoleInfoService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("roleInfoService")
public class RoleInfoServiceImpl extends BaseService implements RoleInfoService {

	@Autowired
	private RoleInfoDao roleInfoDao;

	@Override
	public List<Map<String, Object>> getRoleInfoList(Map<String, Object> map) {
		return roleInfoDao.getRoleInfoList(map);
	}
	//<!-- 获取所有审核角色 根据排序号排序 -->
	public List<RoleInfoDO> queryAllRoleInfoSort(Map<String, Object> map){
		return roleInfoDao.queryAllRoleInfoSort(map);
	}
	@Override
	public RoleInfoDO addRoleInfo(RoleInfoDO roleInfo) {
		return roleInfoDao.addRoleInfo(roleInfo);
	}

	@Override
	public int addRolePerm(Map<String, Object> map) {
		return roleInfoDao.addRolePerm(map);
	}

	@Override
	public RoleInfoDO getRoleInfo(int roleId) {
		return roleInfoDao.getRoleInfo(roleId);
	}
	@Override
	public RoleInfoDO getRoleInfoBySequence(String sequence) {
		// TODO Auto-generated method stub
		return roleInfoDao.getRoleInfoBySequence(sequence);
	}

}
