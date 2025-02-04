package community.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import community.service.CCommentServiceImpl;
import community.service.CmmntyServiceImpl;
import community.service.ICCommentService;
import community.service.ICmmntyService;

@WebServlet("/cmmnty/report.do")
public class ReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	ICmmntyService cmmntyService = CmmntyServiceImpl.getInstance();
	ICCommentService commentService = CCommentServiceImpl.getInstance();
	
    public ReportController() {
    	
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cmmntyCode = Integer.parseInt(request.getParameter("cmmntyCode"));
		System.out.println(cmmntyCode);
		cmmntyService.contentReport(cmmntyCode);
		response.sendRedirect("detail.do?cmmntyCode="+cmmntyCode);
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
