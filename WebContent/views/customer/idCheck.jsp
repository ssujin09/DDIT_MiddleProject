<%@page import="java.util.regex.Pattern"%>
<%@page import="member.service.CustomerServiceImpl"%>
<%@page import="member.service.ICustomerService"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String uId = request.getParameter("id");

	ICustomerService customerService = CustomerServiceImpl.getInstance();
	
	String cstmrId = customerService.getCustomer(uId);
	
/*  	String pattern = "^[a-z]+[a-z0-9]{5,15}$";
	
	boolean chk = Pattern.matches(pattern, cstmrId) */;  // 설정한 정규식과 일치해야 사용 가능
	
	
	if(cstmrId != null) {
		// 중복되는 값으로 사용 불가 응답 결과 생성
%>
		{"rst":"fail", "msg":"사용불가"}
<% 
	} else {
		// 사용가능 응답 결과 생성
%>
		{"rst":"ok", "msg":"사용가능"}
<%
	}
	

%>

