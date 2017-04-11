package com.yqjr.commons.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yqjr.dao.SysFieldDao;
import com.yqjr.entity.SysFieldInfoDO;

@Service
public class Transfer {
	private final static Map<String, HashMap<String, String>> valueMap = 
			new HashMap<String, HashMap<String, String>>();

	@Autowired
	private SysFieldDao sysFieldDao;
	
	@PostConstruct
	private void init(){
		List<SysFieldInfoDO> list = sysFieldDao.selectTransfer();
		SysFieldInfoDO field;
		for(int i=0; i<list.size(); i++){
			field = list.get(i);
			if(!valueMap.containsKey(field.getBusiId())){
				HashMap<String, String> map = new HashMap<String, String>();
				valueMap.put(field.getBusiId(), map);
			}
			valueMap.get(field.getBusiId()).put(field.getFieldName(), field.getFieldValue());
		}
	}
	
	public static String getValue(String colName, String key){
		return valueMap.get(colName).get(key);
	}
	
	public static HashMap<String, String> getAfield(String busiId){
		return valueMap.get(busiId);
	}
}
