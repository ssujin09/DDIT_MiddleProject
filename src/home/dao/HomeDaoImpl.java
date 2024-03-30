package home.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import home.vo.CategoryVO;
import util.MyBatisUtil;

public class HomeDaoImpl implements HomeDao {
	
	private static HomeDao singleTon = null;

	private HomeDaoImpl() {
	};

	public static HomeDao getInstance() {
		if (singleTon == null) {
			singleTon = new HomeDaoImpl();
		}
		return singleTon;
	}

	@Override
	public List<CategoryVO> displayRstrn() {
		
		List<CategoryVO> cv = new ArrayList<CategoryVO>();
		
		SqlSession sqlSession= MyBatisUtil.getInstance();
		
		try {
			cv = sqlSession.selectList("home.displayRstrn", cv);
			
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return cv;
	}

	

}
