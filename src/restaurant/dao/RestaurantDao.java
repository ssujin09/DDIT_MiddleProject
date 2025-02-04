package restaurant.dao;

import java.util.List;
import java.util.Map;

import mypage.vo.FavoriteVO;
import mypage.vo.ReviewImgVO;
import mypage.vo.ReviewVO;
import restaurant.vo.BusinessVO;
import restaurant.vo.MenuVO;
import restaurant.vo.RestaurantVO;

public interface RestaurantDao {

	RestaurantVO displayDeatils(int rstrntCode);

	RestaurantVO getLocal(int rstrntCode);

	int insertReview(ReviewVO reviewVO);

	ReviewVO getReview(ReviewVO reviewVO);

	BusinessVO displayBsn(int rstrntCode);

	List<MenuVO> displayMenu(int rstrntCode);

	List<RestaurantVO> getRstrntList(Map<String, String> map);

	List<ReviewVO> getReviewList(int rstrntCode);

	List<RestaurantVO> getRestaurantList(int ctgryCode);
	

	List<RestaurantVO> getRestaurantInfo(Map<String, Object> map);

	ReviewImgVO getRstrntFile(String rstrntCode);

	void addFavorite(FavoriteVO fv);

	
}
