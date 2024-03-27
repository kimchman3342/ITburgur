package org.iclass.controller.api;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iclass.controller.Controller;
import org.iclass.dao.user.UserDao;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ApiCheckIdController implements Controller{
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ObjectMapper objmapper = new ObjectMapper();
		UserDao ud = UserDao.getInstance();
		int result = ud.isExistId(request.getParameter("user_id"));
		log.info("Result: {}" , result);
		
		Map<String,Integer> data = new HashMap<>();
		data.put("isExist", result);
		String jsonData = objmapper.writeValueAsString(data);
		
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.print(jsonData);
		
	}

}
