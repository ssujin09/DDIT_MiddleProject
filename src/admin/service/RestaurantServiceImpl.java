package admin.service;

import java.util.List;

import admin.dao.IRestaurantDao;
import admin.dao.RestaurantDaoImpl;
import restaurant.vo.BusinessVO;
import restaurant.vo.MenuVO;
import restaurant.vo.RestaurantVO;


public class RestaurantServiceImpl implements IRestaurantService{

	private static IRestaurantService restaurantService;
	
	private IRestaurantDao restaurantDao;
	
	public RestaurantServiceImpl() {
		restaurantDao=RestaurantDaoImpl.getInstance();
	}
	
	public static IRestaurantService getInstance() {
		if(restaurantService == null) {
			restaurantService=new RestaurantServiceImpl(); 
		}
		return restaurantService;
		}

	@Override
	public List<RestaurantVO> getListRstrnt(String city) {
		List<RestaurantVO> rstrntList = restaurantDao.getListRstrnt(city);
		return rstrntList;
	}

	@Override
	public List<RestaurantVO> getListRstrnt(String city, String sel, String searchWord) {
		List<RestaurantVO> rstrntList = restaurantDao.getListRstrnt(city,sel,searchWord);
		return rstrntList;
	}

//	@Override
//	public int addRestaurant(RestaurantVO rv, BusinessVO bv) {
//		
//		restaurantDao.addRestaurant(rv);
//		
//		int rstrntCode = restaurantDao.getRstrntCode(rv);
//		
//		bv.setRstrntCode(rstrntCode);
//		
//		result = restaurantDao.addBusiness(bv);
//
//		
//		return rstrntCode;
//	}

	@Override
	public RestaurantVO getRstrntDetail(int rstrntCode) {
		
		System.out.println(rstrntCode);
		RestaurantVO rv= restaurantDao.getRstrntDetail(rstrntCode);
		
		return rv;
		
	}

	@Override
	public BusinessVO getBusinessDetail(int rstrntCode) {
		BusinessVO bv = restaurantDao.getBusinessDetail(rstrntCode);
		
		return bv;
	}

	@Override
	public List<MenuVO> getMenuDetail(int rstrntCode) {
		List<MenuVO> menuList = restaurantDao.getMenuDetail(rstrntCode);
		
		return menuList;
	}

	@Override
	public int insertRestaurant(RestaurantVO rv) {
		int cnt = restaurantDao.insertRestaurant(rv);
		int rstCode=0;
		
		if(cnt != 0) {
			rstCode = restaurantDao.getRstrntCode();
		}
		return rstCode;
	}

	@Override
	public int updateRestaurant(RestaurantVO rv) {
		return restaurantDao.updateRestaurant(rv);
	}

	@Override
	public int updateBusiness(BusinessVO bv) {
		return restaurantDao.updateBusiness(bv);
	}

	@Override
	public int insertBusiness(BusinessVO bv) {
		return restaurantDao.insertBusiness(bv);

	}

	@Override
	public int deleteRstrnt(int rstrntCode) {
		return restaurantDao.deleteRstrnt(rstrntCode);
	}

	@Override
	public int insertMenu(MenuVO mv) {
		return restaurantDao.insertMenu(mv);
	}

	@Override
	public String getCategoryName(int ctgryCode) {
		
		return restaurantDao.getCategoryName(ctgryCode);
	}


	



}
