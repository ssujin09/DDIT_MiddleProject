package community.service;

import java.util.List;

import community.dao.CCommentDaoImpl;
import community.dao.ICCommentDao;
import community.vo.CommentVO;

public class CCommentServiceImpl implements ICCommentService{
	
	private static ICCommentService singleTon = null;

	private CCommentServiceImpl() {
	};

	public static ICCommentService getInstance() {
		if (singleTon == null) {
			singleTon = new CCommentServiceImpl();
		}
		return singleTon;
	}
	
	private ICCommentDao commentDao = CCommentDaoImpl.getInstance();

	@Override
	public List<CommentVO> getCommentList(int cmmntyCode) {
		List<CommentVO> comList = commentDao.getCommentList(cmmntyCode);
		return comList;
	}

	@Override
	public int insertComment(CommentVO ccv) {
		return commentDao.insertCmmnty(ccv);
	}

	@Override
	public int countComment(int cmmntyCode) {
		return commentDao.countComment(cmmntyCode);
	}

	@Override
	public String commentReport(int ccommentCode) {
		return commentDao.commentReport(ccommentCode);
	}




}
