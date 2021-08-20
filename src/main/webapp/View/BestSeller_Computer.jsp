<!-
	베스트셀러로 들어갔을때 처음 뜨는 화면
	종합 카테고리 누르면 감
  -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<%@ include file="jsp/link.jsp" %>

<style>
	*{height:20px;}
	img
	{
			width:150px; height:30px; margin:0px auto;
	}
	aside	
{
	width:200px;
	height:800px; 
	margin:4px ;border:1px solid gray;
	position:absolute;top:160px;left:0px;
}
content 
{
	height:800px; 
	position:absolute; top:160px;
	margin:4px;
	border: 1px solid gray;
}
div{height:50px; }
.d2{ width:100px; border:1px solid gray;}
footer
{
	width:1190px; height:200px; 
	border:1px solid gray;
	position:absolute; top:962px; left:0px;
	margin: 4px;
}
hr {height:1px; border:0px; background:lightgray;}
.d1 
{
	background-color:white; border:1px solid gray;
	width:500px; height:200px; line-height:40px;
}

div a {text-decoration:none; color:black;}
</style>

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


<content>
</content>
<section></section>
<footer>
<%@ include file="jsp/footerContents.jsp" %>
</footer>

</body>
</html>