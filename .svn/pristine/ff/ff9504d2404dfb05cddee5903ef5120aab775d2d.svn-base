<%@page import="admin.vo.AdminVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">

<%
	AdminVO av = (AdminVO) session.getAttribute("adLogin");


	if(av != null) {
%>
		location.href = "<%=request.getContextPath() %>" + "/admin/noticeList.do";
<%
	} else {
%>
		<%@include file="/index.html" %>
<%
	}

%>
</script>