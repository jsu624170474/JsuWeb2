package com.yqjr.service;

import com.yqjr.entity.GlobalConfigsDO;

import java.util.List;
import java.util.Map;

public interface GlobalConfigsService {
	
	/**
	 * 获取所有的配置项
	 * @return
	 */
	public List<GlobalConfigsDO> getAllGlobleConfigs();
	
	/**
	 * 根据ID获取配置想
	 * @param gcId
	 * @return
	 */
	public GlobalConfigsDO getAllGlobleConfigsById(int gcId);
	
	/**
	 * 根据ID修改配置项
	 * @param gc
	 * @return
	 */
	public int upGlobleConfigsById(GlobalConfigsDO gc);
	
	/**
	 * 获取所有配置项map
	 * @return
	 */
	public  Map<String,String> getGlobleConfigsMap();
	
	/**
	 * 根据条件查询配置项列表
	 * @param gc
	 * @return
	 */
	public List<GlobalConfigsDO> getGlobleConfigsList(GlobalConfigsDO gc);
}
