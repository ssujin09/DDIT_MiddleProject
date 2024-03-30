package mypage.dao;

import java.util.List;

import community.vo.CmmntyVO;
import community.vo.CommentVO;
import member.vo.CustomerVO;
import mypage.vo.FavoriteVO;
import mypage.vo.ProfileImgVO;
import mypage.vo.ReviewImgVO;
import mypage.vo.ReviewVO;
import restaurant.vo.MenuVO;

/**
	 * Description : 마이페이지 DAO를 위한 인터페이스 클래스
	 * Date : 2024. 1. 11.
	 * History :
	 * - 작성자 : '선민수', 날짜 : 2024. 1. 11., 설명 : 최초작성
	 * - 수정자 : 
	 * @author pok4k
	 */
public interface IMypageDao {
	
	/**
	 * 프로필 수정
	 * @param cv
	 * @return
	 */
	int cstmrProfileSetting(CustomerVO cv);

	/**
	 * 프로필 파일 인설트
	 * @param piv
	 * @return
	 */
	int cstmrProfileImgInsert(ProfileImgVO piv);

	/**
	 * 프로필 파일 가져오기
	 * @param img
	 * @return
	 */
	int cstmrProfileImgGet(ProfileImgVO img);

	/**
	 * 프로필 파일 정보 가져오기
	 * @param profileImgNo
	 * @return
	 */
	ProfileImgVO profileImgInfo(int profileImgNo);
	
	/**
	 * 내 게시글 가져오기
	 * @param cstmrId
	 * @return
	 */
	List<CmmntyVO> getMyCommunity(String cstmrId);
	
	/**
	 * 내 게시글 삭제하기
	 * @param cmmntyCode
	 * @return
	 */
	int postDelete(int cmmntyCode);
	
	/**
	 * 내 리뷰 가져오기
	 * @param cstmrId
	 * @return
	 */
	List<ReviewVO> getMyReview(String cstmrId);
	
	/**
	 * 내 리뷰 삭제하기
	 * @param reviewNo
	 * @return
	 */
	int reviewDelete(int reviewNo);
	
	/**
	 * 가게 주소 가져오기
	 * @param rstrntCode
	 * @return
	 */
	String getAddr(int rstrntCode);
	
	/**
	 * 가게 이름 가져오기
	 * @param rstrntCode
	 * @return
	 */
	String getName(int rstrntCode);
	
	/**
	 * 내 게시글 갯수 가져오기
	 * @param cstmrId
	 * @return
	 */
	int countPost(String cstmrId);

	/**
	 * 내 댓글 가져오기
	 * @param cstmrId
	 * @return
	 */
	List<CommentVO> getCommentList(String cstmrId);

	/**
	 * 게시글 제목 가져오기
	 * @param cmmntyCode
	 * @return
	 */
	String getTitle(int cmmntyCode);

	/**
	 * 게시글에 대한 댓글 삭제하기
	 * @param ccommentCode
	 * @return
	 */
	int deleteCcomment(int ccommentCode);

	/**
	 * 즐겨찾는 가게 가져오기
	 * @param cstmrId
	 * @return
	 */
	List<FavoriteVO> favoriteRst(String cstmrId);

	/**
	 * 가게 카테고리 가져오기
	 * @param rstrntCode
	 * @return
	 */
	String getCategory(int rstrntCode);

	MenuVO getMenu(int rstrntCode);

	int insertReviewImg(ReviewImgVO img);

	int postModify(CmmntyVO cv);

	String getNick(String cstmrId);

	int withdrwal(String cstmrId);

	int countFavorite(String cstmrId);

	List<CmmntyVO> getRecentList(String cstmrId);

	ReviewImgVO getReviewImgInfo(int reviewNo);

	int getFirstReview(int rstrntCode);

	int getProfileImgNo(String cstmrId);
	

}
