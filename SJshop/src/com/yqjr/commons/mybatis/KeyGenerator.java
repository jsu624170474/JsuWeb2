/*
 * KeyGenerator.java
 * Copyright (c) 2011,融众网络技术有限公司(www.11186.com)
 * All rights reserved.
 * ---------------------------------------------------------------------
 * 2011-3-8 Created
 */
package com.yqjr.commons.mybatis;

/**
 * <p>
 * 流水号产生器
 * </p>
 * 
 * @author kinjoYang
 * @version 1.0 2011-3-8
 * @since 1.0
 */
public class KeyGenerator {

	private KeyGenerator() {
	}

	/**
	 * 同步产生流水号 默认的PID
	 * 
	 */
	public static long nextSeqNum() {
		return KeyInfo.getInstance().getKey();
	}

	/**
	 * 同步产生流水号
	 * 
	 * @param keyId
	 *            流水号ID
	 * @return long number 当前有效流水号
	 */
	public static long nextSeqNum(String keyName) {
		return KeyInfo.getInstance().getKey(keyName);
	}

}
