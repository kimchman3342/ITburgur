package org.iclass.controller.user;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.iclass.controller.Controller;
import org.iclass.dao.user.UserDao;
import org.iclass.service.UserService;
import org.iclass.vo.BG_USER;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fasterxml.jackson.databind.ObjectMapper;

public class UserModifyController implements Controller{
	private static final Logger logger = LoggerFactory.getLogger(UserModifyController.class);
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		InputStream inputStream = request.getInputStream();
		BufferedReader br = new BufferedReader(new InputStreamReader(inputStream , StandardCharsets.UTF_8));
		StringBuffer sb = new StringBuffer();
		String line = null;
		
		while((line = br.readLine()) != null) {
			sb.append(line);
		}
		logger.info("json : {}",sb.toString());
		
		ObjectMapper objMapper = new ObjectMapper();
		BG_USER user = objMapper.readValue(sb.toString(), BG_USER.class);
		
		logger.info("user : {}",user);
		
		UserDao dao = UserDao.getInstance();
		try {
			user.encryptPassword();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}

		dao.modify(user); // 수정된 user 객체를 사용하여 데이터베이스 수정
		
		
		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		
		
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("회원정보가 수정되었습니다.");
	}

}


// 포토리뷰 등 커뮤니티 하나 만들어서 적용