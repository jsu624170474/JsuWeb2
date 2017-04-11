package com.yqjr.service.impl;

import com.yqjr.commons.base.BaseService;
import com.yqjr.commons.exception.DAOException;
import com.yqjr.dao.UserRoleDao;
import com.yqjr.entity.UserRoleDO;
import com.yqjr.service.UserRoleService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("userRoleService")
public class UserRoleServiceImpl extends BaseService implements UserRoleService {

	@Autowired
	private UserRoleDao userRoleDao;
	@Override
	public List<UserRoleDO> queryByUserId(int userId) throws DAOException {
		return userRoleDao.queryByUserId(userId);
	}
	@Override
	public List<UserRoleDO> queryByRoleId(int roleId) throws DAOException {
		return userRoleDao.queryByRoleId(roleId);
	}
	@Override
	public List<UserRoleDO> queryAllUserRole() throws DAOException {
		return userRoleDao.queryAllUserRole();
	}
	@Override
	public int addUserRole(Map<String,Object> map) {
		userRoleDao.delUserRole(map);
		return userRoleDao.addUserRole(map);
	}
	@Override
	public int delUserRole(Map<String, Object> map) throws DAOException {
		return userRoleDao.delUserRole(map);
	}

}
