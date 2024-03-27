package org.iclass.controller.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.iclass.controller.Controller;
import org.iclass.dao.user.UserDao;
import org.iclass.vo.BG_USER;

public class UserDropController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = ((BG_USER)session.getAttribute("user")).getUser_id();
		
		UserDao dao = UserDao.getInstance();
		dao.drop(id);
		session.invalidate();		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/member/drop.jsp");
		dispatcher.forward(request, response);
	}

}
