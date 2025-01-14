package restaurant.service;

import java.util.List;
import java.util.Map;

import mypage.vo.FavoriteVO;
import mypage.vo.ReviewImgVO;
import mypage.vo.ReviewVO;
import restaurant.vo.BusinessVO;
import restaurant.vo.MenuVO;
import restaurant.vo.RestaurantVO;

public interface RestaurantService {

	public RestaurantVO displayDeatils(int rstrntCode);

	public RestaurantVO displayLocals(int rstrntCode);

	public int insertReview(ReviewVO reviewVO);

	public ReviewVO getReview(ReviewVO reviewVO);
	
	public BusinessVO displayBsn(int rstrntCode);

	public List<MenuVO> displayMenu(int rstrntCode);
	
	public List<RestaurantVO> getRstrntList(Map<String, String> map);

	public List<ReviewVO> getReviewList(int rstrntCode);

	public List<RestaurantVO> getRestaurantList(int ctgryCode);




	public List<RestaurantVO> getRestaurantInfo(Map<String, Object> map);

	public String getRstrntFile(String rstrntCode);

	public void addFavorite(FavoriteVO fv);
	
	
}
