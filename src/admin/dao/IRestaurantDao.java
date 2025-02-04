package admin.dao;

import java.util.List;

import restaurant.vo.BusinessVO;
import restaurant.vo.MenuVO;
import restaurant.vo.RestaurantVO;


public interface IRestaurantDao {
	
	/**
	 * 가게 목록을 불러오는 메소드
	 * @param city 
	 * @return
	 */
	List<RestaurantVO> getListRstrnt(String city);
	
	/**
	 * 가게 검색
	 * @param city
	 * @param sel
	 * @param searchWord
	 * @return
	 */
	List<RestaurantVO> getListRstrnt(String city, String sel, String searchWord);
	
	//가게 정보 상세
	RestaurantVO getRstrntDetail(int rstrntCode);
	
	/**
	 * 가게 정보 상세 영업시간
	 * @param rstrntCode
	 * @return
	 */
	BusinessVO getBusinessDetail(int rstrntCode);

	/**
	 * 가게 메뉴 상세
	 * @param rstrntCode
	 * @return
	 */
	List<MenuVO> getMenuDetail(int rstrntCode);

	int insertRestaurant(RestaurantVO rv);
	
	int insertBusiness(BusinessVO bv);

	int updateRestaurant(RestaurantVO rv);

	int updateBusiness(BusinessVO bv);
	
	//최신등록 가게 가져옴
	int getRstrntCode();
	
	//가게삭제
	int deleteRstrnt(int rstrntCode);
	
	//가게 메뉴 등록
	int insertMenu(MenuVO mv);
	
	//가게카테고리 코드를 가게이름으로 받아옴
	String getCategoryName(int ctgryCode);


	
	

}
