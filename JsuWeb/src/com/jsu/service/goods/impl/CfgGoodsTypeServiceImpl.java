package com.jsu.service.goods.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jsu.dao.CfgGoodsTypeDao;
import com.jsu.entity.CfgGoodsTypeDO;
import com.jsu.service.goods.CfgGoodsTypeService;

@Service("CfgGoodsTypeService")
public class CfgGoodsTypeServiceImpl implements CfgGoodsTypeService {

	@Autowired
	CfgGoodsTypeDao cfgGoodsTypeDao;
	
	@Override
	public int save(CfgGoodsTypeDO cfgGoodsTypeDO) {
		
		if(cfgGoodsTypeDO.getId()==null){ // 新增
			cfgGoodsTypeDao.insert(cfgGoodsTypeDO);
		}else{ // 修改
			cfgGoodsTypeDao.updateByPrimaryKeySelective(cfgGoodsTypeDO);
		}
		return cfgGoodsTypeDO.getId();
	}

	
	
}
