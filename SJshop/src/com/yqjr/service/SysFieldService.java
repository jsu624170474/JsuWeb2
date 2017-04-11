package com.yqjr.service;

import com.yqjr.entity.SysFieldInfoDO;

import java.util.List;

public interface SysFieldService {
	 public List<SysFieldInfoDO> queryFiled(String busiId, String fieldName);
}
