package com.ex1.yj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.ex1.yj.dao.*;
import com.ex1.yj.vo.*;

@Controller
@RequestMapping("/board")
public class Board {
	
	@Autowired
	BoardDAO bDAO;
	
	@RequestMapping("/tBoardList.yj")
	public ModelAndView tBoardList(ModelAndView mv) {
		
		mv.setViewName("/board/tBoardList");
		
		return mv;
	}
	
	@RequestMapping("/tBoardForm.yj")
	public ModelAndView tBoardForm(ModelAndView mv) {
		
		mv.setViewName("/board/tBoardForm");
		
		return mv;
	}
	
	@RequestMapping("/tBoardAction.yj")
	public ModelAndView tBoardAction(ModelAndView mv,
										RedirectView rv,
										BoardVO bVO) {
		
		int cnt = bDAO.tBoardAction(bVO); // 정보 입력
		if(cnt != 1) { // 글 작성 실패
			System.out.println("### 글 작성 실패");
			rv.setUrl("/yj/board/tBoardForm.yj");
		}else {
			System.out.println("### 글 작성 성공");
			rv.setUrl("/yj/board/tBoardList.yj");
		}
		
		mv.setView(rv);
		return mv;
	}
}
