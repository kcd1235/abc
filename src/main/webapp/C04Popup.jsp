<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
    box-sizing: border-box;
}
div {
    display: block;
}
body {
    overflow: auto;
    overflow-y: scroll;
    letter-spacing: 0;
    line-height: 1.5;
    font-size: 15px;
    color: #444;
    font-weight: 400;
    font-family: NanumBarunGothic,Dotum,'돋움',sans-serif;
}
.layer-header {
	overflow: hidden;
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 45px;
    background: #503396;
}
.btn-login-close{
	float:right;
	display: block;
    position: absolute;
    top: 13px;
    right: 20px;
    width: 20px;
    height: 20px;
    margin: 0;
    padding: 0;
    border: 0;
    backgroung-color:none;
    text-indent: -9999px;
    background: url(./img/close.png) no-repeat center;
    cursor:pointer;
}

.tit {
	color: #fff;
    font-size: 1.2em;
    line-height: 10px;
}

.layer-content {
	display:block;
	position:relative;
	background-color:none;
	top:50px;
	width: 480px;
	height: 400px;
}
.input-text {
    display: block;
    width: 100%;
    height: 32px;
    padding: 0 10px;
    line-height: 36px;
    color: #444;
    border: 1px solid #d8d9db;
    vertical-align: middle;
    font-family: NanumBarunGothic,Dotum,'돋움',sans-serif;
    box-sizing: border-box;
}
.pwd {
    margin-top: 15px!important;
}

.save-id{
	overflow: hidden;
    padding: 15px 0 35px 0;
}
#btnLogin {
	line-height: 36px;
	display: block;
    width: 100%;
    padding : 0 10px;
	background-color: #e0e0e0!important;
    border-color: #e0e0e0!important;
}
.link {
	padding: 20px 0 30px 0;
    text-align: center;
    line-height: 1.1;
}
.link a {
    display: inline-block;
    position: relative;
    vertical-align: middle;
    margin: 0 0 0 27px;
    padding: 0;
    font-size: .9333em;
    color: #666;
}

.login-input-area .link a:first-child:before {
    display: none;
}
.link a:before {
    content: '';
    display: block;
    position: absolute;
    left: -15px;
    top: 50%;
    width: 1px;
    height: 16px;
    margin-top: -8px;
    background-color: #d8d9db;
    pointer-events: none;
}
a:link{
	text-decoration: none;
}
.sns-login {
    text-align: center;
}
.login-input-area .sns-login a {
    overflow: hidden;
    display: inline-block;
    width: 40px;
    height: 40px;
    margin: 0 23px;
    font-size: 0;
    line-height: 0;
}
</style>
</head>
<body>
<div class="main-container">
	<div class="main-wrap">
		<header class="layer-header">
			<div class="header-wrap">
				<h3 class="tit">로그인</h3>
				<input type="button" value="창닫기" class="btn-login-close" onclick="window.close()">
			</div>
		</header>
	</div>
	<form method=post action="C05LoginProc.jsp">
	<div class="layer-content">
		<div class="login-input-area">
			<input type="text" name="userid" placeholder="아이디" title="아이디를 입력하세요" class="input-text id">
			<input type="password" name="userpwd" placeholder="비밀번호" title="비밀번호를 입력하세요" class="input-text pwd">
			
			<div class="save-id">
				<input id="chkIdSave" type="checkbox">아이디 저장
			</div>
			
			<button id="btnLogin" type="button">로그인</button>
			
			<div class="link">
				<a href="#" title="ID/PW 찾기 선택">ID/PW 찾기</a>
				<a href="#" title="회원가입 선택">회원가입</a>
				<a href="#" title="비회원 예매확인">비회원 예매확인</a>
			</div>
			
			<div class="sns-login">
				<a href="#" title="페이스북으로 로그인 선택">
					<img src="./img/ico-facebook.png" alt="페이스북">
				</a>
				<a href="#" title="네이버으로 로그인 선택">
					<img src="./img/ico-naver.png" alt="네이버">
				</a>
				<a href="#" title="카카오톡으로 로그인 선택">
					<img src="./img/ico-kakao.png" alt="카카오톡">
				</a>
				<a href="#" title="페이코으로 로그인 선택">
					<img src="./img/ico-payco.png" alt="페이코">
				</a>
			</div>
		</div>
	</div>
	</form>
</div>

</body>
</html>