<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	/* 
JDBC를 사용해서  DB정보 조회

0. 연결할 DB설치되어 있어야 함	
1. 자바와 DB연결을 위한 라이브러리 필요(ojdbc.jar)
2. Class.forName("JDBC Driver") - 드라이버 로딩
3. DriverManager를 통해 Connection객체 생성
4. SQL구문 실행을 위한 Statment객체 생성

*/

String userId = request.getParameter("userId");
String userPw = request.getParameter("userPw");


Class.forName("oracle.jdbc.driver.OracleDriver");
String url = "jdbc:oracle:thin:@localhost:1521:xe";
Connection conn = DriverManager.getConnection(url, "testpc22", "java");
Statement stmt = conn.createStatement();

String sql = "select cstmr_id from customer where cstmr_id = '" + userId + "' and cstmr_pw='" + userPw + "'";
ResultSet rs = stmt.executeQuery(sql);

if (rs.next()) {
	// 응답정보 생성
%>
	{"rst":"ok"}
<% 
} else {
	// 응답정보 생성
%>
	{"rst":"fail"}
<%
}
%>