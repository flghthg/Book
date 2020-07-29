package com.korea.book;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.ReviewDAO;
import vo.ReviewVO;

@Controller
public class ReviewController {

	ReviewDAO review_dao;
	
	public void setReview_dao(ReviewDAO review_dao) {
		this.review_dao = review_dao;
	}
	
	public static final String R_VIEW_PATH = "WEB-INF/views/book/";
	
	@Autowired
	HttpServletRequest request;
	
	@RequestMapping("/review.do")
	public String review(ReviewVO vo) {
		System.out.println("들어옴ㅁㅁㅁㅁㅁㅁ");
		System.out.println(vo.getName());
		//vo.setName(name);//session으로 넘어오는 이름을 저장해줄것.
		
		review_dao.insert(vo);
		
		return R_VIEW_PATH+"book_list.jsp";//booklist보여지는 곳으로 다시 돌아감.
	}
	
}
