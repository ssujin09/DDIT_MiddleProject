package admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.service.CustomerServiceImpl;
import admin.service.ICustomerService;

@WebServlet("/admin/expelCustomer.do")
public class CustomerExpel extends HttpServlet {
	
	
	private static final long serialVersionUID = 1L;


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String cstmrId = request.getParameter("cstmrId");
		
		ICustomerService cstmrService = CustomerServiceImpl.getInstance();
		
		int cnt = cstmrService.expelCustomer(cstmrId);
		
		System.out.println(cnt);
		if(cnt>0) {
			
			response.getWriter().write("success");
		
		}else {

			response.getWriter().write("fail");

		}
		
		
		
		
		
	}

}
