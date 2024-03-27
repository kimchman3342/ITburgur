package org.iclass.controller.notice;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iclass.controller.Controller;
import org.iclass.dao.notice.NoticeDao;
import org.iclass.vo.Notice;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.oreilly.servlet.MultipartRequest;

public class NoticeWriteSaveController implements Controller {
	private static final Logger logger = LoggerFactory.getLogger(NoticeWriteSaveController.class);

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

		// 파일을 첨부하지 않은 경우를 고려하여 처리합니다.
		String notice_image = null;
		if (filename != null) {
			notice_image = filename;
		} else {
			// 파일을 첨부하지 않은 경우에 대한 처리
			// 예를 들어, 디폴트 이미지나 기본값을 사용할 수 있습니다.
			// 여기에 원하는 처리를 추가합니다.
		}

		String notice_title = multiRequest.getParameter("notice_title");
		String notice_content = multiRequest.getParameter("notice_content");

		// 현재 시간을 Timestamp 형식으로 저장
		Timestamp notice_date = new Timestamp(System.currentTimeMillis());

		Notice vo = Notice.builder().notice_title(notice_title).notice_content(notice_content).notice_date(notice_date)
				.notice_image(notice_image) // 수정된 notice_image 값을 사용합니다.
				.build();

		NoticeDao dao = NoticeDao.getInstance();
		long result = dao.write(vo);
		if (result != 0) {
			response.sendRedirect("list");
		} else {
			// 메인화면으로 이동
			response.sendRedirect(request.getContextPath());
		}
	}

}
