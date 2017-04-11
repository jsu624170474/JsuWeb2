package com.yqjr.service;

import java.util.List;

import com.yqjr.entity.SysLogDO;

public interface SysLogService {
	
	/**
     * 插入系统日志表
     * @param syslog
     * @return
     */
    public int insertSyslog(SysLogDO syslog);
    
    
	/**
	 * 根据指定条件查询系统日志记录
	 * @param syslog
	 * @return
	 */
    public List<SysLogDO> selectSysList(SysLogDO syslog);

    
    /**
     * 根据操作类型获取操作类型对应名称
     * @param operType	操作类型
     * @return
     */
    public String getOperName(String operType);
}
