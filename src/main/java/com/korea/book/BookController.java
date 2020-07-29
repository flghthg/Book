package com.korea.book;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import common.Common;
import dao.BookDAO;
import dao.CartDAO;
import dao.LoginDAO;
import dao.ReviewDAO;
import vo.BookVO;
import vo.CartVO;
import vo.LoginVO;
import vo.ReviewVO;


@Controller
public class BookController {

   BookDAO book_dao;
   ReviewDAO review_dao;
   LoginDAO login_dao;
   CartDAO cart_dao;
   
   public void setBook_dao(BookDAO book_dao) {
      this.book_dao = book_dao;
   }
   
   public void setReview_dao(ReviewDAO review_dao) {
      this.review_dao = review_dao;
   }
   
   public void setLogin_dao(LoginDAO login_dao) {
      this.login_dao = login_dao;
   }
   
   public void setCart_dao(CartDAO cart_dao) {
      this.cart_dao = cart_dao;
   }
   
   public static final String VIEW_PATH = "WEB-INF/views/book/";

   @Autowired
   HttpServletRequest request;
   
   //전체 목록
   @RequestMapping(value={"/booklist.do"})
   public String list(Model model, String category) {
      
      category = request.getParameter("category");
      
      if( category == null || category.isEmpty() ) {
         category = "novel";//첫 실행시 소설 카테고리에서 시작
      }
      
      //카테고리별 목록조회
      List<BookVO> list = book_dao.select(category);
      model.addAttribute("list", list);
      
      return VIEW_PATH + "book_list.jsp";
   }
   
   @RequestMapping("/bookcart.do")
   public String view(Model model,BookVO vo) {
   
   model.addAttribute("vo", vo);
   
   return VIEW_PATH + "cart_list.do";
   }
   
   //상세보기
   @RequestMapping("/bookview.do")
   public String view(Model model, int idx,String id) {
   //view.do?idx=5
   idx = Integer.parseInt( request.getParameter("idx") );
   
   BookVO vo = book_dao.selectOne(idx);
   LoginVO vo_l=login_dao.selectOne(id);
   
   
   //책이름에해당되는 모든 정보들을 가지고 옴.
   List<ReviewVO> rlist=null;
   System.out.println("aa : " + review_dao);
   //rlist=book_dao.review_selectlist(vo.getB_name());
   rlist=review_dao.selectlist(vo.getB_name());
         
   ReviewVO v=null;
   int s=0;//별에 들어있는 수를 합친 정수가 들어감.
   for(int i=0;i<rlist.size();i++) {
      s += rlist.get(i).getStar();
   }
   System.out.println("s"+s);
   System.out.println("rlist"+rlist.size());
   
   double s1=s;
   double r=rlist.size();
   
   double sta=s1/r;
    double star=Double.parseDouble(String.format("%.1f",sta));
    
    if(rlist.size() == 0) {
       star=0;
    }
    
    int starlength=0;
   
    if( rlist.size() != 0 ) {
        starlength=s/rlist.size();
    }
   System.out.println("star평점"+star);
   
   
   model.addAttribute("sta",starlength);
   model.addAttribute("star",star);      
   model.addAttribute("vo", vo);
   model.addAttribute("vo_l", vo_l);
   model.addAttribute("rlist",rlist);
   
   return VIEW_PATH + "book_content.jsp";
   }
   
   //구매페이지
   @RequestMapping("/buy.do")
   public String buy(Model model, int idx, String id) {
      idx = Integer.parseInt( request.getParameter("idx") );

      BookVO vo = book_dao.selectOne(idx);
      LoginVO vo_l = login_dao.selectOne_l(id);
      
      model.addAttribute("vo", vo);
      model.addAttribute("vo_l",vo_l);
      return VIEW_PATH + "book_buy.jsp";
   }
   
   //장바구니에서 구매
   @RequestMapping("/buy2.do")
   public String buy2(Model model, String id) {
      int m_idx = 1;
      List<CartVO> list = cart_dao.select(m_idx);
      int total_amount = cart_dao.selectTotalAmount(m_idx);
      
      LoginVO vo_l = login_dao.selectOne_l(id);
      
      System.out.println("1." + list.get(0).getB_name());
      
      model.addAttribute("vo_l",vo_l);
      model.addAttribute("list",list);
      model.addAttribute("total_amount", total_amount);
      return VIEW_PATH + "book_buy_cart.jsp";
   }

   //도서찾기
   @RequestMapping("/search_form.do")
   public String search_form(Model model) {
      //bookdao로 가서 selectlist해서 모든 책의 이름을 가지고온후 아래  jsp에다가 보냄.
      List<BookVO> list=null;
      list=book_dao.selectlist();
      System.out.println( "1." + list );
      System.out.println( "2." + list.size() );
      model.addAttribute("list",list); 
      return VIEW_PATH+"search.jsp";
   }
   
   @RequestMapping("/search.do")
   public String search(String in_name,Model model) {
       
      BookVO search=book_dao.selectOne_search(in_name);
      model.addAttribute("search",search);
      
      return VIEW_PATH+"book_list.jsp";
   }
   
   
   /*
    * @RequestMapping("/login_popup.do") public String login_popup() { return
    * VIEW_PATH+"login_popup.jsp"; }
    */
   
   //구매완료
         @RequestMapping("/paid.do")
         public String paid() {

            return VIEW_PATH + "book_paid.jsp";
         }

         //api
         @RequestMapping("/api.do")
         public String kakaoPayApi() {
           
         return VIEW_PATH + "kakaoPayApi.jsp";
         }
   
   
}

