package com.yqjr.service;

import com.yqjr.entity.PermInfoDO;

import java.util.List;

public interface PermInfoService {
	public  List<PermInfoDO> queryPermInfo(int user_id);
}
