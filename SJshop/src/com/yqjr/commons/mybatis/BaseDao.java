/*
 * MyBatisDaoImpl.java
 * Copyright (c) 2011,融众网络技术有限公司(www.11186.com)
 * All rights reserved.
 * ---------------------------------------------------------------------
 * 2011-3-9 Created
 */
package com.yqjr.commons.mybatis;

import java.io.Serializable;
import java.sql.Connection;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.yqjr.commons.utils.Page;
import com.yqjr.commons.utils.exception.DataBaseAccessException;

/**
 * MyBatis的Dao中转代理类
 * 
 * @author kinjoYang
 * @version 1.0 2011-3-9
 * @since 1.0
 */
public class BaseDao<T> extends SqlSessionDaoSupport {

	private static final String COUNT = "_Count";

	/**
	 * 
	 * @param key
	 * 
	 * @param entity
	 */
	public int save(String key, T entity) throws DataBaseAccessException {
		try {
			return getSqlSession().insert(key, entity);
		} catch (Exception e) {
			throw new DataBaseAccessException(getClass().getName() + " save exception:", e);
		}
	}

	/**
	 * 
	 *
	 * @param key
	 * 
	 * @param entity
	 */
	public int save(String key, List<T> entity) throws DataBaseAccessException {
		try {
			return getSqlSession().insert(key, entity);
		} catch (Exception e) {
			throw new DataBaseAccessException(getClass().getName() + " save exception:", e);
		}
	}

	/**
	 * 
	 * @param key
	 * 
	 * @param entity
	 */
	public int update(String key, Object entity) throws DataBaseAccessException {
		try {
			return getSqlSession().update(key, entity);
		} catch (Exception e) {
			throw new DataBaseAccessException(getClass().getName() + " update exception:", e);
		}
	}

	public int update(String key, Map<Object, Object> entity) throws DataBaseAccessException {
		try {
			return getSqlSession().update(key, entity);
		} catch (Exception e) {
			throw new DataBaseAccessException(getClass().getName() + " update exception:", e);
		}
	}

	/**
	 * 
	 * @param key
	 * 
	 * @param id
	 */
	public int delete(String key, Serializable id) throws DataBaseAccessException {
		try {
			return getSqlSession().delete(key, id);
		} catch (Exception e) {
			throw new DataBaseAccessException(getClass().getName() + " delete exception:", e);
		}
	}

	public int delete(String key, Object entity) throws DataBaseAccessException {
		try {
			return getSqlSession().delete(key, entity);
		} catch (Exception e) {
			throw new DataBaseAccessException(getClass().getName() + " delete exception:", e);
		}
	}

	/**
	 * @param key
	 * 
	 * @return List<T>
	 */
	@SuppressWarnings("unchecked")
	public List<T> getAll(String key) {
		try {
			return getSqlSession().selectList(key);
		} catch (Exception e) {
			logger.error(getClass().getName() + " getAll exception and key is" + key, e);
			return null;
		}
	}

	/**
	 * @param key
	 * 
	 * @param params
	 * 
	 * @return T
	 */
	@SuppressWarnings("unchecked")
	public T get(String key, Object params) {
		try {
			return (T) getSqlSession().selectOne(key, params);
		} catch (Exception e) {
			logger.error(getClass().getName() + " get exception and key is" + key, e);
			return null;
		}
	}

	/**
	 *
	 * @param key
	 * 
	 * @param params
	 * 
	 * @return List<T>
	 */
	@SuppressWarnings("unchecked")
	public List<T> getList(String key, Object params) {
		try {
			return getSqlSession().selectList(key, params);
		} catch (Exception e) {
			logger.error(getClass().getName() + " getList exception and key is" + key, e);
			return null;
		}
	}

	/**
	 * @param key
	 * 
	 * @param params
	 * 
	 * @param page
	 * 
	 * @return Page<T>
	 */
	@SuppressWarnings("unchecked")
	public Page<T> getList(String key, Object params, Page<T> page) {
		try {
			Integer totalCounts = count(key + COUNT, params);
			// add 最大页数判断
			int pageM = maxPage(totalCounts, page.getPageSize(), page.getPageNo());
			if (pageM > 0) {
				page.setPageNo(pageM);
			}// end
			if (totalCounts != null && totalCounts.longValue() > 0) {
				List<T> list = getSqlSession().selectList(key, params,
						new RowBounds(page.getOffset(), page.getPageSize()));
				page.setResult(list);
				page.setTotalCount(totalCounts.longValue());
			}
			return page;
		} catch (Exception e) {
			logger.error(getClass().getName() + " getList exception and key is" + key, e);
			return null;
		}
	}

	/**
	 * 判断是否超出最大页数
	 * 
	 * @param tcount
	 *            总条数
	 * @param pageS
	 *            每页条数
	 * @param pNo
	 *            当前页
	 * @return int 大于0表示超出最大页数,返回最大页数
	 */
	private int maxPage(Integer tcount, Integer pageS, Integer pNo) {
		int maxPage = tcount % pageS == 0 ? tcount / pageS : tcount / pageS + 1;// 最大页数
		if (maxPage < pNo)
			return maxPage;
		else
			return -1;
	}

	/**
	 * @param key
	 * 
	 * @param params
	 * 
	 * @return Integer
	 */
	public Integer count(String key, Object params) {
		try {
			return (Integer) getSqlSession().selectOne(key, params);
		} catch (Exception e) {
			logger.error(getClass().getName() + " count exception and key is" + key, e);
			return Integer.valueOf(0);
		}
	}

	public Connection getConnection() {
		return getSqlSession().getConnection();
	}
}
