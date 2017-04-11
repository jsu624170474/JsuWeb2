package com.yqjr.dao;

import com.yqjr.entity.PermInfoDO;

import java.util.List;

public interface PermInfoDao {
	public List<PermInfoDO> queryPermInfo(int user_id);

	public List<PermInfoDO> getPermInfo();
}
