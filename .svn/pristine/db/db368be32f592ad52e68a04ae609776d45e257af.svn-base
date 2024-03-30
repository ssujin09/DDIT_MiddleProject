package community.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import community.vo.CommentVO;
import util.MyBatisUtil;

public class CCommentDaoImpl implements ICCommentDao {

	private static ICCommentDao singleTon = null;

	private CCommentDaoImpl() {
	};

	public static ICCommentDao getInstance() {
		if (singleTon == null) {
			singleTon = new CCommentDaoImpl();
		}
		return singleTon;
	}

	@Override
	public List<CommentVO> getCommentList(int cmmntyCode) {
		
		List<CommentVO> comList = new ArrayList<CommentVO>();
		SqlSession sqlSession = MyBatisUtil.getInstance();
		try {
			
			comList = sqlSession.selectList("commComment.getCommentList", cmmntyCode);
			
			
			
		} catch (PersistenceException e) {
			e.printStackTrace();
			
		}finally {
			sqlSession.close();
		}
		
		return comList;
	}

	@Override
	public int insertCmmnty(CommentVO ccv) {
		
		int cnt = 0;

		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			cnt = session.insert("commComment.insertComment", ccv);
			
			if(cnt>0) {
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
	public int countComment(int cmmntyCode) {
		
		int cnt = 0;
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			
			cnt = session.selectOne("commComment.countComment", cmmntyCode);
			
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		
		return cnt;
	}

	@Override
	public String commentReport(int ccommentCode) {
		
		String report = "";
		SqlSession sqlSession = MyBatisUtil.getInstance();
		
		try {
			report = sqlSession.selectOne("commComment.commentReport",ccommentCode);
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return report;
	}

}



