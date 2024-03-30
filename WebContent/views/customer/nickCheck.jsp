<%@page import="member.service.CustomerServiceImpl"%>
<%@page import="member.service.ICustomerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	String cstmrNick = request.getParameter("nickName");
	
	
	ICustomerService customerService = CustomerServiceImpl.getInstance();
	
	String cstmrId = customerService.nickChk(cstmrNick);

	if(cstmrId != null) {
		
%>
	fail
<%
	} else { 
%>
	ok
<%
	}
%>

	