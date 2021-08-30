<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 | 라이브씨어터,메가박스</title>
<%@ include file="jsp/link.jsp" %>
<link rel="stylesheet" href="css/customerservice_content.css">
<link rel="stylesheet" href="css/theater.css?12345">
<script src="js/board.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>

	<script>
		$(function(){
  $('.theater_list > div').hide();
  $('.theater_region a').click(function () {
    $('.theater_list > div').hide().filter(this.hash).fadeIn();
    $('.theater_region a').removeClass('active');
    $(this).addClass('active');
    return false;
  }).filter(':eq(0)').click();
  });
	</script>
</head>

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
		<div class="slide">
			
		</div>
		<div class="theater">
            <h2 class=title>전체 극장</h2>
            <div class="theater_box">
                <div class="theater_region">
					<ul>
						<li><a href="#s">서울</a></li>
						<li><a href="#k">경기</a></li>
						<li><a href="#i">인천</a></li>
						<li><a href="#dcs">대전/충청/세종</a></li>
						<li><a href="#bdk">부산/대구/경상</a></li>
						<li><a href="#gj">광주/전라</a></li>
						<li class="kw"><a href="#kw">강원</a></li>
					</ul>
					<div class="theater_list">
						<div id="s">
							<ul>
								<li>강남</li>
								<li>강남대로(씨티)</li>
								<li>강동</li>
								<li class="l1">군자</li>
								<li>동대문</li>
								<li>마곡</li>
								<li>목동</li>
								<li class="l1">상봉</li>
								<li>상암월드컵경기장</li>
								<li>성수</li>
								<li>센트럴</li>
								<li class="l1">송파파크하비오</li>
								<li>신촌</li>
								<li>이수</li>
								<li>창동</li>
								<li class="l1">코엑스</li>
								<li>홍대</li>
								<li>화곡</li>
								<li>ARTNINE</li>
							</ul>
						</div>
						<div id="k">
							<ul>
								<li>고양스타필드</li>
								<li>김포한강신도시</li>
								<li>남양주</li>
								<li class="l1">남양주현대아울렛스페이스원</li>
								<li>동탄</li>
								<li>미사강변</li>
								<li>백석</li>
								<li class="l1">별내</li>
								<li>부천스타필드</li>
								<li>분당</li>
								<li>수원</li>
								<li class="l1">수원남문</li>
								<li>시흥배곧</li>
								<li>안산중앙</li>
								<li>안성스타필드</li>
								<li class="l1">양주</li>
								<li>영롱</li>
								<li>용인기흥</li>
								<li>용인테크노밸리</li>
								<li class="l1">의정부민락</li>
								<li>일산</li>
								<li>일산벨라시타</li>
								<li>킨텍스</li>
								<li class="l1">파주금촌</li>
								<li>파주운정</li>
								<li>파주출판도시</li>
								<li>하남스타필드</li>
							</ul>
						</div>
						<div id="i">
							<ul id="i">
								<li>검단</li>
								<li>송도</li>
								<li>영종</li>
								<li class="l1">인천논현</li>
								<li>청라지젤</li>
								<li></li>
								<li></li>
							</ul>
						</div>
						<div id="dcs">
							<ul>
								<li>공주</li>
								<li>논산</li>
								<li>대전</li>
								<li class="l1">대전신세계아트앤사이언스</li>
								<li>대전유성</li>
								<li>대전중앙로</li>
								<li>대전현대아울렛</li>
								<li class="l1">세종(조치원)</li>
								<li>세종나성</li>
								<li>세종청사</li>
								<li>오창</li>
								<li class="l1">제천</li>
								<li>진천</li>
								<li>천안</li>
								<li>청주사창</li>
								<li class="l1">충주</li>
								<li>홍성내포</li>
								<li></li>
								<li></li>
							</ul>
						</div>
						<div id="bdk">
							<ul>
								<li>경북도청</li>
								<li>경산하양</li>
								<li>구미강동</li>
								<li class="l1">김천</li>
								<li>남포항</li>
								<li>대구(칠성로)</li>
								<li>대구신세계(동대구)</li>
								<li class="l1">대구이시아</li>
								<li>덕천</li>
								<li>마산</li>
								<li>문경</li>
								<li class="l1">부산극장</li>
								<li>부산대</li>
								<li>북대구(칠곡)</li>
								<li>삼천포</li>
								<li class="l1">양산</li>
								<li>양산라피에스타</li>
								<li>울산</li>
								<li>정관</li>
								<li class="l1">창원</li>
								<li>창원내서</li>
								<li>해운대(장산)</li>
								<li></li>
							</ul>
						</div>
						<div id="gj">
							<ul>
								<li>광주상무</li>
								<li>광주하남</li>
								<li>목포하당(포르모)</li>
								<li class="l1">송천</li>
								<li>순천</li>
								<li>여수웅천</li>
								<li>전대(광주)</li>
								<li class="l1">전주혁신</li>
								<li>첨단</li>
								<li></li>
								<li></li>
							</ul>
						</div>
						<div id="kw">
							<ul id="kw">
								<li>남춘천</li>
								<li>속초</li>
								<li>원주</li>
								<li class="l1">원주센트럴</li>
							</ul>
						</div>
					</div>
                </div>
				<div class="theater_box_bottom">
					나의정보
				</div>
            </div>
        </div>
        <div class="event">
            <div class=title>
                <h2 class="tit">극장 이벤트</h2>
				<a href="#" class="more">더보기></a>
            </div>
			<div class="event_box">
				<ul>
					<li>
						<a href="#">
							<img src="./img/event.JPG" alt="">
						</a>
					</li>
					<li>
						<a href="#">
							<img src="./img/event2.JPG" alt="">
						</a>
					</li>
				</ul>

			</div>
        </div>
        <div class="notice">
			 <div class="title">
				<h2 class="tit">극장 공지</h2>
				<a href="notice.jsp" class="more">더보기></a>
            </div>
			<div class="notice_tbl">
				<table border="1" class="boardlist">
					<thead>
						<tr>
							<th>극장</th>
							<th>제목</th>
							<th>지역</th>
							<th>등록일</th>
						</tr>
					</thead>
					<tbody>
					<%
						listSize=blist.size();
						if(blist.isEmpty()){
							out.println("등록된 게시물이없습니다");
						}
						else
						{
							for(int i=1;i<numPerPage;i++)
							{
								if(i==listSize)
									break;
								
								BoardBean bean=blist.get(i);
								%>
								<tr>
									<td align="center"><%=bean.getTheater() %></td>
									<th align="left">
										<a href="javascript:read('<%=bean.getNum()%>')"><%=bean.getSubject() %></a>
									</th>
									<td align="center"><%=bean.getRegion() %></td>
									<td align="center"><%=bean.getRegdate() %></td>
								</tr>
								<%
							}
						}
					%>
					</tbody>
				</table>
			</div>
        </div>
		<form name=readFrm method=get>
			<input type="hidden" name="num">
			<input type="hidden" name="nowPage" value=<%=nowPage%>>
		</form>
		<footer id="footer">
			<jsp:include page="jsp/footerContents.jsp"/>
		</footer>
	</div>
</body>
</html>