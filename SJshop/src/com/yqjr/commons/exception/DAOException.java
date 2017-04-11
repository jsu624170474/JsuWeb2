package com.yqjr.commons.exception;

import org.springframework.dao.DataAccessException;

/** 
 * Description
 * @author  Robin
 * @version V1.0 
 * @createDateTime：2014-10-30  11:35:26 
 **/
public class DAOException extends DataAccessException{
	public DAOException(String msg, Throwable cause) {
		super(msg, cause);
		// TODO Auto-generated constructor stub
	}

	private static final long serialVersionUID = -7523238768060633894L;

}
