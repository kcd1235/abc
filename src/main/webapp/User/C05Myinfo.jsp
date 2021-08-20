<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
  <title> 입력양식 </title> 
  <%@ include file="jsp/link.jsp" %>
  <style>
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
}
  </style>




</head>

<body> 
<%-- <jsp:useBean id="memberDAO" class="Ch15.MemberDAO" scope="page" />
<%@page import="Ch15.MemberDTO" %>
<%
	String userid = (String)session.getAttribute("idKey");
	memberDAO.ConnectDB();
	MemberDTO dto = memberDAO.SearchMember(userid);
	memberDAO.Disconnect();
	
%> --%>


<%--  <header>
<jsp:include page="module/header.jsp" />
</header>

<nav>
<jsp:include page="module/nav.jsp" />
</nav>



<content>
<form method="post" action=C05MyInfoUpdate.jsp>  
<table border = 1 width=500px >
<caption>
회원기본정보<font size=2px color=gray>(*는 필수 입력 항목입니다)</font>
</caption>
<tbody>
<tr>
	<td class="c1">아이디*</td>
	<td><input type="text" id="id" name="userid" value="<%=//dto.getUserid() %>" placeholder="아이디 입력" required> <a href="#"><input type=button value=중복확인></a></td>
</tr>
<tr>
	<td class="c1">비밀번호*</td>
	<td><input type="password" id="pwd" name="pwd" value=<%=//dto.getPwd() %> placeholder="비밀번호 입력" required></td>
</tr>
<tr>
	<td class="c1">비밀번호확인*</td>
	<td><input type="password" id="pwcheck" name="pwcheck" placeholder="비밀번호 확인" required></td>
</tr>
<tr>
	<td class="c1">이름*</td>
	<td><input type="text" id="name" name="name" value="<%=dto.getName() %>" placeholder="이름 입력" required></td>
</tr>
<tr>
	<td class="c1">휴대전화번호*</td>
	<td>
	<input type="tel" size=5px name="ph1" value=<%=dto.getPh1() %> placeholder="01*" pattern=[0-1]{3} required> 
	- 
	<input type="tel" size=5px name="ph2" value=<%=dto.getPh2() %> placeholder="****" pattern=[0-9]{3,4} required> 
	- 
	<input type="tel" size=5px name="ph3" value=<%=dto.getPh3() %> placeholder="****" pattern=[0-9]{4} required></td>
</tr>
<tr>
	<td class="c1">일반전화</td>
	<td>
	<input type="tel" name=tel1 value=<%=dto.getTel1() %> size=5px> 
	- 
	<input type="tel" name=tel2 value=<%=dto.getTel2() %> size=5px> 
	- 
	<input type="tel" name=tel3 value=<%=dto.getTel3() %> size=5px></td>
</tr>
<tr>
	<td class="c1">이메일</td>
	<td><input type="email" name=email value=<%=dto.getEmail() %>></td>
</tr>
<tr>
	<td class="c1">우편번호*</td>
	<td><input type="text" name=addrnum value=<%=dto.getAddrnum() %> required >&nbsp;<a href="#"><input type=button value=주소찾기></a></td>
</tr>
<tr>
	<td class="c1">기본주소*</td>
	<td><input type="text" name=addr1 value=<%=dto.getAddr1() %> required></td>
</tr>
<tr>
	<td class="c1">상세주소*</td>
	<td><input type="text" name=addr2 value=<%=dto.getAddr2() %>required></td>
</tr>

<tr>
	<td class="c1">수신동의</td>
	<td>
	<%
		if(dto.getSmsrecv()!=null)
		{
	%>
			<input type="checkbox" name="smsrecv" checked>SMS 수신
	<%
		}
		else
		{
	%>
			<input type="checkbox" name="smsrecv">SMS 수신
	<%
		}
	%> 
	
	<%
		if(dto.getEmailrecv()!=null)
		{
	%>
			<input type="checkbox" name="emailrecv" checked>EMAIL 수신
	<%
		}
		else
		{
	%>
			<input type="checkbox" name="emailrecv">EMAIL 수신
	<%
		}
	%> 
	
	
	</td>
</tr>
</tbody>



</table>
<br>
<div class="footer">
<input type="submit" value=수정하기 id="fbtn1">
<button type="reset" id="fbtn2" >취소하기</button>
</div>

</form>
</content>

<footer>
<%@ include file="jsp/footerContents.jsp" %>
</footer>
 --%>
<body> 
</body>
</html>








