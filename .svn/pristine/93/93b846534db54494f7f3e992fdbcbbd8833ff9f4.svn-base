package admin.service;


import java.util.List;
import java.util.Map;

import admin.dao.IReportDao;
import admin.dao.ReportDaoImpl;
import admin.vo.CmmntyVO;
import community.vo.CommentVO;


public class ReportServiceImpl implements IReportService{
	
	private static IReportService reportService;
	
	private IReportDao reportDao;
	
	private ReportServiceImpl() {
		reportDao = ReportDaoImpl.getInstance();
	}
	
	public static IReportService getInstance() {
		if(reportService == null) {
			reportService = new ReportServiceImpl();
		}
		return reportService;
	}

	@Override
	public List<CmmntyVO> getReportPostList() {
		List<CmmntyVO> reportPostList = reportDao.getReportPostList();
		return reportPostList;
	}

	@Override
	public CmmntyVO getReportPostDetail(int cmmntyCode) {
		
		CmmntyVO cv = reportDao.getReportPostDetail(cmmntyCode);
		
		return cv;
	}

	@Override
	public int deleteReportPost(Map<String, Object> param) {

		int cnt = reportDao.deleteReportPost(param);
	
		return cnt;
	
	}

	@Override
	public int cancelReportPost(Map<String, Object> param) {
		int cnt = reportDao.cancelReportPost(param);
		
		return cnt;
	
	}


	@Override
	public List<CommentVO> getReportComList() {
		List<CommentVO> reportComList = reportDao.geReportComList();
		return reportComList;
	}

	@Override
	public CommentVO getReportComDetail(int commCode) {
		CommentVO ccv = reportDao.getReportCommDetail(commCode);
		
		return ccv;
	}

	@Override
	public int cancelComm(int ccommentCode) {
		
		return reportDao.cancelComm(ccommentCode);
	}

	@Override
	public int deleteComm(int ccommentCode) {
		
		
		return reportDao.deleteComm(ccommentCode);
	}



	


}
