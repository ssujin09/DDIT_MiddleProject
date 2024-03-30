package admin.service;

import java.util.List;

import restaurant.vo.BusinessVO;
import restaurant.vo.MenuVO;
import restaurant.vo.RestaurantVO;


public interface IRestaurantService{

	/**
	 * 가게 목록을 불러오는 메소드
	 * @param city 
	 * @return
	 */
	List<RestaurantVO> getListRstrnt(String city);
	
	/**
	 * 가게 검색기능
	 * @param city
	 * @param sel
	 * @param searchWord
	 * @return
	 */
	List<RestaurantVO> getListRstrnt(String city, String sel, String searchWord);

//	int addRestaurant(RestaurantVO rv, BusinessVO bv);
	
	/*
	 * 가게 상세 정보
	 */
	RestaurantVO getRstrntDetail(int rstrntCode);

	/**
	 * 가게 상세 영업시간
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
	
	/**
	 * 가게등록
	 * @param rv
	 * @return
	 */
	int insertRestaurant(RestaurantVO rv);
	
	int insertBusiness(BusinessVO bv);
	

	int updateRestaurant(RestaurantVO rv);

	int updateBusiness(BusinessVO bv);
	/**
	 * 가게삭제
	 * @param rstrntCode
	 * @return
	 */
	int deleteRstrnt(int rstrntCode);
	
	/**
	 * 가게 메뉴 등록
	 * @param mv
	 * @return
	 */
	int insertMenu(MenuVO mv);
	
	/**
	 * 가게분류코드를 가게 이름으로 받아옴
	 * @param ctgryCode
	 * @return
	 */
	String getCategoryName(int ctgryCode);

	
}
