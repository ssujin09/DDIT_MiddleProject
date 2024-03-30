package admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.service.IReportService;
import admin.service.ReportServiceImpl;

/**
 * Servlet implementation class ManageComm
 */
@WebServlet("/admin/managecomm.do")
public class ManageComm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	IReportService reportService = ReportServiceImpl.getInstance();
	
	
	
    public ManageComm() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String active = request.getParameter("active");
		int ccommentCode = Integer.parseInt(request.getParameter("ccommentCode"));
		
		System.out.println("ccommentCode=" +ccommentCode);
		
		
		if(active.equals("복원")) {
			reportService.cancelComm(ccommentCode);
		}else if(active.equals("삭제")) {
			reportService.deleteComm(ccommentCode);
		}else {
			// 오류
		}
		
		response.sendRedirect("reportPostList.do");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
