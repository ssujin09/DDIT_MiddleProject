package admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.service.INoticeService;
import admin.service.NoticeServiceImpl;
import admin.vo.NoticeVO;

@WebServlet("/admin/noticeInsert.do")
public class InsertNotice extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/views/admin/noticeInsert.jsp").forward(request, response);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String noticeTitle = request.getParameter("noticeTitle");
		String noticeContent = request.getParameter("noticeContent");
		
		INoticeService noticeService = NoticeServiceImpl.getInstance();
		
		NoticeVO nv = new NoticeVO();
		
		nv.setNoticeTitle(noticeTitle);
		nv.setNoticeContent(noticeContent);
		
		int cnt = noticeService.insertNotice(nv);
			String msg = "";
			
		if(cnt>0) {
			msg = "공지사항 등록 성공";
		}else {
			msg = "공지사항 등록 실패";
		}
	
		response.sendRedirect(request.getContextPath() + "/admin/noticeList.do");
		
	}
	
	
	
}
