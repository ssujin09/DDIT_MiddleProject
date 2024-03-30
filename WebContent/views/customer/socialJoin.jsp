<%@page import="member.vo.SocialVO"%>
<%@page import="member.service.CustomerServiceImpl"%>
<%@page import="member.service.ICustomerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%
 	
 	SocialVO sv = new SocialVO();
 	String cstmrId = request.getParameter("cstmrId");
 	String socialCtg = request.getParameter("socialCtg");
	
 	sv.setCstmrId(cstmrId);
 	sv.setSocialCtg(socialCtg);
 	
 	ICustomerService customerService = CustomerServiceImpl.getInstance();
 	
 	int rst = customerService.insertSocial(sv);
	 	
 
 %>
 <%=rst %>