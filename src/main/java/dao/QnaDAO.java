package dao;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.QnaVO;

public class QnaDAO {
	
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	//전체 게시글 조회
	public List<QnaVO> selectList(){
		List<QnaVO> list = null;
		list = sqlSession.selectList("b.qna_list");
		return list;	
	}
	
	
	 //게시글 추가 
	  public int insert( QnaVO vo ) {
		  int res =sqlSession.insert("b.qna_insert", vo); 
		  return res; 
	  }
	
	
	//idx에 해당하는 게시글 한 건 얻어오기
	public QnaVO selectOne( int idx ) {
		QnaVO vo = null;
		vo = sqlSession.selectOne("b.qna_one", idx);
		return vo;
	}
	
	
	  //조회수 증가 
	 public int update_readhit(int idx) {
	  
	  int res = sqlSession.update("b.qna_update_readhit", idx); 
	  return res;
	  
	  }
	  
	  //기준글의 step보다 큰 값 +1처리 
	 public int update_step( QnaVO baseVo ) { 
		 int res =
	  sqlSession.update("b.qna_update_step", baseVo); 
	 return res; 
	  }
	  
	  //댓글달기 
	 public int reply( QnaVO vo ) { 
		 int res =
	  sqlSession.insert("b.qna_reply", vo); 
		 return res; 
		 }
	 
	 //해당 idx와 ref가 일치하는 게시글 가지고오기
	 public QnaVO selectOne_re(int idx) {
		 QnaVO vo=sqlSession.selectOne("b.qna_re",idx);
		 
		 return vo;
	 }
	  
	  //삭제를 위한 게시글의 정보 가져오기 
	 public QnaVO selectOne(int idx, String pwd) { 
	  QnaVO vo = null; HashMap<String, Object> map = new HashMap<String, Object>();
	  map.put("idx", idx); 
	  map.put("pwd", pwd); vo =
	  sqlSession.selectOne("b.qna_idx_pwd", map); 
	  return vo; 
	  }
	  
	  //게시글 삭제(된 것 처럼) 업데이트 
	 public int del_update( QnaVO vo ) {
	  
	  int res = sqlSession.update("b.qna_del_update", vo); 
	  return res;
	  
	  }
	 
	 //수정한정보 업데이트
	 public int update( QnaVO vo ) {
			int res=sqlSession.update("b.qna_update",vo);
			return res;
	}
	
	
	//페이징을 포함한 검색
		public List<QnaVO> selectList(Map<String, Integer> map){
			
			List<QnaVO> list = null;
			list = sqlSession.selectList("b.qna_list_condition", map);
			return list;
			
		}

		//게시판의 전체 게시물 수
		public int getRowTotalqna() {
			
			int count = sqlSession.selectOne("b.qna_count");
			return count;
			
		}
	
		
		//del_info이용하기
		public int update_re(int idx) {
			int res=
					sqlSession.update("b.qna_del_re",idx);
			
			return res;
		}
		
		//삭제될게시판의 idx보다 큰 idx를 전부 -1씩 시킨다.
		public int del_idx_update(int idx) {
			int res=
					sqlSession.update("b.qna_del_idx",idx);
			return res;
		}
		
		//체크할경우
		public int ch_insert( QnaVO vo ) {
			  int res =sqlSession.insert("b.qna_ch_insert", vo); 
			  return res; 
		 }
		 
		
		
}



















