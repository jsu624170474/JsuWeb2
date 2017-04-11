package com.yqjr.commons.exception;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.yqjr.commons.enums.ExceptionEnums;
import com.yqjr.commons.enums.impl.MSiteExceptionEnum;

public class MSiteException extends Exception{

	/**
	 * 
	 */
	private static final long serialVersionUID = -19462950480213001L;
	protected Logger logger = LoggerFactory.getLogger(this.getClass());
	private MSiteExceptionEnum mSiteExceptionEnum;
	public MSiteException(){
        this.mSiteExceptionEnum = MSiteExceptionEnum.UNKNOW_ERROR;  
		logger.error("M Site Have Exception:"+mSiteExceptionEnum.getMsg());
	}
	public MSiteException(MSiteExceptionEnum mSiteExceptionEnum){
        this.mSiteExceptionEnum = mSiteExceptionEnum;  
		logger.error("M Site Have Exception:"+mSiteExceptionEnum.getMsg());
	}
	public ExceptionEnums getExceptionEnums() {
		return mSiteExceptionEnum;
	}
}
