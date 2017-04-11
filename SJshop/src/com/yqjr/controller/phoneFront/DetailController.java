package com.yqjr.controller.phoneFront;


import com.yqjr.commons.base.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/phoneFront")
public class DetailController extends BaseController {

    /**
     * 首页
     */
    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public ModelAndView detail(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mav = new ModelAndView("phoneFront/detail");


        return mav;
    }
}
