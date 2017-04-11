package com.yqjr.commons.shiro.filter;

import com.yqjr.commons.constants.SessionConstants;
import com.yqjr.entity.MenuInfoDO;
import com.yqjr.entity.UserInfoDO;
import com.yqjr.service.MenuInfoService;
import com.yqjr.service.UserInfoService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.PathMatchingFilter;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * Description
 * 
 * @author Robin
 * @version V1.0
 * @createDateTime：2014-10-30 11:35:26
 * @Company:
 * @Copyright: Copyright (c) 2014
 **/
public class SysUserFilter extends PathMatchingFilter {
	@Autowired
	private UserInfoService userInfoService;
	@Autowired
	MenuInfoService menuInfoService;

	@Override
	protected boolean onPreHandle(ServletRequest request,
			ServletResponse response, Object mappedValue) throws Exception {
		String userName = (String) SecurityUtils.getSubject().getPrincipal();
		UserInfoDO user = new UserInfoDO();
		Session session = SecurityUtils.getSubject().getSession();
		if (userName != null) {
			if (session.getAttribute(SessionConstants.CURRENT_USER) == null) {
				user = userInfoService.queryUserInfo(userName);
				session.setAttribute(SessionConstants.CURRENT_USER, user);
			}

			// 查询菜单
			if (session.getAttribute("menuList") == null
					|| ((List<MenuInfoDO>) session.getAttribute("menuList"))
							.size() <= 0) {
				List<MenuInfoDO> menuList = menuInfoService.queryMenu(userName);
				// 默认加载root目录菜单
				if(menuList.size()>0){
					List<MenuInfoDO> list= getList(menuList, "ROOT");
//					this.setSession("superMenu",list.get(0));
					this.setSession("menuList",list);
				}
			}
		}

		return true;

	}

	/**
	 * 处理用户菜单
	 * 
	 * @param tem
	 * @param str
	 * @return
	 */
	public List<MenuInfoDO> getList(List<MenuInfoDO> tem, String str) {
		List<MenuInfoDO> list = new ArrayList<MenuInfoDO>();
//		tem.get(0).setThisclass("active");
		for (int i = 0; i < tem.size(); i++) {
			MenuInfoDO do1 = tem.get(i);
			if (str.equals(do1.getSuperiorId())) {
				do1.setMelist(getList(tem, do1.getMenuId()));
				list.add(do1);
			}
			// 我的工作台 快捷菜单 2016-01-05
			if ("1".equals(str)) {
				if ("1".equals(do1.getPermValid())) {
					list.add(do1);
				}

			}
		}
		Collections.sort(list, new Comparator<MenuInfoDO>() {

			@Override
			public int compare(MenuInfoDO o1, MenuInfoDO o2) {
				// TODO Auto-generated method stub
				if (o1.getMenuOrder() > o2.getMenuOrder()) {
					return 1;
				} else {
					return 0;
				}
			}
		});
		return list;
	}
	/**
	 * 将一些数据放到ShiroSession中,以便于其它地方使用
	 * 
	 * 比如Controller,使用时直接用HttpSession.getAttribute(key)就可以取到
	 */
	private void setSession(Object key, Object value) {
		Subject currentUser = SecurityUtils.getSubject();
		if (null != currentUser) {
			Session session = currentUser.getSession();
			if (null != session) {
				session.setAttribute(key, value);
			}
		}
	}
}
