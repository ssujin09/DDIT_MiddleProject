<%@page import="member.service.CustomerServiceImpl"%>
<%@page import="member.service.ICustomerService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <% 
    	String name = request.getParameter("cstmrName");
    	String email = request.getParameter("cstmrEmail");
    	
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	map.put("cstmrName", name);
    	map.put("cstmrEmail", email);
    	
    	ICustomerService customerService = CustomerServiceImpl.getInstance();
    	
    	
    	String cstmrId = customerService.searchId(map);
    	
    	String socialTag = customerService.getSocialTag(cstmrId);
    	
    	String rst = null;
    	
    	if(socialTag != null) {
    		
    		rst = socialTag;
    	} else {
    		rst = cstmrId;
    	}
    	
    
    %>
    
    <%=rst %>