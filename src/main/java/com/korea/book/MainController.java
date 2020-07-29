package com.korea.book;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import common.Common;
import dao.MainDAO;
import vo.MainVO;

@Controller
public class MainController {

	MainDAO main_dao;
	
	public void setMain_dao(MainDAO main_dao) {
		
		this.main_dao = main_dao;
	}
	
	@Autowired
	HttpServletRequest request;
	
	@RequestMapping(value= {"/","/main.do"})
	public String list(Model model) {
		List<MainVO> list = main_dao.selectList();
		model.addAttribute("list",list);
		return Common.VIEW_PATH+"main/mainview.jsp";
	}
	
	@RequestMapping("main_insert.do")
		public String insert(MainVO vo) {
		
		System.out.println(vo.getPrice());
		System.out.println(vo.getThumbnail());
		System.out.println(vo.getTitle());
		
		String ip = request.getRemoteAddr();

		
		vo.setIp(ip);
		System.out.println(vo.getIp());
		
		main_dao.insert(vo);
		
		return "redirect:main.do";
		}
}

