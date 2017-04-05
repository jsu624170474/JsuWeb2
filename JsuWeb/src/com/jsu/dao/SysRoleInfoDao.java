package com.jsu.dao;

import com.jsu.entity.SysRoleInfoDO;

public interface SysRoleInfoDao {
    int deleteByPrimaryKey(String roleId);

    int insert(SysRoleInfoDO record);

    int insertSelective(SysRoleInfoDO record);

    SysRoleInfoDO selectByPrimaryKey(String roleId);

    int updateByPrimaryKeySelective(SysRoleInfoDO record);

    int updateByPrimaryKey(SysRoleInfoDO record);
}