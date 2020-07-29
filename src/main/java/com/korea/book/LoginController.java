package com.korea.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import common.Common;
import dao.LoginDAO;
import vo.LoginVO;


@Controller

public class LoginController { 



	LoginDAO login_dao; 
	public void setLogin_dao(LoginDAO login_dao) {
		this.login_dao = login_dao;  
	} 
	
	@Autowired
	HttpServletRequest request;

	@RequestMapping(value={"/login_form.do"}) 

	public String login_form(){

		return Common.LOGIN_VIEW_PATH+"login.jsp";

	}

	@RequestMapping ("/login_check.do") 
	@ResponseBody
	public String check(Model model,String u_id,String u_pwd) {

		String res="0";

		LoginVO basevo =  login_dao.selectOne(u_id); 

		//아이디 없으면
		if(basevo==null) {

			res=String.format("[{'result':'%s'}]", "0");

		}else {
			if(!u_pwd.equalsIgnoreCase(basevo.getU_pwd())){

				res=String.format("[{'result':'%s'}]", "1");

			}else {

				res=String.format("[{'result':'%s'}, {'userId':'%s'}]", "2", u_id);

			}  
		}
		
		return res;
	}

//로그인 성공 페이지 넘어가는 쪽
	@RequestMapping("/login.do")
	public String login_success(Model model, LoginVO vo){
		/* String u_id,String u_pwd */
	    HttpSession session = request.getSession();
	    
        session.setAttribute("Success_id", vo.getU_id());
        session.setAttribute("Success_pwd", vo.getU_pwd());
		/* model.addAttribute("Successid", u_id); 세션했으니까 모델 필요없*/

		return Common.LOGIN_VIEW_PATH+"loginSuccess.jsp"; 

	}
	
	//로그아웃폼
	@RequestMapping("/logout.do")
	public String logout() {
		
		HttpSession session = request.getSession();
		session.removeAttribute("Success_id");
		session.removeAttribute("Success_pwd");
		
		return "redirect:login_form.do";
		
	}

	@RequestMapping("/movejoin.do")
	public String join_form() {

		return Common.LOGIN_VIEW_PATH +"join.jsp";   
	}


	@RequestMapping("/id_check.do")
	@ResponseBody 
	public String join_check(Model model,String u_id) {
		
		String idcheck_number; 
		
		LoginVO basevo2 = login_dao.check_id(u_id);
		if(basevo2!=null) {
 
			idcheck_number =String.format("[{'result':'%s'}]", "0"); 

		}else {
			
			idcheck_number =String.format("[{'result':'%s'}]", "1");
			
		}
		return idcheck_number;
	}
	//컨트롤러는 반환타입 무조건 스트링..
	
	@RequestMapping("/information_check.do")
	@ResponseBody
	public String information_check (Model model,LoginVO vo) {

		
        String inputresult;
		int getinsertres =login_dao.insert(vo);   
		
		if(getinsertres==1) {
		inputresult=String.format("[{success:%s}]",getinsertres);
		}else {
		inputresult=String.format("[{success:%s}]",getinsertres);
		}
		return inputresult;

	}
	
	//회원정보 수정 폼이동
	@RequestMapping("/updateform.do")
	public String updateform(Model model, String u_id){  
		
		
		LoginVO vo =  login_dao.selectOne(u_id);   
		
		if( vo != null ) {
			model.addAttribute("vo", vo);
		}
		return Common.LOGIN_VIEW_PATH+"updateinfo.jsp";
		
	}
	//회원정보 수정 업로드
	@RequestMapping("/modify_form.do")
	@ResponseBody
	public String update(LoginVO vo){
		
		String result;
		int getmodifyres = login_dao.modify(vo, request);
		if(getmodifyres==1) {
			
			result=String.format("[{'success':'%s'}]",getmodifyres);
			
		}else {
			result=String.format("[{'success':'%s'}]", getmodifyres);
			
		}
		
		return result;
		
	}
	

}
