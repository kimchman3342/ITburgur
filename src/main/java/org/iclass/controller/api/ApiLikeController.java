package org.iclass.controller.api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.iclass.controller.Controller;
import org.iclass.dao.event.EventDao;
import org.iclass.vo.BG_EVENT;
import org.iclass.vo.BG_USER;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fasterxml.jackson.databind.ObjectMapper;

public class ApiLikeController implements Controller {
	private static final Logger logger = LoggerFactory.getLogger(ApiLikeController.class);
	
    private final EventDao eventDao = EventDao.getInstance();

    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	request.setCharacterEncoding("UTF-8");
    	
    	InputStream inputStream = request.getInputStream();
    	BufferedReader br = new BufferedReader(new InputStreamReader(inputStream, StandardCharsets.UTF_8));
        StringBuffer sb = new StringBuffer();
        String line;
        
        while((line = br.readLine()) != null) {
			sb.append(line);
		}
		logger.info("JSON data: {}",sb.toString());
		
		ObjectMapper objMapper = new ObjectMapper();
		String json = sb.toString();
        String eventId = null;
        try {
            eventId = objMapper.readTree(json).get("eventId").asText();
            
        } catch (Exception e) {
            logger.error("Failed to parse JSON data: {}", e.getMessage());
        }
        int event_Id = Integer.parseInt(eventId); 
        int result =0;
        String message =null;
        if (eventId != null && !eventId.isEmpty()) {
        	HttpSession session = request.getSession();
        	BG_USER user = (BG_USER) session.getAttribute("user");
            // 좋아요 처리
        	result = eventDao.updateLikeUser(event_Id,user.getUser_id());		//result  1이면 정상 좋아요 처리완료, -1이면 이미 좋아요했음. 0이면 오류
            if(result==1) {
            	eventDao.updateLikeCount(event_Id);
            	message ="이 이벤트에 좋아요를 해주셨어요!";
            }else if(result==-1) {
            	message ="이미 좋아요한 이벤트 입니다!";
            }
        }
        
        if(result==0) {
        	message ="좋아요 처리 중 오류가 발생했습니다.";
        }
        
        ObjectMapper objmapper = new ObjectMapper();
        Map<String,Object> data = new HashMap<>();
		data.put("message", message);
		data.put("result", result);
		String jsonData = objmapper.writeValueAsString(data);
        
        // 클라이언트에게 응답을 반환
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
        response.setContentType("text/plain;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.print(jsonData);
    }
}

