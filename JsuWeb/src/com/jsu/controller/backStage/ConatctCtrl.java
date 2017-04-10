package com.jsu.controller.backStage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jsu.commons.mybatisextend.PageContext;
import com.jsu.commons.utils.StringUtil;
import com.jsu.dao.LeaveMessageDao;
import com.jsu.entity.LeaveMessageDO;

@Controller
@RequestMapping("backStage/conatct/")
public class ConatctCtrl {

	@Autowired
	LeaveMessageDao leaveMessageDao;
	
	@RequestMapping(value="listLeaveMessage", method=RequestMethod.GET)
	public ModelAndView listLeaveMessage(HttpServletRequest request){
		ModelAndView model = new ModelAndView("backStage/contact/LeaveMessageList");
		
		/** 查询条件 */
		String name = StringUtil.reqParamTrade(request.getParameter("name"));
		String phone = StringUtil.reqParamTrade(request.getParameter("phone"));
		
		PageContext page = PageContext.getContext(request);
		
		LeaveMessageDO leaveMessage = new LeaveMessageDO();
		leaveMessage.setName(name);
		leaveMessage.setPhone(phone);
		List<LeaveMessageDO> list = leaveMessageDao.list(leaveMessage);
		
		request.setAttribute("paginator", page);
		model.addObject("list", list);
		return model;
	}
}
