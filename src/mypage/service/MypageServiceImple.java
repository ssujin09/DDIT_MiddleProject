package mypage.service;


import java.util.List;

import community.vo.CmmntyVO;
import community.vo.CommentVO;
import member.vo.CustomerVO;
import mypage.dao.IMypageDao;
import mypage.dao.MypageDaoImpl;
import mypage.vo.FavoriteVO;
import mypage.vo.ProfileImgVO;
import mypage.vo.ReviewImgVO;
import mypage.vo.ReviewVO;
import restaurant.vo.MenuVO;

/**
 * Description : 마이페이지 서비스 작업을 위해 마이페이지 인터페이스를 임플리먼트한 클래스
 * Date : 2024. 1. 10
 * History :
 * - 작성자 : '선민수', 날짜 : 2024. 1. 10, 설명 : 최초작성
 * - 수정자 : 
 * @author PC-09
 */
public class MypageServiceImple implements IMypageService{
	
	IMypageDao mypageDao = MypageDaoImpl.getInstance();
	
	private static IMypageService singleTon = null;

	private MypageServiceImple() {
	};

	public static IMypageService getInstance() {
		if (singleTon == null) {
			singleTon = new MypageServiceImple();
		}
		return singleTon;
	}

	@Override
	public int cstmrProfileSetting(CustomerVO cv) {
		
		
		
		return mypageDao.cstmrProfileSetting(cv);
	}

	@Override
	public int cstmrProfileImgInsert(ProfileImgVO piv) {
		
		
		return mypageDao.cstmrProfileImgInsert(piv);
	}

	public int cstmrProfileImgGet(ProfileImgVO img) {
		
		return mypageDao.cstmrProfileImgGet(img);
	}

	@Override
	public ProfileImgVO profileImgInfo(int profileImgNo) {
		ProfileImgVO img = mypageDao.profileImgInfo(profileImgNo);
		return img;
	}	

	@Override
	public List<CmmntyVO> getMyCommunity(String cstmrId) {

		return mypageDao.getMyCommunity(cstmrId);
	}

	@Override
	public int postDelete(int cmmntyCode) {
		return mypageDao.postDelete(cmmntyCode);
	}

	@Override
	public List<ReviewVO> getMyReview(String cstmrId) {
		return mypageDao.getMyReview(cstmrId);
	}

	@Override
	public int reviewDelete(int reviewNo) {
	
		return mypageDao.reviewDelete(reviewNo);
	}

	@Override
	public String getAddr(int rstrntCode) {
		return mypageDao.getAddr(rstrntCode);
	}

	@Override
	public String getName(int rstrntCode) {
		
		return mypageDao.getName(rstrntCode);
	}

	@Override
	public int countPost(String cstmrId) {
		return mypageDao.countPost(cstmrId);
	}

	@Override
	public List<CommentVO> getCommentList(String cstmrId) {
		return mypageDao.getCommentList(cstmrId);
	}

	@Override
	public String getTitle(int cmmntyCode) {
		return mypageDao.getTitle(cmmntyCode);
	}

	@Override
	public int deleteCcomment(int ccommentCode) {
		return mypageDao.deleteCcomment(ccommentCode);
	}

	@Override
	public List<FavoriteVO> favoriteRst(String cstmrId) {
		return mypageDao.favoriteRst(cstmrId);
	}

	@Override
	public String getCategory(int rstrntCode) {
		return mypageDao.getCategory(rstrntCode);
	}

	@Override
	public MenuVO getMenu(int rstrntCode) {
		return mypageDao.getMenu(rstrntCode);
	}

	@Override
	public int insertReviewImg(ReviewImgVO img) {
		return mypageDao.insertReviewImg(img);
	}

	@Override
	public int postModify(CmmntyVO cv) {
		return mypageDao.postModify(cv);
	}

	@Override
	public String getNick(String cstmrId) {
		return mypageDao.getNick(cstmrId);
	}

	@Override
	public int withdrawl(String cstmrId) {
		return mypageDao.withdrwal(cstmrId);
	}

	@Override
	public int countFavorite(String cstmrId) {
		return mypageDao.countFavorite(cstmrId);
	}

	@Override
	public List<CmmntyVO> getRecentList(String cstmrId) {
		return mypageDao.getRecentList(cstmrId);
	}

	@Override
	public String reviewImgPath(int reviewNo) {
		ReviewImgVO riv =mypageDao.getReviewImgInfo(reviewNo);
		String noImg = "noImg";
		if(riv != null ) {
			
			String filePath = riv.getReviewFilePath();
			String fileName = riv.getReviewFileName();
			String fileExstn = riv.getReviewFileExtsn();
			
			filePath = filePath.replace("d:", "");
			System.out.println(filePath);
			
			return filePath+"/"+fileName+fileExstn;
		}else {
			return noImg;
		}
	}

	@Override
	public String getRstImg(int rstrntCode) {
		
		// 레스토랑 코드 번호로 첫번째 해당 가게 리뷰 번호 리턴받아옴
		int reviewNo = mypageDao.getFirstReview(rstrntCode);
		
		// 리뷰 번호로 해당 리뷰 이미지 가져오기 VO
		ReviewImgVO riv =mypageDao.getReviewImgInfo(reviewNo);
		
		String noImg = "noImg";
		
		if(riv != null ) {
			
			String filePath = riv.getReviewFilePath();
			String fileName = riv.getReviewFileName();
			String fileExstn = riv.getReviewFileExtsn();
			
			filePath = filePath.replace("d:", "");
			System.out.println(filePath+"/"+fileName+fileExstn);
			
			return filePath+"/"+fileName+fileExstn;
		}else {
			return noImg;
		}
	}

	@Override
	public int getProfileImgNo(String cstmrId) {
		
		
		
		return mypageDao.getProfileImgNo(cstmrId);
	}


}