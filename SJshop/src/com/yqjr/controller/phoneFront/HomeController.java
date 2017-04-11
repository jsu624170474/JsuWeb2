package com.yqjr.controller.phoneFront;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yqjr.commons.base.BaseController;
import com.yqjr.commons.cache.CachePool;
import com.yqjr.commons.util.StringUtil;
import com.yqjr.commons.util.file.FileUpload;
import com.yqjr.dao.PhoneHomeDao;
import com.yqjr.service.phoneFront.HomeService;

@Controller
@RequestMapping("/phoneFront")
public class HomeController extends BaseController {

	@Autowired
	HomeService homeService;
	
    /**
     * 首页
     */
    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public ModelAndView toAddRole(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mav = new ModelAndView("phoneFront/home");

        /** 促销 */
        List<Map<String, Object>> salesList = (List<Map<String, Object>>) homeService.getContent(request, CachePool.HOME_PHONE_SALES);
        
        /** 老板推荐 */
        List<Map<String, Object>> recommendList = (List<Map<String, Object>>) homeService.getContent(request, CachePool.HOME_PHONE_RECOMMEND);
        
        /** 热销 */
        List<Map<String, Object>> hotList = (List<Map<String, Object>>) homeService.getContent(request, CachePool.HOME_PHONE_HOT);
        
        mav.addObject("salesList", salesList);
        mav.addObject("recommendList", recommendList);
        mav.addObject("hotList", hotList);
        return mav;
    }
}
