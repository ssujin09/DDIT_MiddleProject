package restaurant.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.vo.CustomerVO;
import mypage.vo.FavoriteVO;
import restaurant.service.RestaurantService;
import restaurant.service.RestaurantServiceImpl;

@WebServlet("/restaurant/addfavorite.do")
public class AddFavorite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       RestaurantService rstService = RestaurantServiceImpl.getInstance();
    public AddFavorite() {
        super();
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CustomerVO myInfo = (CustomerVO) request.getSession().getAttribute("loginCode");
		int rstrntCode = Integer.parseInt(request.getParameter("rstrntCode"));
		
		FavoriteVO fv = new FavoriteVO();
		fv.setCstmrId(myInfo.getCstmrId());
		fv.setRstrntCode(rstrntCode);
		
		rstService.addFavorite(fv);
		
	
	
	
	
	}

}
