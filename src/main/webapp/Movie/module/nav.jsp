<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
nav 	
{
	width:1190px; height:100px;  border:1px solid gray;
	font-size:15px;
}
	nav > ul
{
	text-align:center;
	list-style: none;
	
}
nav > ul > li
{
	display :inline-block;
	width:100px;
	position:relative;top:0px;left:0px;

}
nav > ul > li > a
{
	text-decoration:none;
	color:black;

}
nav > ul > li > img
{
	width:100px;
	height:100px;
}

nav ul ul
{
	position:absolute;
	top:30px;left:0px;
	width:100%;
	padding:0px;
	list-style:none;
	font-size:12px;
	line-height:40px;
	
}
nav ul ul>li
{
	height:40px;
	border:1px solid #FAFAFA;
	width:300px;
	text-align:left;
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

<ul>
	<li>
	<a href="#">영화</a>
		<ul>
			<li><a href="C02Sub1.jsp">전체영화</a>&nbsp;&nbsp;
			<a href="C02Sub1.jsp">N스크린</a>&nbsp;&nbsp;
			<a href="C02Sub1.jsp">큐레이션</a>&nbsp;&nbsp;
			<a href="C02Sub1.jsp">무비포스트</a>&nbsp;&nbsp;
			</li>
		</ul>
	</li>
	
	<li>
	<a href="#">예매</a>
		<ul>
			<li><a href="C02Sub1.jsp">빠른예매</a>&nbsp;&nbsp;
			<a href="C02Sub1.jsp">상영시간표</a>&nbsp;&nbsp;
			<a href="C02Sub1.jsp">더 부티크 프라이빗 예매</a>&nbsp;&nbsp;
			</li>
		</ul>
	</li>
	
	<li>
	<a href="#">극장</a>
		<ul>
			<li><a href="C02Sub1.jsp">전체극장</a>&nbsp;&nbsp;
			<a href="C02Sub1.jsp">특별관</a>&nbsp;&nbsp;
			</li>
		</ul>
	</li>
	<li><a href="#"><img alt="" src="메가박스.png"></a></li>
	<li>
	<a href="#">이벤트</a>
		<ul>
			<li><a href="C02Sub1.jsp">진행중이벤트</a>&nbsp;&nbsp;
			<a href="C02Sub1.jsp">지난이벤트</a>&nbsp;&nbsp;
			<a href="C02Sub1.jsp">당첨자발표</a>&nbsp;&nbsp;
			</li>
		</ul>
	</li>
	<li><a href="#">스토어</a></li>
	<li>
	<a href="#">혜택</a>
		<ul>
			<li><a href="C02Sub1.jsp">메가박스멤버십</a>&nbsp;&nbsp;
			<a href="C02Sub1.jsp">제휴카드</a>&nbsp;&nbsp;
			</li>
		</ul>
	</li>
</ul>


</body>
</html>