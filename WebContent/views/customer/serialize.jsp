<%@page import="member.service.CustomerServiceImpl"%>
<%@page import="member.service.ICustomerService"%>
<%@page import="mypage.util.FileUtil"%>
<%@page import="mypage.service.MypageServiceImple"%>
<%@page import="mypage.dao.MypageDaoImpl"%>
<%@page import="mypage.service.IMypageService"%>
<%@page import="mypage.vo.ProfileImgVO"%>
<%@page import="java.time.LocalDate"%>
<%@page import="member.vo.CustomerVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 

	// request.getParameter("key")를 통해 데이터를 각각 받아 처리해야 함을
	// beanUtils의 도움으로 조금 간편하게 처리 가능
	
	CustomerVO cv = new CustomerVO();

	ProfileImgVO pv = new ProfileImgVO();
	
	request.setCharacterEncoding("UTF-8");
	// 매핑되는 항목명을 동일하게 지정할 것(form의 name속성과 vo의 필드명 일치)
	BeanUtils.populate(cv, request.getParameterMap());
	
	cv.setProfileImgNo((int) request.getAttribute("fileNo"));
	
	
	ICustomerService customerService = CustomerServiceImpl.getInstance();
	
	int result = customerService.cstmrJoin(cv);
	
	if(result == 1) {
%>
		ok
<%
	} else {
%>
		fail		
<% 
	}
%>		

	

