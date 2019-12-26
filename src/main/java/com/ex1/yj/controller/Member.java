package com.ex1.yj.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.ex1.yj.dao.*;
import com.ex1.yj.vo.*;

@Controller
@RequestMapping("/member")
public class Member {
	@Autowired
	MemberDAO mDAO;
	
	
	@RequestMapping("/login.yj")
	public ModelAndView loginForm(ModelAndView mv) {
		// 할 일
		// 이 함수는 하는 역할이 뷰만 부르는 역할을 담당하고 있다.
		// 따라서 뷰만 부르면 된다.
		mv.setViewName("member/login");	// ==>	/WEB-INF/views/com.ex1.yj/member/login.jsp
		
		return mv;
	}
	
	@RequestMapping("/loginProc.yj")
	public ModelAndView loginProc(MemberVO mVO,
									ModelAndView mv,
									HttpSession session,
									RedirectView rv) {
		System.out.println("### id : " + mVO.getM_id() + " pw : " + mVO.getM_pw());
		int cnt = mDAO.loginProc(mVO);
		if(cnt == 1) { // 아이디와 비밀번호가 일치하는 회원이 한 명 있는 경우
			System.out.println("### 로그인 성공");
			
			session.setAttribute("SID", mVO.getM_id());
			rv.setUrl("/yj/main.yj");
			mv.setView(rv);
		} else { // 로그인에 실패한 경우
			System.out.println("### 로그인 실패");
			
			rv.setUrl("/yj/member/login.yj");
			mv.setView(rv);
		}
		/*
		if(mVO.getM_id().equals("yj") && mVO.getM_pw().equals("1234")) {
			System.out.println("### 로그인 성공");
			session.setAttribute("SID", mVO.getM_id());
			rv.setUrl("/yj/main.yj");
		} else {
			System.out.println("### 로그인 실패");
			rv.setUrl("/yj/member/login.yj");
		}
		
		mv.setView(rv);
		 */
		return mv;
	}

	@RequestMapping("/join.yj")
	public ModelAndView joinForm(ModelAndView mv) {
		
		mv.setViewName("/member/join");
		
		return mv;
	}
	
	@RequestMapping("/joinProc.yj")
	public ModelAndView joinProc(ModelAndView mv,
									RedirectView rv,
									HttpSession session,
									MemberVO mVO) {
		
		int cnt = mDAO.insertMemb(mVO); // 회원정보 입력
		if(cnt != 1) { //회원가입 실패
			System.out.println("### 회원가입 실패");
			rv.setUrl("/yj/member/join.yj");
			
		}else { // 회원가입 성공
			System.out.println("### 회원가입 성공");
			rv.setUrl("/yj");
		}
		mv.setView(rv);
		return mv;
	}

	@RequestMapping("/logout.yj")
	public ModelAndView logout(ModelAndView mv,
								RedirectView rv,
								HttpSession session) {
		System.out.println("### logout");
		
		session.setAttribute("SID", "");
		rv.setUrl("/yj/");
		
		mv.setView(rv);
		
		return mv;
	}
}
