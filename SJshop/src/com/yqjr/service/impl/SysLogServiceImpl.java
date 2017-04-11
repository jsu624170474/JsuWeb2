package com.yqjr.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hy.commons.util.StringUtil;
import com.yqjr.commons.constants.Constants;
import com.yqjr.dao.SysLogDao;
import com.yqjr.entity.SysLogDO;
import com.yqjr.service.SysLogService;

@Service
public class SysLogServiceImpl implements SysLogService{
	@Autowired
	private SysLogDao syslogdao;
	

	@Override
	public List<SysLogDO> selectSysList(SysLogDO syslog) {
		// TODO Auto-generated method stub
		return syslogdao.selectBySelective(syslog);
	}

	@Override
	public int insertSyslog(SysLogDO syslog) {
		// TODO Auto-generated method stub
		return syslogdao.insert(syslog);
	}

	@Override
	public String getOperName(String operType) {
		
		if(StringUtil.isEmpty(operType)){
			return "";
		}else if(operType.equals(Constants.SYSLOG_TYPE_LOGIN)){
			return "系统登录";
		}else if(operType.equals(Constants.SYSLOG_TYPE_PWD)){
			return "修改密码";
		}else if(operType.equals(Constants.SYSLOG_TYPE_CHGTELPARAM)){
			return "修改电话详单参数";
		}else if(operType.equals(Constants.SYSLOG_TYPE_CHGBLACKTEL)){
			return "修改电话黑名单";
		}else if(operType.equals(Constants.SYSLOG_TYPE_ADDBLACKTEL)){
			return "新增电话黑名单";
		}
		
		return "";
	}

}
