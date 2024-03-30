package admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.service.CustomerServiceImpl;
import admin.service.ICustomerService;
import admin.vo.CustomerVO;

@WebServlet("/admin/warnCustomer.do")
public class WarnCustomer extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ICustomerService customerService = CustomerServiceImpl.getInstance();
		
		List<CustomerVO> warnCustomerList = customerService.getWarnCustomerList();
		
		request.setAttribute("warnCustomerList",warnCustomerList);
		
		request.getRequestDispatcher("/views/admin/warnCustomer.jsp").forward(request, response);
		
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	
}
