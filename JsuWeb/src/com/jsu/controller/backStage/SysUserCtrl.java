package com.jsu.controller.backStage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.jsu.commons.constants.Constants;
import com.jsu.commons.constants.ConstantsConfig;
import com.jsu.commons.mybatisextend.PageContext;
import com.jsu.commons.utils.ConfigUtil;
import com.jsu.commons.utils.DateUtil;
import com.jsu.commons.utils.ListUtil;
import com.jsu.commons.utils.PasswdEncryption;
import com.jsu.commons.utils.StringUtil;
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
		
		String name = StringUtil.reqParamTrade(request.getParameter("name"));
		String loginName = StringUtil.reqParamTrade(request.getParameter("loginName"));
		
		ModelAndView mav = new ModelAndView("backStage/system/userList");
		PageContext page = PageContext.getContext(request);
		SysUserInfoDO sysUserInfoDO = new SysUserInfoDO();
		sysUserInfoDO.setName(name);
		sysUserInfoDO.setLoginName(loginName);
		List<SysUserInfoDO> list = userInfoDao.selectSelective(sysUserInfoDO);
		request.setAttribute("paginator", page);
		mav.addObject("list", list);
		mav.addObject("name", name);
		mav.addObject("loginName", loginName);
		
		return mav;
	}
	
	@RequestMapping(value="add", method=RequestMethod.GET)
	public ModelAndView userAdd(HttpServletRequest request){
		ModelAndView mav = new ModelAndView("backStage/system/userAdd");
		
		return mav;
	}
	
	@RequestMapping(value="save", method=RequestMethod.POST)
	public ModelAndView save(HttpServletRequest reqeust){
		
		/** 获取页面参数 */
		String loginName = reqeust.getParameter("loginName");
		String name = reqeust.getParameter("name");
		String phone = reqeust.getParameter("phone");
		String email = reqeust.getParameter("email");
		
		/** 保存 */
		String salt = StringUtil.getRandomString(26);
		String password = PasswdEncryption.toPasswd(ConstantsConfig.INIT_PASSWD, salt.getBytes());
		
		SysUserInfoDO userInfoDo = new SysUserInfoDO();
		userInfoDo.setEmail(email);
		userInfoDo.setLoginName(loginName);
		userInfoDo.setPhone(phone);
		userInfoDo.setName(name);
		userInfoDo.setPassword(password);
		userInfoDo.setSalt(salt);
		userInfoDo.setCreateTime(DateUtil.getNowDate());
		userInfoDo.setUpdateTime(DateUtil.getNowDate());
		userInfoDo.setLoginTime(null);
		userInfoDo.setStatus(Constants.STATUS_YES);
		userInfoDao.insert(userInfoDo);
		
		/** 返回列表页面 */
		ModelAndView mav = new ModelAndView("redirect:/backStage/sys/user/list");
		return mav;
	}
	
	
	/**
	 * 校验是否符合新增用户条件
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "addCheck")
    @ResponseBody
	public JSONObject addCheck(Model model, HttpServletRequest request){
		JSONObject rtnJson = new JSONObject(); 
		
		String loginName = request.getParameter("loginName");
		
		SysUserInfoDO sysUserInfoDO = new SysUserInfoDO();
		sysUserInfoDO.setLoginName(loginName);
		List<SysUserInfoDO> list = userInfoDao.selectSelective(sysUserInfoDO);
		if(!ListUtil.isBlank(list)){
			rtnJson.put("rtnCode", "F");
			rtnJson.put("rtnMsg", "该账号已存在！");
			return rtnJson;
		}
		
		rtnJson.put("rtnCode", "S");
		return rtnJson;
	}
}
