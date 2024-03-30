package admin.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.logging.jdbc.BaseJdbcLogger;

import admin.service.IRestaurantService;
import admin.service.RestaurantServiceImpl;
import restaurant.vo.BusinessVO;
import restaurant.vo.MenuVO;
import restaurant.vo.RestaurantVO;

/**
 * Servlet implementation class InsertRestaurant
 */
@MultipartConfig
@WebServlet("/admin/insertrstrnt.do")
public class RestaurantInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
      IRestaurantService rstService = RestaurantServiceImpl.getInstance();
 

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.getRequestDispatcher("/views/admin/restaurantInsert.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
//	String ctgry = request.getParameter("ctgry");
//	int ctgry_no = rstService.getCtgryNo(ctgry);
		
	request.setCharacterEncoding("utf-8");
	String rstrntName = request.getParameter("rstrntName");
	String rstrntAddr = request.getParameter("rstrntAddr");
	String rstrntTel = request.getParameter("rstrntTel");
	String rstrntTag = request.getParameter("rstrntTag");
	
	int ctgryCode = Integer.parseInt(request.getParameter("categoryCode"));
	
	
	String city = rstrntAddr.substring(0,2);

	String bsnOpentime = request.getParameter("rstrntOpen");
	String bsnClosetime = request.getParameter("rstrntclose");
	String bsnReststart = request.getParameter("rstrntSt");
	String bsnRestfinish = request.getParameter("rstrntEnd");

	String[] menuName = request.getParameterValues("menuName");
	String[] menuPrice = request.getParameterValues("menuPrice");
//	String menuPrice1 = request.getParameter("menuPrice1");
//	String menuPrice2 = request.getParameter("menuPrice2");
	
	
	
	MenuVO mv = new MenuVO();
	
//	mv.setMenuName(menuName1);
//	mv.setMenuPrice(menuPrice1);
	
	
	RestaurantVO rv = new RestaurantVO();
	
	rv.setRstrntName(rstrntName);
	rv.setRstrntAddr(rstrntAddr);
	rv.setRstrntTel(rstrntTel);
	rv.setRstrntTag(rstrntTag);
	rv.setCtgryCode(ctgryCode);
	
	
	
	BusinessVO bv = new BusinessVO();
	
	bv.setBsnOpentime(bsnOpentime);
	bv.setBsnClosetime(bsnClosetime);
	bv.setBsnReststart(bsnReststart);
	bv.setBsnRestfinish(bsnRestfinish);
	
	int rstCode = rstService.insertRestaurant(rv);
	
	int cnt = 0;
	if(rstCode > 0) {
		System.out.println("로그 : 가게 정보 등록 성공");
		
		bv.setRstrntCode(rstCode);
		
		cnt = rstService.insertBusiness(bv);
		
		if(cnt > 0) {
			mv.setRstrntCode(rstCode);
			System.out.println("로그 : 가게 영업시간 등록 성공");
			for(int i=0; i<menuName.length; i++) {
				mv.setMenuName(menuName[i]);
				mv.setMenuPrice(menuPrice[i]);
				cnt= rstService.insertMenu(mv);
			}
		}
		
		
		
		if(cnt > 0) {
			System.out.println("로그 : 가게 메뉴 등록 성공");
			
		
		}
		
		
		
	}
	

	
	response.sendRedirect(request.getContextPath()+"/admin/restaurantList.do?city="+URLEncoder.encode(city, "UTF-8"));

	}
	}
	


