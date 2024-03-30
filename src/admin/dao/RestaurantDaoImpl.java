package admin.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.crypto.spec.RC2ParameterSpec;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import restaurant.vo.BusinessVO;
import restaurant.vo.MenuVO;
import restaurant.vo.RestaurantVO;
import util.MyBatisUtil;

public class RestaurantDaoImpl implements IRestaurantDao{

	private static IRestaurantDao restaurantDao;
	
	public RestaurantDaoImpl() {
	}
	
	public static IRestaurantDao getInstance() {
		if(restaurantDao==null) {
			restaurantDao= new RestaurantDaoImpl();
		}
		return restaurantDao;
	}

	@Override
	public List<RestaurantVO> getListRstrnt(String city) {
		
		List<RestaurantVO> rstrntList = new ArrayList<RestaurantVO>();
		SqlSession sqlSession = MyBatisUtil.getInstance();
		
		try {
			rstrntList = sqlSession.selectList("admin.listRstrntCity", city);
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return rstrntList;
	}

	@Override
	public List<RestaurantVO> getListRstrnt(String city, String sel, String searchWord) {
		
		List<RestaurantVO> rstrntList = new ArrayList<RestaurantVO>();
		SqlSession sqlSession = MyBatisUtil.getInstance();
		
		Map<String, Object> param = new HashMap<>();
		
		param.put("city", city);
		param.put("sel", sel);
		param.put("searchWord", searchWord);
		
	
		
		try {
			
			rstrntList = sqlSession.selectList("admin.searchRstrntCity", param);
			System.out.println(rstrntList.size());
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return rstrntList;
		
	}

	@Override
	public RestaurantVO getRstrntDetail(int rstrntCode) {
		
		RestaurantVO rv = new RestaurantVO();
		
		SqlSession sqlSession = MyBatisUtil.getInstance();
		
		try {
			
			rv=sqlSession.selectOne("admin.getRstrntDetail",rstrntCode);
			
		}catch(PersistenceException e){
			e.printStackTrace();
			
		}finally {
			sqlSession.close();
		}
		
		
		return rv;
	}

	@Override
	public BusinessVO getBusinessDetail(int rstrntCode) {
		System.out.println(rstrntCode);

		BusinessVO bv = new BusinessVO();
		
		SqlSession sqlSession = MyBatisUtil.getInstance();
		
		try {
			
			bv=sqlSession.selectOne("admin.getBusinessDetail",rstrntCode);
			
		}catch(PersistenceException e){
			e.printStackTrace();
			
		}finally {
			sqlSession.close();
		}
		
		System.out.println(bv.getBsnClosetime());
		return bv;
	}

	@Override
	public List<MenuVO> getMenuDetail(int rstrntCode) {
		
		List<MenuVO> menuList = new ArrayList<MenuVO>();
		
		SqlSession sqlSession = MyBatisUtil.getInstance();
		
		try {
			
			menuList=sqlSession.selectList("admin.getMenuDetail",rstrntCode);
			
		}catch(PersistenceException e){
			e.printStackTrace();
			
		}finally {
			sqlSession.close();
		}
		
		System.out.println(menuList.size());
		return menuList;
	}

	@Override
	public int insertRestaurant(RestaurantVO rv) {
		int result = 0;
		SqlSession sqlSession = MyBatisUtil.getInstance();
		try {
			result = sqlSession.insert("admin.insertRestaurant",rv);
			if(result>0) sqlSession.commit();
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		
		return result;
	}
	
	@Override
	public int insertBusiness(BusinessVO bv) {
		

		int result = 0;
		SqlSession sqlSession = MyBatisUtil.getInstance();
		try {
			result = sqlSession.insert("admin.insertBusiness",bv);
			if(result>0) sqlSession.commit();
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		
		return result;
	}


	@Override
	public int updateRestaurant(RestaurantVO rv) {
		
		int result = 0;
		SqlSession sqlSession = MyBatisUtil.getInstance();

		try {
			
			result = sqlSession.update("admin.updateRestaurant",rv);
			
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

	@Override
	public int updateBusiness(BusinessVO bv) {
		
		int result = 0;
		SqlSession sqlSession = MyBatisUtil.getInstance();
		try {
			
			result = sqlSession.update("admin.updateBusiness",bv);
			if(result>0) sqlSession.commit();
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
	
		return result;
	}

	@Override
	public int getRstrntCode() {

		SqlSession sqlSession = MyBatisUtil.getInstance();
		int result = 0;
		
		try {
			
			result=sqlSession.selectOne("admin.getRstrntCode");
			
		}catch(PersistenceException e){
			e.printStackTrace();
			
		}finally {
			sqlSession.close();
		}
		
		return result;

	}

	@Override
	public int deleteRstrnt(int rstrntCode) {
		
		SqlSession sqlSession = MyBatisUtil.getInstance();
		int result = 0;
		
		try {
			
			result=sqlSession.update("admin.deleteRstrnt",rstrntCode);
			if(result>0) sqlSession.commit();
			
		}catch(PersistenceException e){
			e.printStackTrace();
			
		}finally {
			sqlSession.close();
		}
		System.out.println(result);
		return result;
		
		
	}

	@Override
	public int insertMenu(MenuVO mv) {
		int result = 0;
		SqlSession sqlSession = MyBatisUtil.getInstance();
		try {
			result = sqlSession.insert("admin.insertMenu",mv);
			if(result>0) sqlSession.commit();
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		
		return result;
	}

	@Override
	public String getCategoryName(int ctgryCode) {
		
		String ctgryName = null;
		
		SqlSession sqlSession = MyBatisUtil.getInstance();
		try {
			ctgryName = sqlSession.selectOne("admin.getCtgtyName",ctgryCode);
			
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		System.out.println("다오에서 찍어낸  " +ctgryName );
		
		
		return ctgryName;

	}



}
