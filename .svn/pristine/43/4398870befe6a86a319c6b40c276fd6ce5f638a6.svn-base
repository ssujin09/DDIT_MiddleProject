package admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.dao.ICustomerDao;
import admin.service.CustomerServiceImpl;
import admin.service.ICustomerService;
import admin.vo.CustomerVO;


@WebServlet("/admin/customerList.do")
public class CustomerList extends HttpServlet{

	
	
	public CustomerList() {
		super();
	}
	

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ICustomerService customerService = CustomerServiceImpl.getInstance();
		
		List<CustomerVO> customerList = customerService.listCustomer();
		
		request.setAttribute("customerList", customerList);
		
		request.getRequestDispatcher("/views/admin/customerList.jsp").forward(request, response);
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
}
