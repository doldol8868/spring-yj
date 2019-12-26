package com.ex1.yj.dao;

import java.util.*;

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
}
