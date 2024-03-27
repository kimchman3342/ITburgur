package org.iclass.controller.pay;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iclass.controller.Controller;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class PayRequestFailController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String,Object> payErr = new HashMap<>();
		
		payErr.put("code", request.getParameter("code"));
		payErr.put("orderId", request.getParameter("orderId"));
		payErr.put("message", request.getParameter("message"));
		
		log.info("payErr : {}",payErr);
		request.setAttribute("payErr", payErr);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("reqfail.jsp");
		dispatcher.forward(request, response);
	}

}
