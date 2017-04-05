package com.jsu.dao;

import com.jsu.entity.SysMenuInfoDO;

public interface SysMenuInfoDao {
    int deleteByPrimaryKey(String menuId);

    int insert(SysMenuInfoDO record);

    int insertSelective(SysMenuInfoDO record);

    SysMenuInfoDO selectByPrimaryKey(String menuId);

    int updateByPrimaryKeySelective(SysMenuInfoDO record);

    int updateByPrimaryKey(SysMenuInfoDO record);
}