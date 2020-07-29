package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.MainVO;

public class MainDAO {

	
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	//글 불러오기
	public List<MainVO> selectList(){
		
		List<MainVO> list = null;
		list = sqlSession.selectList("m.main_list");
		return list;
	}
	//책 검색기록 추가
	public int insert(MainVO vo) {
		int res = sqlSession.insert("m.main_insert",vo);
		return res;
	}
}
