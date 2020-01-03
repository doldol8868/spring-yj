package com.ex1.yj.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	MemberVO mVO;
	
	@RequestMapping("/tBoardList.yj")
	public ModelAndView tBoardList(ModelAndView mv) {
		
		List<BoardVO> list = bDAO.tBoardList();
			// List<BoardVO> 타입의 list란 이름의 변수를 bDAO의 tBoardList2() 함수의 값을 넣겠다.
		mv.addObject("LIST", list);
			// mv에 "LIST"란 오브젝트에 변수 list 값을 담겠다. (?)포워딩
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
	@RequestMapping("/tBoardAction2.yj")
	public ModelAndView tBoardAction2(ModelAndView mv,
										RedirectView rv,
										BoardVO bVO) {
		
		int cnt = bDAO.tBoardAction2(bVO); // 정보 입력
		if(cnt != 1) { // 글 작성 실패
			System.out.println("### 글작성 실패");
			rv.setUrl("/yj/board/tBoardForm2.yj");
		} else {
			System.out.println("### 글작성 성공");
			rv.setUrl("/yj/board/tBoardList2.yj");
		}
		
		mv.setView(rv);
		return mv;
	}
	
	@RequestMapping("/tBoardForm2.yj")
	public ModelAndView tBoardForm2(ModelAndView mv) {
		
		mv.setViewName("/board2/tBoardForm2");
		
		return mv;
	}
	
	@RequestMapping("/tBoardList2.yj")
	public ModelAndView tBoardList2(ModelAndView mv) {
		
		
		List<BoardVO> list = bDAO.tBoardList2();
		mv.addObject("LIST", list);
		
		mv.setViewName("/board2/tBoardList2");
		return mv;
		
	}
	
	@RequestMapping("/tBoardForm3.yj")
	public ModelAndView tBoardForm3(ModelAndView mv) {
		
		mv.setViewName("/board3/tBoardForm3");
		
		return mv;
	}
	
	@RequestMapping("/tBoardAction3.yj")
		public ModelAndView tBoardAction3(ModelAndView mv,
											RedirectView rv,
											BoardVO bVO) {
			int cnt = bDAO.tBoardAction3(bVO);
			if(cnt != 1) { // 글 작성 실패
				System.out.println("### 글 작성 실패");
				rv.setUrl("/yj/board/tBoardForm3.yj");
			} else {	// 글 작성 성공
				System.out.println("### 글 작성 성공");
				rv.setUrl("/yj/board/tBoardList3.yj");
			}
			mv.setView(rv);
			return mv;
	}
	
	@RequestMapping("/tBoardList3.yj")
	public ModelAndView tBoardList3(ModelAndView mv) {
		
		List<BoardVO> list = bDAO.tBoardList3();
		mv.addObject("LIST", list);
		mv.setViewName("/board3/tBoardList3");
		
		return mv;
	}
	
	@RequestMapping("/tBoardBody.yj")
	public ModelAndView tBoardBody(ModelAndView mv,
									int tbno) {
		
		BoardVO body = bDAO.tBoardBody(tbno);
		
		mv.addObject("CONT", body);
		mv.setViewName("/board/tBoardBody");
		
		return mv;
	}
	
}
