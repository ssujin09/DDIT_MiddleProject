package community.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import community.vo.CmmntyVO;
import util.MyBatisUtil;

public class CmmntyDaoImpl implements ICmmntyDao {

	private static ICmmntyDao singleTon = null;

	private CmmntyDaoImpl() {
	};

	public static ICmmntyDao getInstance() {
		if (singleTon == null) {
			singleTon = new CmmntyDaoImpl();
		}
		return singleTon;
	}

	@Override
	public List<CmmntyVO> displayAllCmmnty() {
		List<CmmntyVO> cv = new ArrayList<CmmntyVO>();
		SqlSession sqlSession = MyBatisUtil.getInstance(true);

		try {

			cv = sqlSession.selectList("community.getAllCommunity");

		} catch (PersistenceException e) {
			e.printStackTrace();
			
		} finally {
			sqlSession.close();
		}

		return cv;
	}

	@Override
	public CmmntyVO getDetailContent(int cmmntyCode) {

		SqlSession sqlSession = MyBatisUtil.getInstance(true);

		CmmntyVO cv = null;

		try {
			cv = sqlSession.selectOne("community.getDetailContent", cmmntyCode);
		} catch (PersistenceException e) {
			e.printStackTrace();
			
		} finally {
			sqlSession.close();
		}
		return cv;
	}

	@Override
	public int insertCmmnty(CmmntyVO cv) {
		int cnt = 0;

		SqlSession session = MyBatisUtil.getInstance();

		try {
			cnt = session.insert("community.insertCmmnty", cv);

			if (cnt > 0) {
				session.commit();
			}

		} catch (PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
			
		} finally {
			session.close();
		}

		return cnt;
	}

	@Override
	public int updateView(int cmmntyCode) {

		int cnt = 0;

		SqlSession session = MyBatisUtil.getInstance();

		try {

			cnt = session.update("community.updateView", cmmntyCode);
			
			if(cnt>0) {
				
			session.commit();
			}
		} catch (PersistenceException e) {
			session.rollback();
			e.printStackTrace();
			
		} finally {
			session.close();
		}

		return cnt;
	}

	@Override
	public int upLike(int cmmntyCode) {
		
		int result = 0;
		SqlSession sqlSession = MyBatisUtil.getInstance();
		
		try {
			result = sqlSession.update("community.upLike",cmmntyCode);
			
			if(result>0) {
				sqlSession.commit();
			}
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		
		return result;
	}

	@Override
	public String contentReport(int cmmntyCode) {
		
		String report = "";
		SqlSession sqlSession = MyBatisUtil.getInstance();
		
		try {
			report = sqlSession.selectOne("community.contentReport",cmmntyCode);
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return report;
	}

}
