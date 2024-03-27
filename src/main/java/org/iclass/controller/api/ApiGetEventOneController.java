package org.iclass.controller.api;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iclass.controller.Controller;
import org.iclass.dao.event.*;
import org.iclass.vo.BG_EVENT;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fasterxml.jackson.databind.ObjectMapper;

public class ApiGetEventOneController implements Controller{
	private static final Logger logger = LoggerFactory.getLogger(ApiGetEventOneController.class);
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ObjectMapper objmapper = new ObjectMapper();
		String jsonData =null;
		try {
			int idx = Integer.parseInt(request.getParameter("idx"));
			logger.info("idx :{}",idx);
			EventDao dao = EventDao.getInstance();
			BG_EVENT event = dao.EventOne(idx);
			jsonData = objmapper.writeValueAsString(event);
			logger.info("result :{}",event);
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(jsonData);
		
	}

}
