package com.korea.book;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import common.Common;
import dao.CartDAO;
import vo.CartVO;

@Controller
public class CartController {

   CartDAO cart_dao;

   
   public void setCart_dao(CartDAO cart_dao) {
      this.cart_dao = cart_dao;
   }
   
   @Autowired
   HttpServletRequest request;
   
   
   //장바구니 리스트 검색
   @RequestMapping("/cart_list.do")
   public String list( Model model, int m_idx ) {
      
   
      
   List<CartVO> list = cart_dao.select(m_idx);
   int total_amount = cart_dao.selectTotalAmount(m_idx);
   
   System.out.println("m_idx"+m_idx);
   
   model.addAttribute("list",list);
   model.addAttribute("total_amount", total_amount);
   return Common.VIEW_PATH+"cart/cart.jsp";
   }
   
   //장바구니 삭제 기능
   @RequestMapping("/cart_delete.do")
   public String del(Model model,int c_idx) {
      
      System.out.println("C_IDX:"+c_idx);
      int m_idx = 1;
      
      //장바구니에서 항목 삭제
      
      cart_dao.delete(c_idx);
      
      List<CartVO> list = cart_dao.select(m_idx);
      int total_amount = cart_dao.selectTotalAmount(m_idx);
      
      model.addAttribute("list", list);
      model.addAttribute("total_amount", total_amount);
      
      return Common.VIEW_PATH+"cart/cart.jsp";
      
   }
   
   //장바구니 항목 추가 
      @RequestMapping("/cart_insert.do")
      @ResponseBody
      public String insert( CartVO vo ) {
         
         //이미 장바구니에 등록된 상품이 있는지 확인
         CartVO res_vo = cart_dao.selectOne(vo);
         
         System.out.println("res_vo:" + res_vo);
         
         String result = " no";
         if(res_vo == null) {
            result = "yes";
                           
            //장바구니에 상품 등록
            cart_dao.insert(vo);
         }
         
         
         
         String resultStr = String.format("[{'result':'%s'}, {'m_idx':'%s'}]", result, vo.getM_idx());
         //response.getWriter().println(resultStr);
         return resultStr;
      }   
   //장바구니 업데이트 
   @RequestMapping("/cart_update.do")
   public String update(Model model,int c_idx,int c_cnt) {
      int m_idx = 1;
      
      //수량 업데이트
      cart_dao.update_cnt(c_idx, c_cnt);
      
      //장바구니 목록 조회
      List<CartVO> list = cart_dao.select(m_idx);
      int total_amount = cart_dao.selectTotalAmount(m_idx);
      
      model.addAttribute("list", list);
      model.addAttribute("total_amount", total_amount);
      
      return "redirect:cart_list.do";
   }
   
}