<%@page import="member.vo.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%

		CustomerVO info = (CustomerVO) session.getAttribute("loginCode");
		
		List<CategoryVO> ctgryList = (List<CategoryVO>) request.getAttribute("cv");
		RestaurantService rstService = RestaurantServiceImpl.getInstance();
		
%>

	<%@include file="/views/home/home.jsp" %>
	
