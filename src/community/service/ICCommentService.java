package community.service;

import java.util.List;

import community.vo.CmmntyVO;
import community.vo.CommentVO;

public interface ICCommentService {

	List<CommentVO> getCommentList(int cmmntyCode);

	int insertComment(CommentVO ccv);

	int countComment(int cmmntyCode);

	String commentReport(int ccommentCode);





	

}