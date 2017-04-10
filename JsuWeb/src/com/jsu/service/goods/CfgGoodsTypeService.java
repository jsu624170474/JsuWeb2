package com.jsu.service.goods;

import com.jsu.entity.CfgGoodsTypeDO;

public interface CfgGoodsTypeService {

	/**
	 * 保存或修改商品类型对象
	 * @param cfgGoodsTypeDO
	 * @return
	 */
	public int save(CfgGoodsTypeDO cfgGoodsTypeDO);
}
