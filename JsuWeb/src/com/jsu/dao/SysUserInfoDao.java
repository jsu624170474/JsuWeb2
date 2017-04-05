package com.jsu.dao;

import java.util.List;

import com.jsu.entity.SysUserInfoDO;

public interface SysUserInfoDao {
    int deleteByPrimaryKey(Integer userId);

    int insert(SysUserInfoDO record);

    int insertSelective(SysUserInfoDO record);

    int updateByPrimaryKeySelective(SysUserInfoDO record);

    SysUserInfoDO selectByPrimaryKey(Integer userId);

    List<SysUserInfoDO> selectSelective(SysUserInfoDO sysUserInfoDO);
}