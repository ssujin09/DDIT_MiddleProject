package admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.service.IRestaurantService;
import admin.service.RestaurantServiceImpl;
import restaurant.vo.BusinessVO;
import restaurant.vo.MenuVO;
import restaurant.vo.RestaurantVO;

@WebServlet("/admin/rstrntDetail.do")
public class RestaurantDetail extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		

		int rstrntCode = Integer.parseInt(req.getParameter("rstrntCode"));
		String param = req.getParameter("param");
		
		System.out.println(rstrntCode);
		
		IRestaurantService restaurantService = RestaurantServiceImpl.getInstance();
		
		RestaurantVO rv =  restaurantService.getRstrntDetail(rstrntCode);
		
		BusinessVO bv = restaurantService.getBusinessDetail(rstrntCode);
		
		List<MenuVO> menuList = restaurantService.getMenuDetail(rstrntCode);
		
		int ctgryCode = rv.getCtgryCode();
		System.out.println("rv에서 꺼낸 " + ctgryCode);
		
		String ctgryName = restaurantService.getCategoryName(ctgryCode);
		System.out.println("변환한 ctgryName"+ctgryName);
		
		req.setAttribute("ctgryName", ctgryName);
		req.setAttribute("rv", rv);
		req.setAttribute("bv", bv);
		req.setAttribute("menuList", menuList);
		
		if(param !=null) {
			req.getRequestDispatcher("/views/admin/restaurantUpdate.jsp").forward(req, resp);
			
		}else {
		
		req.getRequestDispatcher("/views/admin/restaurantDetail.jsp").forward(req, resp);
		
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
