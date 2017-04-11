/*
 * KeyInfo.java
 * Copyright (c) 2011,融众网络技术有限公司(www.11186.com)
 * All rights reserved.
 * ---------------------------------------------------------------------
 * 2011-3-8 Created
 */
package com.yqjr.commons.mybatis;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

import com.yqjr.commons.constants.Constants;
import com.yqjr.commons.spring.SpringContextHelper;

/**
 * <p>
 * 单例聚集模式的流水号产生器,延迟初始化,数据结构为堆栈 向数据库预定指定数量的流水号
 * 如果系统意外终止,没用完的流水号会浪费,但能预防如流水号重复等未知异常 使用需配置名为myBatisDao的数据库存储bean 并且包含 ibatis
 * 查询方法 pango.getGeneratorKeyValue 更新方法 pango.updateGeneratorKey
 * </p>
 * 
 * @author kinjoYang
 * @version 1.0 2011-3-8
 * @since 1.0
 */
public class KeyInfo {

	@SuppressWarnings("unchecked")
	private KeyInfo() {
		myBatisDao = (BaseDao<Map<String, Object>>) SpringContextHelper.getBean("myBatisDao");
	}

	private BaseDao<Map<String, Object>> myBatisDao;

	/** 流水号缓存对象 */
	private static Map<String, KeyStack> keymp = new ConcurrentHashMap<String, KeyStack>();// key的缓存

	private int keySize = 30;

	private final Lock lock = new ReentrantLock();

	static class SingletonHoder {
		static KeyInfo instance = new KeyInfo();
	}

	/** 返回当前对象实例,单例模式 */
	public static KeyInfo getInstance() {
		return SingletonHoder.instance;
	}

	/**
	 * 根据流水号ID返回流水号
	 * 
	 * @param key
	 *            流水号ID
	 * @return long 流水号
	 */
	public long getKey(String key) {
		try {
			lock.lock();
			if (keymp.containsKey(key)) {
				try {
					return keymp.get(key).pop();
				} catch (Exception e) {
					return this.reload(key);
				}
			} else {
				return this.reload(key);
			}
		} finally {
			lock.unlock();
		}
	}

	/**
	 * 返回系统默认流水号PID
	 * 
	 * @return long 当前有效的流水号
	 */
	public long getKey() {
		try {
			String key = Constants.KEY_NAME;
			lock.lock();
			if (keymp.containsKey(key)) {
				try {
					return keymp.get(key).pop();
				} catch (Exception e) {
					return this.reload(key);
				}
			} else {
				return this.reload(key);
			}
		} finally {
			lock.unlock();
		}
	}

	private long reload(String key) {
		if (this.loadFromDb(key))
			return this.getKey(key);
		return -1;
	}

	// 向数据库预定指定的序列号
	// synchronized
	private boolean loadFromDb(String keyName) {
		long dbValue = -1;
		try {
			Map<String, Object> res = myBatisDao.get("pango.getGeneratorKeyValue", keyName);
			try {
				if (res.get("KEY_VALUE") != null) {
					dbValue = Long.parseLong(res.get("KEY_VALUE").toString());
					putKey(keyName, dbValue);
				}
			} catch (Exception e) {
				this.clear(keyName);
				return Boolean.FALSE;
			}
			Map<String, Object> up = new HashMap<String, Object>();
			up.put("keyValue", dbValue + keySize);
			up.put("keyName", keyName);
			myBatisDao.update("pango.updateGeneratorKey", up);
		} catch (Exception e) {
			return Boolean.FALSE;
		}
		return Boolean.TRUE;
	}

	private void putKey(String name, long value) throws Exception {
		try {
			KeyStack k;
			lock.lock();
			if (keymp.containsKey(name)) {
				k = keymp.get(name);
			} else {
				k = new KeyStack();
			}
			int factSize = keySize;
			for (long i = 0; i < factSize; i++) {
				long cur = value + i;
				k.push(cur);
			}
			keymp.put(name.toUpperCase(), k);
		} catch (Exception e) {
			throw e;
		} finally {
			lock.unlock();
		}
	}

	private void clear(String name) {
		try {
			lock.lock();
			if (keymp.containsKey(name))
				keymp.remove(name);
		} finally {
			lock.unlock();
		}
	}

	// inner class
	class KeyStack {

		// private List<String> l = new CopyOnWriteArrayList<String>();
		private List<Long> l = new ArrayList<Long>();

		private byte[] ol = new byte[0];

		public void push(Long s) {
			l.add(s);
		}

		public Long pop() throws Exception {
			if (l.isEmpty()) {
				throw new Exception("there is no key left...");
			}
			Long r;
			synchronized (ol) {
				r = l.get(0);
				l.remove(0);
			}
			return r;
		}
	}
}
