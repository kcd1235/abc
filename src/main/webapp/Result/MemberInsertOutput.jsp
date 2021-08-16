<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String userid=request.getParameter("userid");
%>
<script>
	alert("<%=userid%>님의 가입을 축하합니다");
	location.href="../View/Login.jsp";
</script>
</body>
</html>