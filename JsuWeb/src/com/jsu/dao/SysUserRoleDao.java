package com.jsu.dao;

import com.jsu.entity.SysUserRoleDO;

public interface SysUserRoleDao {
    int deleteByPrimaryKey(SysUserRoleDO key);

    int insert(SysUserRoleDO record);

    int insertSelective(SysUserRoleDO record);

    SysUserRoleDO selectByPrimaryKey(SysUserRoleDO key);

    int updateByPrimaryKeySelective(SysUserRoleDO record);

    int updateByPrimaryKey(SysUserRoleDO record);
}