package org.iclass.dao.notice;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.iclass.mybatis.SqlSessionBean;
import org.iclass.vo.Notice;
import org.iclass.vo.Paging;

public class NoticeDao {
	private static NoticeDao dao = new NoticeDao();
	private NoticeDao() {}
	public static NoticeDao getInstance() {
		return dao;
	}

	public List<Notice> list(Paging paging) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		List<Notice> list = mapperSession.selectList("bg_notice.getList",paging);
		mapperSession.close();
		return list;
	}
	
	public int count(Map<String, String> map) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.selectOne("bg_notice.count",map);
		mapperSession.close();
		return result;
	}
	
	public Notice read(int idx) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		Notice vo = mapperSession.selectOne("bg_notice.getOne",idx);
		mapperSession.close();
		return vo;
	}
	
	public int write(Notice notice) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.insert("bg_notice.insert",notice);
		mapperSession.commit();
		mapperSession.close();
		return result;
	}
	
	public int update(Notice notice) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.update("bg_notice.update",notice);
		mapperSession.commit();
		mapperSession.close();
		return result;
	}
	
	public int delete(int idx) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.update("bg_notice.delete",idx);
		mapperSession.commit();
		mapperSession.close();
		return result;
	}
	
	public int setReadCount(int idx) {
		SqlSession session = SqlSessionBean.getSession();
		int result = session.update("bg_notice.setReadCount", idx);
		session.commit();
		session.close();
		return result;
	}

	
	
}
