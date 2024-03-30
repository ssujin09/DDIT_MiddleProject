package member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import home.service.HomeService;
import home.service.HomeServiceImpl;
import home.vo.CategoryVO;
import member.service.CustomerServiceImpl;
import member.service.ICustomerService;
import member.vo.CustomerVO;

/**
 * Description : Date : 2024. 1. 10 History : - 작성자 : '최현흠', 날짜 : 2024. 1. 10,
 * 설명 : 최초작성 - 수정자 :
 * 
 * @author PC-22
 */
@WebServlet("/main.do")
public class Main extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		CustomerVO cv = (CustomerVO) request.getSession().getAttribute("loginCode");
		
		if (cv != null) {
			
			HttpSession session = request.getSession();
			session.setAttribute("loginCode", cv);
			
//			HomeService homeService = HomeServiceImpl.getInstance();
//			
//			List<CategoryVO> ctv = homeService.displayRstrn();
//			
//			request.setAttribute("cv", ctv);
			
			request.getRequestDispatcher("home.do").forward(request, response);
		}

	}

}
