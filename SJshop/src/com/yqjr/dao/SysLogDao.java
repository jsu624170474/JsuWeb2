package com.yqjr.dao;

import java.util.List;

import com.yqjr.entity.SysLogDO;

public interface SysLogDao {

	public int insert(SysLogDO record);

    public List<SysLogDO> selectBySelective(SysLogDO record);

}