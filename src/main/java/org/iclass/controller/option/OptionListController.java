package org.iclass.controller.option;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iclass.controller.Controller;
import org.iclass.dao.menu.MenuDao;
import org.iclass.dao.option.OptionDao;
import org.iclass.vo.BG_MENU;
import org.iclass.vo.BG_MENU_OPTION;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class OptionListController implements Controller{
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		log.info(":::::::: 요청 OptionListController 처리 시작 : {} ::::::::",request.getServletPath());
		
		String menu_code = request.getParameter("menu_code");
		
		log.info("파라미터 [메뉴 코드] : {} ", menu_code);
		
		OptionDao optionDao = OptionDao.getInstance();
		MenuDao menuDao = MenuDao.getInstance();
		
		List<BG_MENU_OPTION>  optionList =  optionDao.optionList(menu_code);
		BG_MENU menuVO = menuDao.getOne(menu_code);

		log.info("리턴 Attribute [optionList] : {} ", optionList);
		log.info("리턴 Attribute [menuVO] : {} ", menuVO);
		
		request.setAttribute("optionList", optionList);
	    request.setAttribute("menuVO", menuVO);
	    
		RequestDispatcher dispatcher = request.getRequestDispatcher("list.jsp");
		dispatcher.forward(request, response);
		
	}
}
