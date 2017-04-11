package com.yqjr.service.impl;

import com.yqjr.commons.base.BaseService;
import com.yqjr.commons.constants.SessionConstants;
import com.yqjr.commons.exception.ServiceException;
import com.yqjr.dao.PermInfoDao;
import com.yqjr.dao.RoleInfoDao;
import com.yqjr.dao.RolePermDao;
import com.yqjr.entity.PermInfoDO;
import com.yqjr.entity.RoleInfoDO;
import com.yqjr.entity.UserInfoDO;
import com.yqjr.service.RolePermService;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("rolePermService")
public class RolePermServiceImpl extends BaseService implements RolePermService {
	@Autowired
	private RoleInfoDao roleInfoDao;
	@Autowired
	private PermInfoDao permInfoDao;
	@Autowired
	private RolePermDao rolePermDao;
	
	@Override
	public List<Map<String, Object>> getRoleInfoList(Map<String,Object> map) throws ServiceException {
		// TODO Auto-generated method stub
		return roleInfoDao.getRoleInfoList(map);
	}

	@Override
	public RoleInfoDO addRoleInfo(RoleInfoDO roleInfo) throws ServiceException {
		// TODO Auto-generated method stub
		return roleInfoDao.addRoleInfo(roleInfo);
	}
	
	@Override
	public int updateRolePerm(RoleInfoDO roleInfo,String permIds) throws ServiceException {
		int count = 0 ;
		count = roleInfoDao.updateRoleInfo(roleInfo);
		if(count>0){
			roleInfoDao.delRolePerm(roleInfo.getRoleId().intValue());
			if(!permIds.equals("")){
				String [] permIdsArray = permIds.split(",");
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("roleId", roleInfo.getRoleId());
				UserInfoDO userInfoDO = (UserInfoDO) SecurityUtils.getSubject().getSession().getAttribute(SessionConstants.CURRENT_USER);
				map.put("creator", userInfoDO.getUserName());
				map.put("permIds", permIdsArray);
				count = roleInfoDao.addRolePerm(map);
			}
		}
		
		return count;
	}
	
	@Override
	public int addRolePerm(Map<String, Object> map) throws ServiceException {
		// TODO Auto-generated method stub
		return roleInfoDao.addRolePerm(map);
	}

	@Override
	public List<PermInfoDO> getPermList() throws ServiceException {
		// TODO Auto-generated method stub
		return permInfoDao.getPermInfo();
	}

	@Override
	public RoleInfoDO getRoleInfo(int roleId) throws ServiceException {
		// TODO Auto-generated method stub
		return roleInfoDao.getRoleInfo(roleId);
	}

	@Override
	public List<Map<String, Object>> getRolePerm(int roleId) throws ServiceException {
		// TODO Auto-generated method stub
		return rolePermDao.getRolePerm(roleId);
	}
	
	@Override
	public int delRolePerm(Map<String, Object> map) throws ServiceException {
		// TODO Auto-generated method stub
		return rolePermDao.delRolePerm(Integer.parseInt(map.get("roleId").toString()));
	}
}
