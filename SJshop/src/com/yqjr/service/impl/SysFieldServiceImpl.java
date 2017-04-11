package com.yqjr.service.impl;

import com.yqjr.commons.base.BaseService;
import com.yqjr.dao.SysFieldDao;
import com.yqjr.entity.SysFieldInfoDO;
import com.yqjr.service.SysFieldService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("sysFieldService")
public class SysFieldServiceImpl extends BaseService implements SysFieldService {
	@Autowired
	SysFieldDao sysFieldDao;

	@Override
	public List<SysFieldInfoDO> queryFiled(String busiId, String fieldName) {
		// TODO Auto-generated method stub
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("busiId",busiId);
		map.put("fieldName", fieldName);
		return sysFieldDao.queryFiled(map);
	}
}
