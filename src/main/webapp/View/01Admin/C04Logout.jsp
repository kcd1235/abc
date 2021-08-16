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
	String id = (String)session.getAttribute("idKey");
	session.invalidate();
%>
<script>
	alert("<%=id %>"+"님 로그아웃합니다");
	location.href="../C04Login.jsp";
</script>



</body>
</html>