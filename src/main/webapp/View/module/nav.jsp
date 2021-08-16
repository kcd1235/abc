<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#mainmenu{text-align:center;list-style: none;}

#mainmenu > li
{
	display :inline-block;
	width:150px;
	position:relative;top:0px;left:0px;
}

#mainmenu > li > a{text-decoration:none;color:black;}

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
#submenu li {display:inline-block; float:left;}
#menu:hover #submenu 
{
	width:300px;
	height:40px;
	background:#D8D8D8;
}

	nav ul ul li > a {height:40px; text-decoration:none;}

	 img{width:150px; height:150px; position:absolute;top:-40px;left:-30px;}
	
	.u1{position:absolute; top:2px; left:0px; font-size:12px;}
	.u1 li{display:inline-block;}
	.u1 a{text-decoration:none; color:black;}
	.u1 a:hover {text-decoration:underline; color:gray;}
	
 	.u2{position:absolute; top:2px; left:950px; font-size:12px;}
	.u2 li{display:inline-block;}
	.u2 a{text-decoration:none; color:black;}
	.u2 a:hover {text-decoration:underline; color:gray;}
	
</style>
<body>
<ul class="u1">
	<li><a href="Main.jsp">VIP LOUNGE</a>&nbsp;&nbsp;</li>
	<li>&nbsp;&nbsp;<a href="#">멤버십</a>&nbsp;&nbsp;</li>
	<li>&nbsp;&nbsp;<a href="#">고객센터</a>&nbsp;&nbsp;</li>
</ul>
<ul class="u2">
	<li>&nbsp;&nbsp;<a href="Login.jsp">로그인</a>&nbsp;&nbsp;</li>
	<li><a href="MemberJoin.jsp">회원가입</a>&nbsp;&nbsp;</li>
	<li><a href="#">빠른예매</a>&nbsp;&nbsp;</li>
</ul>
<ul id="mainmenu">
	<li id="menu"><a href="BestSeller.jsp">영화</a>
		<ul id="submenu">
			<li><a href="#">전체영화&nbsp;&nbsp;</a></li>
			<li><a href="#">N스크린&nbsp;&nbsp;</a></li>
			<li><a href="#">큐레이션&nbsp;&nbsp;</a></li>
			<li><a href="#">무비포스트</a></li>
		</ul>
		
	</li>
	<li id="menu"><a href="BestSeller.jsp">예매</a>
		<ul id="submenu">
			<li><a href="#">빠른예매</a></li>
			<li><a href="#">상영시간표</a></li>
			<li><a href="#">더 부티크 프라이빗 예매</a></li>
		</ul>
	</li>
	<li id="menu"><a href="NewBook.jsp">극장</a>
		<ul id="submenu">
			<li><a href="#">전체극장</a></li>
			<li><a href="#">특별관</a></li>
		</ul>
	</li>
	<li id="i1"><a href="Main.jsp"><img alt="cgv" src="cgv.jpg"></a></li>
	<li id="menu"><a href="Event.jsp">이벤트&컬쳐</a>
		<ul id="submenu">
			<li><a href="#">진행중 이벤트</a></li>
			<li><a href="#">지난 이벤트</a></li>
			<li><a href="#">당첨자 발표</a></li>
		</ul>
	</li>
	<li id="menu"><a href="Event.jsp">스토어</a></li>
	<li id="menu"><a href="Event.jsp">혜택</a>
		<ul id="submenu">
			<li><a href="#">메가박스 멤버십</a></li>
			<li><a href="#">제휴/할인</a></li>
		</ul>
	</li>
</ul>
</body>
</html>