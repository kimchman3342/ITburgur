package org.iclass.controller.buy;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.iclass.controller.Controller;
import org.iclass.dao.buy.BuyDao;
import org.iclass.vo.BG_BUYMENU;
import org.iclass.vo.BG_USER;


import lombok.extern.slf4j.Slf4j;

@Slf4j

public class MyListController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		  String user_id = request.getParameter("user_id");
		
		  HttpSession session = request.getSession();
		  BG_USER user = (BG_USER) session.getAttribute("user");
		  log.info("my user : {}",user);
		  try {
			  BuyDao dao = BuyDao.getInstance();
			  List<BG_BUYMENU> mylist = dao.selectBybuymenu(user.getUser_id());
//			  log.info("mylist : {}",mylist);
//			  if(mylist==null || !user.getUser_id().equals("admin")) throw new RuntimeException();
			  request.setAttribute("mylist", mylist);			
		} catch (Exception e) {
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("mylist.jsp");
		dispatcher.forward(request, response);
		
		
		
//		  List<BG_BUYS> list = dao.selectbyuser_id(user_id);
//		  request.setAttribute("mylist", list);
//		BuyDao dao = new BuyDao();
		
//		List<BG_BUYMENU> list = dao.selectBybuymenu(request.getParameter("user_id"));
//		log.info("mylist:",list);
//		
//		//(List) 자바 객체를 json 문자열로 변환
//		//1)아이디 중복검사가 아닌 고객 조회이면 사용하기
//		ObjectMapper objMapper = new ObjectMapper();
//		String jsonData = null;
//		jsonData = objMapper.writeValueAsString(list);
//		log.info("전송할 json 문자열 : {}", jsonData);
//		
//		response.setContentType("application/json; charset=UTF-8");
//		PrintWriter out = response.getWriter();
//		out.print(jsonData);
		
//		int result=0;
//		if(list!=null) result=1;
//		//2)아이디 중복검사인 경우에는 json 으로 있다 또는 없다 에 대한 값으로 전달하기
//		String jsonData = "{ \"result\" :"+result+"}";
//		response.setContentType("application/json;charset=UTF-8");
//		response.getWriter().print(jsonData);


	}

}
