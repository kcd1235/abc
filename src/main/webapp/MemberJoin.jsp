<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
  <title> 입력양식 </title> 
  <%@ include file="jsp/link.jsp" %>
 <style type="text/css">
	.member-wrap{
	width: 720px;
    min-height: 100%;
    margin: 0 auto;
    padding: 80px 100px;
    background-color: #fff;
}
.gohome
{
	width:517px;
	height:117px;
}
.gohome a{
	display: block;
    width: 140px;
    height: 47px;
    margin: 0 auto;
    padding: 0;
    font-size: 0;
    line-height: 0;
}
.col-wrap{
	overflow:hidden;
}
.step-member{
	overflow: hidden;
    position: relative;
    margin: 15px 0 40px 0;
    padding: 0;
}
.step-member ol li:first-child {
	margin-left:30px;
}
.step-member ol li {
	float:left;
	margin:0 0 0 27px;
	padding:0;
	text-align: center;
	font-size: .9333em;
}
.member-wrap .step-member ol li .step {
    display: inline-block;
    position: relative;
    z-index: 2;
    margin: 0;
    padding: 0 0 15px 0;
    font-size: .9333em;
    letter-spacing: 0;
}
.member-wrap .step-member ol li .step.on {
    border-bottom: 2px solid #503396;
    color: #503396;
}
.step-member:after {
	content:'';
	overflow:hidden;
	position:absolute;
	left:0;
	bottom:0;
	width:100%;
	height:1px;
	background-color:#ebebeb;
}
.page-info-txt h3 {
	display:block;
	padding:0 0 10px 0;
	color: #222;
}
colgroup {
	    display: table-column-group;
}
col {
    display: table-column;
}
tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
}
table {
    width: 100%;
    margin: 0;
    border: 0;
    table-layout: fixed;
    border-collapse: collapse;
    empty-cells: show;
}
.board-form tbody td, .board-form tbody th {
    position: relative;
    height: 50px;
    padding: 7px 15px;
    text-align: left;
    border-bottom: 1px solid #d1d5dd;
}
.board-form tbody th {
	background:#f7f8f9;
	width:150px;
}

.input-text {
    display: inline-block;
    width: 260px!important;
    height: 32px;
    padding: 0 10px;
    line-height: 30px;
    color: #444;
    border: 1px solid #d8d9db;
    vertical-align: middle;
    font-family: NanumBarunGothic,Dotum,'돋움',sans-serif;
}
.ph1, .ph2, .ph3{
    width: 100px!important;
}

.button {
    display: inline-block;
    height: 30px;
    margin: 0;
    padding: 0 15px;
    text-align: center;
    line-height: 34px;
    color: #fff;
    font-weight: 400;
    border-radius: 4px;
    font-family: NanumBarunGothic,Dotum,'돋움',sans-serif;
    text-decoration: none;
    border: 1px solid #503396;
    vertical-align: middle;
    background-color: #503396;
    cursor: pointer;
}
.button.idoverlap {
	padding : 0 5px;
	border : 1px solid #c1c1c1;
	color : #777;
	background-color : #e0e0e0;
	font-size : .8111em;
	margin-left: 2px!important;
	width:69px;
	line-height: 25px;
}
.button.setmegabox {
	padding : 0 5px;
	border : 1px solid #c1c1c1;
	color : #777;
	background-color : #ffffff;
	font-size : .8111em;
	margin-left: 2px!important;
	width:48px;
	line-height: 25px;
}
.marketing-agree{
    border-radius: 2%;
    border : 1px solid rgb(185, 185, 185);
    margin-top: 45px;
    
}
.marketing-agree .phr{
    padding: 0 20px;
    padding-bottom: 10px;
    font-size: 16.5px;
    font-weight: 600;
    border-bottom: 1px solid rgb(185, 185, 185);
}
.cont{
    padding: 0 20px;
}
.marketing-agree dl dt {
    margin : 0 0 5px 0;
    color : #666;
    font-weight: 600;
}
.marketing-agree dl dd , .marketing-agree .samedd{
    margin : 0 0 15px 0;
    color : #666;
    font-size: .8999em;
}
input[type="radio"]
{
    background-color: blue!important;
}
.markag {
    background-color: rgb(240, 240, 240)!important;
    width: 100%;
    height: 40px;
    margin-bottom: 15px;
    line-height: 40px;
    padding: 0 5px;
    border-radius: 5px;
}
.marketing-agree .samedt{
    margin : 0 0 15px 0;
    color : #666;
    font-weight: 600;
    
}
.footer{
    padding-top: 10px;
    text-align: center;
}
.join{
    width: 200px!important;
    height: 60px;
    padding: 0!important;
    font-size: 20px!important;
    
}
 </style>
 <script>
 	var startyear="1930";
 	var today=new Date();
 	var todayyear=today.getFullYear();
 	var index=0;
 	for(var y=startyear;y<=todayyear;y++)
 	{
 		document.getElementById('year').options[index]=new Option(y,y);
 		index++;
 	}
 	index=0;
 	for(var m=1;m<=12;m++)
 	{
 		document.getElementById('month').options[index]=new Option(y,y);
 		index++;		
 	}
 	
 	lastday();
 	
 	function lastday()
 	{
 		var Year=document.getElementById('year').value;
 		var Month=document.getElementById('month').value;
 		var Day=new Date(new Date(Year,Month,1)-86400000).getDate();
 		var dayindex_len=document.getElementById('day').length;
 		
 		if(Day>dayindex_len)
 		{
 			for(var i=(dayindex_len+1);i<=Day;i++)
 			{
 				document.getElementById('day').options[i-1]=new Option(i,i);
 			}
 		}
 		else if(Day<dayindex_len)
 		{
 			for(var i=dayindex_len;i>=Day;i--)
 			{
 				document.getElementById('day').options[i]=null;
 			}
 		}
 	}
 </script>
