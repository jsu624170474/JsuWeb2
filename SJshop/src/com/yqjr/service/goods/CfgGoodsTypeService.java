package com.yqjr.service.goods;

import com.yqjr.entity.CfgGoodsTypeDO;

public interface CfgGoodsTypeService {

	/**
	 * 保存或修改商品类型对象
	 * @param cfgGoodsTypeDO
	 * @return
	 */
	public int save(CfgGoodsTypeDO cfgGoodsTypeDO);
}
