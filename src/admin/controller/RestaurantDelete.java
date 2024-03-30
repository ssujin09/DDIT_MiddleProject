package admin.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.service.IRestaurantService;
import admin.service.RestaurantServiceImpl;

@WebServlet("/admin/rstrntDelete.do")
public class RestaurantDelete extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int rstrntCode = Integer.parseInt(req.getParameter("rstrntCode"));	
		String city = req.getParameter("city");
		IRestaurantService rstrntService = RestaurantServiceImpl.getInstance();
		
		int result = rstrntService.deleteRstrnt(rstrntCode);
		
		if(result>0) {
			
			System.out.println("가게 삭제 성공");
		}else {
			System.out.println("가게 삭제 실패");
		}
		
		resp.sendRedirect(req.getContextPath()+"/admin/restaurantList.do?city="+URLEncoder.encode(city, "UTF-8"));
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
