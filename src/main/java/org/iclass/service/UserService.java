package org.iclass.service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Map;

import org.iclass.dao.user.UserDao;
import org.iclass.vo.BG_USER;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class UserService {
	private static final Logger logger = LoggerFactory.getLogger(UserService.class);
	private UserDao dao = UserDao.getInstance();
	
////	// password 해싱
	public void join(BG_USER user) {
		try {
			String password = encrypt(user.getUser_password());
			user.setUser_password(password);
			dao.join(user);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
				
	}
	// password 해싱
	public BG_USER login(Map<String,String> map) {
		BG_USER result=null;
		try {
			String password = encrypt(map.get("user_password"));
			map.put("user_password", password);
			result = dao.login(map);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public String encrypt(String text) throws NoSuchAlgorithmException {
		//자바에서는 MessageDigest 클래스가 해싱함수를 제공
		//1) 실행 객체 생성
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        //2) 평문을 저장. byte 배열로 변환하여 저장.
        md.update(text.getBytes());
        //md.digest() 메소드가 해싱함수 실행합니다.해싱결과가 byte[]
        return bytesToHex(md.digest());
    }
	
    private String bytesToHex(byte[] bytes) {
        StringBuilder builder = new StringBuilder();
        for (byte b : bytes) {
        	//byte 배열에서 1바이트씩 가져와 16진수 2자리 문자로 변환
            builder.append(String.format("%02x", b));
        }
        return builder.toString();
    }
    

}
