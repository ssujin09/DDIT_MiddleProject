<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    	String userId = request.getParameter("userId");
    	String rst = "";
    
    	if(userId != null) {
			rst = "ok";    		
    	} else {
    		rst = "fail";
    	}
    %>
    <%=rst %>