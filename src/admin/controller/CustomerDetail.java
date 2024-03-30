package admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.service.CustomerServiceImpl;
import admin.service.ICustomerService;
import admin.vo.CustomerVO;

@WebServlet("/admin/customerDetail.do")
public class CustomerDetail extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cstmrId = request.getParameter("cstmrId");
		
		ICustomerService customerService = CustomerServiceImpl.getInstance();
		
		CustomerVO cv = customerService.getCustomerDetail(cstmrId);
		
		request.setAttribute("cv", cv);
		
		request.getRequestDispatcher("/views/admin/customerDetail.jsp").forward(request, response);
		
		
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
