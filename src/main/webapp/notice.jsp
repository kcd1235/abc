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
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
<jsp:useBean id="bMgr" class="Ch20.BoardMgr" scope="page" />
<%@page import="java.util.*,Ch20.BoardBean" %>	<!-- ArrayList 사용위한 클래스 경로 설정-->
<%
	int totalRecord=0;
	int numPerPage=10;
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
	for(x in a){
		var opt=document.createElement("option");
		opt.value=a[x];
		opt.innerHTML=a[x];
		target.appendChild(opt);
	}
}
$(function(){
	  $('.tabcontent > div').hide();
	  $('.tabnav a').click(function () {
	    $('.tabcontent > div').hide().filter(this.hash).fadeIn();
	    $('.tabnav a').removeClass('active');
	    $(this).addClass('active');
	    return false;
	  }).filter(':eq(0)').click();
	});
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
		<br><br>
		<div class="tab">
			<ul class="tabnav">
		     	<li><a href="#tab01">전체</a></li>
		     	<li><a href="#tab02">메가박스공지</a></li>
		     	<li><a href="#tab03">지점공지</a></li>
	   	 	</ul>
	    	<div class="tabcontent">
	      		<div id="tab01">
	      			<div id="top">
			            전체 !건
			        </div>
			        <div id="divi">
			        	<form name=searchFrm method=get action=notice.jsp>

				        <select id="s1" onchange="regioncate(this)" name="keyField1" size=1>
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
			            <select id="theater" name="keyField2">
			            	<option>극장선택</option>
						</select>
			            <input type="text" name="keyWord">
			          <a href="javascript:check()"><span style="color:gray"><i class="fas fa-search"></i></span></a>
			          <input type="hidden" value="1" name="nowPage">
			          </form>
			            <div class="notice">
							<table align=center>
								<tr>
								<!-- 게시물 내용 출력  -->
									<td colspan=2>
										<table width=800>
											<tr align=center bgcolor=lightgray height=40px;>
												<td>번호</td>
												<td>극장</td>
												<td>구분</td>
												<td width=400>제목</td>
												<td>등록일</td>
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
		<tr height=50px>
			<td align=center><%=bean.getNum() %></td>
			<td align=center><%=bean.getTheatername()%></td>
			<td><%=bean.getDivi() %></td>
			<td>
			<a href="javascript:read('<%=bean.getNum()%>')"><%=bean.getSubject() %></a>
			</td>
			<td align=center><%=bean.getRegdate() %></td>
		</tr>
	
		<%
				}
			}
		%>		
										</table>
									</td>
								</tr>
								<tr><!-- 페이지블럭 출력 [1][2][3][4][5][6][7]-->
									<td align="center">
	<% 
		int pageStart=(nowBlock -1)*pagePerBlock + 1;	//블럭 시작 번호(1000게시물일때 블럭총개수:7)
		int pageEnd=((pageStart + pagePerBlock)<=totalPage)?(pageStart+pagePerBlock) :totalPage+1;
	
		if(totalPage!=0)
		{
			if(nowBlock>1)
			{
				%>
					<a href="javascript:list()">[<<]</a>&nbsp;
					<a href="javascript:block('<%=nowBlock-1%>')">[<]</a>&nbsp;
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
					<a href="javascript:block('<%=nowBlock+1%>')">[>]</a>
				<%
			}
			
		}
	%>
	
	
	</td>
							</table>
						</div>         
	      			</div>
	      		</div>
	      		<div id="tab02">
            		<div id="top">
            			전체 !건
            		</div>
            		<div id="divi">
             		 <input type="text">
					<div class="notice">
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
										<%
			listSize=alist.size();	//가져온 게시물의 개수를 listSize에 저장
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
					
					BoardBean bean = alist.get(i);				
		%>
		<tr height=50px>
			<td align=center><%=bean.getNum() %></td>
			<td align=center><%=bean.getTheatername()%></td>
			<td><%=bean.getDivi() %></td>
			<td>
			<a href="javascript:read('<%=bean.getNum()%>')"><%=bean.getSubject() %></a>
			</td>
			<td align=center><%=bean.getRegdate() %></td>
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
				</div>
				<div id="tab03">
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
			            <select id="s2">
			            	<option>극장선택</option>
						</select>
			            <input type="text">
			            <div class="notice">
							<table align=center >
								<tr>
								<!-- 게시물 내용 출력  -->
									<td colspan=2>
										<table width=800>
											<tr align=center bgcolor=lightgray>
												<td>번호</td>
												<td>극장</td>
												<td>구분</td>
												<td width=400>제목</td>
												<td>등록일</td>
											</tr>
											<%
			listSize=clist.size();	//가져온 게시물의 개수를 listSize에 저장
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
					
					BoardBean bean = clist.get(i);				
		%>
		<tr height=50px>
			<td align=center><%=bean.getNum() %></td>
			<td align=center><%=bean.getTheatername()%></td>
			<td><%=bean.getDivi() %></td>
			<td>
			<a href="javascript:read('<%=bean.getNum()%>')"><%=bean.getSubject() %></a>
			</td>
			<td align=center><%=bean.getRegdate() %></td>
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
	      		</div>
	      	</div>
	      </div>
		
				
<!-- 검색 -->



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
	<footer id="footer">
		<jsp:include page="jsp/footerContents.jsp" />
	 </footer>
</body>
</html>