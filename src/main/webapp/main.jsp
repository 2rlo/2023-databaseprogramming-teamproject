<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청 시스템</title>
</head>
<body>
<%@include file="top.jsp" %>
<% if(session_id != null) {%>
<table width = "75%" align="center" height="100%">
<tr>
	<td align="center"><%=session_id%>님 방문을 환영합니다.</td>
</tr>
<% }else { %>
<table width = "75%" align="center" height="100%">
<tr>
<td align="center">로그인 후 사용하세요.</td>
</tr>
<%
}
%>
</table>
</body>
</html>