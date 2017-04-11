package com.yqjr.dao;

import java.util.List;
import java.util.Map;


public interface RolePermDao {
	List<Map<String, Object>> getRolePerm(int roleId);

	int delRolePerm(int roleId);

}
