package org.iclass.dao.menu;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.iclass.mybatis.SqlSessionBean;
import org.iclass.vo.BG_MENU;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class MenuDao {

	private static final Logger logger = LoggerFactory.getLogger(MenuDao.class);
	private static MenuDao dao = new MenuDao();
	
	private MenuDao() {}
	
	public static MenuDao getInstance() {
		return dao;
	}
	
	public List<BG_MENU> menuList() {
		SqlSession sqlSession = SqlSessionBean.getSession();
		List<BG_MENU> list = sqlSession.selectList("bg_menu.menuList");
		logger.info("menuList :{}",list);
		sqlSession.close();
		return list;
	}
	public BG_MENU getOne(String menu_code) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		BG_MENU vo = sqlSession.selectOne("bg_menu.getOne",menu_code);
		logger.info("vo : {}",vo);
		sqlSession.close();
		return vo;
	}
	
	public Map<String, Object> selectBuyMenuInfo(Map<String, Object> map) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		Map<String, Object> info = sqlSession.selectOne("bg_menu.selectBuyMenuInfo",map);
		logger.info("info : {}",info);
		sqlSession.close();
		return info;
	}
	
	public List<BG_MENU> cateList(String category_code) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		List<BG_MENU> list = sqlSession.selectList("bg_menu.cateList",category_code);
		logger.info("cateList :{}",list);
		sqlSession.close();
		return list;
	}
	
}
