package com.ex1.yj.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	@RequestMapping("/join2.yj")
	public ModelAndView joinForm2(ModelAndView mv) {
		
		mv.setViewName("/member/join2");
		
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
	
	@RequestMapping("/memberList.yj")
	public ModelAndView memberList(ModelAndView mv) {
		
		List<MemberVO> list = mDAO.memberList(); 
		mv.addObject("M_LIST", list);
		mv.setViewName("/member/memberList");
		
		return mv;
	}
	
	@RequestMapping("/memberInfo.yj")
	public ModelAndView memberInfo(ModelAndView mv,
									int m_no) {
		
		MemberVO info = mDAO.memberInfo(m_no);
		
		mv.addObject("INFO", info);
		mv.setViewName("/member/memberInfo");
		
		return mv;
	}
	
	@RequestMapping(value="idCheck.yj")
	@ResponseBody
	public int idCheck(@RequestParam String m_id) {
		int cnt = 0;
		cnt = mDAO.idCheck(m_id);
		
		/*
			우리가 현재 필요한 데이터는 json 형식의 데이터이다.
			데이터의 숫자가 적을 경우는 해당 json 형식의 데이터를 만들어주는 것이 문제없지만,
			여러 개라면 문제가 될 수 있다.
			코드의 길이가 늘어날 수 있고
			확인하는 작업이 불편해진다.
			
			만약 vo의 모든 변수에 대한 데이터를 json 형식으로 변환시켜야 한다면
			모든 변수의 키값을 만들고 입력해줘야 한다.
			
			다행이도 스프링에서는 json 문서를 쉽게 만들 수 있는 방법을 제공하고 있다.
			
			방법)
				실행함수에 반환값을 VO 타입으로 정하고
				함수에
					@ResponseBody
				라는 어노테이션을 붙여주면 된다.
				VO에 선언된 변수 이름을 키값으로 하고
				입력된 데이터를 밸류로 해서
				json 문서를 알아서 만들어준다.
		*/
		return cnt;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
// 	연습----------------------------------------------------------
	
	
	
	@RequestMapping("/memberList2.yj")
	public ModelAndView memberList2(ModelAndView mv) {
		
		List<MemberVO> list = mDAO.memberList2();
		
		mv.addObject("LIST", list);
		mv.setViewName("/member/memberList2");
		
		return mv;
	}
	
	
	
	
	@RequestMapping("/memberInfo2.yj")
	public ModelAndView memberInfo2(ModelAndView mv,
										int m_no) {
		
		MemberVO info = mDAO.memberInfo2(m_no);
		
		mv.addObject("INFO", info);
		mv.setViewName("/member/memberInfo2");
		
		return mv;
	}
}
