package com.yqjr.service.goods.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yqjr.commons.util.DateUtil;
import com.yqjr.commons.util.UserUtils;
import com.yqjr.dao.CfgGoodsDao;
import com.yqjr.entity.CfgGoodsDO;
import com.yqjr.service.goods.CfgGoodsService;

@Service("CfgGoodsService")
public class CfgGoodsServiceImpl implements CfgGoodsService {

	@Autowired
	CfgGoodsDao cfgGoodsDao;
	
	@Override
	public String save(CfgGoodsDO cfgGoodsDO) {
		if(cfgGoodsDO.getId()==null){ // 新增
			cfgGoodsDO.setUpdateTime(DateUtil.getDate(DateUtil.YYYY_MM_DD_HHMMSS));
			cfgGoodsDO.setUpdateUser(UserUtils.getCurrentUser());
			cfgGoodsDao.insert(cfgGoodsDO);
		}else{ // 更新
			cfgGoodsDO.setUpdateTime(DateUtil.getDate(DateUtil.YYYY_MM_DD_HHMMSS));
			cfgGoodsDO.setUpdateUser(UserUtils.getCurrentUser());
			cfgGoodsDao.updateByPrimaryKeySelective(cfgGoodsDO);
		}
		
		return cfgGoodsDO.getId().toString();
	}

	@Override
	public boolean updateFlag(String id, String flag) {
		
		CfgGoodsDO cfgGoodsDO = new CfgGoodsDO();
		cfgGoodsDO.setId(Integer.parseInt(id));
		cfgGoodsDO.setFlag(flag);
		cfgGoodsDO.setUpdateTime(DateUtil.getDate(DateUtil.YYYY_MM_DD_HHMMSS));
		cfgGoodsDO.setUpdateUser(UserUtils.getCurrentUser());
		cfgGoodsDao.updateByPrimaryKeySelective(cfgGoodsDO);
		
		return true;
	}

}
