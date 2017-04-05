package com.jsu.controller.backStage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jsu.commons.mybatisextend.PageContext;
import com.jsu.dao.SysUserInfoDao;
import com.jsu.entity.SysUserInfoDO;

@Controller
@RequestMapping(value="backStage/sys/user/")
public class SysUserCtrl {

	private final Logger log = LoggerFactory.getLogger(SysUserCtrl.class); 
	
	@Autowired
	private SysUserInfoDao userInfoDao;
	
	@RequestMapping(value="list", method=RequestMethod.GET)
	public ModelAndView userList(HttpServletRequest request){
		
		ModelAndView mav = new ModelAndView("backStage/system/userList");
		
		PageContext page = PageContext.getContext(request);
		
		SysUserInfoDO sysUserInfoDO = new SysUserInfoDO();
		List<SysUserInfoDO> list = userInfoDao.selectSelective(sysUserInfoDO);
		request.setAttribute("paginator", page);
		mav.addObject("list", list);
		
		return mav;
	}
	
}
