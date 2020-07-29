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
import dao.QnaDAO;
import vo.QnaVO;

@Controller
public class QnaController {

	QnaDAO qna_dao;

	public void setQna_dao(QnaDAO qna_dao) {
		this.qna_dao = qna_dao;
	}

	@Autowired
	HttpServletRequest request;

	// qna목록보기
	@RequestMapping("/qna.do")
	public String qna(Model model, Integer page) {
		int nowPage = 1;

		if (page != null) {
			nowPage = page;
		}

		// 한 페이지에 표시되는 게시물의 시작과 끝번호를 계산
		int start = (nowPage - 1) * Common.Board.BLOCKLIST + 1;
		int end = start + Common.Board.BLOCKLIST - 1;

		// start와 end를 맵에 저장
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		
		// 게시글 전체목록 가져오기
		List<QnaVO> list = null;
		list = qna_dao.selectList(map);
		
		System.out.println("list가져와서다음작업");
		
		// 전체 게시물 수 구하기
		int row_total = qna_dao.getRowTotalqna();

		// Paging클래스를 사용하여 페이지 메뉴 생성하기
		String pageMenu = Paging.getPaging("qna.do", nowPage, row_total, Common.Board.BLOCKLIST,
				Common.Board.BLOCKPAGE);// 현재페이지 메핑,지금현재페이지,게시물전체갯수,한페이지에 표시할 게시물 수,페이지메뉴수
		
		System.out.println("row_total:"+row_total);
		
		int idx=0;
		if(list.size() != 0) {
			idx=list.get(0).getIdx();
		}
		
		System.out.println("idx:"+idx);
		
		model.addAttribute("idx",idx);
		model.addAttribute("list", list);
		model.addAttribute("pageMenu", pageMenu);

		//세션에 기록되어 있던 show정보를 삭제
		request.getSession().removeAttribute("show");
		
		
		
		
		return Common.BOARD_VIEW_PATH + "qna_list.jsp";
	}

	
	@RequestMapping("/qna_view.do")
	public String view( Model model, int idx ) {
	 //view.do?idx=25
	  
	 //idx에 해당하는 게시글 한 건 얻어오기 
		QnaVO vo= qna_dao.selectOne(idx);
	  
		//조회수 증가
		//새로고침했을대 조회수 증가 막기위함.
		HttpSession session=request.getSession();
		String show=(String)session.getAttribute("show");
		if(show == null) {
			qna_dao.update_readhit(idx);
			session.setAttribute("show", "yes");
		}
	  
		//
		QnaVO re=qna_dao.selectOne_re(idx);
		
		
	  model.addAttribute("vo", vo);
	  model.addAttribute("re",re);
	  
	  return Common.BOARD_VIEW_PATH + "qna_view.jsp";//바인딩,포워딩이 필요한경우.
	  
	  }
	 

	// 게시글 작성
	@RequestMapping("/insert_form.do")
	public String insert_form(Model model,int idx) {
		
		model.addAttribute("idx",idx);
		return Common.BOARD_VIEW_PATH + "qna_write.jsp";
	}

	//게시글 등록
	@RequestMapping("/insert.do")
	public String insert(QnaVO vo) {
		
		System.out.println(vo.getIdx());
		vo.setIdx(vo.getIdx()+1);
		System.out.println(vo.getIdx());
		//접속자의 ip구하기
		String ip=request.getRemoteAddr();
		vo.setIp(ip);
		
		//체크할경우
		if(vo.getCh()==1) {
			qna_dao.ch_insert(vo);
			
		}else if(vo.getCh() != 1) {//체크안할경우
			//DB에 insert
			qna_dao.insert(vo); 
		
		}
		
		
		
		return "redirect:qna.do";
	}

	@RequestMapping("/del.do")
	@ResponseBody
	public String delete( int idx, String pwd ) {
		QnaVO baseVO= qna_dao.selectOne(idx, pwd);//idx에 해당하는 정보를 들고옴.

		String result="no";

		if( baseVO == null ) {//비밀번호가 없을경우.틀릴경우
			return result;
		}

		//찾아온 게시글의 정보를 수정
		baseVO.setName("known");

		int res=qna_dao.del_update(baseVO);
			
		if( res == 1 ) {
			result="yes";
		}
		
		//파라미터로 넘겨주는 idx보다 큰 idx값들을 전부 -1씩 시켜줌.
		qna_dao.del_idx_update(idx);
		 
		return result;

	}
	
	//글 수정 폼으로 이동하기
		@RequestMapping("/modify_form_qna.do")
		public String modify_form( Model model,int idx ) {
			
			QnaVO vo= qna_dao.selectOne(idx);
			
			if( vo != null) {
				model.addAttribute("vo",vo);
			}
			
			return Common.BOARD_VIEW_PATH + "qna_modify_form.jsp";
			
		}
	
	//글 수정
		@RequestMapping("/modify.do")
		public String modify( HttpServletRequest request, QnaVO vo ) {
				
			String ip=request.getRemoteAddr();
			vo.setIp(ip);
				
			qna_dao.update(vo);
			return "redirect:qna.do";
				
		}	
		
	
	  //댓글을 달기위한 페이지로 전환
	  
	  @RequestMapping("/reply_form.do") 
	  public String reply_form() { 
		  return Common.BOARD_VIEW_PATH +"qna_reply.jsp"; 
		  }
	 

	
	 //댓글달기
	  @RequestMapping("/reply.do") 
	  public String reply( QnaVO vo,String page ) { //idx를 사용하여 게시물 정보얻기
	  QnaVO baseVo=qna_dao.selectOne(vo.getIdx());//내가 댓글 달고싶은 곳의 정보
	  
	  //del_info를 이용
	  qna_dao.update_re(vo.getIdx());
	  
	  //기준글의 step보다 큰값은 모두 step=step +1처리하기 
	  qna_dao.update_step(baseVo);
	  
	  
	  //달고자 하는 댓글을 vo에 포장 
	  String ip=request.getRemoteAddr(); 
	  vo.setIp(ip);
	 
	  //해당문의의 idx와 같게만들어줌.
	  vo.setRef(vo.getIdx());
	  vo.setSubject("d");
	  vo.setPwd("1234");
	  
	  vo.setRef(baseVo.getRef()); 
	  vo.setStep(baseVo.getStep()+1);
	  vo.setDepth(baseVo.getDepth()+1);
	  
	  //댓글등록 
	  qna_dao.reply(vo);
	  
	 return "redirect:qna.do?page="+page; 
	 }
	 
	  
	 // @RequestMapping("/check.do")
	//  public String check(Model model,int c) {
		  
	//	  model.addAttribute("check",c);
		  
	//	  return Common.BOARD_VIEW_PATH+"qna_list.jsp";
	 // }
	  
}
