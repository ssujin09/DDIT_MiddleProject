package admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.service.INoticeService;
import admin.service.NoticeServiceImpl;

@WebServlet("/admin/noticeDelete.do")
public class DeleteNotice extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int noticeCode = Integer.parseInt(request.getParameter("noticeCode"));
		
		INoticeService noticeService = NoticeServiceImpl.getInstance();
		
		int cnt = noticeService.deleteNotice(noticeCode);
		
		String msg="";
		if(cnt>0) {
			msg="성공";
		}else {
			msg="실패";
		}
		
		response.sendRedirect(request.getContextPath()+"/admin/noticeList.do");

		
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
