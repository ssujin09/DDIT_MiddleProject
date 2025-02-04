package restaurant.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import restaurant.service.RestaurantService;
import restaurant.service.RestaurantServiceImpl;
import restaurant.vo.RestaurantVO;


@WebServlet("/search.do")
public class SearchRstrnt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchRstrnt() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String rstrntName = request.getParameter("rstrntName");
		String location = request.getParameter("location");
		String menuName = request.getParameter("menuName");
		
		if (rstrntName == null) {
			rstrntName = "";
		}
		if (location == null) {
			location = "";
		}
		if (menuName == null) {
			menuName = "";
		}
		
		RestaurantService restaurantService = RestaurantServiceImpl.getInstance();

		RestaurantVO rv = new RestaurantVO();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("rstrntName", rstrntName);
		map.put("location", location);
		map.put("menuName", menuName);
		
		List<RestaurantVO> rl = restaurantService.getRestaurantInfo(map);
		
		request.setAttribute("searchList", rl);
		
		request.getRequestDispatcher("/views/restaurant/searchList.jsp").forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
