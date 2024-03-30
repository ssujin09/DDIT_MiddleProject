package admin.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import admin.vo.CmmntyVO;
import community.vo.CommentVO;
import util.MyBatisUtil;

public class ReportDaoImpl implements IReportDao {

	private static IReportDao reportDao;

	private ReportDaoImpl() {
	};

	public static IReportDao getInstance() {
		if (reportDao == null) {
			reportDao = new ReportDaoImpl();
		}
		return reportDao;
	}

	@Override
	public List<CmmntyVO> getReportPostList() {

		List<CmmntyVO> reportPostList = new ArrayList<CmmntyVO>();

		SqlSession sqlSession = MyBatisUtil.getInstance(true);

		try {

			reportPostList = sqlSession.selectList("admin.reportPostList");

		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return reportPostList;
	}

	@Override
	public CmmntyVO getReportPostDetail(int cmmntyCode) {

		CmmntyVO cv = new CmmntyVO();

		SqlSession sqlSession = MyBatisUtil.getInstance(true);

		try {

			cv = sqlSession.selectOne("admin.reportPostDetail", cmmntyCode);

		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		System.out.println(cv.getCmmntyCode());

		return cv;
	}

	@Override
	public int deleteReportPost(Map<String, Object> param) {

		int cnt = 0;
		int cnt1 = 0;
		int cnt2 = 0;
		int cnt3 = 0;

		int cmmntyCode = (int) (param.get("cmmntyCode"));
		String cstmrId = (String) param.get("cstmrId");
		String back = (String) param.get("back");

		SqlSession sqlSession = MyBatisUtil.getInstance();

		try {
			
			cnt2 = sqlSession.delete("admin.deleteReportComment", cmmntyCode);
			if (cnt2 > 0) {
				sqlSession.commit();
			}

			cnt1 = sqlSession.delete("admin.deleteReportPost", cmmntyCode);
			if (cnt1 > 0) {
				sqlSession.commit();
			}
	
			cnt3 = sqlSession.update("admin.updateCstmrWarn", cstmrId);
			if (cnt3 > 0) {
				sqlSession.commit();
			}
			cnt = cnt1 * cnt2 * cnt3;

			if (cnt > 0) {
				sqlSession.commit();
			}
		} catch (PersistenceException e) {
			sqlSession.rollback();
			e.printStackTrace();

		} finally {
			sqlSession.close();
		}

		return cnt;
	}

	@Override
	public int cancelReportPost(Map<String, Object> param) {

		int cnt = 0;

		int cmmntyCode = (int) (param.get("cmmntyCode"));
		String cstmrId = (String) param.get("cstmrId");
		String cancel = (String) param.get("cancel");

		SqlSession sqlSession = MyBatisUtil.getInstance();

		try {

			cnt = sqlSession.update("admin.updateCmmntyReport", cmmntyCode);
			if (cnt > 0) {
				sqlSession.commit();
			}

		} catch (PersistenceException e) {
			sqlSession.rollback();
			e.printStackTrace();

		} finally {
			sqlSession.close();
		}

		System.out.println(cnt);

		System.out.println(cnt);
		return cnt;

	}

	@Override
	public List<CommentVO> geReportComList() {
		List<CommentVO> reportComList = new ArrayList<CommentVO>();

		SqlSession sqlSession = MyBatisUtil.getInstance(true);

		try {

			reportComList = sqlSession.selectList("admin.reportComList");

		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return reportComList;
	}
	//신고댓글상세
	@Override
	public CommentVO getReportCommDetail(int commCode) {

		CommentVO ccv = new CommentVO();

		SqlSession sqlSession = MyBatisUtil.getInstance(true);

		try {

			ccv = sqlSession.selectOne("admin.reportCommDetail", commCode);

		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return ccv;
	}
	
	//신고댓글복원
	@Override
	public int cancelComm(int ccommentCode) {
		
		int result = 0;
		SqlSession sqlSession = MyBatisUtil.getInstance();
		try {
			result = sqlSession.update("admin.cancelComm",ccommentCode);
			
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
	//신고댓글지우기
	@Override
	public int deleteComm(int ccommentCode) {

		int result = 0;
		SqlSession sqlSession = MyBatisUtil.getInstance();
		try {
			
			result = sqlSession.update("admin.warnCustomer",ccommentCode);
			if(result > 0) { 
				sqlSession.commit();
			}
			System.out.println(result);
			result = 0;
			
			
			  result = sqlSession.delete("admin.deleteComm",ccommentCode); 
			  if(result > 0 )
			  { sqlSession.commit(); }
			 
			
			
		} catch (PersistenceException e) {
			e.printStackTrace();
			
		}finally {
			sqlSession.close();
		}
		return result;
	}

}
