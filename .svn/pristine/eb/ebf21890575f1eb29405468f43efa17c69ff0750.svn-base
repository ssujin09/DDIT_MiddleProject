package mypage.service;

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
	 * Description : 마이페이지 서비스를 위한 인터페이스
	 * Date : 2024. 1. 10
	 * History :
	 * - 작성자 : '선민수', 날짜 : 2024. 1. 10, 설명 : 최초작성
	 * - 수정자 : 
	 * @author PC-09
	 */
public interface IMypageService {

	/**
	 * 사용자 정보 수정
	 * @param cv
	 * @return
	 */
	int cstmrProfileSetting(CustomerVO cv);

	/**
	 * 내 게시글 가져오기
	 * @param cstmrId
	 * @return
	 */
	List<CmmntyVO> getMyCommunity(String cstmrId);
	
	/**
	 * 사용자 프로필 이미지 파일 등록
	 * @param piv
	 * @return
	 */
	int cstmrProfileImgInsert(ProfileImgVO piv);
	
	/**
	 * 사용자 프로필 이미지 번호
	 * @param piv
	 * @return
	 */
	int cstmrProfileImgGet(ProfileImgVO piv);
	
	/**
	 * 사용자 프로필 이미지 정보 가져오기
	 * @param profileImgNo
	 * @return
	 */
	ProfileImgVO profileImgInfo(int profileImgNo);
	
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
	 * 가게 카테고리 가져오기
	 * @param rstrntCode
	 * @return
	 */
	String getCategory(int rstrntCode);
	
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
	 * 내 댓글 삭제하기
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
	 * 가게에 대한 메뉴 가져오기
	 * @param rstrntCode
	 * @return
	 */
	MenuVO getMenu(int rstrntCode);

	/**
	 * 리뷰 사진 등록하기
	 * @param img
	 * @return
	 */
	int insertReviewImg(ReviewImgVO img);

	/**
	 * 내 게시글 수정하기
	 * @param cv
	 * @return
	 */
	int postModify(CmmntyVO cv);
	
	/**
	 * 사용자 닉네임 가져오기
	 * @param cstmrId
	 * @return
	 */
	String getNick(String cstmrId);

	/**
	 * 회원 탈퇴 하기
	 * @param cstmrId
	 * @return
	 */
	int withdrawl(String cstmrId);
	
	/**
	 * 즐겨찾는 가게 수 가져오기
	 * @param cstmrId
	 * @return
	 */
	int countFavorite(String cstmrId);
	
	/**
	 * 최근 게시글 가져오기
	 * @param cstmrId
	 * @return
	 */
	List<CmmntyVO> getRecentList(String cstmrId);
	
	/**
	 * 리뷰 이미지 경로 가져오기
	 * @param reviewNo
	 * @return
	 */
	String reviewImgPath(int reviewNo);
	
	/**
	 * 가게 이미지 경로 가져오기
	 * @param rstrntCode
	 * @return
	 */
	String getRstImg(int rstrntCode);
	
	int getProfileImgNo(String cstmrId);
	
	
	
}
