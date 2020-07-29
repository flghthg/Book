package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.CartVO;

public class CartDAO {


   
   SqlSession sqlSession;
   
   public void setSqlSession(SqlSession sqlSession) {
      this.sqlSession = sqlSession;
   }
   
   
   //회원별 장바구니 목록
   public List<CartVO> select(int m_idx){
      List<CartVO> list =null;
      list= sqlSession.selectList("c.cart_list", m_idx);
      return list;
   }
   
   //회원별 장바구니 상품의 총 합 
   public int selectTotalAmount (int m_idx) {
      int total = sqlSession.selectOne("c.cart_total_amount",m_idx);
      return total;   
   }
   //상품갯수, 상품번호, 유저번호를 파라미터로 받아서 update
   public int update_cnt(int c_idx, int c_cnt) {
      
      
      HashMap<String, Integer> map = new HashMap<String, Integer>();
      map.put("c_idx", c_idx);
      map.put("c_cnt", c_cnt);
      
      int res = sqlSession.update("c.cart_cnt_update", map);
      
      

      return res;
   }
   //장바구니에서 상품 삭제하기
   public int delete(int c_idx){
      
      int res = sqlSession.delete("c.cart_cnt_del",c_idx);
      
      return res;
   }
   
   //이미 장바구니에 등록된 상품이 있는지 확인함
   public CartVO selectOne(CartVO vo) {
      
      CartVO resVO = null;
      resVO = sqlSession.selectOne("c.cart_one",vo);
      
      
      return resVO;
   }
   //장바구니에 상품 등록하기
   public int insert(CartVO vo) {
      
      
      int res = sqlSession.insert("c.cart_insert",vo);
      
      
      return res;
   }

}
