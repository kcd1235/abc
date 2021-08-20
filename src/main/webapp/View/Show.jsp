<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="bMgr" class="Ch20.BoardMgr" scope="page"/>
	<%@page import="Ch20.BoardBean" %>
	<%
		//int num=Integer.parseInt(request.getParameter("num"));	//게시물번호
		String nowPage=request.getParameter("nowPage");			//List.jsp에서 읽던 페이지 번호
		String keyField=request.getParameter("keyField");		//List.jsp에서 검색했던 keyField
		String keyWord=request.getParameter("keyWord");			//List.jsp에서 검색했던 keyWord
		
		//조회수 증가
		//bMgr.upCount(num);
		
		//DB로부터 게시물 가져오기
		//BoardBean bean=bMgr.getBoard(num);
		
		//현재 페이지에 표시
		//세션 객체에 현재 받아온 게시물 추가(update/reply/delete 시 사용)
		//session.setAttribute("bean", bean);
		
	%>
	<script>
		function list(){
			document.listForm.submit();
		}
	</script>
	<form name=listForm method="post" action=List.jsp>
		<input type="hidden" name="nowPage" value=<%=nowPage %>>
		<input type="hidden" name="keyField" value="<%=keyField%>">
		<input type="hidden" name="keyWord" value="<%=keyWord%>">
	</form>
	<br><br>
	<table align="center" width=1000>
		<tr>
			<td>
				<table width=100%>
					<tr>
						<td align="center" bgcolor="lightgray" rowspan="4">이미지넣을거임</td>
						<td>책제목</td>
					</tr>
					<tr>
						<!-- <td></td> -->
						<td>지은이 지음 | 출판사 | 출간일</td>
					</tr>
					<tr>
						<!-- <td></td> -->
					
					</tr>
					<tr>
						<!-- <td>.............</td> -->
						<td>가격</td>
					</tr>
					<tr>
						<td colspan=4 align="right">
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td align="center" colspan=2>
				<hr>
				<a href="Update.jsp?nowPage=<%=nowPage%>">장바구니</a> | 
				<a href="Reply.jsp?nowPage=<%=nowPage%>">바로구매</a>
			</td>
		</tr>
	</table>
</body>
</html>