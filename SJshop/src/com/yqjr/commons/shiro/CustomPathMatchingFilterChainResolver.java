package com.yqjr.commons.shiro;

import com.yqjr.commons.util.StringUtil;
import com.yqjr.entity.MenuInfoDO;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.web.filter.mgt.FilterChainManager;
import org.apache.shiro.web.filter.mgt.PathMatchingFilterChainResolver;

import javax.servlet.FilterChain;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import java.util.ArrayList;
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
public class CustomPathMatchingFilterChainResolver extends
		PathMatchingFilterChainResolver {
	private CustomDefaultFilterChainManager customDefaultFilterChainManager;

	public void setCustomDefaultFilterChainManager(
			CustomDefaultFilterChainManager customDefaultFilterChainManager) {
		this.customDefaultFilterChainManager = customDefaultFilterChainManager;
		setFilterChainManager(customDefaultFilterChainManager);
	}

	@SuppressWarnings("unchecked")
	public FilterChain getChain(ServletRequest request,
			ServletResponse response, FilterChain originalChain) {
		FilterChainManager filterChainManager = getFilterChainManager();
		if (!filterChainManager.hasChains()) {
			return null;
		}

		String requestURI = getPathWithinApplication(request);
		
		List<String> chainNames = new ArrayList<String>();
		// the 'chain names' in this implementation are actually path patterns
		// defined by the user. We just use them
		// as the chain name for the FilterChainManager's requirements
		for (String pathPattern : filterChainManager.getChainNames()) {
			// If the path does match, then pass on to the subclass
			// implementation for specific checks:
			if (pathMatches(pathPattern, requestURI)) {
				chainNames.add(pathPattern);
			}
		}
		List<MenuInfoDO> list=(List<MenuInfoDO>)SecurityUtils.getSubject().getSession().getAttribute("menuList");
		
		// 检查是否为重新选择菜单
		if(isNeed(list, requestURI)){
			// 重置active
			this.clearActive(list);
			// 匹配active
			boolean isActive = this.checkMenuActive(list, requestURI);
		}
		
		if (chainNames.size() == 0) {
			return null;
		}

		return customDefaultFilterChainManager.proxy(originalChain, chainNames);
	}

	
	/**
	 * 访问路径是否为菜单配置路径（如像新增或修改新弹出页面，无需重置菜单）
	 * @param menuList		权限内菜单列表
	 * @param requestURI	访问路径
	 * @return
	 */
	private boolean isNeed(List<MenuInfoDO> menuList , String requestURI){
		
		if(StringUtil.isBlank(requestURI)){
			return true;
		}
		
		if(menuList==null){
			return false;
		}
		
		for(MenuInfoDO menuInfo : menuList){
			List<MenuInfoDO> list = menuInfo.getMelist();
			if(list==null || list.size()==0){ // 叶节点
				if(requestURI.equals("/"+menuInfo.getLinkUrl())){
					return true;
				}
			}else{ // 不是叶节点，继续往下一层查找
				if(this.isNeed(list, requestURI)){
					return true;
				}
			}
		}	
		
		return false;
	}
	
	/**
	 * 检索当前访问路径是否与菜单匹配
	 * @param menuList	子菜单
	 * @param requestURI访问路径
	 * @return
	 */
	private boolean checkMenuActive(List<MenuInfoDO> menuList , String requestURI){
		
		if(menuList==null){
			return false;
		}
		
		for(MenuInfoDO menuInfo : menuList){
			List<MenuInfoDO> list = menuInfo.getMelist();
			if(list==null || list.size()==0){ // 叶节点
				if(!StringUtil.nullToString(requestURI).equals("") && requestURI.startsWith("/"+menuInfo.getLinkUrl())){
					menuInfo.setThisclass("active");
					return true;
				}else{
					menuInfo.setThisclass("");
				}
			}else{ // 不是叶节点，继续往下一层查找
				if(this.checkMenuActive(list, requestURI)){
					menuInfo.setThisclass("active");
					return true;
				}else{
					menuInfo.setThisclass("");
				}
			}
		}	
		
		return false;
	}
	
	private void clearActive(List<MenuInfoDO> menuList){
		if(menuList!=null){
			for(MenuInfoDO menuInfo : menuList){
				menuInfo.setThisclass("");
				List<MenuInfoDO> list = menuInfo.getMelist(); 
				if(list!=null && list.size()>0){
					this.clearActive(list);
				}
			}
		}
	}
}
