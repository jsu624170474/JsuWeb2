package com.jsu.controller.backStage;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jsu.commons.constants.Constants;
import com.jsu.commons.utils.DateUtil;
import com.jsu.commons.utils.PasswdEncryption;
import com.jsu.commons.utils.StringUtil;
import com.jsu.dao.SysUserInfoDao;
import com.jsu.entity.SysMenuInfoDO;
import com.jsu.entity.SysUserInfoDO;
import com.jsu.service.SysMenuService;
import com.jsu.service.SysUserInfoService;

@Controller
@RequestMapping(value="backStage/login")
public class LoginCtrl {

	private final Logger log = LoggerFactory.getLogger(LoginCtrl.class); 
	
	@Autowired
	private SysUserInfoDao sysUserInfoDao;
	@Autowired
	private SysUserInfoService sysUserInfoService;
	@Autowired
	private SysMenuService sysMenuService;
	
	@RequestMapping(value="", method=RequestMethod.GET)
	public String login(){
		
		return "backStage/login";
	}
	
	@RequestMapping(value="/check", method=RequestMethod.POST)
	public String loginCheck(Model model, HttpSession session, String username, String password){
		
		/** 账号，密码基本校验 */
		if(StringUtil.isBlank(username)){
			log.info(String.format("账号为空！"));
			model.addAttribute("message", "账号为空！");
			return "backStage/login";
		}
		if(StringUtil.isBlank(password)){
			log.info(String.format("密码为空！"));
			model.addAttribute("message", "密码为空！");
			return "backStage/login";
		}
		
		
		/** 校验用户 */
		SysUserInfoDO selectUserInfo = new SysUserInfoDO();
		selectUserInfo.setLoginName(username);
		SysUserInfoDO userInfoDo = sysUserInfoService.getUserByLoginname(username);
		
		if(userInfoDo==null){
			log.info(String.format("用户[%s]不存在！", username));
			model.addAttribute("message", "用户不存在！");
			return "backStage/login";
		}else if(!userInfoDo.getStatus().equals(Constants.STATUS_YES)){
			log.info(String.format("用户[%s]账号状态异常！", username));
			model.addAttribute("message", "账号状态异常！");
			return "backStage/login";
		}else{
			if(PasswdEncryption.checkPasswd(password, userInfoDo.getSalt(), userInfoDo.getPassword())){
				// 更新用户最近登录时间
				userInfoDo.setLoginTime(DateUtil.getNowDate());
				sysUserInfoDao.updateByPrimaryKeySelective(userInfoDo);
				// 初始化用户信息到session
				session.setAttribute(Constants.CURRENT_USER, userInfoDo);
				// 初始化菜单到session
				List<SysMenuInfoDO> userMenuList = sysMenuService.listUserMenu(userInfoDo.getUserId());
				session.setAttribute(Constants.CURRENT_USER_MENU, userMenuList);
				
				return "redirect:/backStage/home/";
			}else{
				log.info(String.format("用户[%s]密码不正确！", username));
				model.addAttribute("message", "密码不正确！");
				return "backStage/login";
			}
		}
	}
	
	
	@RequestMapping(value="/out", method=RequestMethod.GET)
	public String loginOut(HttpSession session){
		//清除Session  
        session.invalidate();  
          
        return "redirect:/backStage/login/";
	}
}
