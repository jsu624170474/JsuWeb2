package com.jsu.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SystemCont {

	private final Logger log = LoggerFactory.getLogger(SystemCont.class); 
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String home(){
		
		log.info("++++ 进入首页");
		return "frontEnd/home";
	}
	
	@RequestMapping(value="/service", method=RequestMethod.GET)
	public String service(){
		
		return "frontEnd/service";
	}
	
	@RequestMapping(value="/gallery", method=RequestMethod.GET)
	public String gallery(){
		
		return "frontEnd/gallery";
	}
	
	@RequestMapping(value="/pricing", method=RequestMethod.GET)
	public String pricing(){
		
		return "frontEnd/pricing";
	}
	
	@RequestMapping(value="/aboutus", method=RequestMethod.GET)
	public String aboutus(){
		
		return "frontEnd/aboutus";
	}
	
	
	@RequestMapping(value="/single", method=RequestMethod.GET)
	public String single(){
		
		System.out.println("single +++++++++++++++ ");
		
		return "frontSingle/single"; 
	}
}
