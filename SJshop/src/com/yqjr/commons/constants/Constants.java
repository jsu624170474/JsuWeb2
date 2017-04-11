package com.yqjr.commons.constants;

/** 
 * Description
 * @author  Robin
 * @version V1.0 
 * @Company: yqjr.com.cn
 * @Copyright: Copyright (c) 2014
 **/
public class Constants {
	
	/** 公共状态 */
	public static final String STATUS_SUCC = "S";
	public static final String STATUS_FAIL = "F";
	
	
	/** 配置 - 上传文件路径 */
	public static final String FILE_UPLOAD_PATH = "file_upload_path";
	
	/**数字0、1、2*/
	public static final Integer INTEGER_ZERO = 0;
	public static final Integer INTEGER_ONE = 1;
	public static final Integer INTEGER_TWO = 2;
	
	/** 默认主键名称 */
	public final static String KEY_NAME = "PID";
	
	/** 系统日志 - 类型 */
	public static final String SYSLOG_TYPE_LOGIN = "10";	// 登录
	public static final String SYSLOG_TYPE_PWD = "20";		// 修改密码
	public static final String SYSLOG_TYPE_CHGTELPARAM = "21";		// 修改电话详单参数
	public static final String SYSLOG_TYPE_CHGBLACKTEL = "22";		// 修改电话黑名单
	public static final String SYSLOG_TYPE_ADDBLACKTEL = "32";		// 新增电话黑名单
	
	/** 系统日志 - 状态 */
	public static final String SYSLOG_STATUS_SUCCESS = "S";	// 成功
	public static final String SYSLOG_STATUS_FAIL = "F";		// 失败
}
