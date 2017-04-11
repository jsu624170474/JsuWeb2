package com.yqjr.controller.sys;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yqjr.commons.base.BaseController;
import com.yqjr.commons.constants.Constants;
import com.yqjr.commons.util.DateUtil;
import com.yqjr.entity.UserInfoDO;
import com.yqjr.service.HomePageService;
import com.yqjr.service.MenuInfoService;
import com.yqjr.service.UserInfoService;

/**
 * Description
 * 
 * @author Robin
 * @version V1.0
 * @createDateTime：2014-10-30 11:35:26
 * @Company:
 * @Copyright: Copyright (c) 2014
 **/
@Controller
public class MainController extends BaseController {
	@Autowired
    MenuInfoService menuInfoService;
	@Autowired
	private UserInfoService userInfoService;
	@Autowired
	private HomePageService homePageService; 
	int logincode = 0;

	@RequestMapping(value = "main", method = RequestMethod.GET)
	public ModelAndView main2(HttpServletRequest request) {
		logger.info("test logger");
		if (SecurityUtils.getSubject().isAuthenticated()) {
			return new ModelAndView("index");
		}
		return new ModelAndView("login");
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public ModelAndView login(HttpServletRequest request,
			@RequestParam String username, @RequestParam String password) {
		UsernamePasswordToken token = new UsernamePasswordToken(username,
				password);
		token.setHost(request.getRemoteHost());
		token.setRememberMe(false);
		// shiro 登录
		Subject subject = SecurityUtils.getSubject();
		try {
			// 在调用了login方法后,SecurityManager会收到AuthenticationToken,并将其发送给已配置的Realm执行必须的认证检查
			// 每个Realm都能在必要时对提交的AuthenticationTokens作出反应
			// 所以这一步在调用login(token)方法时,它会走到ShiroRealm.doGetAuthenticationInfo()方法中,具体验证方式详见此方法
			logger.info("对用户[" + username + "]进行登录验证..验证开始");
			subject.login(token);
			request.setAttribute("successMsg", "登录成功");

			// 更新登录时间
			UserInfoDO infoDO= userInfoService.queryUserInfo(username);
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("userId", infoDO.getUserId());
			map.put("loginTime", new Date());
			userInfoService.updateUser2(map);

			super.WriteSyslog(Constants.SYSLOG_TYPE_LOGIN, "", Constants.SYSLOG_STATUS_SUCCESS);
			
			logger.info("对用户[" + username + "]进行登录验证..验证通过");
		} catch (UnknownAccountException uae) {
			logger.info("对用户[" + username + "]进行登录验证..验证未通过,未知账户");
			request.getSession().setAttribute("message_login", "用户不存在或密码错误");
			return new ModelAndView(BASE_REDIRECT_MARK + "/");
		} catch (IncorrectCredentialsException ice) {
			logger.info("对用户[" + username + "]进行登录验证..验证未通过,错误的凭证");
			request.getSession().setAttribute("message_login", "密码不正确");
			return new ModelAndView(BASE_REDIRECT_MARK + "/");
		} catch (LockedAccountException lae) {
			logger.info("对用户[" + username + "]进行登录验证..验证未通过,账户已锁定");
			request.getSession().setAttribute("message_login", "账户已锁定");
			return new ModelAndView(BASE_REDIRECT_MARK + "/");
		} catch (ExcessiveAttemptsException eae) {
			logger.info("对用户[" + username + "]进行登录验证..验证未通过,错误次数过多");
			request.getSession().setAttribute("message_login", "用户名或密码错误次数过多");
			return new ModelAndView(BASE_REDIRECT_MARK + "/");
		} catch (AuthenticationException ae) {
			// 通过处理Shiro的运行时AuthenticationException就可以控制用户登录失败或密码错误时的情景
			logger.info("对用户[" + username + "]进行登录验证..验证未通过,堆栈轨迹如下");
			request.getSession().setAttribute("message_login", "用户名或密码不正确");
			return new ModelAndView(BASE_REDIRECT_MARK + "/");
		}
		// Map<String, Object> map = new HashMap<String, Object>();
		return new ModelAndView(BASE_REDIRECT_MARK + "/" + "homePage");
	}
	
	
	/**
	 * 首页
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "homePage", method = RequestMethod.GET)
	public ModelAndView toHomePage(HttpServletRequest request, HttpServletResponse response){
		ModelAndView model = new ModelAndView("index");
		
		// 当天日期
		String today = DateUtil.getDate(DateUtil.YYYY_MM_DD);
//		today = "2016-11-16";
		
		/** 当天各业务量通过情况统计 */
		Map<String, String> todayResultMap = new HashMap<String, String>();
		todayResultMap = homePageService.getResultStat(today);
		model.addObject("todayResultMap", todayResultMap);
		
		/** 当天各环节业务量统计 */
		Map<String, String> todayStatusMap = new HashMap<String, String>();
		todayStatusMap = homePageService.getStatusStat(today);
		model.addObject("todayStatusMap", todayStatusMap);
		
		/** 近7天每天业务量统计 */
		
		
		/** 近7天通过情况 */
		
		return model;
	}
	
	
	@RequestMapping(value = "workbench", method = RequestMethod.GET)
	public ModelAndView workbench(HttpServletRequest request,HttpServletResponse response) {
	
		return new ModelAndView("workbench/welcome");
		
	}
		
}