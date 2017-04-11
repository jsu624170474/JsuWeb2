/*
 * MySQLDialect.java
 * Copyright (c) 2011,融众网络技术有限公司(www.11186.com)
 * All rights reserved.
 * ---------------------------------------------------------------------
 * 2011-3-9 Created
 */
package com.yqjr.commons.mybatis;


/**
 * Mysql方言
 * 
 * @author liuyi
 * @version 1.0 2011-3-9
 * @since 1.0
 */
public class MySQLDialect {

	public boolean supportsLimitOffset() {
		return true;
	}

	public boolean supportsLimit() {
		return true;
	}

	public String getLimitString(String sql, int offset, int limit) {
		return getLimitString(sql, offset, String.valueOf(offset), limit, String.valueOf(limit));
	}

	public String getLimitString(String sql, int offset, String offsetPlaceholder, int limit, String limitPlaceholder) {
		if (offset > 0) {
			return sql + " limit " + offsetPlaceholder + "," + limitPlaceholder;
		} else {
			return sql + " limit " + limitPlaceholder;
		}
	}

}
