<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <%@ include file="jsp/link.jsp" %>

<style>
* {height:20px;}

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
	width:250px; height:30px;
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

#t1 #a1 {border-left:1px solid lightgray;}
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
<br><br>
아이디,비밀번호를 입력하신 후, 로그인 버튼을 클릭해주세요
<form method=post action=LoginProc.jsp>
	<table>
		<tr>
			<td><input type=text name=userid></td>
		</tr>
		<tr>
			<td><input type=text name=userpwd></td>
			<!-- <td></td> -->
		</tr>
		<tr>
			<td><input type=submit value=로그인></td>
		</tr>
	</table>
</form>

<div class=joinfind> 
아이디저장  <a href="#">아이디 찾기></a>&nbsp;
<a href="#">비밀번호찾기</a><br>
<input type=button value=네이버로그인>
</div>
</div>
<table id="t1">
	<tr>
		<td>CJ ONE 회원이 아니신가요? 회원가입하시고 다양한 혜택을 누리세요</td>
		<td><a href="#">회원가입</a></td>
		<td id="a1"><a href="#">CJ ONE 멤버십이란??</a></td>
	</tr>
</table>

</content>
<footer>
<%@ include file="jsp/footerContents.jsp" %>
</footer>
</body>
</html>