package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.ReviewVO;

public class ReviewDAO {
SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int insert(ReviewVO vo) {
		// TODO Auto-generated method stub
		int res=sqlSession.insert("re.insert_review",vo);
		return res;
	}

	public List<ReviewVO> selectlist(String b_name) {
		String r_book=b_name;
		//System.out.println(r_book);
		List<ReviewVO> rlist=null;
		rlist=sqlSession.selectList("re.selectlist_review",r_book);
		
		//System.out.println("1."+rlist.get(0).getName());
		//System.out.println("2."+rlist.get(0).getR_book());
				
		return rlist;
	}
	
	
	
}
