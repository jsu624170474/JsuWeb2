package com.yqjr.commons.shiro;

import com.yqjr.commons.constants.SessionConstants;
import com.yqjr.entity.MenuInfoDO;
import com.yqjr.entity.PermInfoDO;
import com.yqjr.entity.UserInfoDO;
import com.yqjr.service.MenuInfoService;
import com.yqjr.service.PermInfoService;
import com.yqjr.service.UserInfoService;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.ByteSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

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
public class ShiroRealm extends AuthorizingRealm {

	protected Logger logger = LoggerFactory.getLogger(ShiroRealm.class);
	@Autowired
	private UserInfoService userInfoService;
	@Autowired
	private PermInfoService permInfoService;

	@Autowired
	MenuInfoService menuInfoService;

	/**
	 * 为当前登录的Subject授予角色和权限
	 * 
	 * @see 经测试:本例中该方法的调用时机为需授权资源被访问时
	 * @see 经测试:并且每次访问需授权资源时都会执行该方法中的逻辑,这表明本例中默认并未启用AuthorizationCache
	 * @see 个人感觉若使用了Spring3
	 *      .1开始提供的ConcurrentMapCache支持,则可灵活决定是否启用AuthorizationCache
	 * @see 比如说这里从数据库获取权限信息时,先去访问Spring3.1提供的缓存,而不使用Shior提供的AuthorizationCache
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		// 获取当前登录的用户名,等价于(String)principals.fromRealm(this.getName()).iterator().next()
		String currentUserId = (String) super.getAvailablePrincipal(principals);
		List<String> roleList = new ArrayList<String>();
		List<String> permissionList = new ArrayList<String>();
		UserInfoDO user = userInfoService.queryUserInfo(currentUserId);
		if (null != user) {
			List<PermInfoDO> limitList = permInfoService.queryPermInfo(user.getUserId());
			for (PermInfoDO permInfoDO : limitList) {
				if (!StringUtils.isEmpty(permInfoDO.getPermString())) {
					permissionList.add(permInfoDO.getPermString());
				}
			}
		} else {
			throw new AuthorizationException();
		}
		// 为当前用户设置角色和权限
		SimpleAuthorizationInfo simpleAuthorInfo = new SimpleAuthorizationInfo();
		simpleAuthorInfo.addRoles(roleList);
		simpleAuthorInfo.addStringPermissions(permissionList);
		return simpleAuthorInfo;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken authcToken) throws AuthenticationException {
		// 获取基于用户名和密码的令牌
		// 实际上这个authcToken是从LoginController里面currentUser.login(token)传过来的
		UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
		UserInfoDO user = null;
		try {
			// 查询用户信息
			user = userInfoService.queryUserInfo(token.getUsername());
			if (user == null) {
				throw new UnknownAccountException();// 没找到帐号
			} else if (Boolean.TRUE.equals(false)) {
				throw new LockedAccountException(); // 帐号锁定
			}
			SimpleAuthenticationInfo authcInfo = new SimpleAuthenticationInfo(
					user.getUserName(), user.getPassword(), getName());
			authcInfo.setCredentialsSalt(ByteSource.Util.bytes(user.getSalt()));
			// 查询用户菜单
			List<MenuInfoDO> menuList = menuInfoService.queryMenu(user
					.getUserName());
			// user.setMenuList(getList(menuList, "ROOT")); // 默认加载root目录菜单
			if (menuList.size() > 0) {
				List<MenuInfoDO> list = getList(menuList, "ROOT");
//				this.setSession("superMenu", list.get(0));
				this.setSession("menuList", list);
			}
			this.setSession(SessionConstants.CURRENT_USER, user);
			return authcInfo;
		} catch (Exception e) {
			logger.error("Error message:" + e.getMessage());
		}
		// 没有返回登录用户名对应的SimpleAuthenticationInfo对象时,就会在LoginController中抛出UnknownAccountException异常
		return null;
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
				if (o1.getMenuOrder() < o2.getMenuOrder()) {
					return -1;
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
	 * @see 比如Controller,使用时直接用HttpSession.getAttribute(key)就可以取到
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

	@Override
	public void clearCachedAuthorizationInfo(PrincipalCollection principals) {
		super.clearCachedAuthorizationInfo(principals);
	}

	@Override
	public void clearCachedAuthenticationInfo(PrincipalCollection principals) {
		super.clearCachedAuthenticationInfo(principals);
	}

	@Override
	public void clearCache(PrincipalCollection principals) {
		super.clearCache(principals);
//		clearAllCache();
	}

	public void clearAllCachedAuthorizationInfo() {
		getAuthorizationCache().clear();
	}

	public void clearAllCachedAuthenticationInfo() {
		getAuthenticationCache().clear();
	}

	public void clearAllCache() {
		clearAllCachedAuthenticationInfo();
		clearAllCachedAuthorizationInfo();
	}
}
