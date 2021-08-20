<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<%@ include file="jsp/link.jsp" %>
<link rel="stylesheet" href="css/notice.css">
<script src="js/board.js"></script>
</head>
<body>
<jsp:useBean id="bMgr" class="Ch20.BoardMgr" scope="page" />
<%@page import="java.util.*,Ch20.BoardBean" %>	<!-- ArrayList 사용위한 클래스 경로 설정-->
<%
	int totalRecord=0;
	int numPerPage=5;
	int totalPage=0;
	int totalBlock=0;
	int nowPage=1;
	int nowBlock=1;
	int pagePerBlock=10;//블럭당 페이지수(한블럭에 [1][2][3][4]...[15]까지 페이지 표시)
	
	int start=0;
	int end=5;
	String keyWord="";// 검색할 문자열
	String keyField="";//이름 제목 내용
	
	//키워드 검색 시작
	if(request.getParameter("keyWord")!=null){
		keyWord=request.getParameter("keyWord");
		keyField=request.getParameter("keyField");
	}
	//키워드 검색 끝
	
	if(request.getParameter("reload")!=null){
		if(request.getParameter("reload").equals("true")){
			keyWord=""; keyField="";
		}
	}
	int listSize=0;
	if(request.getParameter("nowPage")!=null){
		nowPage=Integer.parseInt(request.getParameter("nowPage"));
	}
	start=(nowPage*numPerPage)-numPerPage;
	end=numPerPage;
	totalRecord=bMgr.getTotalCount(keyField,keyWord); //검색내용을 전달하여 만족하는 전체 레코드수 리턴
	totalPage= (int)Math.ceil((double)totalRecord/ numPerPage);	//전체 페이수 계산(1000개 게시물일때 페이수는 100페이지)
	totalBlock=(int)Math.ceil((double)totalPage/pagePerBlock);	//총 블럭(15개단위)개수 계산(1000개 게시물일때 블럭수는 7)
	nowBlock=(int)Math.ceil((double)nowPage/pagePerBlock); // 현재 블럭 계산(총블럭에서 몇번째인지)
	
	
	ArrayList<BoardBean> blist = bMgr.getBoardList(keyField, keyWord, start, end);
	
%>
<script>
function block(value){
	<%-- document.readFrm.nowPage.value=<%=pagePerBlock%>*(value-1)+1; --%>	//이동하는 블럭의 시작페이지 계산-> 15*(value-1)+1
	document.readFrm.submit();
}
</script>

<div id="wrap">
		<header id="header">
			<jsp:include page="module/header.jsp" />
		</header>
		<aside id="aside">
			<jsp:include page="module/aside.jsp"/>
		</aside>
		<div id="top">
			<h2>공지사항</h2>
		</div>
		<br>
		 <div id="divi">
			<ul>
                <li id="l1">전체</li>
                <li>메가박스</li>
                <li>지점공지</li>
				<li id="l2"></li>
				<li id="l2"></li>
				<li id="l2"></li>
				<li id="l2"></li>
				<li id="l2"></li>
				<li id="l2"></li>
				<li id="l2"></li>
				<li id="l2"></li>
            </ul>
		 </div>
		<div id="noticeboard">
            <div id="top">
            전체 !건
            </div>
            <div id="divi">
                <select id="s1">
                    <option>지역선택</option>
					<option value="seo">서울</option>
                    <option value="kk">경기</option>
					<option value="inc">인천</option>
					<option value="dcs">대전/충청/세종</option>
					<option value="bdk">부산/대구/경상</option>
					<option value="kj">광주/전라</option>
					<option value="kw">강원</option>
					<option value="jj">제주</option>
                </select>
                <select id="s2" disabled>
                    <option>극장선택</option>
					<option value="seo1">강남</option>
					<option value="seo2">강남대로(씨티)</option>
					<option value="seo3">강동</option>
					<option value="seo4">군자</option>
					<option value="seo5">동대문</option>
					<option value="seo6">마곡</option>
					<option value="seo7">목동</option>
					<option value="seo8">상봉</option>
					<option value="seo9">상암월드컵경기장</option>
					<option value="seo10">성수</option>
					<option value="seo11">센트럴</option>
					<option value="seo12">신촌</option>
					<option value="seo13">이수</option>
					<option value="seo14">창동</option>
					<option value="seo15">코엑스</option>
					<option value="seo16">홍대</option>
					<option value="seo17">화곡</option>
					<option value="seo17">ARTNINE</option>
					<option value="kk1">천안</option>
					<option value="kk2">청주사창</option>
					<option value="kk3">충주</option>
					<option value="kk4">흥성</option>
					<option value="kk5">지역2</option>
                    <option value="inc1">검단</option>
					<option value="inc2">송도</option>
					<option value="inc3">영종</option>
					<option value="inc4">인천논현</option>
					<option value="inc5">청라지젤</option>
					<option value="dcs1">공주</option>
					<option value="dcs2">논산</option>
					<option value="dcs3">대전</option>
					<option value="dcs4">대전신세계아트앤사이언스</option>
					<option value="dcs5">대전유성</option>
					<option value="dcs6">대전중앙로</option>
					<option value="dcs7">대전현재아울렛</option>
					<option value="dcs8">세종(조치원)</option>
					<option value="dcs9">세종나성</option>
					<option value="dcs10">세종청사</option>
					<option value="dcs11">오창</option>
					<option value="dcs12">제천</option>
					<option value="dcs13">진천</option>
					<option value="dcs14">천안</option>
					<option value="dcs15">청주사창</option>
					<option value="dcs16">충주</option>
					<option value="dcs17">흥성</option>
					<option>지역2</option>
                </select>
                <input type="text">
            </div>
			<div id="notice">
				<table align=center border=1>
					<tr>
		<!-- 게시물 내용 출력  -->
						<td colspan=2>
		<table border=1 width=800>
			<tr align=center bgcolor=lightgray>
				<td>번호</td>
				<td>극장</td>
				<td>구분</td>
				<td width=400>제목</td>
				<td>등록일</td>
			</tr>	
		</table>
		</td>
	</tr>
	</table>
<!-- 검색 -->
<form name=searchFrm method=get action=notice.jsp>
</form>


<!--페이징 처리를 위한 Form-->
<form name=readFrm method=get>
	<input type="hidden" name="num">
	<input type="hidden" name="nowPage" value=<%=nowPage%>>
	<input type="hidden" name="keyField" value=<%=keyField %>>
	<input type="hidden" name="keyWord" value=<%=keyWord %>>
</form>

<!--처음으로 기능 처리 시작  -->
<form method="post" name=listFrm>
	<input type="hidden" name=reload value=true>
	<input type="hidden" name=nowPage value=1>
</form>
<!--처음으로 기능 처리 끝  -->
</div>
			</div>
        </div>	
		
	</div>
	<footer id="footer">
		<jsp:include page="jsp/footerContents.jsp" />
	 </footer>
</body>
</html>