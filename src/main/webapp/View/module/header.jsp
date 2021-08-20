<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	header img
	{
			width:150px; height:50px; margin:0px;
	}
	header ul
	{
		position:absolute; top:15px; left:600px;
		font-size:12px;
	}
	header li
	{
		display:inline-block;
	}
	header a
	{
		text-decoration:none;
		color:black;
	}
	header a:hover
	{
		color:gray;
	}
	.u1{position:absolute; top:15px; left:0px; font-size:12px;}
</style>
<body>

<ul class="u1">
	<li><a href="Main.jsp">Home</a>&nbsp;&nbsp;|</li>
	<li>&nbsp;&nbsp;<a href="Book.jsp">CGV APP</a>&nbsp;&nbsp;</li>
	<li>&nbsp;&nbsp;<a href="FBook.jsp">Like</a>&nbsp;&nbsp;</li>
	<li>&nbsp;&nbsp;<a href="EBook.jsp">Follow</a></li>
	<li>&nbsp;&nbsp;<a href="EBook.jsp">알뜰한 영화관람법</a></li>
</ul>
<ul>
	<li><a href="MemberJoin.jsp">회원가입</a>&nbsp;&nbsp;|</li>
	<li>&nbsp;&nbsp;<a href="Login.jsp">로그인</a>&nbsp;&nbsp;|</li>
	<li>&nbsp;&nbsp;<a href="#">MyCGV</a>&nbsp;&nbsp;|</li>
	<li>&nbsp;&nbsp;<a href="CustomerService.jsp">VIP LOUNGE</a></li>
	<li><a href="MemberJoin.jsp">Club서비스</a>&nbsp;&nbsp;|</li>
	<li>&nbsp;&nbsp;<a href="Login.jsp">고객센터</a>&nbsp;&nbsp;|</li>
	<li>&nbsp;&nbsp;<a href="#">ENGLISH TICKETING</a>&nbsp;&nbsp;</li>
</ul>

</body>
</html>