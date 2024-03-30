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

@WebServlet("/cmmnty/comreport.do")
public class ComReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	ICmmntyService cmmntyService = CmmntyServiceImpl.getInstance();
	ICCommentService commentService = CCommentServiceImpl.getInstance();
	
    public ComReportController() {
    	
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println(request.getParameter("ccommentCode"));
		int ccommentCode = Integer.parseInt(request.getParameter("ccommentCode"));
		commentService.commentReport(ccommentCode);
//		response.sendRedirect("detail.do?ccommentCode="+ccommentCode);
		request.getRequestDispatcher("detail.do?ccommentCode="+ccommentCode).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
