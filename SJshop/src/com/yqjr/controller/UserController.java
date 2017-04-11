package com.yqjr.controller;


import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.yqjr.commons.base.BaseController;
import com.yqjr.commons.constants.Constants;
import com.yqjr.commons.constants.SessionConstants;
import com.yqjr.commons.exception.ServiceException;
import com.yqjr.commons.helper.PasswordHelper;
import com.yqjr.entity.UserInfoDO;
import com.yqjr.service.MenuInfoService;
import com.yqjr.service.RoleInfoService;
import com.yqjr.service.UserInfoService;
import com.yqjr.service.UserRoleService;

@Controller
@RequestMapping("/userinfo")
public class UserController extends BaseController {
	@Autowired
	private UserInfoService userInfoService;
	@Autowired
    MenuInfoService menuInfoService;
	@Autowired
	private UserRoleService userRoleService;
	@Autowired
	private RoleInfoService roleInfoService;
	@Autowired
	private PasswordHelper passwordHelper;
	
	@RequestMapping(value = "test")
	public void test(HttpServletRequest request, HttpServletResponse response){
		JSONObject json = new JSONObject();
		response.setContentType("text/html;charset=UTF-8");
		json.put("returnCode", "IPS0000");
		json.put("message", "成功！");
		
		try {
			response.getWriter().write(json.toJSONString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "getMenuTree", method = RequestMethod.GET)
	public void getMenuTree(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
		try {
			request.setCharacterEncoding("utf-8"); // 设置编码
			response.setContentType("text/html;charset=UTF-8");
			logger.debug("Get menu tree start");
			int userId = -1;
			List<Map<String,Object>> list = menuInfoService.queryAllMenu(-1);
			if(request.getParameter("userId")!=null&&!"".equals(request.getParameter("userId"))){
				userId= Integer.parseInt(request.getParameter("userId"));
			}
			List<Map<String,Object>> realList = menuInfoService.queryAllMenu(userId);
			Map<Integer,Integer> menuIdMap = new HashMap<Integer,Integer>();
			for (int i = 0; i < list.size(); i++) {
				menuIdMap.put(Integer.parseInt(list.get(i).get("menuId").toString()),i);
				if(list.get(i).get("superiorId").equals("ROOT")){
					list.get(i).put("icon",basePath+"js/zTree_v3/css/zTreeStyle/img/diy/1_open.png");
					list.get(i).put("iconOpen",basePath+"js/zTree_v3/css/zTreeStyle/img/diy/1_open.png");
					list.get(i).put("iconClose",basePath+"js/zTree_v3/css/zTreeStyle/img/diy/1_close.png");
				}else{
					list.get(i).put("icon",basePath+"js/zTree_v3/css/zTreeStyle/img/diy/2.png");
				}
			}
			list.get(0).put("checked", "true");//第一个菜单（我的工作台）默认选中
			for (int j = 0; j < realList.size(); j++) {
				if(userId!=-1){
					int temp = Integer.parseInt(realList.get(j).get("menuId").toString());
					int tempI = menuIdMap.get(temp);
					list.get(tempI).put("checked", "true");
					list.get(tempI).put("open", "true");
				}
			}
			String json= JSONArray.toJSONString(list);
			logger.debug("Get menu tree stop");
			response.getWriter().write(json);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 获取所有的用户
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/getUserList",method=RequestMethod.GET)
	public void getUserList(HttpServletRequest request,HttpServletResponse response){
		try {
			request.setCharacterEncoding("utf-8"); // 设置编码  
			response.setContentType("text/html;charset=UTF-8");
			List<UserInfoDO> list = userInfoService.getUsers(-1);
			String json = JSONObject.toJSONString(list, SerializerFeature.WriteDateUseDateFormat);
			response.getWriter().write(json);
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * 检查密码
	 * @param userId
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/checkPwd",method=RequestMethod.POST)
	public void checkPwd(HttpServletRequest request,HttpServletResponse response){
		try {
			request.setCharacterEncoding("utf-8"); // 设置编码  
			response.setContentType("text/html;charset=UTF-8");
			String userId = request.getParameter("userId");
			String password = request.getParameter("password");
			int count = userInfoService.queryUserInfo(userId, password);
			response.getWriter().write(count+"");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 检查密码
	 * @param userId
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/checkPwdForPlugin",method=RequestMethod.POST, produces="application/json")
	public Map<String, Object> checkPwdForPlugin(String param, String name, HttpServletRequest request,HttpServletResponse response){
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			String userId = this.getSessionUser().getUserId().toString();
			String password = param;
			int count = userInfoService.queryUserInfo(userId, password);
			if(count > 0) {
				map.put("status", "y");
				map.put("info", "原始密码正确！");
			} else {
				map.put("status", "n");
				map.put("info", "原始密码不正确！");
			}
		} catch (Exception e) {
			map.put("status", "n");
			map.put("info", "原始密码不正确！");
		}
		return map;
	}
	
	/**
	 * 修改密码
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/changePwd",method=RequestMethod.POST)
	public ModelAndView changePwd(HttpServletRequest request,HttpServletResponse response){
		try {
			String userId = request.getParameter("userId").trim();
			String newPassword = request.getParameter("newPassword").trim();
			String newPasswordAgain = request.getParameter("newPasswordAgain").trim();
			
			if(!newPassword.equals(newPasswordAgain)) {
				this.setFailMsg("重复新密码不一致");
				return new ModelAndView(BASE_REDIRECT_MARK+"/sys/updatepwd");
			}
			
			UserInfoDO userInfo=new UserInfoDO();
			userInfo.setUserId(Integer.parseInt(userId));
			userInfo.setPassword(newPassword);
			PasswordHelper helper=new PasswordHelper();
			helper.encryptPassword(userInfo);
			int count = userInfoService.updateUser(userInfo);
			if(count < 1) {
				this.setFailMsg("密码修改失败");
				return new ModelAndView(BASE_REDIRECT_MARK+"/sys/updatepwd");
			}
			
			// 记录系统日志
			this.WriteSyslog(Constants.SYSLOG_TYPE_PWD, "", Constants.SYSLOG_STATUS_SUCCESS);
			
		} catch (Exception e) {
			this.setFailMsg("密码修改失败:"+e.getMessage());
			return new ModelAndView(BASE_REDIRECT_MARK+"/sys/updatepwd");
		}
		this.setSuccessMsg("密码修改成功");
		return new ModelAndView(BASE_REDIRECT_MARK+"/sys/updatepwd");
	}
	
	
	
	/**
	 * toAddUser 添加用户
	 */
	@RequestMapping(value = "/toAddUser")
	public ModelAndView toAddUser(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView("/sys/addUser");
		int userId=-1;
		try {
			List<Map<String,Object>> tempRoleList =  roleInfoService.getRoleInfoList(null);
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("userId",userId);
			List<Map<String,Object>> trueRoleList =  roleInfoService.getRoleInfoList(map);
			List<Map<String,Object>> roleList = new ArrayList<Map<String,Object>>();
			Map<String,Object> detailMap = null;
			for (int i = 0; i < tempRoleList.size(); i++) {	//获取全部角色的列表 再循环
				int roleId = Integer.parseInt(tempRoleList.get(i).get("roleId").toString());//获取角色ID
				detailMap = new HashMap<String,Object>();
				detailMap.put("checked",false);	//先放入一个checked为false的值
				detailMap.put("roleId",tempRoleList.get(i).get("roleId"));	//放入角色的id
				detailMap.put("roleName",tempRoleList.get(i).get("roleName"));	//放入角色的名字
				for (int j = 0; j < trueRoleList.size(); j++) {	//循环当前角色存在的权限
					if(roleId==Integer.parseInt(trueRoleList.get(j).get("roleId").toString())){	//如果角色id相等
						detailMap.clear();	//那么将map中的值清除 
						detailMap.put("checked",true);	//放入checked值为true
						detailMap.put("roleId",trueRoleList.get(j).get("roleId"));
						detailMap.put("roleName",trueRoleList.get(j).get("roleName"));
					}
				}
				roleList.add(detailMap);
			}
			mav.addObject("roleList",roleList);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	
	/**
	 * doAddUser 添加用户
	 */
	@RequestMapping(value = "/doAddUser",method=RequestMethod.POST)
	public ModelAndView doAddUser(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
		ModelAndView mav = new ModelAndView("redirect:"+basePath+"sys/user");
		UserInfoDO userInfo = new UserInfoDO();
		userInfo.setUserName(request.getParameter("userName"));
		userInfo.setTrueName(request.getParameter("trueName"));
		//userInfo.setPassword("111111");			//新建用户之后默认密码为6个1 然后用户可以自己登陆账户修改密码
		userInfo.setPassword(request.getParameter("password"));
		passwordHelper.encryptPassword(userInfo);
		userInfo.setPhone(request.getParameter("phone"));
		userInfo.setEmail(request.getParameter("email"));
		userInfo.setUserStatus("0");
		userInfo=userInfoService.addUserInfo(userInfo);
		if(userInfo!=null){
			String content =  request.getParameter("content");
			int count = 0;
			UserInfoDO userInfoDO = (UserInfoDO) SecurityUtils.getSubject().getSession().getAttribute(SessionConstants.CURRENT_USER);
			Map<String,Object> map = new HashMap<String,Object>();
			if(!"".equals(content)&&content!=null){
				String [] menu= content.split(",");
				map.put("menuIds", menu);
				map.put("userId", userInfo.getUserId());
				map.put("creator",userInfoDO.getUserName());
				count = userInfoService.addUserMenu(map);
			}
			if(count>0||(count==0&&(content==null||"".equals(content)))){
				String [] roleIds = request.getParameterValues("roleId");
				if(roleIds!=null){
					map =  new HashMap<String,Object>();
					map.put("roleIds", roleIds);
					map.put("userId", userInfo.getUserId());
					map.put("creator", userInfoDO.getUserName());
					count = userRoleService.addUserRole(map);
					if(count>0){
						this.setSuccessMsg("添加成功！");
						return mav;
					}else{
						return null;
					}
				}else{
					return mav;
				}
			}else{
				return null;
			}
		}
		this.setFailMsg("添加失败，请检查网络或联系管理员。");
		return null;
	}
	/**
	 * updateUser 获取当前需要修改的用户
	 */
	@RequestMapping(value = "/updateUser",method=RequestMethod.GET)
	public ModelAndView updateUser(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("/sys/updateUser");
		int userId=request.getParameter("userId")!=null?Integer.parseInt(request.getParameter("userId")):0;
		try {
			List<UserInfoDO> list = userInfoService.getUsers(userId);
			List<Map<String,Object>> tempRoleList =  roleInfoService.getRoleInfoList(null);
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("userId",userId);
			List<Map<String,Object>> trueRoleList =  roleInfoService.getRoleInfoList(map);
			List<Map<String,Object>> roleList = new ArrayList<Map<String,Object>>();
			Map<String,Object> detailMap = null;
			for (int i = 0; i < tempRoleList.size(); i++) {	//获取全部角色的列表 再循环
				int roleId = Integer.parseInt(tempRoleList.get(i).get("roleId").toString());//获取角色ID
				detailMap = new HashMap<String,Object>();
				detailMap.put("checked",false);	//先放入一个checked为false的值
				detailMap.put("roleId",tempRoleList.get(i).get("roleId"));	//放入角色的id
				detailMap.put("roleName",tempRoleList.get(i).get("roleName"));	//放入角色的名字
				for (int j = 0; j < trueRoleList.size(); j++) {	//循环当前角色存在的权限
					if(roleId==Integer.parseInt(trueRoleList.get(j).get("roleId").toString())){	//如果角色id相等
						detailMap.clear();	//那么将map中的值清除 
						detailMap.put("checked",true);	//放入checked值为true
						detailMap.put("roleId",trueRoleList.get(j).get("roleId"));
						detailMap.put("roleName",trueRoleList.get(j).get("roleName"));
					}
				}
				roleList.add(detailMap);
			}
			mav.addObject("roleList",roleList);
			if(list.size()!=0)mav.addObject("userInfo",list.get(0));
		}catch (ServiceException e) {
			e.printStackTrace();
		}
		mav.addObject("userId",userId);
		return mav;
	}
	/**
	 * 对当前需要修改的用户修改操作
	 */
	@RequestMapping(value = "/update",method=RequestMethod.POST)
	public ModelAndView update(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
		ModelAndView mav = new ModelAndView("redirect:"+basePath+"sys/user");
		Map<String,Object> map = new HashMap<String,Object>();
		int userId = Integer.parseInt(request.getParameter("userId"));
		map.put("userId", userId);
		map.put("userName", request.getParameter("userName"));
		map.put("trueName", request.getParameter("trueName"));
		map.put("phone", request.getParameter("phone"));
		map.put("email", request.getParameter("email"));
		map.put("updateTime", "updateTime");
		int count = userInfoService.updateUser2(map);
		if(count>0){
			count = -1;
			map = new HashMap<String,Object>();
			String content =  request.getParameter("content");
			if(content!=null&&!"".equals(content)){
				String [] menu= content.split(",");
				map.put("menuIds", menu);
			}
			map.put("userId",userId);
			UserInfoDO userInfoDO = (UserInfoDO) SecurityUtils.getSubject().getSession().getAttribute(SessionConstants.CURRENT_USER);
			map.put("creator",userInfoDO.getUserName() );
			count = userInfoService.addUserMenu(map);
			if(count>0||(count==0&&(content==null||"".equals(content)))){
				String [] roleIds = request.getParameterValues("roleId");
				map =  new HashMap<String,Object>();
				map.put("roleIds", roleIds);
				map.put("userId", userId);
				map.put("creator", userInfoDO.getUserName());
				if(roleIds!=null){
					count = userRoleService.addUserRole(map);
					if(count>0){
						this.setSuccessMsg("修改成功！");
						return mav;
					}else{
						return null;
					}
				}else{
					userRoleService.delUserRole(map);
					return mav;
				}
			}else{
				return null;
			}
		}
		this.setFailMsg("修改失败，请检查网络或联系管理员。");
		return mav;
	}	
	
	/**
	 * 删除用户
	 */
	@RequestMapping(value = "/deleteUser",method=RequestMethod.GET)
	public ModelAndView deleteUser(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
		ModelAndView mav = new ModelAndView("redirect:"+basePath+"sys/user");
		Map<String,Object> map = new HashMap<String,Object>();
		int userId = Integer.parseInt(request.getParameter("userId"));
		map.put("userId", userId);
		int count = userInfoService.delUserInfo(map);
		if(count>0){
			this.setSuccessMsg("删除成功！");
			return mav;
		}else{
			this.setFailMsg("删除失败，请检查网络或联系管理员。");
			return null;
		}
	}

	/**
	 * 检查登录名
	 * @param userId
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/checkUserName",method=RequestMethod.GET)
	public Integer checkUserName(HttpServletRequest request,HttpServletResponse response){
		try {
			String userName = request.getParameter("userName");
			UserInfoDO userInfo = userInfoService.queryUserInfo(userName);
			if (userInfo != null) {
				return 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
}
