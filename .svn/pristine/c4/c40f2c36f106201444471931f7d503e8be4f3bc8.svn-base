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

@WebServlet("/admin/noticeUpdate.do")
public class UpdateNotice extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		int noticeCode = Integer.parseInt(request.getParameter("noticeCode"));

		INoticeService noticeService = NoticeServiceImpl.getInstance();

		NoticeVO nv = noticeService.getNoticeDetail(noticeCode);

		request.setAttribute("nv", nv);

		request.getRequestDispatcher("/views/admin/noticeUpdate.jsp").forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String noticeTitle=request.getParameter("noticeTitle");
		String noticeContent= request.getParameter("noticeContent");
		int noticeCode =Integer.parseInt(request.getParameter("noticeCode"));

		INoticeService noticeService= NoticeServiceImpl.getInstance();

		NoticeVO nv = new NoticeVO();


		nv.setNoticeTitle(noticeTitle);
		nv.setNoticeContent(noticeContent);
		nv.setNoticeCode(noticeCode);
		int cnt = noticeService.updateNotice(nv);

		String msg="";

		if(cnt>0) {
			msg="성공";
		}else {
			msg = "실패";
		}

		response.sendRedirect(request.getContextPath() + "/admin/noticeList.do");

	}

}
