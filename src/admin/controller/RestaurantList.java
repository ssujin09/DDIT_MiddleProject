package admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.valves.rewrite.ResolverImpl;

import admin.service.IRestaurantService;
import admin.service.RestaurantServiceImpl;
import restaurant.vo.RestaurantVO;


@WebServlet("/admin/restaurantList.do")
public class RestaurantList extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public RestaurantList() {
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String city = request.getParameter("city");
		
		String sel =request.getParameter("sel");
		String searchWord = request.getParameter("searchWord"); 
	

		IRestaurantService restaurantService = RestaurantServiceImpl.getInstance();
		
		List<RestaurantVO> rstrntList = new ArrayList<RestaurantVO>();
		
		//검색시 가게목록
		if(searchWord !=null) {
			rstrntList=restaurantService.getListRstrnt(city,sel,searchWord);
			
		//도시별 가게목록
		}else {
			rstrntList= restaurantService.getListRstrnt(city);
			
		}
		
		request.setAttribute("rstrntList", rstrntList);
		
		request.getRequestDispatcher("/views/admin/cityRstrnt.jsp").forward(request, response);
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		

	}
}
