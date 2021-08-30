<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<%@ include file="jsp/link.jsp" %>

</head>

<body>
	<div id="wrap">
		<header id="header">
			<%@ include file="module/header.jsp" %>
		</header>
		<aside id="aside">
			<%@include file="module/aside.jsp" %>
		</aside>
		
		<footer id="footer">
			<%@ include file="jsp/footerContents.jsp" %>
		</footer>
	</div>
</body>
</html>