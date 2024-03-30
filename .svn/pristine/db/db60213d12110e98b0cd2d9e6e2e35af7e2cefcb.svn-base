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


@WebServlet("/map.do")
public class Maps extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Maps() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// String sido = request.getParameter("");
		// String detail = request.getParameter("");
		String addr = request.getParameter("addr");
		
		String address[] = addr.split(" "); 
		
		String sido = address[0];
		
		String detail = address[1] + " " + address[2];
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("sido", sido);
		map.put("detail", detail);
		
		RestaurantService restaurantService = RestaurantServiceImpl.getInstance();
		
		List<RestaurantVO> rl = restaurantService.getRstrntList(map);
		
		request.setAttribute("addrList", rl);
		request.setAttribute("addr", addr);
		
		request.getRequestDispatcher("/views/restaurant/map.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
