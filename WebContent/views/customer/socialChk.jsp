<%@page import="member.service.CustomerServiceImpl"%>
<%@page import="member.service.ICustomerService"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="member.vo.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    
    
    	request.setCharacterEncoding("UTF-8");
    	
    	String cstmrPhone = (String) request.getParameter("cstmrPhone");
    	
  		ICustomerService customerService = CustomerServiceImpl.getInstance();
  		
  		String idChk = customerService.socialChk(cstmrPhone);
  		
  		if(idChk != null)  {
    %>
		ok
	<%
  		} else { 
	%>    
		fail
	<%
  		}
	%>
    
