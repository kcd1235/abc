<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="prodRepo" class="Ch13.ProdRepository" scope="session" />
<%@page import="Ch13.Product"  %>

<%
	String title = request.getParameter("title");
	String publisher = request.getParameter("publisher");
	String price = request.getParameter("price");
	
	String userid = (String)session.getAttribute("idKey");
	
	Product prod = new Product(userid,title,publisher,price);
	prodRepo.addProduct(userid, prod);
%>

<script>
 	location.href="C04Booklist.jsp";
</script>


</body>
</html>




