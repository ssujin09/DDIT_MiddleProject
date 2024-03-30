package admin.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import admin.service.IReportService;
import admin.service.ReportServiceImpl;

@WebServlet("/admin/reportPostDelete.do")
public class ReportPostDelete extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String cancel=req.getParameter("cancel");
		int cmmntyCode = Integer.parseInt(req.getParameter("cmmntyCode"));
		String cstmrId = req.getParameter("cstmrId");
		
		System.out.println(cmmntyCode);
		System.out.println(cstmrId);
	
		
		IReportService reportService = ReportServiceImpl.getInstance();
		
		Map<String, Object> param =  new HashMap<String, Object>();
		
		param.put("cmmntyCode", cmmntyCode);
		param.put("cstmrId", cstmrId);
		param.put("cancel",cancel);
		
		int cnt=0;
		
		if(cancel != null ) {
			
			 cnt = reportService.cancelReportPost(param);
			
		}else {
			
			 cnt = reportService.deleteReportPost(param);
			
		}
		
		String msg = "";
		
		if(cnt>1) {
			msg="성공";
			
		}else {
			msg="실패";
		}
		
		resp.sendRedirect(req.getContextPath()+"/admin/reportPostList.do");

		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
		
	}

}
