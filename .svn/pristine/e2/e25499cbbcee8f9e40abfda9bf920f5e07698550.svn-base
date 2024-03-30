package admin.service;

import java.util.List;
import java.util.Map;

import admin.vo.CmmntyVO;
import community.vo.CommentVO;

public interface IReportService {
	
	//신고 게시글 불러오기
	List<CmmntyVO> getReportPostList();

	//신고 게시글 상세
	CmmntyVO getReportPostDetail(int cmmntyCode);
	
	//신고 게시글 삭제
	int deleteReportPost(Map<String, Object> param);
	
	//신고 게시글 취소
	int cancelReportPost(Map<String, Object> param);
	
	//신고 댓글 불러오기
	List<CommentVO> getReportComList();
	
	//신고댓글 상세
	CommentVO getReportComDetail(int commCode);

	int cancelComm(int ccommentCode);

	int deleteComm(int ccommentCode);


}
