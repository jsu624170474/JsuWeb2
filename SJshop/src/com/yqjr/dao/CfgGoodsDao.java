package com.yqjr.dao;

import java.util.List;
import java.util.Map;

import com.yqjr.entity.CfgGoodsDO;

public interface CfgGoodsDao {
    int deleteByPrimaryKey(Integer id);
    
    int insert(CfgGoodsDO record);

    CfgGoodsDO selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CfgGoodsDO record);

    int updateByPrimaryKey(CfgGoodsDO record);
    
    /**
     * 商品列表
     * @param cfgGoodsDO
     * @return
     */
    public List<Map<String, String>> selectList(Map<String, String> paraMap); 
}