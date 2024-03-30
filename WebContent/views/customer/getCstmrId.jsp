<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="member.service.CustomerServiceImpl"%>
<%@page import="member.service.ICustomerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    	String cstmrId = request.getParameter("cstmrId");
    	String cstmrEmail = request.getParameter("cstmrEmail");
    
    	ICustomerService customerService = CustomerServiceImpl.getInstance();
    
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	map.put("cstmrId", cstmrId);
    	map.put("cstmrEmail", cstmrEmail);
    
    	String id = customerService.getCstmrId(map);
    
    %>
    
    <%=id %>