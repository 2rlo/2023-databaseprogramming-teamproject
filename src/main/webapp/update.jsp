<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 정보 수정</title>
</head>
<body>
<%@ include file="top.jsp" %>
<% if (session_id==null) response.sendRedirect("login.jsp"); %>
<% Connection myConn = null;
Statement stmt = null;
String mySQL = null;

String dburl = System.getenv("dburl");
String user=System.getenv("user");
String passwd = System.getenv("passwd");
String dbdriver = "oracle.jdbc.driver.OracleDriver";

String s_addr = null;
String s_pwd = null;

Class.forName(dbdriver);
myConn=DriverManager.getConnection(dburl, user, passwd);
stmt = myConn.createStatement();
mySQL = "select s_addr, s_pwd from student where s_id='"+session_id+"'";

ResultSet myResultSet = stmt.executeQuery(mySQL);
if(myResultSet.next()){
	s_addr = myResultSet.getString("s_addr");
	s_pwd = myResultSet.getString("s_pwd");

%>
<div class="update_button_wrapper">
<div class="update_wrapper">
<form class="update_form" method="post" action="update_verify.jsp">
<input type="hidden" name="s_id" size="30" value="<%=session_id%>">
<label class="update_label">주소</label>
<input class="update_input" type="text" name="s_addr" size="50" value="<%=s_addr%>">
<label class="update_label">비밀번호</label>
<input class="update_input"type="text" name="s_pwd" size="50" value="<%=s_pwd%>">
</div>
<%
}
stmt.close(); myConn.close();
%>
<input class="update_button" type="submit" value="수정">
</form></div></body>
</html>