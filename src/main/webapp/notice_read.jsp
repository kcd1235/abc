<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<%@ include file="jsp/link.jsp" %>
<script src="js/board.js"></script>
</head>
<body>
<jsp:useBean id="bMgr" class="Ch20.BoardMgr" scope="page"/>
	<%@page import="Ch20.BoardBean" %>
	<%
		int num=Integer.parseInt(request.getParameter("num"));	//게시물번호
		String nowPage=request.getParameter("nowPage");			//List.jsp에서 읽던 페이지 번호
		String keyField=request.getParameter("keyField");		//List.jsp에서 검색했던 keyField
		String keyWord=request.getParameter("keyWord");			//List.jsp에서 검색했던 keyWord
		
		
		//DB로부터 게시물 가져오기
		BoardBean bean=bMgr.getBoard(num);
		
		//현재 페이지에 표시
		//세션 객체에 현재 받아온 게시물 추가(update/reply/delete 시 사용)
		session.setAttribute("bean", bean);
		
	%>
<script>
		function list(){
			document.listForm.submit();
		}
	</script>
		<form name=listForm method="post" action=notice.jsp>
		<input type="hidden" name="nowPage" value=<%=nowPage %>>
		<input type="hidden" name="keyField" value="<%=keyField%>">
		<input type="hidden" name="keyWord" value="<%=keyWord%>">
	</form>

<header>
<jsp:include page="module/header.jsp" />
</header>


<aside>
<jsp:include page="module/aside.jsp" />
</aside>


<content>
<br><br>
	<div  id="d1">
		<div id="d2">
			[<%=bean.getTheatername() %>]<%=bean.getSubject() %><br>
			영화관 : <%=bean.getTheatername() %> | 구분 <%=bean.getDivi() %>| 등록일 <%=bean.getRegdate() %>
		</div>
		<%=bean.getContent() %>
	</div>
	<input type="button" value="목록" onclick="list()">
</content>
<section></section>
<footer>
<%@ include file="jsp/footerContents.jsp" %>
</footer>

</body>
</html>