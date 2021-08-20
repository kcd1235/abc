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
<div align="center">
	<table border=1>
		<tr>
		<td><a href="Main.jsp"><img alt="" src=""></a></td>
		<td>
		<form name=searchFrm method=get action=List.jsp>
						<input size=16 name=keyWord>
						<input type=button value=찾기 onclick="javascript:check()">
						<input type=hidden name=nowPage value=1>
		</form>
		</td>
		</tr>
		</table>
	</div>
<nav>
<jsp:include page="module/nav.jsp" />
</nav>

<aside>
<jsp:include page="module/aside.jsp" />
</aside>


<content>
	<br><br>
	<h1>베스트셀러</h1>
	<br>
	<hr>
	<br>
	<div class="d1">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="BestSeller.jsp">종합</a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="javascript:gobestseller()">인문/사회</a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="javascript:gobestseller()">과학</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="javascript:gobestseller()">소설</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="javascript:gobestseller()">컴퓨터</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="javascript:gobestseller()">역사</a><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</div><br>
	
<div>
<br>
<h2>분야종합</h2>
<br>
<!-- 상단  -->
<table align="center" width="1000">
	<tr>
		<td>
	<% 
		int pageStart=(nowBlock -1)*pagePerBlock + 1;	//블럭 시작 번호(1000게시물일때 블럭총개수:7)
		int pageEnd=((pageStart + pagePerBlock)<=totalPage)?(pageStart+pagePerBlock) :totalPage+1;
	
		if(totalPage!=0)
		{
			if(nowBlock>1)
			{
				%>
					<a href="javascript:block('<%=nowBlock-1%>')">[이전으로]</a>&nbsp;
				<%
			}
			for(;pageStart<pageEnd;pageStart++)
			{
				%>
				<a href="javascript:paging('<%=pageStart%>')">[<%=pageStart%>]</a>
				<%
			}
			if(totalBlock>nowBlock){
				%>
					<a href="javascript:block('<%=nowBlock+1%>')">[다음으로]</a>
				<%
			}
			
		}
	%>
	
	</td>
	</tr>
</table>
<!-- 본문  -->
<table align=center width="1000">
<tr>
	<!-- 게시물 내용 출력  -->
	<td colspan=2>
	<table width=1000>
		<tr align=center bgcolor=lightgray>
			<td>이미지</td>
			<td>제목</td>
			<td>책제목</td>
			<td>작가</td>
			<td>출판사</td>
			<td>출간일</td>
			<td>가격</td>
			<td></td>
		</tr>
		
		<%
			listSize=blist.size();	//가져온 게시물의 개수를 listSize에 저장
			if(blist.isEmpty())
			{
				out.println("등록된 게시물이 없습니다.");
			}
			else
			{
				for(int i=0;i<numPerPage;i++)
				{
					if(i==listSize)
						break;
					
					BoardBean bean = blist.get(i);				
		%>
		<tr>
			<%-- <td align=center><%= %></td>
			<td>
			<a href="javascript:read('<%=bean.getNum()%>')"><%=bean.getSubject() %></a>
			</td>
			<td align=center><%= %></td>
			<td align=center><%= %></td>
			<td align=center><%= %></td> --%>
		</tr>
	
		<%
				}
			}
		%>	
	</table>
	</td>
</tr>
<tr>
	<td colspan=2><br></td>
</tr>
<tr>
	<!-- 페이지블럭 출력 [1][2][3][4][5][6][7]-->
	<td>
	<% 
		int pageStart1=(nowBlock -1)*pagePerBlock + 1;	//블럭 시작 번호(1000게시물일때 블럭총개수:7)
		int pageEnd1=((pageStart + pagePerBlock)<=totalPage)?(pageStart+pagePerBlock) :totalPage+1;
	
		if(totalPage!=0)
		{
			if(nowBlock>1)
			{
				%>
					<a href="javascript:block('<%=nowBlock-1%>')">[이전으로]</a>&nbsp;
				<%
			}
			for(;pageStart<pageEnd;pageStart++)
			{
				%>
				<a href="javascript:paging('<%=pageStart%>')">[<%=pageStart%>]</a>
				<%
			}
			if(totalBlock>nowBlock){
				%>
					<a href="javascript:block('<%=nowBlock+1%>')">></a>
				<%
			}
			
		}
	%>
	</td>
</tr>

</table>

<!--페이징 처리를 위한 Form-->
<form name=readFrm method=get>
	<input type="hidden" name="num">
	<input type="hidden" name="nowPage" value=<%=nowPage%>>
	<input type="hidden" name="keyField" value=<%=keyField %>>
	<input type="hidden" name="keyWord" value=<%=keyWord %>>
</form>

<form name=moveFrm method="post">
	<input type="hidden" name="cid">
</form>

</div>
</content>
<section></section>
<footer>
<%@ include file="jsp/footerContents.jsp" %>
</footer>

</body>
</html>