<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<%@ include file="jsp/link.jsp" %>
<link rel="stylesheet" href="css/notice.css?1234">
<script src="js/board.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<style>
	#wrap {background:white; height:800px;}
	#aside {background:white}
	#nav {background:white}
</style>
</head>
<body>
<jsp:useBean id="bMgr" class="Board.BoardMgr" scope="page" />
<%@page import="java.util.*,Board.BoardBean" %>	<!-- ArrayList 사용위한 클래스 경로 설정-->
<%
	int totalRecord=0;
	int numPerPage=10;
	int totalPage=0;
	int totalBlock=0;
	int nowPage=1;
	int nowBlock=1;
	int pagePerBlock=10;
	
	int totalRecord1=0;
	int numPerPage1=10;
	int totalPage1=0;
	int totalBlock1=0;
	int nowPage1=1;
	int nowBlock1=1;
	int pagePerBlock1=10;
	
	int start=0;
	int end=10;
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
	totalRecord=bMgr.getTotalCount(keyField,keyWord);
	totalPage= (int)Math.ceil((double)totalRecord/ numPerPage);
	totalBlock=(int)Math.ceil((double)totalPage/pagePerBlock);
	nowBlock=(int)Math.ceil((double)nowPage/pagePerBlock);
	
	totalRecord1=bMgr.getTotalCount();
	totalPage1= (int)Math.ceil((double)totalRecord1/ numPerPage1);
	totalBlock1=(int)Math.ceil((double)totalPage1/pagePerBlock1);
	nowBlock1=(int)Math.ceil((double)nowPage1/pagePerBlock1);
	
	
	ArrayList<BoardBean> blist = bMgr.getBoardList(keyField, keyWord, start, end);
	ArrayList<BoardBean> alist=bMgr.selectMegabox();
	ArrayList<BoardBean> clist=bMgr.selectRegion();
	
%>
<script>
function block(value){
	 document.readFrm.nowPage.value=<%=pagePerBlock%>*(value-1)+1;	//이동하는 블럭의 시작페이지 계산-> 15*(value-1)+1
	document.readFrm.submit();
}
function regioncate(e)
{
	var theater_s=["강남","강남대로(씨티)","강동","군자","동대문","마곡","목동","상봉"
		,"상암월드컵경기장","성수","센트럴","신촌","이수","창동","코엑스","홍대","화곡","ARTNINE"];
	var theater_k=["고양스타필드","김포한강도시","남양주","남양주현대아울렛 스페이스원","동탄"
		,"미사강변","백석","별내","부천스타필드","분당","수원","수원남문","시흥배곧","안산중앙"
		,"안성스타필드","양주","영롱","용인기흥","용인테크노밸리","의정부민락","일산","일산벨라시타"
		,"킨텍스","파주금촌","파주운정","파주출판도시","하남스타필드"];
	var theater_i=["검단","송도","영종","인천논현","청라지젤"];
	var theater_dcs=["공주","논산","대전","대전신세계아트앤사이언스","대전유성","대전중앙로"
		,"대전현대아울렛","세종(조치원)","세종나성","세종청사","오창","제천","진천","천안"
		,"청주사창","충주","흥성내포"];
	var theater_bdk=["경북도청","경산하양","구미강동","김천","남포항","대구(칠성로)","대구신세계(동대구)"
		,"대구이시아","덕천","마산","문경","부산극장","부산대","북대구(칠곡)","삼천포","양산"
		,"양산라피에스타","울산","정관"];
	var theater_gj=["광주상무","광주하남","목포하당(포르모)","송천","순천","여수웅천","전대(광주)"
		,"전주혁신","첨단"];
	var theater_kw=["남춘천","속초","원주","원주센트럴"];
	var target=document.getElementById("theater");
	
	if(e.value=="s") var a=theater_s;
	else if(e.value=="k") var a=theater_k;
	else if(e.value=="i") var a=theater_i;
	else if(e.value=="dcs") var a=theater_dcs;
	else if(e.value=="bdk") var a=theater_bdk;
	else if(e.value=="gj") var a=theater_gj;
	else if(e.value=="kw") var a=theater_kw;
	target.options.length=1;
	document.getElementById("theater").removeAttribute("disabled");
	for(x in a){
		var opt=document.createElement("option");
		opt.value=a[x];
		opt.innerHTML=a[x];
		target.appendChild(opt);
	}
}
	$(document).ready(function(){
	$('ul.tab_title li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.tab_title li').removeClass('on');
		$('.boardlistwrap').removeClass('on');

		$(this).addClass('on');
		$("#"+tab_id).addClass('on');
	})

})
	
