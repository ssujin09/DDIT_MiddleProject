<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="member.service.CustomerServiceImpl"%>
<%@page import="member.service.ICustomerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <%
    	String cstmrId = request.getParameter("cstmrId");
    	String cstmrPw = request.getParameter("cstmrPw");
    	
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("cstmrId", cstmrId);
    	map.put("cstmrPw", cstmrPw);
    	
    	ICustomerService customerService = CustomerServiceImpl.getInstance();
    	
    	int rst = customerService.resetPass(map);
    %>
    
    <%=rst %>