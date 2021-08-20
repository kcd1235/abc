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
content 
{
	width:5300px; 
	height:800px; 
	position:absolute; top:160px; left:0px; 
	margin:4px;
	border: 1px solid gray;
	background-color:black;
	color:white;
}
section
{
	width:1190px; 
	height:800px; 
	position:absolute; top:960px; left:0px; 
	margin:4px;
	border: 1px solid gray;
}
#b1{width:1190px; 
	height:400px; 
	position:absolute; top:960px; left:0px; 
	margin:4px;
	border: 1px solid gray;}
#b2{width:1190px; 
	height:550px; 
	position:absolute; top:1360px; left:0px; 
	margin:4px;
	border: 1px solid gray;}
#q1 {width:1190px; 
	height:800px; 
	position:absolute; top:1910px; left:0px; 
	margin:4px;
	border: 1px solid gray;
	background-color:navy;}
#q1 a {text-decoration:none; color:lightgray;}
#q1 ul {list-style:none;}
#a1
{
	width:1190px; 
	height:800px; 
	position:absolute; top:2710px; left:0px; 
	margin:4px;
	border: 1px solid gray;
}
#a1 ul
{
	list-style:none;
	text-align:center;
}
#a1 ul li {display:inline-block; width:100px;}

nav 	
{
	width:1190px; height:100px;  border:1px solid gray;
	font-size:15px;
}
footer
{
	width:1190px; height:280px; 
	border:1px solid gray;
	position:absolute; top:3510px; left:0px;
	margin: 4px;
}

div{height:50px;}

hr {height:1px; border:0px; background:lightgray;}
#contents {width:100%;height:800px; margin:30px;}
#contents ul {list-style:none; text-align:center;}
#contents ul li {width:200px;height:50px; float:left; margin:40px; }
#contents ul li form img {width:100%; height:300px; border:1px solid gray; }
#contents ul li form input[type="button"]
{
	position:relative; top:280px; left:0px;
	width:150px; height:50px;
}

#td1{text-align:center; font-size:16px;}
#td2{text-align:right; font-size:17px;}
#t1
{
	font-size:20px;
	position:relative; top:200px; left:-50px;
	text-align:center;
}
#t2 td
{
	color:white;
	font-size:20px;	
}
</style>

</head>
<body>
	<header>
		<jsp:include page="module/header.jsp" />
	</header>

	
	<content>
	<br><br><br>
	<div id=contents align="center">
	<table width=1000px border=1>
		<tr>
			<td id="td1">박스오피스</td>
		</tr>
		<tr>
			<td colspan="5" id="td2"><a href="#">더 많은 영화보기+</a></td>
			<!-- <td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td> -->
		</tr>
	</table>
		<ul>
			<li>
				<form>
					<img src="이것이리눅스다.jpg">
					<input type="button" onclick="" value="예매하기">
				</form>
			</li>
			<li>
				<form>
					<img src="열혈C.jpg">
					<input type="button" onclick="" value="예매하기">
				</form>
			</li>
			
			<li>
				<form>
					<img src="자바의정석.jpg">
					<input type="button" onclick="" value="예매하기">
				</form>
			</li>
			
			<li>
				<form>
					<img src="DOITJAVA.jpg">
					<input type="button" onclick="" value="예매하기">
				</form>
			</li>
			<li>
			</li>
		</ul>
		<table border=1 id="t1" width=1000px;>
		<tr>
			<td>
				<form name=searchFrm method=get action=List.jsp>
					<input size=16 name=keyWord>
					<input type=button value=찾기 onclick="javascript:check()">
					<input type=hidden name=nowPage value=1>	
				</form>	
			</td>
			<td>상영시간표</td>
			<td>박스오피스</td>
			<td>빠른예매</td>
		</tr>
	</table>
	</div>
	
	</content>
	<section id="b1">
		혜택
	</section>
	<section id="b2">
		<table border=1>
			<tr>
			<td><img alt="" src="">VIP LOUNGE</td>
			</tr>
			<tr>
			<td><img alt="" src="">VIP LOUNGE</td>
			</tr>
			<tr>
			<td><img alt="" src="">VIP LOUNGE</td>
			</tr>
			<tr>
			<td><img alt="" src="">VIP LOUNGE</td>
			</tr>
		</table>
	</section>
	<section id="q1">
	<br>
		<table width=1300px id="t2">
		<tr>
			<td>큐레이션</td>
		</tr>
		<tr>
			<td colspan="5" id="td2"><a href="#">큐레이션더보기+</a></td>
			<!-- <td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td> -->
		</tr>
		<tr>
			<td rowspan="5"><img alt="" src="돈조반니.jpg"></td>
			<td>
				#클래식소사이어티
				<font>2021 잘츠부르크_돈 조반니</font>
			</td>
		</tr>
		<tr>
			<!-- <td></td> -->
			<td>스크린으로 만나는 세계 최고의 음악 페스티벌</td>
		</tr>
		<tr>
			<!-- <td></td> -->
			<td>2021 잘츠부르크 페스티벌-돈 조반니</td>
		</tr>
		<tr>
			<!-- <td></td> -->
			<td>[상영정보]
				<ul>
					<li>-상영일시 : 2021년 8월 22일(일) 14:00 *딜레이중계</li>
					<li>-공연시간 : 약 220분(인터미션 포함)/전체관람가</li>
					<li>-상영지점 : 코엑스, 센트럴, 목동, 성수, 킨텍스, 분당, 하남스타필드, 대구신세계, 해운대(장산)</li>
				</ul>
			</td>
		</tr>
	</table>
	
	</section>
	<section id="a1">
		메가박스안내
		<hr>
		<ul>
			<li>고객센터</li>
			<li>자주묻는질문</li>
			<li>1:1문의</li>
			<li>단체/대관문의</li>
			<li>분실물 문의/접수</li>
			<li>더 부티크 프라이빗 대관예매</li>
		</ul>
	</section>
	
	<footer>
		<%@ include file="jsp/footerContents.jsp" %>
	</footer>
<form>
	<input type=hidden name=title id=title value="이것이리눅스다" >
	<input type=hidden name=publisher id=publisher value="한빛미디어" >
	<input type=hidden name=price id=price value="20000" >
</form>
</body>
</html>