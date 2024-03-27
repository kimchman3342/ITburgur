package org.iclass.controller.event;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iclass.controller.Controller;
import org.iclass.dao.event.EventDao;

public class EventDeleteController implements Controller {
    
    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String eventSeqStr = request.getParameter("event_seq");
        if (eventSeqStr == null || eventSeqStr.isEmpty()) {
            response.getWriter().write("fail"); // 요청 파라미터가 잘못된 경우 처리
            return;
        }
        
        int event_Seq = Integer.parseInt(eventSeqStr);
        EventDao eventDao = EventDao.getInstance();
        
        // 삭제 작업 수행
        
        eventDao.delete(event_Seq);
		
		  int success = eventDao.delete(event_Seq);
		  
		  if (success == 0) { 
			  response.sendRedirect("event?page="+eventSeqStr);
//			  response.getWriter().write("success");
			  } // 삭제 성공 시 응답 
		  else { response.getWriter().write("fail"); }// 삭제 실패 시 응답 
		 
    }
    
}