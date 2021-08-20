<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
  <title> 입력양식 </title> 
  <%@ include file="jsp/link.jsp" %>
  <style>
 	*{background-color:lightgray;}
  	table 
  	{
  		width:80%;
  		border-collapse:collapse;
  	 	border-top:1px solid #E6E6E6;
  		border-bottom:1px solid #E6E6E6;
		border-right:0px;
		border-left:0px;
		margin:20px auto 0px;
		left:0px;
  	}
  	td 
  	{
  		text-align:left;
  		font-size:10px;
  		
  	}
  	td.c1
  	{
  		background:#E6E6E6;
  		color:black;
  		border-left:#E6E6E6;
  	}
  	tr:hover
  	{
  		background:orange;
  	}
  	caption
  	{
  		text-align:left;
  		font-family:맑은 고딕;
  		margin:10px 0px;
  	
  	}
  	input 
  	{
  		margin:5px;
  		border:1px solid gray;
  		height:20px;
  	
  	}
  	input[type="text"]
  	{
  		width:200px;
  	
  	}
  	input[type="password"]
  	{
  		width:200px;
  	
  	}
  	input[type="email"]
  	{
  		width:200px;
  	
  	}
  	input[type="button"]
  	{
  		background:red;
  		color:white;
  		font-size:10px;
  		border:0px;
  		height:25px;
  	
  	}
  	#fbtn1
  	{
  		background:#1C1C1C;
  		width:100px;
  		height:30px;
  		color:white;
  	}
  	#fbtn2
  	{
  		background:white;
  		width:100px;
  		height:30px;
  		border:1px solid #E6E6E6;
  	
  	}
  div.footer	
  {
  	width:220px;
  	margin:0px auto;
  }
  
  *	{ height:50px;}
  
  content 
{
	width:1190px; 
	height:800px; 
	position:absolute; top:110px; left:0px; 
	margin:4px;
	border: 1px solid gray;
	background-color:white;
}
  </style>




</head>
<body> 
<content>
<form method="post" action=MemberJoin.do>  
<table border = 1 width=500px >
<caption>
OOO님 안녕하세요<font size=2px color=gray>(*는 필수 입력 항목입니다)</font>
</caption>
<tbody>
<tr>
	<td class="c1">생년월일</td>
	<td>
</tr>
<tr>
	<td class="c1">아이디</td>
	<td><input type="text" id="id" name="userid" placeholder="아이디 입력" required> <a href="#"><input type=button value=중복확인></a></td>
</tr>
<tr>
	<td class="c1">비밀번호*</td>
	<td><input type="password" id="pwd" name="pwd" placeholder="비밀번호 입력" required></td>
</tr>
<tr>
	<td class="c1">비밀번호확인*</td>
	<td><input type="password" id="pwcheck" name="pwcheck" placeholder="비밀번호 확인" required></td>
</tr>
<tr>
	<td class="c1">휴대전화번호*</td>
	<td>
	<input type="tel" size=5px name="ph1" placeholder="01*" pattern=[0-1]{3} required> 
	- 
	<input type="tel" size=5px name="ph2" placeholder="****" pattern=[0-9]{3,4} required> 
	- 
	<input type="tel" size=5px name="ph3" placeholder="****" pattern=[0-9]{4} required></td>
</tr>
<tr>
	<td class="c1">이메일</td>
	<td><input type="email" name=email></td>
</tr>
<tr>
	<td class="c1">무인발권기 기능설정*</td>
	<td><input type="text" name=addr1 required></td>
</tr>
</tbody>



</table>
<br>
<div class="footer">
<input type="submit" value=가입하기 id="fbtn1">
<button type="reset" id="fbtn2" >취소하기</button>
</div>

</form>
</content>

<body> 
</body>
</html>








