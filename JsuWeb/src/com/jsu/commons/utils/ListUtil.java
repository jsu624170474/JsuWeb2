package com.jsu.commons.utils;

import java.util.List;

public class ListUtil {

	/**
	 * 该集合是否为空
	 * @param list
	 * @return
	 */
	public static boolean isBlank(List<?> list){
		if(list==null || list.size()<=0){
			return true;
		}
		
		return false;
	}
}
