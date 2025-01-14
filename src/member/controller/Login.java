package member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.service.AdminServiceImpl;
import admin.service.IAdminService;
import admin.vo.AdminVO;
import member.service.CustomerServiceImpl;
import member.service.ICustomerService;
import member.vo.CustomerVO;

/**
	 * Description : 로그인 처리 클래스
	 * Date : 2024. 1. 10
	 * History :
	 * - 작성자 : '최현흠', 날짜 : 2024. 1. 09, 설명 : 최초작성
	 * - 수정자 : 
	 * @author PC-22
	 */
@WebServlet("/login.do")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Login() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			String cstmrId = request.getParameter("userId");
			String cstmrPw = request.getParameter("userPw");
			String socialCtg = request.getParameter("socialCtg");
			
			ICustomerService customerService = CustomerServiceImpl.getInstance();
			
			if (socialCtg != null) {
				
				
				CustomerVO cv =  customerService.getSocialInfo(cstmrId);
				
				
				if (cv == null) {
					
					response.sendRedirect(request.getContextPath() + "/views/customer/registration.html");
					
				} else {
					
					HttpSession session = request.getSession();
					session.setAttribute("loginCode", cv);
					
					response.sendRedirect(request.getContextPath() + "/main.do");
				}
				
				
			} else {
				
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("userId", cstmrId);
				map.put("userPw", cstmrPw);
				
				if (cstmrId.startsWith("admin")) {
					IAdminService adminService = AdminServiceImpl.getInstance();
					
					AdminVO av = adminService.adLogin(map);
					
					if (av != null) {
						
						HttpSession session = request.getSession();
						session.setAttribute("adLogin", av);
						
						response.sendRedirect(request.getContextPath() + "/admin.do");
						
					}
					
				} else {
					CustomerVO cv = customerService.loginChk(map);
					
					if (cv != null) {
						
						HttpSession session = request.getSession();
						session.setAttribute("loginCode", cv);
						
						response.sendRedirect(request.getContextPath() + "/main.do");
						
						
					} else {
						response.sendRedirect(request.getContextPath() +"/views/customer/login.html");
					}
				}
				
			}
		}
				
		
	}


