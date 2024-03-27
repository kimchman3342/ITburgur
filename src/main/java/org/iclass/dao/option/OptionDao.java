package org.iclass.dao.option;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.iclass.mybatis.SqlSessionBean;
import org.iclass.vo.BG_MENU_OPTION;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class OptionDao {

	private static final Logger logger = LoggerFactory.getLogger(OptionDao.class);
	private static OptionDao dao = new OptionDao();
	
private OptionDao() {}
	
	public static OptionDao getInstance() {
		return dao;
	}
	public List<BG_MENU_OPTION> optionList(String menu_code) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		List<BG_MENU_OPTION> list = sqlSession.selectList("bg_option.optionList", menu_code);
		logger.info("optionList :{}",list);
		sqlSession.close();
		return list;
	}
			
			
			
			
}
