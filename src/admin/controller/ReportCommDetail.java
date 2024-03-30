package admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.service.IReportService;
import admin.service.ReportServiceImpl;
import admin.vo.CmmntyVO;
import community.vo.CommentVO;

@WebServlet("/admin/reportCommDetail.do")
public class ReportCommDetail extends HttpServlet{
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cmmntyCode =Integer.parseInt(request.getParameter("cmmntyCode"));
		
		int commCode = Integer.parseInt(request.getParameter("commCode"));
		
		System.out.println(cmmntyCode);
		
		IReportService reportService= ReportServiceImpl.getInstance();
		
		CmmntyVO cv = reportService.getReportPostDetail(cmmntyCode);
		CommentVO ccv = reportService.getReportComDetail(commCode);
		
		request.setAttribute("cv", cv);
		request.setAttribute("ccv", ccv);
		
		request.getRequestDispatcher("/views/admin/reportCommentDetail.jsp").forward(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
