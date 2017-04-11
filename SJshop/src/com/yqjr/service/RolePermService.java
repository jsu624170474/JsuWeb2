package com.yqjr.service;

import com.yqjr.commons.exception.ServiceException;
import com.yqjr.entity.PermInfoDO;
import com.yqjr.entity.RoleInfoDO;

import java.util.List;
import java.util.Map;


public interface RolePermService {
	public List<Map<String,Object>> getRoleInfoList(Map<String, Object> map) throws ServiceException;

	public RoleInfoDO addRoleInfo(RoleInfoDO roleInfo) throws ServiceException;

	public int addRolePerm(Map<String, Object> map) throws ServiceException;

	public List<PermInfoDO> getPermList() throws ServiceException;

	public RoleInfoDO getRoleInfo(int roleId) throws ServiceException;

	public List<Map<String, Object>> getRolePerm(int roleId) throws ServiceException;

	public int delRolePerm(Map<String, Object> map) throws ServiceException;

	public int updateRolePerm(RoleInfoDO roleInfo, String permIds) throws ServiceException;
}
