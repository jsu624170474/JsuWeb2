package com.yqjr.service.impl;

import com.yqjr.dao.PermInfoDao;
import com.yqjr.entity.PermInfoDO;
import com.yqjr.service.PermInfoService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("permInfoService")
public class PermInfoServiceImpl implements PermInfoService {
	@Autowired
	PermInfoDao permInfoDao;

	@Override
	public List<PermInfoDO> queryPermInfo(int user_id) {
		// TODO Auto-generated method stub
		return permInfoDao.queryPermInfo(user_id);
	}

}