</head>
<body> 
	<div id="wrap">
		<div class="member-wrap">
			<h1 class="gohome">
                <a href="./C01Main.jsp" title="메인 페이지로 이동">
                	<img src="./img/메가박스로고.JPG">MEGABOX : Life Theater
                </a> 
            </h1>
            <div class="col-wrap">
                <div class="step-member">
                    <ol>
                        <li>
                            <p class="step">STEP1.본인인증</p>
                        </li>
                        <li>
                            <p class="step">STEP2.약관동의</p>
                        </li>
                        <li>
                            <p class="step on">STEP3.정보입력</p>
                        </li>
                        <li>
                            <p class="step">STEP4.가입완료</p>
                        </li>
                    </ol>
                </div>
                <p class="page-info-txt">
                    <h3>*님 안녕하세요.</h3>
                    <font size=2px color=gray>회원정보를 입력해주세요</font>
                </p>
        
        
        <form method="post" action=C06MemberProc.jsp>  	
            <div class="table-wrap">
                <colgroup>
                    <col style="width:130px;">
                    <col>
                </colgroup>
                <table class="board-form">
                    <tbody>
                        <tr>
                            <th class="c1">생년월일</th>
                            <td>
                            	<select id="year" onchange="javascript:lastday();"></select>
                            	<select id="month" onchange="javascript:lastday();"></select>
                            	<select id="day"></select>
                            </td>
                        </tr>
                        <tr>
                            <th class="c1">휴대폰 번호</th>
                            <td>
                            <input type="tel" size=5px name="ph1" placeholder="01*" pattern=[0-1]{3} class="input-text ph1" required> 
                            - 
                            <input type="tel" size=5px name="ph2" placeholder="****" pattern=[0-9]{3,4} class="input-text ph2" required> 
                            - 
                            <input type="tel" size=5px name="ph3" placeholder="****" pattern=[0-9]{4} class="input-text ph3" required></td>
                        </tr>
                        <tr>
                            <th class="c1">아이디</th>
                            <td><input type="text" id="id" name="userid" placeholder="영문, 숫자 조합(8~12자)" class="input-text" required>
                                <a href="#"><input type=button value=중복확인 class="button idoverlap"></a></td>
                        </tr>
                        <tr>
                            <th class="c1">비밀번호</th>
                            <td><input type="password" id="pwd" name="pwd" placeholder="영문, 숫자, 특수기호 중 2가지 이상 조합" class="input-text" required></td>
                        </tr>
                        <tr>
                            <th class="c1">비밀번호확인</th>
                            <td><input type="password" id="pwcheck" name="pwcheck" placeholder="영문, 숫자, 특수기호 중 2가지 이상 조합" class="input-text" required></td>
                        </tr>
                        <tr>
                            <th class="c1">이메일</th>
                            <td><input type="email" name=email placeholder="이메일주소를 입력해 주세요" class="input-text" required></td>
                        </tr>
                        <tr>
                            <th class="c1">무인발권기<br>기능 설정</th>
                            <td>
                            <input type="radio" id="ticketY" name="ticketSet">
                            <label for="ticketY">"사용"</label>
                            <input type="radio" id="ticketN" name="ticketSet" checked>
                            <label for="ticketN">"사용안함"</label><br>
                            <span>※ '생년월일 + 휴대폰번호로' 티켓 출력</span>
                            </td>
                        </tr>
                        <tr>
                            <th class="c1">나만의 메가박스</th>
                            <td>
                            <span>자주 방문하는 메가박스를 등록해 주세요!</span>
                            <a href="#"><input type="button" value="설정" class="button setmegabox"></a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        <div class="marketing-agree">
            <p class="phr">마케팅 활용을 위한 개인정보 수집 이용 안내(선택)</p>
            <div class="cont">
                <dl>
                    <dt>수집목적</dt>
                    <dd>고객맞춤형 상품 및 서비스 추천, 당사 신규 상품/서비스 안내 및 권유,<br>
                        사은/할인 행사 등 각종 이벤트 정보 등의 안내 및 권유</dd>
                    <dt>수집항목</dt>
                    <dd>이메일, 휴대폰번호, 주소, 생년월일, 선호영화관, 문자/이메일/앱푸쉬<br>
                        정보수신동의 여부, 서비스 이용기록, 포인트 적립 및 사용 정보, 접속 로그</dd>
                    <dt>보유기간</dt>
                    <dd>회원 탈퇴 시 혹은 이용 목적 달성 시 까지</dd>
                </dl>
                <div class="markag radagree">
                    <input type="radio" id="agree" name="agreeSet">
                    <label for="agreeY">동의</label>
                    <input type="radio" id="disagree" name="agreeSet" checked>
                    <label for="disagree">미동의</label>
                </div>
                <p class="samedt">혜택 수신설정</p>
                <div class="markag chebox">
                    <input type="checkbox" id="push">
                    <label for="push">알림</label>
                    <input type="checkbox" id="SMS">
                    <label for="SMS">SMS</label>
                    <input type="checkbox" id="email">
                    <label for="email">이메일</label>
                </div>
                <p class="samedd">
                    ※ 이벤트, 신규 서비스, 할인 혜택 등의 소식을 전해 드립니다.<br>
                    (소멸포인트 및 공지성 안내 또는 거래정보와 관련된 내용은<br> 수신 동의 여부와 상관없이 발송됩니다.)
                </p>
            </div>
        </div>
        <br>
        <div class="footer">
        <input type="submit" value="회원가입" class="button join">
        </div>
        
        </form>
        
        
        </div>
        </div>
		</div>
		
	</div>

<body> 
</body>
</html>








