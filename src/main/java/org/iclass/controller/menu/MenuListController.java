package org.iclass.controller.menu;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iclass.controller.Controller;
import org.iclass.dao.menu.MenuDao;
import org.iclass.vo.BG_MENU;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class MenuListController implements Controller{
	
	private static final Logger logger = LoggerFactory.getLogger(MenuListController.class);


	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.info(":::::::: 요청 MenuListController 처리 시작 : {} ::::::::",request.getServletPath());
		
		
		MenuDao dao = MenuDao.getInstance();
		List<BG_MENU> list = dao.menuList();
		
		request.setAttribute("menuList", list);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("list.jsp");
		dispatcher.forward(request, response);
		
		
	}
}
