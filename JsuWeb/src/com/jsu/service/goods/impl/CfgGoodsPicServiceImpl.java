package com.jsu.service.goods.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jsu.dao.CfgGoodsPicDao;
import com.jsu.entity.CfgGoodsPicDO;
import com.jsu.service.goods.CfgGoodsPicService;

@Service("CfgGoodsPicService")
public class CfgGoodsPicServiceImpl implements CfgGoodsPicService {

	@Autowired
	CfgGoodsPicDao cfgGoodsPicDao;
	
	@Override
	public String save(CfgGoodsPicDO cfgGoodsPicDO) {
		/*if(cfgGoodsPicDO.getId()==null){ // 新增
			cfgGoodsPicDO.setUpdatetime(DateUtil.getDate(DateUtil.YYYY_MM_DD_HHMMSS));
			cfgGoodsPicDao.insert(cfgGoodsPicDO);
		}else if(StringUtil.isBlank(cfgGoodsPicDO.getPicUrl())){ // 删除
			cfgGoodsPicDao.deleteByPrimaryKey(cfgGoodsPicDO.getId());
		}else{
			cfgGoodsPicDO.setUpdatetime(DateUtil.getDate(DateUtil.YYYY_MM_DD_HHMMSS));
			cfgGoodsPicDao.updateByPrimaryKey(cfgGoodsPicDO);
		}*/
		
		/** 查询原来是否存在 */
		CfgGoodsPicDO picSelect = new CfgGoodsPicDO(); 
		picSelect.setOrderSeq(cfgGoodsPicDO.getOrderSeq());
		picSelect.setGoodsId(cfgGoodsPicDO.getGoodsId());
		List<CfgGoodsPicDO> list = cfgGoodsPicDao.selectList(picSelect);
		if(list==null || list.size()==0){ // 不存在，则新增
			cfgGoodsPicDao.insert(cfgGoodsPicDO);
		}else{ // 更新
			cfgGoodsPicDO.setId(list.get(0).getId());
			cfgGoodsPicDao.updateByPrimaryKeySelective(cfgGoodsPicDO);
		}
		
		return cfgGoodsPicDO.getId().toString();
	}

}
