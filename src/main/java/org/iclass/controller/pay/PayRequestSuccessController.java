package org.iclass.controller.pay;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iclass.controller.Controller;
import org.iclass.dao.menu.MenuDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class PayRequestSuccessController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		log.info(":::::::: 요청 PayRequestSuccessController 처리 시작 : {} ::::::::",request.getServletPath());
		
		
		Map<String,Object> payMap = new HashMap<>();
		payMap.put("paymentType", request.getParameter("paymentType"));
		payMap.put("orderId", request.getParameter("orderId"));
		payMap.put("paymentKey", request.getParameter("paymentKey"));
		payMap.put("amount", request.getParameter("amount"));
		
		log.info("[payMap] : {}",payMap);
		request.setAttribute("payMap", payMap);
		
		int amount = Integer.parseInt(request.getParameter("amount"));
		
		
		String orderId = request.getParameter("orderId");
		String[] temp = orderId.split("_");
		String menu_code = temp[0];			// 메뉴 코드
		String str = temp[1].replace("-",",");	// 옵션 시퀀스
		List<String> option_seq_list = Arrays.asList(str.split(","));
				
		Map<String,Object> map = new HashMap<>();
		map.put("menu_code", menu_code);
		map.put("option_seq_list", option_seq_list);
		log.info("[buyMenuinfo map] : {}",map);
		
		MenuDao dao = MenuDao.getInstance();
		Map<String, Object> item = dao.selectBuyMenuInfo(map);
		
		log.info("[buyMenuinfo] item : {}",item);
		// API 엔드포인트 및 요청 데이터
        String apiUrl = "https://api.tosspayments.com/v1/payments/confirm";
        String paymentKey = request.getParameter("paymentKey");
        //amount , orderId도 필요함.
        
        // Authorization 헤더 생성
        String secretKey = "test_sk_0RnYX2w532ZXMdZoJLqR3NeyqApQ";
        String authorizationHeader = createAuthorizationHeader(secretKey);

        // JSON 데이터 생성
        String jsonData = String.format("{\"paymentKey\":\"%s\",\"amount\":%d,\"orderId\":\"%s\"}", paymentKey, amount, orderId);

        // HTTP POST 요청 보내기
        URL url = new URL(apiUrl);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();

        // 요청 메소드 설정
        connection.setRequestMethod("POST");

        // 헤더 설정
        connection.setRequestProperty("Authorization", authorizationHeader);
        connection.setRequestProperty("Content-Type", "application/json");

        // POST 데이터를 전송 가능하도록 설정
        connection.setDoOutput(true);

        // POST 데이터 전송
        try (DataOutputStream outputStream = new DataOutputStream(connection.getOutputStream())) {
            outputStream.writeBytes(jsonData);
            outputStream.flush();
        }

        // 응답 코드 확인
        int responseCode = connection.getResponseCode();
        log.info("Response Code: {}" , responseCode);
        if(responseCode != 200 && responseCode != 201) 
    		throw new IOException("결제 오류가 발생했습니다.");
        
        String payment=null;
        // 응답 데이터 읽기
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
            String line;
            StringBuilder responseStr = new StringBuilder();
            while ((line = reader.readLine()) != null) {
            	responseStr.append(line);
            }
            payment=responseStr.toString();
       }
       log.info("[payment] : {}",payment);
       
       // 연결 종료
       connection.disconnect();
       request.setAttribute("payment", payment);
       request.setAttribute("item", item);
       RequestDispatcher dispatcher = request.getRequestDispatcher("success.jsp");
       dispatcher.forward(request, response);

		
	}
	
	private static String createAuthorizationHeader(String secretKey) {
        String credentials = secretKey + ":";
        String encodedCredentials = Base64.getEncoder().encodeToString(credentials.getBytes(StandardCharsets.UTF_8));
        return "Basic " + encodedCredentials;
    }

}
