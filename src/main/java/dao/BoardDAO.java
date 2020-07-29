package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.BoardVO;
import vo.QnaVO;

public class BoardDAO {
	
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	//전체 게시글 조회
	public List<BoardVO> selectList(){
		List<BoardVO> list = null;
		list = sqlSession.selectList("b.board_list");
		return list;	
	}
	
	//idx에 해당하는 게시글 한 건 얻어오기
	public BoardVO selectOne( int idx ) {
		BoardVO vo = null;
		vo = sqlSession.selectOne("b.board_one", idx);
		return vo;
	}
	
	//페이징을 포함한 검색
	public List<BoardVO> selectList(Map<String, Integer> map){
		
		List<BoardVO> list = null;
		list = sqlSession.selectList("b.board_list_condition", map);
		return list;
		
	}

	//게시판의 전체 게시물 수
	public int getRowTotal() {
		
		int count = sqlSession.selectOne("b.board_count");
		return count;
		
	}
	
	
}



















