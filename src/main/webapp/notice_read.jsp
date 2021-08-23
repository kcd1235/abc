<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<%@ include file="jsp/link.jsp" %>
<link rel="stylesheet" href="css/notice.css?1111a11s1ad21112">
<link rel="stylesheet" href="css/read.css?133daassad12">
<script src="js/board.js"></script>
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

		
</head>
<body>
	
<div id="wrap">
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
	<header id="header">
		<jsp:include page="module/header.jsp" />
	</header>
	<aside id="aside">
			<jsp:include page="module/aside.jsp"/>
	</aside>
	<div id="top">
            <h2>공지사항</h2>
        </div>
         <div class="board-wrap">
            <div class="board-view">
                <div class="board-title">
                        <p class="title"><%=bean.getSubject() %></p>
                    </div>
                    <div class="info">
                        <p>
							<span class="title">구분</span>
							<span class="text"><%=bean.getDivi() %></span>
						</p>
                        <p>
							<span class="title">등록일</span>
							<span><%=bean.getRegdate() %></span>
						</p>
                    </div>
                    <div class="cont">
                    	<%=bean.getContent() %>
                    </div>
                </div>
            </div>
           <div class="prev-next">
                <div class="line prev">
                    <p class="title">이전</p>
                    <p class="link"><%=bean.getSubject() %></p>
                </div>
                <div class="line next">
                    <p class="title">다음</p>
					<a href="#"></a>
                </div>
            </div>
            <div class="btn">
            	<input type="button" value="목록" onclick="list()">
            </div>
		  
	<footer id="footer">
		<jsp:include page="jsp/footerContents.jsp" />
	</footer>
</div>

</body>
</html>