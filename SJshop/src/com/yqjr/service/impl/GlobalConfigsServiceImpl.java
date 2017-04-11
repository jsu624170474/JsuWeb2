package com.yqjr.service.impl;

import com.yqjr.entity.GlobalConfigsDO;
import com.yqjr.service.GlobalConfigsService;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.yqjr.dao.GlobalConfigsDao;

@Service("GlobalConfigsService")
public class GlobalConfigsServiceImpl implements GlobalConfigsService {
	
	@Resource
	private GlobalConfigsDao GlobalConfigsDao;

	@Override
	public List<GlobalConfigsDO> getAllGlobleConfigs() {
		return GlobalConfigsDao.getAllGlobleConfigs();
	}

	@Override
	public GlobalConfigsDO getAllGlobleConfigsById(int gcId) {
		return GlobalConfigsDao.getAllGlobleConfigsById(gcId);
	}

	@Override
	public int upGlobleConfigsById(GlobalConfigsDO gc) {
		return GlobalConfigsDao.upGlobleConfigsById(gc);
	}

	@Override
	public Map<String, String> getGlobleConfigsMap() {
		List<GlobalConfigsDO> gcList = GlobalConfigsDao.getAllGlobleConfigs();
		Map<String, String> gcMap = new HashMap<String,String>();
		for(GlobalConfigsDO gc : gcList){
			gcMap.put(gc.getGcKey(), gc.getGcValue());
		}
		return gcMap;
	}

	@Override
	public List<GlobalConfigsDO> getGlobleConfigsList(GlobalConfigsDO gc) {
		return GlobalConfigsDao.getGlobleConfigsList(gc);
	}

}
