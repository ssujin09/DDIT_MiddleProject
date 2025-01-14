package restaurant.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import mypage.vo.FavoriteVO;
import mypage.vo.ReviewImgVO;
import mypage.vo.ReviewVO;
import restaurant.vo.BusinessVO;
import restaurant.vo.MenuVO;
import restaurant.vo.RestaurantVO;
import util.MyBatisUtil;

public class RestaurantDaoImpl implements RestaurantDao {

	private static RestaurantDao singleTon = null;

	private RestaurantDaoImpl() {
	};

	public static RestaurantDao getInstance() {
		if (singleTon == null) {
			singleTon = new RestaurantDaoImpl();
		}
		return singleTon;
	}

	@Override
	public RestaurantVO displayDeatils(int rstrntCode) {

		SqlSession sqlSession = MyBatisUtil.getInstance(true);

		RestaurantVO rv = new RestaurantVO();

		try {
			rv = sqlSession.selectOne("restaurant.getRestaurant", rstrntCode);

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return rv;
	}

	@Override
	public RestaurantVO getLocal(int rstrntCode) {

		RestaurantVO rv = new RestaurantVO();

		SqlSession sqlSession = MyBatisUtil.getInstance();

		try {

			rv = sqlSession.selectOne("restaurant.getLocal", rstrntCode);

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return rv;
	}

	@Override
	public BusinessVO displayBsn(int rstrntCode) {

		BusinessVO bv = new BusinessVO();

		SqlSession sqlSession = MyBatisUtil.getInstance();

		try {

			bv = sqlSession.selectOne("restaurant.displayBsn", rstrntCode);

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return bv;
	}

	@Override
	public List<MenuVO> displayMenu(int rstrntCode) {

		List<MenuVO> mv = new ArrayList<MenuVO>();

		SqlSession sqlSession = MyBatisUtil.getInstance();

		try {

			mv = sqlSession.selectList("restaurant.displayMenu", rstrntCode);
			System.out.println(mv.get(0).getMenuName());
			System.out.println(mv.get(0).getMenuCode());
			System.out.println(mv.get(0).getMenuPrice());
			System.out.println(mv.get(0).getRstrntCode());
			
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return mv;
	}

	@Override
	public int insertReview(ReviewVO reviewVO) {
		
		int result = 0;
		SqlSession sqlSession = MyBatisUtil.getInstance();
		try {
			
			result = sqlSession.insert("review.insertReview",reviewVO);
			if(result>0) {
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
	public ReviewVO getReview(ReviewVO reviewVO) {
		
		ReviewVO rv = new ReviewVO();
		SqlSession sqlSession = MyBatisUtil.getInstance();
		try {
			
			rv = sqlSession.selectOne("review.getReview",reviewVO);
			
		} catch (PersistenceException e) {
			e.printStackTrace();
			
		}finally {
			sqlSession.close();
		}
		
		return rv;
	}

	@Override
	public List<RestaurantVO> getRstrntList(Map<String, String> map) {

		List<RestaurantVO> rl = new ArrayList<RestaurantVO>();

		SqlSession sqlSession = MyBatisUtil.getInstance();

		try {

			rl = sqlSession.selectList("restaurant.getRstrntList", map);

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return rl;
	}

	@Override
	public List<ReviewVO> getReviewList(int rstrntCode) {
		
		List<ReviewVO> reviewList = new ArrayList<ReviewVO>();
		SqlSession sqlSession = MyBatisUtil.getInstance();
		
		try {
			reviewList = sqlSession.selectList("review.getReviewList",rstrntCode);
			if(reviewList.size()>0) {
				sqlSession.commit();
			}
		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return reviewList;
	}

	@Override
	public List<RestaurantVO> getRestaurantList(int ctgryCode) {
		List<RestaurantVO> rstList = new ArrayList<RestaurantVO>();
		SqlSession sqlSession = MyBatisUtil.getInstance();
		
		try {
			
			rstList = sqlSession.selectList("restaurant.getRestaurantList",ctgryCode);
			
			if(rstList.size()>0) {
				sqlSession.commit();
			}
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
			
		}
		
		
		return rstList;
	}


	@Override
	public List<RestaurantVO> getRestaurantInfo(Map<String, Object> map) {
		
		List<RestaurantVO> rl = new ArrayList<RestaurantVO>();
		SqlSession sqlSession = MyBatisUtil.getInstance();
		
		try {
			rl = sqlSession.selectList("restaurant.getRestaurantInfo", map);
			if(rl.size()>0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return rl;
		
	}

	@Override
	public ReviewImgVO getRstrntFile(String rstrntCode) {
		
		ReviewImgVO rvo = new ReviewImgVO();
		SqlSession sqlSession = MyBatisUtil.getInstance();
		
		try {
			rvo = sqlSession.selectOne("restaurant.getRstrntFile", rstrntCode);
			
			if(rvo != null) {
				sqlSession.commit();
				
			} else {
				sqlSession.rollback();
			}
		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return rvo;
	}

	@Override
	public void addFavorite(FavoriteVO fv) {
		
		SqlSession sqlSession = MyBatisUtil.getInstance();
		try {
			int result = sqlSession.insert("restaurant.addFavorite",fv);
			if(result > 0) sqlSession.commit();
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		
	}


}
