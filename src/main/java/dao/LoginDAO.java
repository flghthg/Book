package dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import vo.BookVO;
import vo.LoginVO;


public class LoginDAO {

	SqlSession sqlSession;


	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession  = sqlSession;
	}

	public LoginVO selectOne(String input_id) {
		LoginVO vo=null;
		vo=sqlSession.selectOne("b.Login_one",input_id);
		return vo;
	}

	public LoginVO selectOne_l(String id) {
		
		LoginVO vo=null;
		vo=sqlSession.selectOne("b.Login_o",id);
		return vo;
	}
	
	public LoginVO check_id(String join_id) {

		LoginVO vo=null;
		vo=sqlSession.selectOne("b.Login_one",join_id);
		return vo;

	}

	public int insert(LoginVO vo) {


		int insertres=sqlSession.insert("b.insert_inform",vo);  
		return insertres;


	}

	public int modify(LoginVO vo, HttpServletRequest request) {

		int modifyres=sqlSession.update("b.modify_inform",vo);
		return modifyres;

	}
	
//	public List<LoginVO> select( int idx ){
//		
//		List<LoginVO> list = null;
//		list = sqlSession.selectList("b.login_list", idx); //book.xml mapper의 namespace와 이름이 같아야한다.
//		return list;
//		
//	}


}

