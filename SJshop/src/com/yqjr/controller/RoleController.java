package com.yqjr.controller;


import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yqjr.commons.base.BaseController;
import com.yqjr.commons.exception.ServiceException;
import com.yqjr.entity.RoleInfoDO;
import com.yqjr.entity.UserInfoDO;
import com.yqjr.service.RolePermService;

@Controller
@RequestMapping("/role")
public class RoleController extends BaseController {
	@Autowired
	private RolePermService rolePermService;
	private RoleInfoDO roleInfo;
	/**
	 * toAddRole 添加角色的时候 获取权限列表
	 */
	@RequestMapping(value = "/toAddRole",method=RequestMethod.GET)
	public ModelAndView toAddRole(HttpServletRequest request, HttpServletResponse response) {
		logger.debug("get role info start");
		ModelAndView mav = new ModelAndView("role/addRole");
		/*try {
			List<PermInfoDO> list = rolePermService.getPermList();
			mav.addObject("list", list);
		} catch (ServiceException e) {
			e.printStackTrace();
		}*/
		return mav;
	}
	/**
	 * doAddRole 添加角色
	 */
	@RequestMapping(value = "/doAddRole",method=RequestMethod.POST)
	public ModelAndView doAddRole(HttpServletRequest request, HttpServletResponse response) throws ServiceException {
		ModelAndView modelAndView = new ModelAndView("redirect:../sys/role");
//		String path = request.getContextPath();
//		String basePath = request.getScheme() + "://"
//			+ request.getServerName() + ":" + request.getServerPort()
//			+ path + "/";
		String roleName = request.getParameter("roleName");
		String roleDisc = request.getParameter("roleDisc");
		UserInfoDO userInfoDO = getSessionUser();
		roleInfo = new RoleInfoDO();
		roleInfo.setRoleName(roleName);
		roleInfo.setCreator(userInfoDO.getUserName());
		if(StringUtils.isNotBlank(roleDisc)){
			roleInfo.setRoleDisc(roleDisc);
		}
		roleInfo =  rolePermService.addRoleInfo(roleInfo);
		this.setSuccessMsg("添加成功！");
		/*if(roleInfo!=null){
			String [] permIds= request.getParameterValues("permId");
			if(permIds==null){
				return new ModelAndView("redirect:"+basePath+"sys/role");
			}
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("roleId",roleInfo.getRoleId());
			map.put("auditSequence", auditSequence);
			map.put("creator",userInfoDO.getUser_name());
			rolePermService.addRolePerm(map);
			
			return new ModelAndView("redirect:"+basePath+"sys/role");
		}*/
		return modelAndView;
	}
	/**
	 * toUpdateRole 获取当前存在的权限或者获取当前需要修改的角色的一些信息
	 */
	@RequestMapping(value = "/toUpdateRole",method=RequestMethod.GET)
	public ModelAndView toUpdateRole(HttpServletRequest request, HttpServletResponse response) {
		logger.debug("get role info start");
		ModelAndView mav = new ModelAndView("sys/role/updateRole");
		try {
			int roleId = Integer.parseInt(request.getParameter("roleId"));//获取角色的Id
			RoleInfoDO roleInfo = rolePermService.getRoleInfo(roleId);	//获取角色对象
			mav.addObject("roleInfo", roleInfo);
			/*List<PermInfoDO> list = rolePermService.getPermList();	//获取全部的权限list
			if (request.getParameter("roleId") != null) {
				
				List<Map<String, Object>> checkedList = rolePermService.getRolePerm(roleId);	//获取当前角色对应的权限
				List<Map<String,Object>> check = new ArrayList<Map<String,Object>>();	
				Map<String,Object> detailMap = null;
				for (int i = 0; i < list.size(); i++) {	//获取全部的权限列表 再将选中的权限列表和全部的权限列表结合 放入checked属性 在页面中进行判断是否选中
					int permId = list.get(i).getPermId();//获取权限ID
					detailMap = new HashMap<String,Object>();
					detailMap.put("checked",false);	//先放入一个checked为false的值
					detailMap.put("permId",list.get(i).getPermId());	//放入权限的id
					detailMap.put("permName",list.get(i).getPermName());	//放入权限的名字
					for (int j = 0; j < checkedList.size(); j++) {	//循环当前角色存在的权限
						if(permId==Integer.parseInt(checkedList.get(j).get("permId").toString())){	//如果权限id相等
							detailMap.clear();	//那么将map中的值清除 
							detailMap.put("checked",true);	//放入checked值为true
							detailMap.put("permId",list.get(j).getPermId());
							detailMap.put("permName",list.get(j).getPermName());
						}
					}
					check.add(detailMap);
				}
				mav.addObject("check", check);
			}*/
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return mav;
	}
	/**
	 * doUpdateRole 对当前需要修改角色修改操作
	 * @throws IOException 
	 */
	@RequestMapping(value = "/doUpdateRole",method=RequestMethod.POST)
	public ModelAndView doUpdateRole(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ModelAndView modelAndView = new ModelAndView("redirect:../sys/role");
		int count = 0;
		try {
			request.setCharacterEncoding("utf-8"); // 设置编码  
			response.setContentType("text/html;charset=UTF-8");
			//String permIds = request.getParameter("permIds");
			String roleIdTemp = request.getParameter("roleId");
			String roleName = request.getParameter("roleName");
			String roleDisc = request.getParameter("roleDisc");
			RoleInfoDO roleInfo = new RoleInfoDO();
			Integer roleId = new Integer(roleIdTemp); 
			roleInfo.setRoleId(roleId);
			roleInfo.setRoleName(roleName);
			roleInfo.setRoleDisc(roleDisc);
			count = rolePermService.updateRolePerm(roleInfo,"");
			if (count>0) {
				this.setSuccessMsg("修改成功！");
			}else {
				this.setFailMsg("修改失败，请检测您的网络或联系管理员。");
			}
			response.getWriter().write(String.valueOf(count));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return modelAndView;
	}	
	
	/**
	 * 删除角色
	 */
	@RequestMapping(value = "/deleteRole",method=RequestMethod.GET)
	public ModelAndView del(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
		ModelAndView mav = new ModelAndView("redirect:"+basePath+"sys/role");
		Map<String,Object> map = new HashMap<String,Object>();
		int roleId = Integer.parseInt(request.getParameter("roleId"));
		map.put("roleId", roleId);
		int count = -1;
		try {
			count = rolePermService.delRolePerm(map);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		if(count>0){
			this.setSuccessMsg("删除成功！");
			return mav;
		}else{
			this.setFailMsg("删除失败，请检测您的网络或联系管理员。");
			return mav;
		}
	}
}
