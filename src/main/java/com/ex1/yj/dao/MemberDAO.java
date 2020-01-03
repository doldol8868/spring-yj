package com.ex1.yj.dao;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.ex1.yj.vo.*;

public class MemberDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int loginProc(MemberVO mVO) {
		
		int cnt = sqlSession.selectOne("mSQL.login", mVO);
		
		return cnt;
	}
	
	public int insertMemb(MemberVO mVO) {
		
		int cnt = sqlSession.insert("mSQL.addMember", mVO);
		
		return cnt;
	}
	
	public List<MemberVO> memberList() {
		
		List<MemberVO> list = sqlSession.selectList("mSQL.memberList");
		
		return list;
	}
	
	public MemberVO memberInfo(int m_no) {
		
		return sqlSession.selectOne("mSQL.memberInfo", m_no);
	}
	
	public int idCheck(String m_id) {
		
		int cnt = sqlSession.selectOne("mSQL.idCheck", m_id);
		
		return cnt;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//	연습--------------------------------------------------------------------------------
	
	public List<MemberVO> memberList2() {
		
		List<MemberVO> list = sqlSession.selectList("mSQL.memberList");
		
		return list;
	}
	
	public MemberVO memberInfo2(int m_no) {
		
		MemberVO info = sqlSession.selectOne("mSQL.memberInfo2", m_no);
		
		return info;
	}
	
}
