package home.service;

import java.util.List;

import home.dao.HomeDao;
import home.dao.HomeDaoImpl;
import home.vo.CategoryVO;
import restaurant.vo.RestaurantVO;

public class HomeServiceImpl implements HomeService {

	private static HomeService singleTon = null;

	private HomeServiceImpl() {
	};

	public static HomeService getInstance() {
		if (singleTon == null) {
			singleTon = new HomeServiceImpl();
		}
		return singleTon;
	}
	
	HomeDao dao = HomeDaoImpl.getInstance();

	@Override
	public List<CategoryVO> displayRstrn() {
		List<CategoryVO> cv = dao.displayRstrn();
		return cv;
	}

	




}
