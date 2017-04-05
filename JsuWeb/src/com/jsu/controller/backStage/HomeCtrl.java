package com.jsu.controller.backStage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="backStage")
public class HomeCtrl {

	private final Logger log = LoggerFactory.getLogger(HomeCtrl.class); 
	
	@RequestMapping(value="/home", method=RequestMethod.GET)
	public String home(){
		
		log.info("++++ 进入首页");
		return "backStage/home";
	}
}
