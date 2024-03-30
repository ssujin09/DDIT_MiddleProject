<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		테스트
		<%int a = 10; %>
		<%request.setAttribute("str", a);%>
	</div>
	<jsp:include page="modal.jsp"/>
</body>
</html>