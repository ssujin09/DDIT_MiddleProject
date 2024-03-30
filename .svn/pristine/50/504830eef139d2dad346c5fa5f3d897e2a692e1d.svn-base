package admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.service.INoticeService;
import admin.service.NoticeServiceImpl;
import admin.vo.AdminVO;
import admin.vo.NoticeVO;

@WebServlet("/admin/noticeDetail.do")
public class NoticeDetailController extends HttpServlet{
	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int noticeCode = Integer.parseInt(request.getParameter("noticeCode"));
		System.out.println(noticeCode);
		
		
		INoticeService noticeService = NoticeServiceImpl.getInstance();
		
		NoticeVO nv = noticeService.getNoticeDetail(noticeCode);
		
		request.setAttribute("nv", nv);
		
		
		AdminVO av = (AdminVO)request.getSession().getAttribute("adLogin");
		
		if(av !=null) {
			
			request.getRequestDispatcher("/views/admin/noticeDetail.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("/views/admin/userNoticeDetail.jsp").forward(request, response);
			
		}
		
		

	}
	
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	
	

}
