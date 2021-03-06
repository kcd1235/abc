<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 | 라이브씨어터,메가박스</title>
<%@ include file="jsp/link.jsp" %>
<link rel="stylesheet" href="css/customerservice_content.css">
<script src="js/board.js"></script>
</head>
<style>
	#wrap{background:white;}
	#nav {background-color:white;}
	#aside{background-color:white;}
</style>
<body>
<jsp:useBean id="bMgr" class="Board.BoardMgr" scope="page" />
<%@page import="java.util.*,Board.BoardBean" %>	<!-- ArrayList 사용위한 클래스 경로 설정-->
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

	<div id="wrap">
		<header id="header">
			<jsp:include page="module/header.jsp" />
		</header>
		
		<aside id="aside">
			<jsp:include page="module/aside.jsp"/>
		</aside>
		<div id="top">
			<h1>고객센터</h1>
		</div>
		 <div id="search">
			 &nbsp;&nbsp;&nbsp;
			 빠른검색
			 <input type="text" placeholder="검색어를 입력해주세요">
			 <a href="#"><span style="color:gray"><i class="fas fa-search"></i></span></a>
		 </div>
		 <div id="content1">
			 <a href="#">
			 <div id="cont1">
				 <img src="./img/FAQ.png">
				 <h2>자주묻는질문</h2><br>
				 자주묻는 질문을 확인해보세요.
			 </div></a>
			 <a href="#">
			 <div id="cont2">
				<img src="./img/분실물.JPG">
				<h2>분실물문의</h2><br>
				잃어버린 물건을 접수해주시면<br>
				신속히 찾아드리겠습니다
				 
			 </div ></a>
			 <a href="#">
			 <div id="cont3">
				<img src="./img/문의.JPG">
				<h2>1:1 문의</h2><br>
				해결되지않은 문제가 있나요?<br>
				1:1문의로 문의주세요
			 </div></a>
			 <a href="#">
			 <div id="cont4">
				<img src="./img/customer.png">
				<h2>단체관람 및 대관문의</h2><br>
				단체관람 또는 대관을 원하시면<br>
				문의 해주세요
			</div></a>
			<a href="#">
			<div id="cont5">
				<img src="./img/butique.JPG">
				<h2>할인카드 안내</h2><br>
				멤버십 제휴카드 및 다양한 할인카드를<br>
				통해 알뜰하게 영화 감상하세요
			</div></a>
		 </div>
		
		 <div id="content2"> 
		 <hr>
			<div id="cont1">
				<div id="cont1_top">
					<h4>자주묻는질문BEST5
						<div id="more"><a href="FAQ.jsp">더보기 ></a></div>
					</h4>	
				</div>
				
			</div>
			<div id="cont2">
				<div id="cont1_top">
					<h4>공지사항
						<div id="more"><a href="notice.jsp">더보기 ></a></div>
					</h4>
				</div>
					<table align=center width="1000">
						<tr>
						<!-- 게시물 내용 출력  -->
							<td colspan=2>
								<table width=395px>
	
			
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
											<td width="800">
											<a href="javascript:read('<%=bean.getNum()%>')"><%=bean.getNum() %>
											[<%=bean.getDivi() %>]&nbsp;<%=bean.getSubject() %></a>
											</td>
											<td align=center width="300"><%=bean.getRegdate() %></td>
										</tr>
		
					<%
							}
						}
					%>	
								</table>
							</td>
						</tr>
				</table>
				
			</div>
		</div>
		<div id="event">
			<div>
				<h2>이벤트</h2>
			</div>
			<div id="event1">
				<a href="#"><img src="img/이벤트1.jpg"></a>
			</div>
			<div id="event2">
				<a href="#"><img src="img/이벤트2.png"></a>
			</div >
		</div>
		<form name=readFrm method=get>
			<input type="hidden" name="num">
			<input type="hidden" name="nowPage" value=<%=nowPage%>>
		</form>
		 <footer id="footer">
			<jsp:include page="jsp/footerContents.jsp" />
		 </footer>
 
	</div>
</body>
</html>