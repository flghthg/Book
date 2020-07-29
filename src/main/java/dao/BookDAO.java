package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import vo.BookVO;
import vo.ReviewVO;

public class BookDAO {
   
   SqlSession sqlSession;
   
   public void setSqlSession(SqlSession sqlSession) {
      this.sqlSession = sqlSession;
   }
   
   public List<BookVO> selectlist(){
      List<BookVO> list=null;
      list=sqlSession.selectList("book.name_list");
      return list;
   }
   
   //카테고리별 상품조회
   public List<BookVO> select( String category ){
      
      List<BookVO> list = null;
      list = sqlSession.selectList("book.book_list", category); //book.xml mapper의 namespace와 이름이 같아야한다.
      return list;
      
   }
   
   
   //상품 상세보기
   public BookVO selectOne( int idx ) {
      
      BookVO vo = null;
      vo = sqlSession.selectOne("book.book_one", idx);
      return vo;
   }
   
   
   //도서찾기
   public BookVO selectOne_search(String n_name) {
      BookVO vo=null;
      vo=sqlSession.selectOne("book.search_name",n_name);
      return vo;
   }

   public List<ReviewVO> review_selectlist(String b_name) {
      String r_book=b_name;
      List<ReviewVO> rlist=null;
      rlist=sqlSession.selectList("book.review_list",r_book);
      
      return rlist;
   }
   
}





















