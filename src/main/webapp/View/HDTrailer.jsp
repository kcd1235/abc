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
hr {height:1px; border:0px; background:black;}
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

div{height:50px; }
#d2{ width:400px; border:1px solid gray; line-height:50px; text-align:center;}

hr {height:1px; border:0px; background:lightgray;}
.d1 
{
	background-color:white; border:1px solid gray;
	width:500px; height:200px; line-height:40px;
}

div a {text-decoration:none; color:black;} 
 ul,li{list-style:none;}
  #slide{height:300px;overflow:hidden;}
    #slide ul{width:calc(100% * 4);animation:slide 8s infinite;}
    #slide li{width:calc(100% / 4); height:300px;}
    #slide li:nth-child(1){background:#ffa;}
    #slide li:nth-child(2){background:#faa;}
    #slide li:nth-child(3){background:#afa;}
    #slide li:nth-child(4){background:#aaf;}
    @keyframes slide {
      0% {margin-top:0;}
      10% {margin-top:0;}
      25% {margin-top:-300px;}
      35% {margin-top:-300px;}
      50% {margin-top:-600px;}
      60% {margin-top:-600px;}
      75% {margin-top:-900px;}
      85% {margin-top:-900px;}
      100% {margin-top:0;}
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
	<div id="slide">
		<ul>
			<li></li>
			<li></li>
			<li></li>
		</ul>
	</div>
==============================MOVIE SELECTION================<br>
영화 예고편<br>
<iframe width="560" height="315" src="https://www.youtube.com/embed/jLpKjmEko2M" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
포스터
<br>
==============================EVENT================ <br>
<div id="d2"><a href="#">CGV스페셜</a>|<a href="#">영화예매</a>|<a href="#">CGV아트하우스</a>|<a href="#">제휴</a></div><br>
공지사항
	</content>
	<section></section>
	
	<footer>
		<%@ include file="jsp/footerContents.jsp" %>
	</footer>

</body>
</html>