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

<header>
<jsp:include page="module/header.jsp" />
</header>

<nav>
<jsp:include page="module/nav.jsp" />
</nav>

<aside>
<jsp:include page="module/aside.jsp" />
</aside>


<content></content>
<section></section>
<footer>
<%@ include file="jsp/footerContents.jsp" %>
</footer>

</body>
</html>