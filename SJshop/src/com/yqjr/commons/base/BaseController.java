package com.yqjr.commons.base;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import net.sf.ehcache.CacheManager;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.yqjr.commons.constants.SessionConstants;
import com.yqjr.commons.helper.SpringContextHolder;
import com.yqjr.commons.util.DateUtil;
import com.yqjr.commons.util.Transfer;
import com.yqjr.entity.MenuInfoDO;
import com.yqjr.entity.SysLogDO;
import com.yqjr.entity.UserInfoDO;
import com.yqjr.service.MenuInfoService;
import com.yqjr.service.SysLogService;

/**
 * Description: base Controller
 * 
 * @author Robin
 * @version V1.0
 * @createDateTime 2014-10-28
 * 
 */
public class BaseController extends GenericService {
	@Autowired
	private MenuInfoService menuInfoService;
	@Autowired
	public Transfer transfer;
	@Autowired
	private HttpServletRequest request;
	
	@Resource
	private SysLogService sysLogService; 

	public CacheManager cacheManager = CacheManager.getInstance(); // 缓存
	public List<MenuInfoDO> list = null;
	public String BASE_REDIRECT_MARK="redirect:";
 
//	 // 菜单获取缓存
//	 Cache cache=cacheManager.getCache("mycache");
//	 Element element=cache.get("menulist");
	public void setSuccessMsg(String successMsg){
		this.getRequest().getSession().setAttribute("successMsg", successMsg);
	}
	public void setFailMsg(String failMsg){
		this.getRequest().getSession().setAttribute("failMsg", failMsg);
	}
	/**
	 * 获取session 用户信息
	 * 
	 * @return
	 */
	public UserInfoDO getSessionUser() {
		return (UserInfoDO) SecurityUtils.getSubject().getSession()
				.getAttribute(SessionConstants.CURRENT_USER);
	}
	public ServletContext getServletContext(){
		return SpringContextHolder.getServletContext();
	}
	
	public HttpServletRequest getRequest(){
		return	 ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
	}
	
	//获取用户真实ip地址
	public String getIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("X-Real-IP");
		if (null != ip && !"".equals(ip.trim()) && !"unknown".equalsIgnoreCase(ip)) {
			return ip;
		}
		ip = request.getHeader("X-Forwarded-For");
		if (null != ip && !"".equals(ip.trim()) && !"unknown".equalsIgnoreCase(ip)) {
			// get first ip from proxy ip
			int index = ip.indexOf(',');
			if (index != -1) {
				return ip.substring(0, index);
			} else {
				return ip;
			}
		}

		return request.getRemoteAddr();
	}
	
	
	/**
	 * 系统日志记录
	 * @param operType	操作类型
	 * @param context	操作内容
	 * @param status	状态
	 */
	public void WriteSyslog(String operType, String context, String operStatus){
		try {
			String user = getSessionUser().getUserName();
			SysLogDO syslog=new SysLogDO();
			String ip = getIpAddr(request);
			
			syslog.setOperUser(user);
			syslog.setOperIp(ip);
			syslog.setOperType(operType);
			syslog.setOperName(sysLogService.getOperName(operType));	// 操作类型名称
			syslog.setOperDt(DateUtil.getDate("yyyy-MM-dd HH:mm:ss"));
			syslog.setOperStatus(operStatus);
			syslog.setOperContent(context);
			sysLogService.insertSyslog(syslog);
		} catch (Exception e) {
			logger.error("写入系统日志表异常："+e.getMessage());
			e.printStackTrace();
		}
	}
}
