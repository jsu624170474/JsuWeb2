package com.jsu.dao;

import com.jsu.entity.SysSeqDO;

public interface SysSeqDao {
    int deleteByPrimaryKey(String name);

    int insert(SysSeqDO record);

    int insertSelective(SysSeqDO record);

    SysSeqDO selectByPrimaryKey(String name);

    int updateByPrimaryKeySelective(SysSeqDO record);

    int updateByPrimaryKey(SysSeqDO record);
}