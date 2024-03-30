package admin.service;

import java.util.List;

import admin.dao.INoticeDao;
import admin.dao.NoticeDaoImpl;
import admin.vo.NoticeVO;

public class NoticeServiceImpl implements INoticeService{
	
	private static INoticeService noticeService;
	
	private INoticeDao noticeDao;
	
	private NoticeServiceImpl() {
		noticeDao = NoticeDaoImpl.getInstance();
	}
	
	public static INoticeService getInstance() {
		if(noticeService == null) {
			noticeService = new NoticeServiceImpl();
		}
		return noticeService;
	}


	@Override
	public List<NoticeVO> listNotice() {
		List<NoticeVO> noticeList = noticeDao.listNotice();
		return noticeList;
	}

	@Override
	public NoticeVO getNoticeDetail(int noticeCode) {
		NoticeVO nv = noticeDao.getNoticeDetail(noticeCode);
		return nv;
	}

	@Override
	public int insertNotice(NoticeVO nv) {
		int cnt = noticeDao.insertNotice(nv);
		
		return cnt;
	}

	@Override
	public int deleteNotice(int noticeCode) {
		
		int cnt = noticeDao.deleteNotice(noticeCode);
		
		return cnt;
	}

	@Override
	public int updateNotice(NoticeVO nv) {
		
		int cnt = noticeDao.updateNotice(nv);
		
		return cnt;
	}


}
