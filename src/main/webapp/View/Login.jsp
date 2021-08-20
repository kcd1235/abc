<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <%@ include file="jsp/link.jsp" %>

<style>
* {height:50px;}

content 
{
	width:1190px; 
	height:800px; 
	position:absolute; top:110px; left:0px; 
	margin:4px;
	border: 1px solid gray;
}

.loginFrame
{
	width:500px; height:400px; border:3px solid lightgray;
	text-align:center;
	margin:100px auto;
	position:relative; top:30px;

}
.loginFrame h3
{
	font-size :40px;
	margin:30px 0px;
}
.loginFrame input
{
	width:250px;
	border:1px solid gray;
	height:30px;
	margin:2px 0px;
}
.loginFrame input[type="submit"]
{
	width:100px; height:90px;
}
.loginFrame hr
{
	width:90%;
	border:0px;
	height:1px;
	background:lightgray;
	position:relative; top:70px;
}
.joinfind
{
	position:relative; top:110px;
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
<div class=loginFrame>
<h3>LOGIN</h3>
아이디가 없으시면 무료회원가입을 해주시길 바랍니다
<form method=post action=LoginProc.jsp>
	<table>
		<tr>
			<td><input type=text name=userid></td>
			<td rowspan=2><input type=submit value=로그인></td>
		</tr>
		<tr>
			<td><input type=text name=userpwd></td>
			<!-- <td></td> -->
		</tr>
	</table>
</form>
<hr>
<div class=joinfind> 
<a href="MemberJoin.jsp">무료회원가입</a> | <a href="#">아이디/비밀번호 찾기</a>
</div>
</div>

</content>

<footer>
<%@ include file="jsp/footerContents.jsp" %>
</footer>
</body>
</html>