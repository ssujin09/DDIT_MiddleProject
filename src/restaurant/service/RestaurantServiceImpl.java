package restaurant.service;

import java.util.List;
import java.util.Map;

import mypage.vo.FavoriteVO;
import mypage.vo.ReviewImgVO;
import mypage.vo.ReviewVO;
import restaurant.dao.RestaurantDao;
import restaurant.dao.RestaurantDaoImpl;
import restaurant.vo.BusinessVO;
import restaurant.vo.MenuVO;
import restaurant.vo.RestaurantVO;

public class RestaurantServiceImpl implements RestaurantService {

	private static RestaurantService singleTon = null;

	private RestaurantServiceImpl() {
	};

	public static RestaurantService getInstance() {
		if (singleTon == null) {
			singleTon = new RestaurantServiceImpl();
		}
		return singleTon;
	}

	RestaurantDao dao = RestaurantDaoImpl.getInstance();
	
	
	@Override
	public RestaurantVO displayDeatils(int rstrntCode) {
		
		RestaurantVO rv = dao.displayDeatils(rstrntCode);
		
		return rv;
	}

	@Override
	public RestaurantVO displayLocals(int rstrntCode) {
		
		RestaurantVO rv = dao.getLocal(rstrntCode);
		
		return rv;
	}

	@Override
	public BusinessVO displayBsn(int rstrntCode) {
		
		BusinessVO bv = dao.displayBsn(rstrntCode);
		
		return bv;
	}

	@Override
	public List<MenuVO> displayMenu(int rstrntCode) {
		
		List<MenuVO> mv = dao.displayMenu(rstrntCode);
		
		return mv;
	}

	@Override
	public int insertReview(ReviewVO reviewVO) {
		
		
		return dao.insertReview(reviewVO);
	}

	@Override
	public ReviewVO getReview(ReviewVO reviewVO) {
		return dao.getReview(reviewVO);
	}

	@Override
	public List<RestaurantVO> getRstrntList(Map<String, String> map) {
		List<RestaurantVO> rl = dao.getRstrntList(map);
		return rl;
	}
	@Override
	public List<ReviewVO> getReviewList(int rstrntCode) {
		return dao.getReviewList(rstrntCode);
	}

	@Override
	public List<RestaurantVO> getRestaurantList(int ctgryCode) {
		return dao.getRestaurantList(ctgryCode);
	}





	@Override
	public List<RestaurantVO> getRestaurantInfo(Map<String, Object> map) {
		return dao.getRestaurantInfo(map);
	}

	@Override
	public String getRstrntFile(String rstrntCode) {
		ReviewImgVO rvo = dao.getRstrntFile(rstrntCode);
		String noImg = "noImg";
		
		if (rvo != null) {
			String filePath = rvo.getReviewFilePath();
			String fileName = rvo.getReviewFileName();
			String fileExstn = rvo.getReviewFileExtsn();
			
			filePath = filePath.replace("d:", "");
			
			return filePath+"/"+fileName+fileExstn;
		} else {
			return noImg;
		}
		
		
	}

	@Override
	public void addFavorite(FavoriteVO fv) {
		dao.addFavorite(fv);
		
	}
	

	


	
}
