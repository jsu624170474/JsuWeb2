package com.jsu.dao;

import java.util.List;

import com.jsu.entity.SysMenuInfoDO;
import com.jsu.entity.SysUserMenuDO;

public interface SysUserMenuDao {
    int deleteByPrimaryKey(SysUserMenuDO key);

    int insert(SysUserMenuDO record);

    SysUserMenuDO selectByPrimaryKey(SysUserMenuDO key);

    /**
     * 获取指定用户权限内的菜单
     * @param userId
     * @return
     */
    List<SysMenuInfoDO> listMenuByUserid(int userId);
}