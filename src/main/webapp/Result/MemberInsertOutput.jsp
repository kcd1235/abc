<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>가입성공</h3>
<%
	String userid=request.getParameter("userid");
%>
<script>
	alert("<%=userid%>님 가입을 축하합니다.");
	location.href="../View/Login.jsp"
</script>
<%-- //<%=userid %> 님 가입을 축하합니다<br> --%>
<a href="../View/Login.jsp">로그인 페이지로 이동</a>
</body>
</html>