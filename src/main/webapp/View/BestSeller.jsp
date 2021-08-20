<!-
	베스트셀러로 들어갔을때 처음 뜨는 화면
	종합 카테고리 누르면 감
  -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<%@ include file="jsp/link.jsp" %>

<style>
	*{height:20px;}
	nav 	
{
	width:1190px; height:100px;  border:1px solid gray;
	font-size:15px;
}
	img
	{
			width:150px; height:30px; margin:0px auto;
	}
	aside	
{
	width:200px;
	height:800px; 
	margin:4px ;border:1px solid gray;
	position:absolute;top:160px;left:0px;
}
content 
{
	height:800px; 
	position:absolute; top:160px;
	margin:4px;
	border: 1px solid gray;
}
div{height:50px; }
.d2{ width:100px; border:1px solid gray;}
footer
{
	width:1190px; height:200px; 
	border:1px solid gray;
	position:absolute; top:962px; left:0px;
	margin: 4px;
}
hr {height:1px; border:0px; background:lightgray;}
.d1 
{
	background-color:white; border:1px solid gray;
	width:500px; height:200px; line-height:40px;
}

div a {text-decoration:none; color:black;}
</style>

</head>
<body>
<jsp:useBean id="bMgr" class="Ch20.BoardMgr" scope="page" />
<%@page import="java.util.*,Ch20.BoardBean" %>	<!-- ArrayList 사용위한 클래스 경로 설정-->
<%
	int totalRecord=0;	//전체 레코드 수
	int numPerPage=10;	//페이지당 레코드 수(한페이지에 표시되는 게시물 수)
	int pagePerBlock=10;//블럭당 페이지수(한블럭에 [1][2][3][4]...[15]까지 페이지 표시)
	
	int totalPage=0;	//전체 페이지 수
	int totalBlock=0;	//전체 블럭 수
	
	int nowPage=1;		//현재 페이지
	int nowBlock=1;		//현재 블럭
	
	int start=0;		//Database Select 시작 번호(num)
	int end=10;			//시작 번호로 부터 가져올 게시물의 개수
	
	int listSize=0;		//현재 DB로부터 읽어온 게시물의 수
	
	if(request.getParameter("nowPage")!=null){
		nowPage=Integer.parseInt(request.getParameter("nowPage"));
	}
	start=(nowPage * numPerPage) - numPerPage;
	end=numPerPage;	//기준값 10 
	
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
	
	totalRecord=bMgr.getTotalCount(keyField, keyWord); //검색내용을 전달하여 만족하는 전체 레코드수 리턴
	totalPage= (int)Math.ceil((double)totalRecord/ numPerPage);	//전체 페이수 계산(1000개 게시물일때 페이수는 100페이지)
	totalBlock=(int)Math.ceil((double)totalPage/pagePerBlock);	//총 블럭(15개단위)개수 계산(1000개 게시물일때 블럭수는 7)
	nowBlock=(int)Math.ceil((double)nowPage/pagePerBlock); // 현재 블럭 계산(총블럭에서 몇번째인지)
	
	
	ArrayList<BoardBean> blist = bMgr.getBoardList(keyField, keyWord, start, end);
%>

<script>
	
	function paging(page){
		document.readFrm.nowPage.value=page;
		document.readFrm.submit();
	}

	function block(value){
		document.readFrm.nowPage.value=<%=pagePerBlock%>*(value-1)+1;	//이동하는 블럭의 시작페이지 계산-> 15*(value-1)+1
		document.readFrm.submit();
	}

	function list(){
		document.listFrm.action="List.jsp";
		document.listFrm.submit();
	}

	function check(){
		if(document.searchFrm.keyWord.value==""){
			alert("검색어를 입력하세요");
			document.searchFrm.keyWord.focus();
			
		}
		else{
			document.searchFrm.submit();
		}
	}

	function read(num){
		document.readFrm.num.value=num;
		document.readFrm.action="Show.jsp";
		document.readFrm.submit();
	}
</script>
<header>
<jsp:include page="module/header.jsp" />
</header>
<nav>
<jsp:include page="module/nav.jsp" />
</nav>

<aside>
<jsp:include page="module/aside.jsp" />
</aside>


<content>
</content>
<section></section>
<footer>
<%@ include file="jsp/footerContents.jsp" %>
</footer>

</body>
</html>