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
			
			// insert 명령문에서 insert 한 줄의 수를 반환해준다. 우리가 쓰는 SQL문에서는 한 줄씩 넣으므로 1씩 반환이 된다. 
			
			return cnt;
		}
		
		public int tBoardAction2(BoardVO bVO) {
			
			int cnt = sqlSession.insert("bSQL.tBoardAction2", bVO);
			
			return cnt;
		}
		
		public int tBoardAction3(BoardVO bVO) {
			
			int cnt = sqlSession.insert("bSQL.tBoardAction3", bVO);
			
			return cnt;
		}
		
		public List<BoardVO> tBoardList() {
			
			List<BoardVO> list = sqlSession.selectList("bSQL.tBoardList");
				// List<BoardVO> 타입의 list 란 변수에
				// sqlSession.selectList 함수로 
				// bSQL의 tBoardList 라는 id의 SQL문으로 출력된 것을 담겠다. 
			
			return list;
				// 반환
		}
		
		public List<BoardVO> tBoardList2() {
			
			List<BoardVO> list = sqlSession.selectList("bSQL.tBoardList2");
			
			return list;
		}	
		
		public List<BoardVO> tBoardList3() {
			
			List<BoardVO> list = sqlSession.selectList("bSQL.tBoardList3");
			
			return list;
		}
		
		public BoardVO tBoardBody(int tbno) {
			
			BoardVO body = sqlSession.selectOne("bSQL.tBoardBody", tbno);
					
			return body;
		}
}
