<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<%@ include file="jsp/link.jsp" %>

<style>
 img
	{
			width:150px; height:50px; margin:0px auto;
	}
content 
{
	width:1190px; 
	height:800px; 
	position:absolute; top:160px; left:0px; 
	margin:4px;
	border: 1px solid gray;
}
	nav 	
{
	width:1190px; height:100px;  border:1px solid gray;
	font-size:15px;
}
footer
{
	width:1190px; height:500px; 
	border:1px solid gray;
	position:absolute; top:960px; left:0px;
	margin: 4px;
}

</style>

</head>
<body>
	<header>
		<jsp:include page="module/header.jsp" />
	</header>
	<nav>
		<jsp:include page="module/nav.jsp" />
	</nav>
	
	<content>
	애니메이션<br>
==============================MOVIE SELECTION================<br>
영화 예고편<br>
==============================EVENT================ <br>
CGV스페셜|영화예매|CGV아트하우스|제휴<br>
공지사항
	</content>
	<section></section>
	
	<footer>
		<%@ include file="jsp/footerContents.jsp" %>
	</footer>

</body>
</html>