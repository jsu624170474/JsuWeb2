package com.yqjr.controller.sys;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yqjr.commons.base.BaseController;
import com.yqjr.commons.exception.ServiceException;
import com.yqjr.commons.mybatisextend.PageContext;
import com.yqjr.entity.UserInfoDO;
import com.yqjr.service.MenuInfoService;
import com.yqjr.service.RolePermService;
import com.yqjr.service.SysFieldService;
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
@RequestMapping("sys")
public class SystemController extends BaseController {
	@Autowired
    MenuInfoService menuInfoService;
	@Autowired
    UserInfoService userInfoService;
	@Autowired
	RolePermService roleInfoService;
	@Autowired
	SysFieldService sysFieldService;
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView main(HttpServletRequest request) {
		return new ModelAndView("redirect:sys/user");
	}
	

	@RequestMapping(value = "user")
	public ModelAndView user(HttpServletRequest request,String phone,String trueName) {
		ModelAndView mav = new ModelAndView("sys/userlist");
		//此处需要查询当前已有用户的列表
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			// 分页 第一部分 start
			if (null != trueName && !trueName.equals("")) {
				map.put("trueName", trueName);
			}
			if (null != phone && !phone.equals("")) {
				map.put("phone", phone);
			}
			PageContext page = PageContext.getContext(request);
			List<UserInfoDO> list = userInfoService.getUsers(map);
			request.setAttribute("paginator", page);
			mav.addObject("list", list);
			mav.addAllObjects(map);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return mav;
	}
	@RequestMapping(value = "role", method = RequestMethod.GET)
	public ModelAndView role(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("sys/role/rolelist");
		//此处需要查询当前已有用户的列表
		try {
			PageContext page = PageContext.getContext(request);
			request.setAttribute("paginator", page);
			List<Map<String,Object>> list = roleInfoService.getRoleInfoList(null);
			mav.addObject("list", list);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return mav;
	}
	//合作机构查询
	@RequestMapping(value = "organ", method = RequestMethod.GET)
	public ModelAndView organ(HttpServletRequest request) {
		return new ModelAndView("redirect:../organ/show");
	}
	//密码修改
	@RequestMapping(value = "updatepwd", method = RequestMethod.GET)
	public ModelAndView pwd(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("sys/pwdChange");
		mav.addObject("userId", this.getSessionUser().getUserId());
		return mav;
	}
	
     
}
