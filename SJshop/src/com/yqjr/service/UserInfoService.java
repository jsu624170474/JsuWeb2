package com.yqjr.service;

import com.yqjr.commons.exception.ServiceException;
import com.yqjr.entity.UserInfoDO;

import java.util.List;
import java.util.Map;

public interface UserInfoService {
	public List<UserInfoDO> getUsers(int userId) throws ServiceException;
	public List<UserInfoDO> getUsers(Map<String, Object> map) throws ServiceException;

	/**
	 * 根据姓名查询
	 * 
	 * @param name
	 * @return
	 */
	public UserInfoDO queryUserInfo(String name);
	
	/**
	 * 根据ID和密码查询是否存在用户 返回用户的数量
	 * @return
	 */
	public UserInfoDO getUserInfoById(int userId);
	
	/**
	 * 根据ID和密码查询是否存在用户 返回用户的数量
	 * @return
	 */
	public int queryUserInfo(String userId, String password);

	/**
	 * 更新用户
	 * 
	 * @param userDO
	 * @return
	 */
	public int updateUser(UserInfoDO userDO); // 更新用户
	public int updateUser2(Map<String, Object> map); // 更新用户
	
	/**
	 * 添加用户
	 * @param infoDO
	 * @return
	 */
	public UserInfoDO addUserInfo(UserInfoDO infoDO);
	/**
	 * 添加用户关联的菜单列表
	 * @param map
	 * @return
	 */
	public int addUserMenu(Map<String, Object> map);
	
	/**
	 * 删除用户
	 * @param map
	 * @return
	 */
	public int delUserInfo(Map<String, Object> map);
	
	public List<UserInfoDO> getUsersByRoleName(String[] roleNameArray);
	
	/**
	 * 获取首页上的统计图表
	 * 
	 */
	public Map<String, Object> queryChartCount(Map<String, Object> map);
	
	/**
	 * 
	 * @Title: queryAuditQuence 
	 * @Description:根据用户Id查询用户的审核级别
	 * @param userId
	 * @return
	 */
	public List<Integer> queryAuditQuence(Integer userId);
}
