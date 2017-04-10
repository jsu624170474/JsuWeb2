package com.jsu.dao;

import java.util.List;

import com.jsu.entity.CfgGoodsTypeDO;

public interface CfgGoodsTypeDao {
    int deleteByPrimaryKey(Integer id);

    int insert(CfgGoodsTypeDO record);

    CfgGoodsTypeDO selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CfgGoodsTypeDO record);

    List<CfgGoodsTypeDO> selectList(CfgGoodsTypeDO cfgGoodsType);
}