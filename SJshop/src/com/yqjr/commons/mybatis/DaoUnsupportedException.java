/*
 * DaoUnsupportedException.java
 * Copyright (c) 2011,融众网络技术有限公司(www.11186.com)
 * All rights reserved.
 * ---------------------------------------------------------------------
 * 2011-5-31 Created
 */
package com.yqjr.commons.mybatis;

import com.yqjr.commons.utils.exception.DataBaseAccessException;

/**
 * 数据库操作异常
 * 
 * @author kinjoYang
 * @version 1.0 2011-5-31
 * @since 1.0
 * @see com.rongzhong.core.exception.DataBaseAccessException
 */
public class DaoUnsupportedException extends DataBaseAccessException {

	private static final long serialVersionUID = 4928613476405775180L;

	public DaoUnsupportedException(String msg) {
		super(msg);
	}

	public DaoUnsupportedException() {
		super("this operation is not supported.");
	}

	public DaoUnsupportedException(Throwable cause) {
		super(cause);
	}
}
