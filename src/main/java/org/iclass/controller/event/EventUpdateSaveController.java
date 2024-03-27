package org.iclass.controller.event;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iclass.controller.Controller;
import org.iclass.dao.event.EventDao;
import org.iclass.vo.BG_EVENT;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.oreilly.servlet.MultipartRequest;

public class EventUpdateSaveController implements Controller {
    private static final Logger logger = LoggerFactory.getLogger(EventUpdateSaveController.class);

    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // 서버에 전송될 위치(파일시스템 경로)
        String path =  "D:\\Class231228\\upload";

        // 업로드 가능한 최대 크기(바이트)
        int maxSize = 30 * 1024 * 1024; // 1024바이트=1KB, 30MByte로 설정

        // request를 파일을 받을 수 있는 request로 사용해야 합니다. : cos 라이브러리 추가
        MultipartRequest multiRequest = new MultipartRequest(request, path, maxSize, "UTF-8");

        String filename = multiRequest.getFilesystemName("event_image");
        logger.info("::: 파일명-{} :::", filename); // uploadFile
        // 서버의 파일 시스템 C:\\upload 경로에서 파일이 생겼는지 확인하기

        String temp = multiRequest.getParameter("event_seq");
        int event_seq = Integer.parseInt(temp);
        String event_title = multiRequest.getParameter("event_title");
        String event_content = multiRequest.getParameter("event_content");
        String event_image = filename; // 파일명으로 변경

        BG_EVENT vo = BG_EVENT.builder()
                .event_seq(event_seq)
                .event_title(event_title)
                .event_content(event_content)
                .event_image(event_image) // 수정된 notice_image 값을 사용합니다.
                .build();

        EventDao dao = EventDao.getInstance();
        long result = dao.update(vo);

        if (result != 0) {
//            String url = "event/event_seq=" + event_seq;    //실패
//            String url = "read?event_seq=" + event_seq;		//실패
            String url = "event?event_seq=" + event_seq;
//            String url = "read?update=" + event_seq;
            response.sendRedirect(url);
        } else {
            // 메인화면으로 이동
            response.sendRedirect(request.getContextPath());
        }
    	
    }
}
