package com.jsu.service.goods;

import com.jsu.entity.CfgGoodsDO;

public interface CfgGoodsService {

	/**
	 * 保存（新增/更新）商品信息
	 * @param cfgGoodsDO
	 */
	public String save(CfgGoodsDO cfgGoodsDO);
	
	/**
	 * 更新商品状态
	 * @param id	商品编号
	 * @param flag	状态
	 * @return
	 */
	public boolean updateFlag(String id, String flag);
}
