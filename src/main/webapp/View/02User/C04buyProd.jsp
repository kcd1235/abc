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
<jsp:useBean id="prodRepo" class="Ch13.ProdRepository" scope="session" />
<%@page import="Ch13.Product"  %>


<header>
<jsp:include page="module/header.jsp" />
</header>

<nav>
<jsp:include page="module/nav.jsp" />
</nav>

<aside></aside>

<style>
* {height:30px;}
</style>

<%@page import="java.util.*" %>
<%
	Map<String,ArrayList<Product>> map = prodRepo.getMap();
	ArrayList<Product> list = null;
	String userid = (String)session.getAttribute("idKey");
	list = map.get(userid);
%>
<content>
<table border=1 width=800px>
<caption>도서 구매 리스트</caption>
	<tr>
		<th>ID</th>
		<th>TITLE</th>
		<th>PUBLISHER</th>
		<th>PRICE</th>
	</tr>
	<%
	if(list !=null)
	{
		for(int i=0;i<list.size();i++)
		{
		%>
		<tr>
			<td><%=list.get(i).getUserid() %></td>
			<td><%=list.get(i).getTitle() %></td>
			<td><%=list.get(i).getPublisher() %></td>
			<td><%=list.get(i).getPrice() %></td>
		</tr>
		<%
		}
	}
	%>
	
</table>

</content>


<section></section>

<footer>
	<%@ include file="jsp/footerContents.jsp" %>
</footer>


</body>
</html>