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

@WebServlet("/admin/reportPostDetail.do")
public class ReportPostDetail extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cmmntyCode =Integer.parseInt(request.getParameter("cmmntyCode"));
		
		IReportService reportService= ReportServiceImpl.getInstance();
		
		CmmntyVO cv = reportService.getReportPostDetail(cmmntyCode);

		
		request.setAttribute("cv", cv);

		
		request.getRequestDispatcher("/views/admin/reportPostDetail.jsp").forward(request, response);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
	}

}
