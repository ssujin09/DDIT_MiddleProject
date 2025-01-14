package mypage.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import community.vo.CmmntyVO;
import community.vo.CommentVO;
import member.vo.CustomerVO;
import mypage.vo.FavoriteVO;
import mypage.vo.ProfileImgVO;
import mypage.vo.ReviewImgVO;
import mypage.vo.ReviewVO;
import restaurant.vo.MenuVO;
import util.MyBatisUtil;

/**
 * Description : 마이페이지 DAO 인터페이스를 임플리먼트한 마이페이지 DAO Date : 2024. 1. 11. History :
 * - 작성자 : '선민수', 날짜 : 2024. 1. 11., 설명 : 최초작성 - 수정자 :
 * 
 * @author pok4k
 */
public class MypageDaoImpl implements IMypageDao {

	private static IMypageDao singleTon = null;

	private MypageDaoImpl() {
	};

	public static IMypageDao getInstance() {
		if (singleTon == null) {
			singleTon = new MypageDaoImpl();
		}
		return singleTon;
	}

	@Override
	public int cstmrProfileSetting(CustomerVO cv) {

		int result = 0;

		SqlSession sqlSession = MyBatisUtil.getInstance(true);

		try {

			result = sqlSession.update("mypage.cstmrProfileSetting", cv);

		} catch (PersistenceException e) {
			sqlSession.rollback();
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
	}

	@Override
	public int cstmrProfileImgInsert(ProfileImgVO piv) {

		int result = 0;

		SqlSession sqlSession = MyBatisUtil.getInstance(true);

		try {

			result = sqlSession.insert("mypage.cstmrProfileImgInsert", piv);

			if (result > 0) {
				sqlSession.commit();
			}
		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return result;
	}

	@Override
	public int cstmrProfileImgGet(ProfileImgVO img) {
		int profileImgNo = 0;

		SqlSession sqlSession = MyBatisUtil.getInstance(true);

		try {
			profileImgNo = sqlSession.selectOne("mypage.cstmrProfileImgGet", img);
			if (profileImgNo > 0) {
				sqlSession.commit();
			}
		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return profileImgNo;
	}

	@Override
	public ProfileImgVO profileImgInfo(int profileImgNo) {
		ProfileImgVO img = new ProfileImgVO();
		SqlSession sqlSession = MyBatisUtil.getInstance(true);
		try {
			img = sqlSession.selectOne("mypage.profileImgInfo", profileImgNo);
		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return img;
	}

	@Override
	public List<CmmntyVO> getMyCommunity(String cstmrId) {
		List<CmmntyVO> communityList = new ArrayList<CmmntyVO>();
		SqlSession sqlSession = MyBatisUtil.getInstance(true);

		try {
			communityList = sqlSession.selectList("mypage.getMyCommunity", cstmrId);
		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return communityList;
	}

	@Override
	public int postDelete(int cmmntyCode) {
		int result = 0;
		SqlSession sqlSession = MyBatisUtil.getInstance();
		try {
			
			result = sqlSession.delete("mypage.deleteCommentAll",cmmntyCode);
			result = sqlSession.delete("mypage.postDelete", cmmntyCode);
				
			if (result > 0) {
					sqlSession.commit();
				}
			
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return result;
	}

	@Override
	public List<ReviewVO> getMyReview(String cstmrId) {
		List<ReviewVO> reviewList = new ArrayList<ReviewVO>();
		SqlSession sqlSession = MyBatisUtil.getInstance();
		try {
			reviewList = sqlSession.selectList("mypage.getMyReivew", cstmrId);
			
			if(reviewList.size()>0) {
				sqlSession.commit();
			}
			
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}

		return reviewList;
	}

	@Override
	public int reviewDelete(int reviewNo) {
		int result = 0;
		SqlSession sqlSession = MyBatisUtil.getInstance();
		try {
			result = sqlSession.delete("mypage.deleteReviewImg", reviewNo);
			result = sqlSession.delete("mypage.reviewDelete", reviewNo);
			if(result > 0) {
				sqlSession.commit();
			}
			
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return result;
	}
	public String getAddr(int rstrntCode) {
		 String addr = "";
		 SqlSession sqlSession = MyBatisUtil.getInstance();
		 try {
			addr = sqlSession.selectOne("mypage.getAddr",rstrntCode);
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		 return addr;
	}

	@Override
	public String getName(int rstrntCode) {
		String name = "";
		SqlSession sqlSession = MyBatisUtil.getInstance();
		try {
			name = sqlSession.selectOne("mypage.getName",rstrntCode);
			
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return name;
	}

	@Override
	public int countPost(String cstmrId) {
		int countPost = 0;
		int countReview = 0;
		SqlSession sqlSession = MyBatisUtil.getInstance();
		try {
			countPost = sqlSession.selectOne("mypage.countPost",cstmrId);
			countReview = sqlSession.selectOne("mypage.countReview",cstmrId);
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return countPost + countReview;
	}

	@Override
	public List<CommentVO> getCommentList(String cstmrId) {
		List<CommentVO> commentList = new ArrayList<CommentVO>();
		SqlSession sqlSession = MyBatisUtil.getInstance();
		try {
			commentList = sqlSession.selectList("mypage.getCommentList", cstmrId);
			if(commentList.size() >  0) {
				sqlSession.commit();
			}
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return commentList;
	}

	@Override
	public String getTitle(int cmmntyCode) {
		String title = "";
		SqlSession sqlSession = MyBatisUtil.getInstance();
		try {
			title = sqlSession.selectOne("mypage.getTitle",cmmntyCode);
			
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		
		return title;
	}

	@Override
	public int deleteCcomment(int ccommentCode) {
		int result = 0;
		SqlSession sqlSession = MyBatisUtil.getInstance();
		try {
			result = sqlSession.delete("mypage.deleteCcomment",ccommentCode);
			if(result > 0) {
				sqlSession.commit();
			}
		}finally {
			sqlSession.close();
		}
		
		return result;
	}

	@Override
	public List<FavoriteVO> favoriteRst(String cstmrId) {
		List<FavoriteVO> favoriteList = new ArrayList<FavoriteVO>();
		SqlSession sqlSession = MyBatisUtil.getInstance();
		try {
			favoriteList = sqlSession.selectList("mypage.favoriteRst",cstmrId);
			
			if(favoriteList.size()>0) {
				sqlSession.commit();
			}
			
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		
		return favoriteList;
	}

	@Override
	public String getCategory(int rstrntCode) {
		
		int ctNo = 0;
		String category = "";
		SqlSession sqlSession = MyBatisUtil.getInstance();
		try {
			ctNo = sqlSession.selectOne("mypage.getCtno",rstrntCode);
			category = sqlSession.selectOne("mypage.getCategory",ctNo);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return category;
	}

	@Override
	public MenuVO getMenu(int rstrntCode) {
		
		MenuVO mv = new MenuVO();
		SqlSession sqlSession = MyBatisUtil.getInstance();
		try {
			mv = sqlSession.selectOne("mypage.getMenu",rstrntCode);
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return mv;
	}

	@Override
	public int insertReviewImg(ReviewImgVO img) {
		
		int reviewImgNo = 0;
		
		SqlSession sqlSession = MyBatisUtil.getInstance();
		try {
			reviewImgNo = sqlSession.insert("mypage.insertReviewImg",img);
			if(reviewImgNo >0) {
				sqlSession.commit();
			}
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return reviewImgNo;
	}

	@Override
	public int postModify(CmmntyVO cv) {
		int result = 0;
		SqlSession sqlSession = MyBatisUtil.getInstance();
		try {
			result = sqlSession.update("mypage.postModify",cv);
			if(result >0) {
				sqlSession.commit();
			}
			
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		
		return result;
	}

	@Override
	public String getNick(String cstmrId) {
		
		String nick = "";
		SqlSession sqlSession = MyBatisUtil.getInstance();
		
		try {
			nick = sqlSession.selectOne("mypage.getNick",cstmrId);
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return nick;
	}

	@Override
	public int withdrwal(String cstmrId) {
		
		int result = 0;
		SqlSession sqlSession = MyBatisUtil.getInstance();
		try {
			result = sqlSession.update("mypage.withdrawl",cstmrId);
			if(result>0)sqlSession.commit();
		} catch (PersistenceException e) {
			e.printStackTrace();
			
		}finally {
			sqlSession.close();
		}
		
		return result;
	}

	@Override
	public int countFavorite(String cstmrId) {
		
		int countFavorite=0;
		SqlSession sqlSession = MyBatisUtil.getInstance();
		try {
			countFavorite = sqlSession.selectOne("mypage.countFavorite",cstmrId);
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return countFavorite;
	}

	@Override
	public List<CmmntyVO> getRecentList(String cstmrId) {
		List<CmmntyVO> recentList = new ArrayList<CmmntyVO>();
		SqlSession sqlSession = MyBatisUtil.getInstance();
		try {
			recentList = sqlSession.selectList("mypage.getRecentList",cstmrId);
			
		}catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return recentList;
	}

	@Override
	public ReviewImgVO getReviewImgInfo(int reviewNo) {
		ReviewImgVO riv = new ReviewImgVO();
		SqlSession sqlSession = MyBatisUtil.getInstance();
		try {
			riv = sqlSession.selectOne("mypage.getReviewImgInfo",reviewNo);
			if(riv != null) {
				sqlSession.commit();
			}else {
				System.out.println("riv 비었음 ;;");
			}
		} catch (PersistenceException e) {
			System.out.println("널널해요");
		}finally {
			sqlSession.close();
		}
		
		
		return riv;
	}

	@Override
	public int getFirstReview(int rstrntCode) {
		
		int firstReviewNo = 0;
		SqlSession sqlSession = MyBatisUtil.getInstance();
		try {
			
			firstReviewNo = sqlSession.selectOne("review.getFirstReview",rstrntCode);
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return firstReviewNo;
	}

	@Override
	public int getProfileImgNo(String cstmrId) {
		
		int profileImgNo = 0;
		SqlSession sqlSession = MyBatisUtil.getInstance();
		try {
			
			profileImgNo = sqlSession.selectOne("mypage.getProfileImgNo",cstmrId);
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		
		return profileImgNo;
	}

}
