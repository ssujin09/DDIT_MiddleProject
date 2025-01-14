package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
	 * Description : 로그아웃 처리 클래스
	 * Date : 2024. 1. 10
	 * History :
	 * - 작성자 : '최현흠', 날짜 : 2024. 1. 09, 설명 : 최초작성
	 * - 수정자 : 
	 * @author PC-22
	 */
@WebServlet("/logout.do")
public class Logout extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getSession().invalidate();
		
		response.sendRedirect("home.do");
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
