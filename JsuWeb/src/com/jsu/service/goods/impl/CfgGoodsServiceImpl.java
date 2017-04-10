package com.jsu.service.goods.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jsu.commons.utils.DateUtil;
import com.jsu.commons.utils.SessionUtil;
import com.jsu.dao.CfgGoodsDao;
import com.jsu.entity.CfgGoodsDO;
import com.jsu.service.goods.CfgGoodsService;

@Service("CfgGoodsService")
public class CfgGoodsServiceImpl implements CfgGoodsService {

	@Autowired
	CfgGoodsDao cfgGoodsDao;
	
	@Override
	public String save(CfgGoodsDO cfgGoodsDO) {
		if(cfgGoodsDO.getId()==null){ // 新增
			cfgGoodsDO.setUpdateTime(DateUtil.getDate(DateUtil.YYYY_MM_DD_HHMMSS));
			cfgGoodsDO.setUpdateUser(SessionUtil.getCurrnetUserId().toString());
			cfgGoodsDao.insert(cfgGoodsDO);
		}else{ // 更新
			cfgGoodsDO.setUpdateTime(DateUtil.getDate(DateUtil.YYYY_MM_DD_HHMMSS));
			cfgGoodsDO.setUpdateUser(SessionUtil.getCurrnetUserId().toString());
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
		cfgGoodsDO.setUpdateUser(SessionUtil.getCurrnetUserId().toString());
		cfgGoodsDao.updateByPrimaryKeySelective(cfgGoodsDO);
		
		return true;
	}

}
