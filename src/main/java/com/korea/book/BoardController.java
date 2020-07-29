package com.korea.book;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import common.Common;
import common.Paging;
import dao.BoardDAO;
import dao.QnaDAO;
import vo.BoardVO;
import vo.QnaVO;

@Controller
public class BoardController {

	BoardDAO board_dao;
	
	public void setBoard_dao(BoardDAO board_dao) {
		this.board_dao = board_dao;
	}

	@Autowired
	HttpServletRequest request;

	//전체게시물
	@RequestMapping( value= {"/list.do"} )
	public String list( Model model, Integer page) {

		int nowPage= 1;

		if( page != null) {
			nowPage =page;
		}

		//한 페이지에 표시되는 게시물의 시작과 끝번호를 계산
		int start = ( nowPage - 1 ) * Common.Board.BLOCKLIST +1;
		int end=start +Common.Board.BLOCKLIST -1;

		//start와 end를 맵에 저장
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("start",start);
		map.put("end",end);


		//게시글 전체목록 가져오기
		List<BoardVO> list=null;
		list=board_dao.selectList(map);
 
		//전체 게시물 수 구하기
		int row_total=board_dao.getRowTotal();

		//Paging클래스를 사용하여 페이지 메뉴 생성하기
		String pageMenu= Paging.getPaging(
				"list.do", nowPage, row_total, 
				Common.Board.BLOCKLIST, 
				Common.Board.BLOCKPAGE);//현재페이지 메핑,지금현재페이지,게시물전체갯수,한페이지에 표시할 게시물 수,페이지메뉴수

		model.addAttribute("list",list);
		model.addAttribute("pageMenu",pageMenu);

		//세션에 기록되어 있던 show정보를 삭제
		request.getSession().removeAttribute("show");

		return Common.BOARD_VIEW_PATH + "board_list.jsp";
	}


	//게시글 보기
	@RequestMapping("/view.do")
	public String view( Model model, int idx ) {
		//view.do?idx=25

		//idx에 해당하는 게시글 한 건 얻어오기
		BoardVO vo= board_dao.selectOne(idx);

		model.addAttribute("vo", vo);

		return Common.BOARD_VIEW_PATH + "board_view.jsp";//바인딩,포워딩이 필요한경우.

	}
	

}















