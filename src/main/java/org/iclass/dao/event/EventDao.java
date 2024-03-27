package org.iclass.dao.event;

import java.sql.Clob;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.iclass.vo.BG_EVENT;


import org.iclass.mybatis.*;

public class EventDao {
	private static EventDao dao = new EventDao();
	private EventDao() {}
	
	public static EventDao getInstance() {
		return dao;
	}
	
	public static Clob clobConvert(String temp) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		Clob clob =null;
		try {
			clob = sqlSession.getConnection().createClob();
			clob.setString(1,temp);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return clob;
	}

	public List<BG_EVENT> list() {
		SqlSession sqlSession = SqlSessionBean.getSession();
		List<BG_EVENT> list = sqlSession.selectList("event.listAll");
		sqlSession.close();
		return list;
	}
	
	public BG_EVENT EventOne(int idx) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		BG_EVENT event = sqlSession.selectOne("event.getOne",idx);
		sqlSession.close();
		return event;
	}
	
	public int insert(BG_EVENT event) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		int result = sqlSession.insert("event.insert",event);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	
	public int delete(int idx) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.delete("event.delete",idx);
		mapperSession.commit();
		mapperSession.close();
		return result;
	}
	
	public BG_EVENT read(int idx) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		BG_EVENT vo = mapperSession.selectOne("event.getOne",idx);
		mapperSession.close();
		return vo;
	}
	
	public int update(BG_EVENT event) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.update("event.update",event);
		mapperSession.commit();
		mapperSession.close();
		return result;
	}
	public BG_EVENT selectByIdx(int idx) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		BG_EVENT vo = mapperSession.selectOne("event.selectByIdx",idx);
		mapperSession.close();
		return vo;
	}
	  public boolean updateLikeCount(int eventId) {
	        try (SqlSession sqlSession = SqlSessionBean.getSession()) {
	            int result = sqlSession.update("event.updateLikeCount", eventId);
	            sqlSession.commit();
	            return result > 0; // 업데이트가 성공했을 경우 true 반환
	        } catch (Exception e) {
	            e.printStackTrace();
	            return false; // 업데이트가 실패했을 경우 false 반환
	        }
	    }
	    public int updateLikeUser(int eventId,String userid) {
	    	SqlSession sqlSession = SqlSessionBean.getSession();
	    	List<String> users = sqlSession.selectList("event.getLikeUsers",eventId);
	    	int result =0;
	    	if(users.contains(userid)) result=-1;
	    	else {
	    		Map<String,Object> map = new HashMap<>();
	    		map.put("userId", userid);
	    		map.put("eventId", eventId);
	    		
	    		result = sqlSession.insert("event.addLikeUser",map);
	    		sqlSession.commit();
	    	}
	    	sqlSession.close();
	    	return result;
	    }
	}


