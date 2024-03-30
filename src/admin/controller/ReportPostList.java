package admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.service.IReportService;
import admin.service.ReportServiceImpl;
import admin.vo.CmmntyVO;
import community.vo.CommentVO;


@WebServlet("/admin/reportPostList.do")
public class ReportPostList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String param = request.getParameter("param");
		
		IReportService reportService = ReportServiceImpl.getInstance();
		
		List<CmmntyVO> reportPostList = new ArrayList<CmmntyVO>();
		List<CommentVO> reportComList = new ArrayList<CommentVO>();
		

		reportPostList = reportService.getReportPostList();
		reportComList =reportService.getReportComList();
	
		
		request.setAttribute("reportPostList", reportPostList);
		request.setAttribute("reportComList", reportComList);
		
		if(param !=null) {
			
			request.getRequestDispatcher("/views/admin/reportComList.jsp").forward(request, response);
			
		}else {
			request.getRequestDispatcher("/views/admin/reportPostList.jsp").forward(request, response);
			
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
