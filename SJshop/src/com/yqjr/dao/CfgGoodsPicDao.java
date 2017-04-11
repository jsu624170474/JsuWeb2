package com.yqjr.dao;

import java.util.List;

import com.yqjr.entity.CfgGoodsPicDO;

public interface CfgGoodsPicDao {
    int deleteByPrimaryKey(Integer id);
    
    int deleteByGoodsid(Integer goodsId);

    int insert(CfgGoodsPicDO record);

    CfgGoodsPicDO selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CfgGoodsPicDO record);

    int updateByPrimaryKey(CfgGoodsPicDO record);
    
    List<CfgGoodsPicDO> selectList(CfgGoodsPicDO cfgGoodsPicDo);
}