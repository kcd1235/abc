<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#mainmenu{text-align:center; list-style: none;}
#mainmenu li
{
	display :inline-block;
	width:150px;
	position:relative;top:0px;left:0px;
}

#mainmenu li a{text-decoration:none; color:black;}

#submenu
{
	position:absolute;
	top:30px;left:0px;
	width:100%;
	padding:0px;
	list-style:none;
	font-size:12px;
	line-height:40px;
	overflow:hidden;
}
#submenu li {display:inline-block;}
#menu:hover #submenu {height:100px;}
nav ul ul>li
{
	height:40px;
	border:1px solid #FAFAFA;
}
nav ul ul li > a 
{
	height:40px;
	text-decoration:none;
}

nav 
{
	overflow:hidden;
	
	
}
nav:hover
{
	height:300px;
	border-bottom:2px solid black;
	background:#D8D8D8;
	z-index:3;
}
</style>
<body>
<img alt="" src="">
<ul id="mainmenu">
	<li id="menu"><a href="BestSeller.jsp">영화</a>
		<ul id="submenu">
			<li><a href="#">무비차트</a></li>
			<li><a href="#">HD트레일러</a></li>
			<li><a href="#">무비파인더</a></li>
		</ul>
	</li>
	<li id="menu"><a href="BestSeller.jsp">예매</a>
		<ul>
			<li><a href="#">빠른예매</a></li>
			<li><a href="#">상영시간표</a></li>
		</ul>
	</li>
		
	<li id="menu"><a href="NewBook.jsp">극장</a>
		<ul>
			<li><a href="#">CGV극장</a></li>
			<li><a href="#">특별관</a></li>
			<li><a href="#">CLUB서비스</a></li>
		</ul>
	</li>
	<li id="menu"><a href="Event.jsp">이벤트&컬쳐</a>
		<ul>
			<li><a href="#">이벤트</a></li>
			<li><a href="#">기프트샵</a></li>
			<li><a href="#">매거진</a></li>
		</ul>
	</li>
	<li>
	</li>
</ul>
</body>
</html>