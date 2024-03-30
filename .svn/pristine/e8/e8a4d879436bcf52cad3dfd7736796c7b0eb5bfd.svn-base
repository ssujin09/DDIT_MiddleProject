package home.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import home.service.HomeService;
import home.service.HomeServiceImpl;
import home.vo.CategoryVO;
import member.vo.CustomerVO;

@WebServlet("/home.do")
public class Home extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HomeService homeService = HomeServiceImpl.getInstance();
		
		List<CategoryVO> cv = homeService.displayRstrn();
		
		req.setAttribute("cv", cv);
		
		req.getRequestDispatcher("/views/home/home.jsp").forward(req, resp);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
