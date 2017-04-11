package com.yqjr.controller.sys;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yqjr.commons.base.BaseController;
import com.yqjr.commons.mybatisextend.PageContext;
import com.yqjr.commons.util.StringUtil;
import com.yqjr.entity.SysLogDO;
import com.yqjr.service.SysLogService;

@Controller
@RequestMapping("syslog")
public class SysLogController extends BaseController {

	@Autowired
	SysLogService sysLogService; 
	
	@RequestMapping(value = "list")
	public ModelAndView user(HttpServletRequest request,String phone,String trueName) {
		ModelAndView mav = new ModelAndView("sys/sysLogList");
		
		SysLogDO sysLogDO = new SysLogDO();  
		// 分页 第一部分 start
		String operUser = request.getParameter("operUser");
		String operName = request.getParameter("operName");
		if(!StringUtil.isBlank(operUser)) {
			sysLogDO.setOperUser(operUser);
		}
		if(!StringUtil.isBlank(operName)) {
			sysLogDO.setOperName(operName);
		}
		PageContext page = PageContext.getContext(request);
		List<SysLogDO> list = sysLogService.selectSysList(sysLogDO);
		request.setAttribute("paginator", page);
		mav.addObject("list", list);
		mav.addObject("operUser",operUser);
		mav.addObject("operName",operName);
		
		return mav;
	}
}
