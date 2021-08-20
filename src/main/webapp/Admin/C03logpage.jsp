<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="jsp/link.jsp" %>
</head>
<body>
<header>
<jsp:include page="module/header.jsp" />
</header>

<%@page import="java.io.*" %>
<style>
content 
{
	width:1190px; 
	height:800px; 
	position:absolute; top:110px; left:0px; 
	margin:4px;
	border: 1px solid gray;
}
* { height:20px;}
</style>
<content>
<table border=1 width=80%>
<tr>
<td>Date</td>
<td>IP</td>
<td>Account</td>
</tr>
<%
	try{
	InputStream Dout = new FileInputStream("c:/JSPTMP/weblog.txt");
	DataInputStream ddout = new DataInputStream(Dout);
		String tmp="TEST";
		while(tmp!=null)
		{
			tmp = ddout.readUTF();
			%>
				<tr>
				<td><%=tmp %></td>
			<% 
			//td태그 시작
			tmp = ddout.readUTF();
			%>
				<td><%=tmp %></td>
			<%
			tmp = ddout.readUTF();
			%>
			<td><%=tmp %></td>
			<%
		}
	}catch(Exception e){e.printStackTrace();}
%>
	</table>

</content>





</body>
</html>