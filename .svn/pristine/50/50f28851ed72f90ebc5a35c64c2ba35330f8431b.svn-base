package admin.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.service.IRestaurantService;
import admin.service.RestaurantServiceImpl;
import restaurant.vo.BusinessVO;
import restaurant.vo.RestaurantVO;

@MultipartConfig
@WebServlet("/admin/rstrntUpdate.do")
public class RestaurantUpdate extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	IRestaurantService rstService = RestaurantServiceImpl.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		int rstrntCode = Integer.parseInt(req.getParameter("rstrntCode"));
		String rstrntName = req.getParameter("rstrntName");
		String rstrntAddr = req.getParameter("rstrntAddr");
		String rstrntTel = req.getParameter("rstrntTel");
		String rstrntTag = req.getParameter("rstrntTag");
		String city = req.getParameter("city");
		
		String rstrntOpen = req.getParameter("rstrntOpen");
		String rstrntclose = req.getParameter("rstrntclose");
		String rstrntSt = req.getParameter("rstrntSt");
		String rstrntEnd = req.getParameter("rstrntEnd");
		
		RestaurantVO rv = new RestaurantVO();
		BusinessVO bv = new BusinessVO();
		
		if(rstrntName != null) rv.setRstrntName(rstrntName);
		if(rstrntAddr != null) rv.setRstrntAddr(rstrntAddr);
		if(rstrntTel != null) rv.setRstrntTel(rstrntTel);
		if(rstrntTag != null) rv.setRstrntTag(rstrntTag);
		if(rstrntCode != 0) rv.setRstrntCode(rstrntCode);
		
		int result = rstService.updateRestaurant(rv);
		
		if(result > 0) {
			System.out.println("로그 : 가게 업데이트 성공");
		}
		
		if(rstrntOpen != null) bv.setBsnOpentime(rstrntOpen);
		if(rstrntclose != null) bv.setBsnClosetime(rstrntclose);
		if(rstrntSt != null) bv.setBsnReststart(rstrntSt);
		if(rstrntEnd != null) bv.setBsnRestfinish(rstrntEnd);
		if(rstrntCode != 0) bv.setRstrntCode(rstrntCode);
		
		
		result = rstService.updateBusiness(bv);
		
		
		if(result > 0) {
			System.out.println("로그 : 영업시간 업데이트 성공");
		}
		resp.sendRedirect(req.getContextPath()+"/admin/restaurantList.do?city="+URLEncoder.encode(city, "UTF-8"));
		
		
		
		
		
		
		
	}

}
