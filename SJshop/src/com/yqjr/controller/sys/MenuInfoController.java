package com.yqjr.controller.sys;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yqjr.commons.base.BaseController;
import com.yqjr.service.MenuInfoService;

/**
 * Description
 * @author  Robin
 * @version V1.0 
 * @createDateTime：2014-10-30  11:35:26 
 * @Company: 
 * @Copyright: Copyright (c) 2014
 **/
@Controller
@RequestMapping("/menu")
public class MenuInfoController extends BaseController {
	@Autowired
    MenuInfoService menuInfoService;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView main2(HttpServletRequest request) {
//		getMenuInfoList(str)
//		List<MenuInfoDO> list = menuInfoService.queryMenu(0);
		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("list", list);
		return new ModelAndView("menu", map);
	}
}
