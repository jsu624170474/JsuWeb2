package com.yqjr.dao;

import com.yqjr.commons.exception.DAOException;
import com.yqjr.entity.UserInfoDO;

import java.util.List;
import java.util.Map;

public interface UserInfoDao {
	public List<UserInfoDO> getUsers(int userId) throws DAOException;
	public List<UserInfoDO> getUsersByMap(Map<String, Object> map) throws DAOException;
	public UserInfoDO queryUserByName(String name);
	public int queryUserInfo(Map<String, Object> map);
	/**
	 * 添加用户
	 * @param infoDO
	 * @return
	 */
	public int addUserInfo(UserInfoDO infoDO);
	/**
	 * 添加经销商用户
	 * @param infoDO
	 * @return
	 */
	public UserInfoDO addDealerUserInfo(UserInfoDO infoDO);
	
	public int addUserMenu(Map<String, Object> map);
	public int addDealerUserMenu(Map<String, Object> map);
	public int updateUser(Map<String, Object> map);
	public int delUserInfo(Map<String, Object> map);
	public int delUserMenu(Map<String, Object> map);
	public List<UserInfoDO> getUsersByRoleName(String[] roleNameArray);
	
	/**
	 * 
	 * @Title: queryByTrueName 
	 * @Description:通过真实姓名查询用户信息
	 * @param trueName
	 * @return
	 */
	public List<UserInfoDO> queryByTrueName(String trueName);
}
