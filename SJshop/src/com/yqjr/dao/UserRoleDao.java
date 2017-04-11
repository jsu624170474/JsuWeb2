package com.yqjr.dao;

import com.yqjr.commons.exception.DAOException;
import com.yqjr.entity.UserRoleDO;

import java.util.List;
import java.util.Map;

public interface UserRoleDao {
	public List<UserRoleDO> queryByUserId(int userId) throws DAOException;
	public List<UserRoleDO> queryByRoleId(int roleId) throws DAOException;
	public List<UserRoleDO> queryAllUserRole() throws DAOException;
	public int addUserRole(Map<String, Object> map) throws DAOException;
	public int addDealerUserRole(Map<String, Object> map) throws DAOException;
	public int delUserRole(Map<String, Object> map)throws DAOException;
	public List<Integer> queryAuditQuence(Integer userId);
}
