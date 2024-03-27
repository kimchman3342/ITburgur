package org.iclass.dao.user;

import java.util.Date;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.iclass.mybatis.SqlSessionBean;
import org.iclass.vo.BG_USER;

public class UserDao {

	private static UserDao dao = new UserDao();
	private UserDao() {}
	public static UserDao getInstance() {
		return dao;
	}
	
	public void join(BG_USER user) {
	    
		Date now = new Date();

	    user.setJoinDate(now); 
		SqlSession sqlSession = SqlSessionBean.getSession();
		sqlSession.insert("bg_user.join",user);
		sqlSession.commit();
		sqlSession.close();
	}
	
	public void modify(BG_USER user) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		sqlSession.update("bg_user.modify",user);
		sqlSession.commit();
		sqlSession.close();
	}
	
	
	public BG_USER login(Map<String, String> map) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		BG_USER vo = sqlSession.selectOne("bg_user.login",map);
		sqlSession.close();
		return vo;
	}
	
	public int isExistId(String user_id) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		int result = sqlSession.selectOne("bg_user.isExistId",user_id);
		return result;
	}
	
	public BG_USER getById(String id) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		BG_USER vo = sqlSession.selectOne("bg_user.getById",id);
		return vo;
	}
	
	public BG_USER getUserPassword(String pw) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		BG_USER vo = sqlSession.selectOne("bg_user.getUserPassword",pw);
		return vo;
	}
	
	public void drop(String id) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		sqlSession.update("bg_user.drop",id);
		sqlSession.commit();
		sqlSession.close();
	}

}

