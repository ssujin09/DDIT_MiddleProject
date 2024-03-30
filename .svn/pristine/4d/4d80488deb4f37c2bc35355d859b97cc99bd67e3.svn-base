package admin.dao;

import java.util.List;
import java.util.Map;

import admin.vo.CmmntyVO;
import community.vo.CommentVO;

public interface IReportDao {
	
	//신고 게시글 리스트
	List<CmmntyVO> getReportPostList();
	
	//신고게시글 상세보기
	CmmntyVO getReportPostDetail(int cmmntyCode);
	
	//신고 게시글 삭제
	int deleteReportPost(Map<String, Object> param);
	
	//신고 게시글 취소
	int cancelReportPost(Map<String, Object> param);
	
	//신고 댓글 리스트
	List<CommentVO> geReportComList();
	
	//신고 댓글 상세
	CommentVO getReportCommDetail(int commCode);

	int cancelComm(int ccommentCode);

	int deleteComm(int ccommentCode);

}
