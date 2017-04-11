/*
 * ExceptionDescriptor.java
 * Copyright (c) 2011,融众网络技术有限公司(www.11186.com)
 * All rights reserved.
 * ---------------------------------------------------------------------
 * 2011-3-8 Created
 */
package com.yqjr.commons.utils.exception;

/**
 * <p>
 * 异常描叙
 * </p>
 * 
 * @author kinjoYang
 * @version 1.0 2011-3-8
 * @since 1.0
 * 
 */
public final class ExceptionDescriptor {

	// default Exception
	public static final int Exception_DEF = -1;
	// SQLException
	public static final int Exception_SQL = 0;

	// IndexOutOfBandsException
	public static final int Exception_IOB = 1;

	// ClassCastException
	public static final int Exception_CCE = 2;

	// NoClassDefFoundException
	public static final int Exception_NCF = 3;

	// SeccurityException
	public static final int Exception_SEC = 4;

	// NullPointerException
	public static final int Exception_NPE = 5;

	// mongodb Exception
	public static final int Exception_MOG = 6;

}
