package com.yqjr.service;

import com.yqjr.entity.RoleInfoDO;

import java.util.List;
import java.util.Map;

public interface RoleInfoService {
	public List<Map<String,Object>>	getRoleInfoList(Map<String, Object> map);
	//<!-- 获取所有审核角色 根据排序号排序 -->
	public List<RoleInfoDO> queryAllRoleInfoSort(Map<String, Object> map) ;
	public RoleInfoDO addRoleInfo(RoleInfoDO roleInfo);

	public int addRolePerm(Map<String, Object> map);

	public RoleInfoDO getRoleInfo(int roleId);
	public RoleInfoDO getRoleInfoBySequence(String sequence);
}
