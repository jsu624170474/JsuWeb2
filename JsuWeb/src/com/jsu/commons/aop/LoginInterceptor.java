package com.jsu.commons.aop;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.jsu.commons.constants.Constants;
import com.jsu.commons.utils.ListUtil;
import com.jsu.commons.utils.SessionUtil;
import com.jsu.commons.utils.StringUtil;
import com.jsu.entity.SysMenuInfoDO;
import com.jsu.entity.SysUserInfoDO;

/**
 * 登录拦截
 * @author suian
 */
@Aspect
@Component("LoginInterceptor")
public class LoginInterceptor implements HandlerInterceptor{

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	
	/** 
     * Handler执行完成之后调用这个方法 
     */ 
	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {

	}

	/** 
     * Handler执行之后，ModelAndView返回之前调用这个方法 
     */  
	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {

	}

	/** 
     * Handler执行之前调用这个方法 
     */ 
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,  
            Object handler) throws Exception {

		//获取请求的URL  
        String url = request.getRequestURI();  
        //URL:login.jsp是公开的;这个demo是除了login.jsp是可以公开访问的，其它的URL都进行拦截控制  
        /*if(url.indexOf("backStage")>=0){  
            return true;  
        }*/
        
        //获取Session  
        HttpSession session = request.getSession();  
        SysUserInfoDO userInfoDo = (SysUserInfoDO)session.getAttribute(Constants.CURRENT_USER);  
        if(userInfoDo == null){
        	//不符合条件的，跳转到登录界面  
//          request.getRequestDispatcher("backStage/login/").forward(request, response);
        	response.sendRedirect(request.getContextPath()+"/backStage/login/");
  			return false;
        }
        
        /** 重置当前选择菜单 */
        resetMenuSel(url);
        
        return true;
	}
	
	
	/**
	 * 重置当前选择菜单
	 */
	private void resetMenuSel(String requestURI){
		
		HttpSession session = SessionUtil.getSession();
		@SuppressWarnings("unchecked")
		List<SysMenuInfoDO> currentUserMenu = (List<SysMenuInfoDO>) session.
				getAttribute(Constants.CURRENT_USER_MENU);
		
		if(ListUtil.isBlank(currentUserMenu)){
			return;
		}
		
		/** 设置默认选中菜单 */
		String curUserMenuSel1 = (String)session.getAttribute(Constants.CUR_USER_MENU_SEL_1);
		if(StringUtil.isBlank(curUserMenuSel1)){
			// 一级
			SysMenuInfoDO firstMenu = currentUserMenu.get(0);
			
			StringBuffer curMenuSelPathname = new StringBuffer(firstMenu.getMenuName());
			session.setAttribute(Constants.CUR_USER_MENU_SEL_1, firstMenu.getMenuId());
			
			// 二级
			if(StringUtil.isBlank(firstMenu.getLinkUrl()) && !ListUtil.isBlank(firstMenu.getSubMenuList())){
				session.setAttribute(Constants.CUR_USER_MENU_SEL_2, firstMenu.getSubMenuList().get(0).getMenuId());
				curMenuSelPathname.append(firstMenu.getSubMenuList().get(0).getMenuName());
			}
			
			// 设置当前菜单 全路径
			session.setAttribute(Constants.CUR_USER_MENU_SEL_PATHNAME, curMenuSelPathname);
			return ;
		}
		
		
		/** 重置选择菜单 */
		if(!StringUtil.isBlank(requestURI)){
			session.setAttribute(Constants.CUR_USER_MENU_SEL_1, "");
			session.setAttribute(Constants.CUR_USER_MENU_SEL_2, "");
			checkMenuActive(currentUserMenu, requestURI);
		}
	}
	
	/**
	 * 检索当前访问路径是否与菜单匹配
	 * @param menuList	菜单
	 * @param requestURI访问路径
	 * @return
	 */
	private boolean checkMenuActive(List<SysMenuInfoDO> menuList , String requestURI){
		
		for(SysMenuInfoDO menuInfo : menuList){
			if(StringUtil.isBlank(menuInfo.getLinkUrl())){
				checkMenuActive(menuInfo.getSubMenuList(), requestURI);
			}else{
				if(isMatching(menuInfo.getLinkUrl(), requestURI)){
					setMenuSel(menuInfo);
					return true;
				}
			}
		}	
		
		return false;
	}
	
	/**
	 * 菜单地址是否与请求地址匹配
	 * @param linkUrl
	 * @param requestURI
	 * @return
	 */
	private boolean isMatching(String linkUrl, String requestURI){
		
		if(!StringUtil.isBlank(requestURI) && requestURI.startsWith("/JsuWeb"+linkUrl)){
			return true;
		}
		
		return false;
	}
	
	
	/**
	 * 设置选中菜单
	 * @param menuInfo
	 */
	private void setMenuSel(SysMenuInfoDO menuInfo){
		HttpSession session = SessionUtil.getSession();
		
		if(menuInfo.getMenuOrder().length()==3){ // 一级
			session.setAttribute(Constants.CUR_USER_MENU_SEL_1, menuInfo.getMenuId());
			session.setAttribute(Constants.CUR_USER_MENU_SEL_PATHNAME, menuInfo.getMenuName());
		}else if(menuInfo.getMenuOrder().length()==6){ // 二级
			session.setAttribute(Constants.CUR_USER_MENU_SEL_2, menuInfo.getMenuId());
			
			@SuppressWarnings("unchecked")
			List<SysMenuInfoDO> currentUserMenu = (List<SysMenuInfoDO>) session.
					getAttribute(Constants.CURRENT_USER_MENU);
			
			for(SysMenuInfoDO menu : currentUserMenu){
				if(menuInfo.getMenuOrder().startsWith(menu.getMenuOrder())){
					session.setAttribute(Constants.CUR_USER_MENU_SEL_1, menu.getMenuId());
					session.setAttribute(Constants.CUR_USER_MENU_SEL_PATHNAME, menu.getMenuName()+" >> "+menuInfo.getMenuName());
					break;
				}
			}
		}
	}
}