</script>
	<div id="wrap">
		<header id="header">
			<jsp:include page="module/header.jsp" />
		</header>
		<aside id="aside">
			<jsp:include page="module/aside.jsp"/>
		</aside>
		<div class="contents">
			<h2 class="tit">공지사항</h2>
			<div class="tab_list">
				<ul class="tab_title">
					<li class="on" data-tab="tab-1">
						<button>전체</button>
					</li>
					<li data-tab="tab-2">
						<button>메가박스공지</button>
					</li>
					<li data-tab="tab-1">
						<button>지점공지</button>
					</li>
				</ul>
			</div>
			<div id="tab-1" class="boardlistwrap on">
				<div class="boardlist-util">
					<p class="result">
						<strong>
							전체
							<em class="blue"><%=bMgr.getTotalCount(keyField, keyWord) %></em>
							건
						</strong>
					</p>
					<form name=searchFrm method=get action=notice.jsp>
					<div class="dropdown">
						<select id="region" onchange="regioncate(this)" name="keyField1" size=1>
							<option>지역선택</option>
							<option value="s">서울</option>
					        <option value="k">경기</option>
							<option value="i">인천</option>
							<option value="dcs">대전/충청/세종</option>
							<option value="bdk">부산/대구/경상</option>
							<option value="gj">광주/전라</option>
							<option value="kw">강원</option>
							<option value="jj">제주</option>
						</select>
					</div>
					<div class="dropdown2">
						<select id="theater" name="keyField2" disabled>
							<option>극장선택</option>
						</select>
					</div>
					<div class="search">
						<input type="text" class="search_text" name="keyWord">
						<button onclick="javascript:check()">
							<span style="color:gray"><i class="fas fa-search"></i></span>
						</button>
					</div>
					<input type="hidden" value="1" name="nowPage">
			    	</form>
				</div>
				<div class="table-wrap">
					<table class="boardlist" border=1>
						<colgroup>
							<col width="72px">
							<col width="133px">
							<col width="95px">
							<col>
							<col width="116px">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">극장</th>
								<th scope="col">구분</th>
								<th scope="col">제목</th>
								<th scope="col">등록일</th>
							</tr>
						</thead>
						<tbody>
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
								<td><%=bean.getNum() %></td>
								<td><%=bean.getTheater() %></td>
								<td><%=bean.getDivi() %></td>
								<th><%=bean.getSubject() %></th>
								<td><%=bean.getRegdate() %></td>
							</tr>
							<%
								}
							}
						%>
						</tbody>
					</table>
				</div>
				<nav class="page">
					<%
							int pageStart=(nowBlock -1)*pagePerBlock + 1;
							int pageEnd=((pageStart + pagePerBlock)<=totalPage)?(pageStart+pagePerBlock) :totalPage+1;
							if(totalPage!=0)
							{
								if(nowBlock>1)
								{
							%>
									<a href="javascript:list()">[처음으로]</a>
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
				</nav>
			</div>
			<div id="tab-2" class="boardlistwrap">
				<div class="boardlist-util">
					<p class="result">
						<strong>
							전체
							<em class="blue"><%=totalRecord1 %></em>
							건
						</strong>
					</p>
					<form name=searchFrm method=get action=notice.jsp>
					<div class="search">
						<input type="text" class="search_text" name="keyWord">
						<button onclick="javascript:check()">
							<span style="color:gray"><i class="fas fa-search"></i></span>
						</button>
					</div>
					<input type="hidden" value="1" name="nowPage">
			    	</form>
				</div>
				<div class="table-wrap">
					<table class="boardlist">
						<colgroup>
							<col width="72px">
							<col width="133px">
							<col width="95px">
							<col>
							<col width="116px">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">극장</th>
								<th scope="col">구분</th>
								<th scope="col">제목</th>
								<th scope="col">등록일</th>
							</tr>
						</thead>
						<tbody>
							<%
							listSize=alist.size();	//가져온 게시물의 개수를 listSize에 저장
							if(alist.isEmpty())
							{
								out.println("등록된 게시물이 없습니다.");
							}
							else
							{
								for(int i=0;i<numPerPage;i++)
								{
									if(i==listSize)
										break;
									
									BoardBean bean = alist.get(i);				
							%>
							<tr>
								<td><%=bean.getNum() %></td>
								<td><%=bean.getTheater() %></td>
								<td><%=bean.getDivi() %></td>
								<th><%=bean.getSubject() %></th>
								<td><%=bean.getRegdate() %></td>
							</tr>
							<%
								}
							}
						%>
						</tbody>
					</table>
				</div>
				<nav class="page">
					<%
							int pageStart1=(nowBlock1 -1)*pagePerBlock1 + 1;
							int pageEnd1=((pageStart1 + pagePerBlock1)<=totalPage1)?(pageStart1+pagePerBlock1) 
									:totalPage1+1;
							if(totalPage1!=0)
							{
								if(nowBlock1>1)
								{
							%>
									<a href="javascript:list()">[처음으로]</a>
									<a href="javascript:block('<%=nowBlock1-1%>')">[이전으로]</a>&nbsp;
							<%
								}
								for(;pageStart1<pageEnd1;pageStart1++)
								{
									%>
									<a href="javascript:paging('<%=pageStart1%>')">[<%=pageStart1%>]</a>
									<%
								}
								if(totalBlock1>nowBlock1){
									%>
										<a href="javascript:block('<%=nowBlock1+1%>')">[다음으로]</a>
									<%
								}	
							}
						%>	
				</nav>
			</div>
			<div id="tab-3" class="boardlistwrap">
				<div class="boardlist-util">
					<p class="result">
						<strong>
							전체
							<em class="blue"><%=bMgr.getTotalCount(keyField, keyWord) %></em>
							건
						</strong>
					</p>
					<form name=searchFrm method=get action=notice.jsp>
					<div class="search">
						<input type="text" class="search_text" name="keyWord">
						<button onclick="javascript:check()">
							<span style="color:gray"><i class="fas fa-search"></i></span>
						</button>
					</div>
					<input type="hidden" value="1" name="nowPage">
			    	</form>
				</div>
				<div class="table-wrap">
					<table class="boardlist">
						<colgroup>
							<col width="72px">
							<col width="133px">
							<col width="95px">
							<col>
							<col width="116px">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">극장</th>
								<th scope="col">구분</th>
								<th scope="col">제목</th>
								<th scope="col">등록일</th>
							</tr>
						</thead>
						<tbody>
							<%
							listSize=clist.size();	//가져온 게시물의 개수를 listSize에 저장
							if(clist.isEmpty())
							{
								out.println("등록된 게시물이 없습니다.");
							}
							else
							{
								for(int i=0;i<numPerPage;i++)
								{
									if(i==listSize)
										break;
									
									BoardBean bean = clist.get(i);				
							%>
							<tr>
								<td><%=bean.getNum() %></td>
								<td><%=bean.getTheater() %></td>
								<td><%=bean.getDivi() %></td>
								<th><%=bean.getSubject() %></th>
								<td><%=bean.getRegdate() %></td>
							</tr>
							<%
								}
							}
						%>
						</tbody>
					</table>
				</div>
				<nav class="page">
					<%
							int pageStart2=(nowBlock -1)*pagePerBlock + 1;
							int pageEnd2=((pageStart + pagePerBlock)<=totalPage)?(pageStart+pagePerBlock) :totalPage+1;
							if(totalPage!=0)
							{
								if(nowBlock>1)
								{
							%>
									<a href="javascript:list()">[처음으로]</a>
									<a href="javascript:block('<%=nowBlock-1%>')">[이전으로]</a>&nbsp;
							<%
								}
								for(;pageStart<pageEnd;pageStart++)
								{
									%>
									<a href="javascript:paging('<%=pageStart2%>')">[<%=pageStart2%>]</a>
									<%
								}
								if(totalBlock>nowBlock){
									%>
										<a href="javascript:block('<%=nowBlock+1%>')">[다음으로]</a>
									<%
								}	
							}
						%>	
				</nav>
			</div>
		</div>
	</div>
	    	
	      		
		
				
<!-- 검색 -->



<!--페이징 처리를 위한 Form-->
<form name=readFrm method=get>
	<input type="hidden" name="num">
	<input type="hidden" name="nowPage" value=<%=nowPage%>>
	<input type="hidden" name="keyField" value=<%=keyField%>>
	<input type="hidden" name="keyWord" value=<%=keyWord%>>
</form>

<!--처음으로 기능 처리 시작  -->
<form method="post" name=listFrm>
	<input type="hidden" name=reload value=true>
	<input type="hidden" name=nowPage value=1>
</form>
<!--처음으로 기능 처리 끝  -->
</div>
	<footer id="footer">
		<jsp:include page="jsp/footerContents.jsp" />
	 </footer>
</body>
</html>