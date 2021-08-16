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
content 
{
	width:1190px; 
	height:800px; 
	position:absolute; top:160px; left:0px; 
	margin:4px;
	border: 1px solid gray;
}
section
{
	width:1190px; 
	height:800px; 
	position:absolute; top:960px; left:0px; 
	margin:4px;
	border: 1px solid gray;
}
#b1{width:1190px; 
	height:800px; 
	position:absolute; top:1960px; left:0px; 
	margin:4px;
	border: 1px solid gray;}
#a1{width:1190px; 
	height:800px; 
	position:absolute; top:3960px; left:0px; 
	margin:4px;
	border: 1px solid gray;}
#q1 {width:1190px; 
	height:800px; 
	position:absolute; top:2960px; left:0px; 
	margin:4px;
	border: 1px solid gray;}
	nav 	
{
	width:1190px; height:100px;  border:1px solid gray;
	font-size:15px;
}
footer
{
	width:1190px; height:500px; 
	border:1px solid gray;
	position:absolute; top:10000px; left:0px;
	margin: 4px;
}

div{height:50px; }
#d2{ width:400px; border:1px solid gray; line-height:50px; text-align:center;}

hr {height:1px; border:0px; background:lightgray;}
.d1 
{
	background-color:white; border:1px solid gray;
	width:500px; height:200px; line-height:40px;
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
	</content>
	<section id="b1">
		혜택
	</section>
	<section id="q1">
		큐레이션
	</section>
	<section id="a1">
		메가박스안내
	</section>
	
	<footer>
		<%@ include file="jsp/footerContents.jsp" %>
	</footer>

</body>
</html>