package org.iclass.dao.buy;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.iclass.vo.BG_BUYS;
import org.iclass.vo.BG_BUYMENU;
import org.iclass.mybatis.SqlSessionBean;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class BuyDao {
	private static final Logger logger = LoggerFactory.getLogger(BuyDao.class);
	private static BuyDao dao = new BuyDao();
	private BuyDao() {}
	public static BuyDao getInstance() {
		return dao;
	}
	
	
	public int insert(BG_BUYS vo) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		int result=0;	
		try{
			result = sqlSession.insert("bg_buy.insert",vo);
			sqlSession.commit();
		}catch(Exception e) {
			logger.warn("구매 오류 : {}",e.getMessage());
			sqlSession.rollback();
		}finally {
			sqlSession.close();
		}	
		return result;
	}
	
	public List<BG_BUYS> selectbyuser_id(String user_id) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		List<BG_BUYS> list = sqlSession.selectList("bg_buy.selectbyuser_id",user_id);
		sqlSession.close();
		
		
		return list;
		
	}
	
	public List<BG_BUYMENU> selectBybuymenu(String user_id) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		List<BG_BUYMENU> list = sqlSession.selectList("bg_buy.selectBybuymenu",user_id);
		sqlSession.close();
		return list;
	}

	public void buymenu() {
		
	}
}
