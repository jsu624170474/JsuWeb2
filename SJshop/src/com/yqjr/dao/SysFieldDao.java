package com.yqjr.dao;

import com.yqjr.entity.SysFieldInfoDO;

import java.util.List;
import java.util.Map;

public interface SysFieldDao {
	public List<SysFieldInfoDO> queryFiled(Map<String, Object> map);
	public List<SysFieldInfoDO> getSysField(Map<String, String> args);
	public void switchSysField(SysFieldInfoDO sysFieldInfoDO);
	List<SysFieldInfoDO> selectTransfer();
}
