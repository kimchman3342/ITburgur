package org.iclass.controller.user;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.iclass.controller.Controller;
import org.iclass.service.UserService;
import org.iclass.vo.BG_USER;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginActionController implements Controller {
    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("user_id");
        String password = request.getParameter("user_password");
        log.info(password);
        HttpSession session = request.getSession();
        
        Map<String, String> map = new HashMap<>();
        map.put("user_id", id);
        map.put("user_password", password);
        UserService service = new UserService();
        BG_USER user = service.login(map);

        String url = request.getContextPath();
        if (user != null) {
            session.setAttribute("user", user);

            // 자동 로그인 쿠키 생성
            Cookie autoLoginCookie = new Cookie("autoLogin", id + ":" + password);
            autoLoginCookie.setMaxAge(60 * 60 * 24 * 30); // 30일 유지되는 쿠키
            autoLoginCookie.setPath("/");
            response.addCookie(autoLoginCookie);
        } else {
            Cookie cookie = new Cookie("incorrect", "y");
            cookie.setPath("/");
            response.addCookie(cookie);
            url = "login";
        }

        response.sendRedirect(url);
    }
}