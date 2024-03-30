package admin.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import admin.vo.NoticeVO;
import util.MyBatisUtil;

public class NoticeDaoImpl implements INoticeDao {
	
	private static INoticeDao notiDao;
	
	private NoticeDaoImpl() {
	}
	
	public static INoticeDao getInstance() {
		if(notiDao==null) {
			notiDao = new NoticeDaoImpl();
		}
		return notiDao;
	}
	
	
	
	@Override
	public List<NoticeVO> listNotice() {
		
		List<NoticeVO> noticeList = new ArrayList<NoticeVO>();
		SqlSession sqlsession = MyBatisUtil.getInstance(true);
		
		try {
			
			noticeList = sqlsession.selectList("notice.selectNoticeList");
			
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			sqlsession.close();
			
		}
		
		
		return noticeList;
	}

	@Override
	public NoticeVO getNoticeDetail(int noticeCode) {
		
		NoticeVO nv = new NoticeVO();
		SqlSession sqlSession = MyBatisUtil.getInstance();
		
		try {
				sqlSession.update("notice.updateNoticeCount", noticeCode);
			nv = sqlSession.selectOne("notice.selectNoticeDetail", noticeCode);
			
			if(nv != null) {
				sqlSession.commit();
				System.out.println("nv 정상");
			}
			
			
		}catch(PersistenceException e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return nv;
	}

	@Override
	public int insertNotice(NoticeVO nv) {
		
		SqlSession sqlSession=MyBatisUtil.getInstance();
		
		int cnt =0;
		
		try {
			
			cnt = sqlSession.insert("notice.insertNotice",nv);
			if(cnt>0) {
				sqlSession.commit();
				
			}
		}catch(PersistenceException ex) {
			sqlSession.rollback();
			ex.printStackTrace();
		}finally {
			sqlSession.close();
		}
			
		return cnt;
	}

	@Override
	public int deleteNotice(int noticeCode) {
		
		SqlSession sqlSession=MyBatisUtil.getInstance();
		
		int cnt = 0;
		
		try {
			
			cnt=sqlSession.delete("notice.deleteNotice", noticeCode);
			
			if(cnt>0){
				sqlSession.commit();
			}
		
		}catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return cnt;
	}

	@Override
	public int updateNotice(NoticeVO nv) {
		
		SqlSession sqlSession=MyBatisUtil.getInstance();
		
		int cnt =0;
		
		try {
			
			cnt = sqlSession.insert("notice.updateNotice",nv);
			if(cnt>0) {
				sqlSession.commit();
				
			}
		}catch(PersistenceException ex) {
			sqlSession.rollback();
			ex.printStackTrace();
		}finally {
			sqlSession.close();
		}
			
		return cnt;
	
	}
	
	
	

}
