package com.ex1.yj.dao;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.ex1.yj.vo.*;

public class BoardDAO {
	
		@Autowired
		SqlSessionTemplate sqlSession;

		public int tBoardAction(BoardVO bVO) {
			
			int cnt = sqlSession.insert("bSQL.tBoardAction", bVO);
			
			return cnt;
		}
}
