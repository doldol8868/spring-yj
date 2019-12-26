package com.ex1.yj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {

	@RequestMapping("/main.yj")
	public ModelAndView getMain(ModelAndView mv) {
		
		mv.setViewName("main");
		return mv;
	}
}