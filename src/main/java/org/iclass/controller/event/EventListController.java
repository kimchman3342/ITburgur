package org.iclass.controller.event;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iclass.controller.Controller;
import org.iclass.dao.event.EventDao;
import org.iclass.vo.BG_EVENT;

public class EventListController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EventDao dao = EventDao.getInstance();
		List<BG_EVENT> list = dao.list();
		
		request.setAttribute("event", list);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("event.jsp");
		dispatcher.forward(request, response);
		
	}

}
