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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//	연습--------------------------------------------------------------------------------
	
}
