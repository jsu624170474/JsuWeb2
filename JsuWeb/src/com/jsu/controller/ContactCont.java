package com.jsu.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jsu.commons.utils.DateUtil;
import com.jsu.commons.utils.StringUtil;
import com.jsu.dao.LeaveMessageDao;
import com.jsu.entity.LeaveMessageDO;

@Controller
@RequestMapping("contactus")
public class ContactCont {

	private final Logger log = LoggerFactory.getLogger(ContactCont.class); 
	
	@Autowired
	LeaveMessageDao leaveMessageDao;
	
	@RequestMapping(value="", method=RequestMethod.GET)
	public String contactus(){
		
		return "frontEnd/contactus";
	}
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String add(HttpServletRequest request, Model model){
		
		LeaveMessageDO leaveMessage = new LeaveMessageDO();
		leaveMessage.setEmail(StringUtil.nullToString(request.getParameter("email")));
		leaveMessage.setPhone(StringUtil.nullToString(request.getParameter("phone")));
		leaveMessage.setName(StringUtil.nullToString(request.getParameter("name")));
		leaveMessage.setMessage(StringUtil.nullToString(request.getParameter("message")));
		leaveMessage.setCreateTime(DateUtil.getNowDate());
		leaveMessageDao.insert(leaveMessage);
		
		model.addAttribute("alertMsg", "display");
		
		return "frontEnd/contactus";
	}
}
