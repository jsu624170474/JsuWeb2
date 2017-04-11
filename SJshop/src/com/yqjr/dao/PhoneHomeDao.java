package com.yqjr.dao;

import java.util.List;
import java.util.Map;

/**
 * 手机H5前端首页
 * @author suian
 *
 */
public interface PhoneHomeDao {

	/**
	 * 促销商品清单
	 * @return
	 */
	public List<Map<String, Object>> selectSales();
	
	/**
	 * 推荐商品清单
	 * @return
	 */
	public List<Map<String, Object>> selectRecommend();
	
	/**
	 * 热销商品清单
	 * @return
	 */
	public List<Map<String, Object>> selectHot();
}
