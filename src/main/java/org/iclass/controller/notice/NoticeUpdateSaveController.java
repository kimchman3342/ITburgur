package org.iclass.controller.notice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iclass.controller.Controller;
import org.iclass.dao.notice.NoticeDao;
import org.iclass.vo.Notice;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.oreilly.servlet.MultipartRequest;

public class NoticeUpdateSaveController implements Controller {
    private static final Logger logger = LoggerFactory.getLogger(NoticeUpdateSaveController.class);

    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // 서버에 전송될 위치(파일시스템 경로)
        String path =  "D:\\Class231228\\upload";

        // 업로드 가능한 최대 크기(바이트)
        int maxSize = 30 * 1024 * 1024; // 1024바이트=1KB, 30MByte로 설정

        // request를 파일을 받을 수 있는 request로 사용해야 합니다. : cos 라이브러리 추가
        MultipartRequest multiRequest = new MultipartRequest(request, path, maxSize, "UTF-8");

        String filename = multiRequest.getFilesystemName("notice_image");
        logger.info("::: 파일명-{} :::", filename); // uploadFile
        // 서버의 파일 시스템 C:\\upload 경로에서 파일이 생겼는지 확인하기

        String temp = multiRequest.getParameter("notice_seq");
        int notice_seq = Integer.parseInt(temp);
        String notice_title = multiRequest.getParameter("notice_title");
        String notice_content = multiRequest.getParameter("notice_content");
        String notice_image = filename; // 파일명으로 변경

        Notice vo = Notice.builder()
                .notice_seq(notice_seq)
                .notice_title(notice_title)
                .notice_content(notice_content)
                .notice_image(notice_image) // 수정된 notice_image 값을 사용합니다.
                .build();

        NoticeDao dao = NoticeDao.getInstance();
        long result = dao.update(vo);

        if (result != 0) {
            String url = "read?notice_seq=" + notice_seq;
            response.sendRedirect(url);
        } else {
            // 메인화면으로 이동
            response.sendRedirect(request.getContextPath());
        }
    	
    }
}
