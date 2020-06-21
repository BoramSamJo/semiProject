<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 장례 예약 -->
<title>Funeral_Oder</title>

<script src="http://code.jquery.com/jquery-latest.min.js">
	최신
</script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<style>
/* 전체설정 */
body {
	margin: 0px;
	padding: 0px;
	/* background: palevioletred; */
}

body * {
	font-family: 'Noto Sans KR', sans-serif;
	text-decoration: none;
}
/* href 링크 밑줄 및 색깔 수정*/
#a {
	text-decoration: none;
}

#funeralProcessArea {
	background-color: #d2c4b9;
}

/* 절차별 타이틀 설정 */
.processTitle {
	font-family: 'Nanum Myeongjo', serif;
	padding: 35px;
	font-weight: 500;
	border-bottom: 2px solid #242424;
}

/* 맨위 장례서비스 종류(장례 비용, 장례 절차, 장례 용품)*/
#funeral_menu {
	padding-top: 105px;
}

#funeral_menu_Inner {
	display: flex;
	text-align: center;
	width: 850px;
	margin: auto;
	/* background-color: aqua; */
}

#funeral_menu>div>div {
	margin: 10px 20px 10px 20px;
	border: none;
	padding: 15px 45px 15px 45px;
	border-radius: 10px;
	width: 100px;
	background-color: #b3a193;
	background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
}

#funeral_menu>div>div:hover {
	background: -webkit-linear-gradient(top, #3d3d3d, #242424);
}

#funeral_menu>div>div:hover a {
	color: #b3a193;
}

#funeral_menu div a {
	color: #242424;
	font-weight: 700;
	font-size: 20px;
}

/* 장례절차 타이틀 설정 */
#funeralProcessArea {
	background-color: #d2c4b9;
	padding-bottom: 50px;;
}

#funeralProcessTitle {
	background-color: #242424;
	background: -webkit-linear-gradient(top, #3d3d3d, #242424);
	padding: 20px;
	margin: 0px;
	font-size: 25px;
	color: #d2c4b9;
	text-align: center;
}

/* 메모리얼 스톤 장점 속성 */
#stone_Advantage {
	border-radius: 20px 20px 20px 20px;
	width: 800px;
	height: 300px;
	margin: auto;
	background: #b3a193;
}

/* table안에 들어갈 이미지 크기 -> 스크립트로 해주자*/
#funeralProcessSection img {
	width: 200px;
	height: 200px;
}

/* 메모레일스톤 특징 표 글자 속성 */
.why td {
	font-size: 18px;
	padding-left: 10px;
	color: #242424;
}

.why th {
	color: #242424;
	background: #d2c4b9;
}

/* 테이블 간격 줄이기 */
#funeralProcessTable {
	margin: auto;
	margin-top: 30px;
}

#funeralProcessTable img {
	border-radius: 2px;
}

#funeralProcessTable td, #funeralProcessTable tr {
	border: none;
}

#funeralProcessTable tr:nth-of-type(5) td:nth-of-type(2),
	#funeralProcessTable tr:nth-of-type(9) td:nth-of-type(2),
	#funeralProcessTable tr:nth-of-type(1) td:nth-of-type(2) {
	border-bottom: 2px solid black;
}

#funeralProcessTable tr:nth-of-type(3) td:nth-of-type(2),
	#funeralProcessTable tr:nth-of-type(7) td:nth-of-type(2) {
	border-bottom: 2px solid #b3a193;
}

#funeralProcessTable tr:nth-of-type(1) td:nth-of-type(1) {
	border-top-left-radius: 10px;
}

#funeralProcessTable tr:nth-of-type(1) td:nth-of-type(2) {
	border-top-right-radius: 10px;
}

#funeralProcessTable tr:nth-of-type(9) td:nth-of-type(1) {
	border-bottom-left-radius: 10px;
}

#funeralProcessTable tr:nth-of-type(10) td:nth-of-type(1) {
	border-bottom-right-radius: 10px;
}

#funeralProcessTable p {
	margin: 0px;
}

/* 테이블영역 각각 색상주기 */
#funeralProcessTable {
	color: #242424;
	border-spacing: inherit;
}

#funeralProcessTable tr:nth-of-type(1), #funeralProcessTable tr:nth-of-type(2)
	{
	background-color: #b3a193;
}

#tel {
	display: inline-block;
	background-color: #383737;
	color: #b3a193;
	width: 45px;
	text-align: center;
}

#funeralProcessTable tr:nth-of-type(3), #funeralProcessTable tr:nth-of-type(4)
	{
	background-color: #383737;
	color: #b3a193;
}

#funeralProcessTable tr:nth-of-type(5), #funeralProcessTable tr:nth-of-type(6)
	{
	background-color: #b3a193;
}

#funeralProcessTable tr:nth-of-type(7), #funeralProcessTable tr:nth-of-type(8)
	{
	background-color: #383737;
	color: #b3a193;
}

#funeralProcessTable tr:nth-of-type(9), #funeralProcessTable tr:nth-of-type(10)
	{
	background-color: #b3a193;
}

#funeralProcessTable tr {
	height: 100px;
	/* margin: 20px; */
}

#funeralProcessTable td, #funeralProcessTable td p, #funeralProcessTable th
	{
	padding: 20px;
	line-height: 30px;
}

#area1 {
	height: 150px;
	text-align: center;
	position: relative;
}

#area2 {
	border: 1px solid #242424;
	width: 150px;
	height: 150px;
	display: inline-block;
}

#area3 {
	height: 90px;
}

#area3 img {
	width: 80px;
	height: 80px;
	text-align: center;
}

#area4 {
	position: relative;
	width: 50px;
	height: 50px;
	border: 1px solid #242424;
	top: -110px;
	left: 125px;
	border-radius: 50px;
	vertical-align: middle;
}

/* 풋터 설정 */
footer {
	background-color: #242424;
}
/* 풋터 콘텐츠 설정 */
#footerTable {
	width: 1000px;
	margin-left: 30px;
	color: white;
}

#footerTable td {
	padding: 3px;
	padding-left: 50px;
	padding-right: 50px;
	font-size: 14px;
}

#footerTable th {
	text-align: left;
	padding-top: 10px;
	padding-bottom: 5px;
	padding-left: 50px;
	color: #b3a193;
}

/* 풋터 마지막 문구 설정 */
#footerP {
	color: #534b44;
	font-size: 14px;
	margin-top: 10px;
	margin-left: 30px;
	line-height: 30px;
	padding-left: 50px;
}

#footerTable a {
	text-decoration: none;
}

#animalProtectSys {
	background-color: #b3a193;
	color: #242424;
	padding: 1.5px 4px 2px 4px;
	font-size: 12px;
	font-family: 'Noto Sans KR', sans-serif;
}
/* 메뉴바 스타일 - 임의 디자인(한국에자이 참고) 추후 변경예정 */
/* 헤더 전체 설정 */
header {
	width: 100%;
	position: absolute;
	position: fixed;
	z-index: 99;
	background-color: #242424;
	border-bottom: 5px solid #b3a193;
}

header * {
	list-style: none;
}
/* 내부 설정 */
#navMenu {
	display: flex;
	/* margin: 0px;
            padding:0px; */
	margin-bottom: 0px;
	text-align: center;
	/* background-color: tomato; */
}

#navLogo {
	position: absolute;
	top: 23px;
	left: 20px;
}

#navMenu a {
	color: white;
}

#navMenu>li {
	position: relative;
	left: 25%;
	margin: 0px;
	padding: 17px 0px 17px 0px;
	font-size: 17px;
	width: 190px;
	/* background-color: darkorange; */
}

#navMenu>li>ul {
	position: absolute;
	left: -1px;
	margin: 0px;
	margin-top: 15px;
	padding: 0px;
	opacity: 0;
	transition: 0.5s;
	background-color: darkorchid;
}

#navMenu>li>ul>li {
	margin: 0px;
	padding: 0px;
	font-size: 16px;
	width: 190px;
	line-height: 0px;
	transition: 0.5s;
	background-color: #363636;
	border: 1px outset #463f39;
}

#navMenu>li>ul>li:nth-of-type(1) {
	border-top: 2px solid #b3a193;
}
/* 메뉴 호버 효과 */
#navMenu>li:hover>a {
	color: #b3a193;
}

#navMenu>li:hover>ul {
	opacity: 1;
}

#navMenu>li:hover>ul>li {
	padding: 20px 0px 20px 0px;
	line-height: 18px;
}

#navMenu>li:hover>ul>li:hover>a {
	color: #b3a193;
}

/* 반응형메뉴 설정 */
#reactMenu {
	position: absolute;
	display: none;
}

/* 작은 화면일 때의 설정 */
@media only screen and (max-width: 800px) {
	#serveLogo {
		top: 20px
	}
	#serveMenuBtn {
		position: relative;
		width: 60px;
		height: 4px;
		font-size: 55px;
		padding-bottom: 86px;
		padding-right: 35px;
		padding-left: 10px;
		background-color: #d2c4b9;
	}
	.show {
		display: block;
	}
	.hide {
		display: none;
	}
	/* 메인메뉴 없애기 */
	#navMenu {
		display: none;
	}
	#navSmallLink {
		display: none;
	}
	/* 반응형메뉴 설정 */
	#serveSmallLink {
		width: 100%;
		padding: 15px 0px 15px 0px;
		background-color: #b3a193;
		text-align: center;
		color: #242424;
	}
	#serveSmallLink a {
		margin-left: 10px;
		font-size: 20px;
		font-weight: bolder;
		padding: 1% 7% 1% 7%;
		background-color: #b3a193;
		/* color: #242424; */
	}
	#reactMenu {
		position: absolute;
		top: 0px;
		left: 0px;
		width: 100%;
		display: block;
		height: 90px;
		border-bottom: 5px solid #b3a193;
		background-color: #242424;
	}
	#serveMenu {
		margin: 0px;
		padding: 0px;
		background-color: white;
		display: none;
	}
	#serveMenu>li {
		color: #242424;
		font-size: 20px;
		/* background-color: blue; */
		padding: 5px;
		text-indent: 50px;
		margin-bottom: 25px;
		margin-top: 35px;
	}
	#serveMenu>li>a {
		color: #242424;
		font-weight: bolder;
		/* background-color: red; */
	}
	#serveMenu>li>ul {
		margin: 0px;
		padding: 0px;
		opacity: 0;
		transition: 0.5s;
		/* background-color: #242424; */
	}
	#serveMenu>li>ul>li {
		color: white;
		padding: 0px;
		line-height: 0px;
		height: 0px;
		transition: 0.5s;
		/* background-color: rgb(5, 53, 53); */
	}
	#serveMenu>li>ul>li:nth-of-type(1) {
		border-top: 2px solid gray;
		color: white;
		/* background-color: rgb(5, 53, 53); */
	}
	#serveMenu>li>ul>li>a {
		text-decoration: none;
		color: #242424;
		font-size: 18px;
		font-weight: 400;
	}
	#serveMenu hr {
		margin-bottom: 0px;
		width: 90%;
		border: none;
		border-bottom: 1px solid lightgray;
		margin: auto;
		margin-top: 10px;
		/* margin-bottom: 10px; */
	}
	.ulOpacity {
		opacity: 1;
	}
}

/* ------------------------로그인 css-------------------------- */
/* 전체 화면 설정 */
/* 로그인 모달팝업으로 가는 버튼 */
#navSmallLink {
	position: relative;
	top: 0px;
	right: 30px;
	text-align: right;
}

#navSmallLink a {
	padding: 3px;
	font-size: 13px;
	color: #b3a193;
}

#navSmallLink a:hover {
	text-decoration: underline;
}

/* 로그인 모달팝업 전체 설정 */
.modal {
	font-family: 'Noto Sans KR', sans-serif;
	display: none;
	position: fixed;
	position: absolute;
	top: 0px;
	left: 0px;
	z-index: 999999999;
	width: 100%; /* Full width */
	/* height: 1000px; */
	/* 화면의 크기만큼 높이가 맞춰지게 기능걸어야겠다 */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.5); /* Black w/ opacity */
	font-family: 'Noto Sans KR', sans-serif;
}

/* 로그인단 위치설정 위함 +  로그인레이어 전체 크기*/
#logIn {
	position: absolute;
	width: 380px;
	/* background-color: rgb(231, 139, 26); */
	margin: 0px;
	padding: 0px;
}
/* 로그인단 헤더 */
#logInHeader {
	background-color: #d2c4b9;
	background-color: #d0b7b5;
	background: -webkit-linear-gradient(top, #3b3b3b, #242424);
	padding: 10px 5px 15px 15px;
	margin: 0px;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
}

#logInHeader p {
	padding: 0px;
	margin: 0px;
	display: inline-block;
	color: #b3a193;
	/* color: #242424; */
	font-weight: bolder;
	font-size: 17px;;
}
/* 로그인 모달 팝업 Close 버튼 */
.close {
	height: 16px;
	color: #b3a193;
	/* color: #242424; */
	position: absolute;
	top: -2px;
	right: 10px;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	cursor: pointer;
}

/* 로그인단 섹션 */
.logInSection {
	background-color: #b3a193;
	background-color: #242424;
	background-color: white;
	/* background-color: white; */
	padding: 10px;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
}

/* 로그인단(테이블 형태) 설정 */
#loginT {
	vertical-align: middle;
	border-collapse: collapse;
	height: 410px;
	text-align: center;
	margin: auto;
	margin-top: 5px;
	margin-bottom: 5px;
	/* border: 1px solid rgb(230, 224, 224); */
}

#loginT td {
	margin: 0px;
	padding-top: 0px;
	padding-bottom: 0px;
}

#loginT tr {
	height: 25px;
}
/* #loginT tr:nth-of-type(1)>td{} */
#loginT tr:nth-of-type(4) {
	text-align: left;
}

#userIdLogIn {
	height: 37px;
}

#password {
	height: 37px;
}

/* 로그인 버튼 설정 */
#logBtn {
	box-sizing: content-box;
	width: 280px;
	height: 27px;
	background: lightgray;
	border: none;
	border-radius: 2px;
	color: rgb(97, 96, 96);
	font-weight: bolder;
	font-size: 13px;
}

/* 로그인상태 유지 체크박스 */
#maintenanceLogInLabel {
	font-size: 12px;
}

/* input태그 설정(버튼, 체크박스 제외) */
.modal input:not ([id='submit'] ):not ([type='checkbox'] ){
	width: 290px;
	height: 20px;
	border-radius: 2px;
	border: 1px solid rgb(172, 171, 171);
	padding: 5px;
}

/* 수평선 설정 */
/* hr{
                border: none;
                border-top: 1px solid rgb(61,67,83);
            } */

/* 링크(a) 설정 */
#smallInform>a {
	font-size: 10px;
	color: rgb(73, 73, 73);
	text-decoration: none;
}

/* 체크박스 이미지넣고 설정 */
input[type=checkbox]:not ([name='test'] ):not (#testAll ) {
	display: none;
}

input[type=checkbox]+label {
	display: inline-block;
	cursor: pointer;
	line-height: 22px;
	padding-left: 25px;
	background: url('../img/notCheck1.png') left/25px no-repeat;
}
/* ------------------------로그인 css 끝-------------------------- */
</style>
<!-- 나눔명조 폰트 가져오기 -->
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700;800&display=swap"
	rel="stylesheet">
<!-- 노토산스kr 폰트 가져오기 -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
</head>

<body>
	<!-- <헤더(상단 메뉴바) 시작> -->
	<!--헤더 시작-->
	<header id='nav'>
		<!-- 0. 모달 로그인 팝업 -->
		<div id="navSmallLink">
			<a id="moveToLogIn" class="TextmoveTo">로그인</a> <a class="TextmoveTo">회원가입</a>
			<a class="TextmoveTo">오시는길</a>
		</div>
		<div class="modal" id="myModal">
			<!-- 1) 로그인단 + 우측 이미지 -->
			<div id="logIn" class="">
				<div id="logInHeader">
					<p>로그인</p>
					<span class="close">&times;</span>
				</div>
				<div class="logInSection">
					<form action="">
						<table id="loginT">
							<tr>
								<td><img src="../../LOGO/LOGO3.png" width="300" height="100"
									alt=""></td>
							</tr>
							<tr>
								<td><input type="text" name="userIdLogIn" id="userIdLogIn"
									placeholder="아이디" required></td>
								<!-- <td rowspan="7"> 
                                    <span id="advertisement">
                                        &nbsp;&nbsp;&nbsp;&nbsp;<img src="img/심리센터8.png" width="240px" height="270px" alt="">
                                    </span>
                                </td> -->
							</tr>
							<tr>
								<td><input type="password" name="password" id="password"
									placeholder="비밀번호" required></td>
							</tr>
							<tr>
								<td><input src="../../checkboxImage/비활성화상태체크박스.png"
									type="checkbox" name="maintenanceLogIn" id="maintenanceLogIn"
									value="Yes"> <label for="maintenanceLogIn"
									id="maintenanceLogInLabel">&nbsp;로그인 상태 유지 or 아이디 저장 중
										뭐할까</label></td>
							</tr>
							<tr>
								<td><input type="button" value="로그인" id="logBtn" disabled>
								</td>
							</tr>
							<!-- 2) 아이디 찾기, 비번 찾기, 회원가입 링크 -->
							<tr>
								<td>
									<div id="smallInform" align='center'>
										<a href="#" id="#">아이디 찾기 |</a> <a href="#" id="#"><b>비밀번호
												찾기</b></a><span style="font-size: 10px; font-weight: lighter;">
											|</span> <a href="semi_Join.html">회원가입</a>
									</div>
								</td>
							</tr>
							<!-- <tr>
                                <td >
                                    <img src="img/dog-1532627_640.png" width="300" height="100" alt="">
                                </td>
                            </tr> -->
						</table>
					</form>
				</div>
			</div>
		</div>
		<!--상단바-->
		<ul id='navMenu'>
			<img id="navLogo" src="../../LOGO/LOGO1.png" width="130" alt="로고이미지"
				id='bigwindow_logo'>
			<!-- <img src="img/logo1.png" alt="로고이미지" id = 'smallwindow_logo'> -->
			<li><a href="#" id='first' class="colorcss">장례서비스</a>
				<ul>
					<li><a href="#" onclick="location.href='funeral_Order.jsp'">장례절차</a></li>
					<li><a href="#" onclick="location.href='funeral_Goods.jsp'">장례용품</a></li>
					<li><a href="#" onclick="location.href='funeral_Price.jsp'">장례비용</a></li>
					<li><a href="#" onclick="location.href='funeral_Lecete.jsp'">Lucete</a></li>
					<li><a href="#" onclick="location.href='reservation.jsp'">장례예약</a></li>
				</ul></li>
			<li><a href="#" id='second' class="colorcss">보험서비스</a>
				<ul>
					<li><a href='#'>한국에자이 제품</a></li>
					<li><a href='#'>치매증상 치료제</a></li>
					<li><a href='#'>뇌전증 치료제</a></li>
					<li><a href='#'>다발성 경화증 치료제</a></li>
				</ul></li>
			<li><a href="#" id='third' class="colorcss">혜윰스케치북</a></li>
			<li><a href="#" id='forth' class="colorcss">고객센터</a>
				<ul>
					<li><a href='#'>공지사항</a></li>
					<li><a href='#'>FAQ</a></li>
					<li><a href='#'>QnA</a></li>
				</ul></li>
			<li><a href="#" id='fifth' class="colorcss">For Member</a></li>
		</ul>


		<!-- 반응형 메뉴 -->
		<div id='reactMenu'>
			<img id="serveLogo" src="../../LOGO/LOGO1.png" width="120" alt="로고이미지"
				id='bigwindow_logo'>
			<div id="serveMenuBtn">
				<img src="../../img/noun_List_25956.png" width="90" height="90">
			</div>
			<ul id="serveMenu">
				<div id="serveSmallLink">
					<a id="moveToLogIn2" class="TextmoveTo">로그인</a> <a
						class="TextmoveTo">회원가입</a> <a class="TextmoveTo">오시는길</a>
				</div>

				<li id="serve1"><a href="#">장례서비스 </a>
					<hr>
					<ul>
					<li><a href="#" onclick="location.href='funeral_Order.jsp'">장례절차</a></li>
					<li><a href="#" onclick="location.href='funeral_Goods.jsp'">장례용품</a></li>
					<li><a href="#" onclick="location.href='funeral_Price.jsp'">장례비용</a></li>
					<li><a href="#" onclick="location.href='funeral_Lucete.jsp'">Lucete</a></li>
					<li><a href="#" onclick="location.href='reservation.jsp'">장례예약</a></li>
					</ul></li>

				<li id="serve2"><a href="#">보험서비스</a>
					<hr>
					<ul>
						<li><a href='#'>한국에자이 제품</a></li>
						<li><a href='#'>치매증상 치료제</a></li>
						<li><a href='#'>뇌전증 치료제</a></li>
						<li><a href='#'>다발성 경화증 치료제</a></li>
					</ul></li>
				<li><a href="#"><a>혜윰스케치북</a>
						<hr></li>
				<li id="serve3"><a href="#">고객센터</a>
					<hr>
					<ul>
						<li><a href='#'>공지사항</a></li>
						<li><a href='#'>FAQ</a></li>
						<li><a href='#'>QnA</a></li>
					</ul></li>
				<li><a href="#">혜윰 Family</a>
					<hr></li>
			</ul>
		</div>
	</header>

	<section id="funeralProcessSection">
		<div style="margin: auto;">
			<div id="funeral_menu">
				<div id="funeral_menu_Inner">
					<div>
						<a href="#" onclick="location.href='funeral_Price.jsp'" target="_self">장례비용</a>
					</div>
					<div>
						<a href="#" onclick="location.href='funeral_Order.jsp'" target="_self">장례절차</a>
					</div>
					<div>
						<a href="#" onclick="location.href='funeral_Goods.jsp'" target="_self">장례용품</a>
					</div>
					<div>
						<a href="#" onclick="location.href='funeral_Lucete.jsp'" target="_self">LECETE</a>
					</div>
					<div>
						<a href="#" onclick="location.href='reservation.jsp'" target="_self">장례예약</a>
					</div>
				</div>
			</div>

			<div id="funeral_service">
				<br> <br>
				<div id="funeralProcessArea">
					<h1 id="funeralProcessTitle">장례 절차</h1>
					<div>
						<table id="funeralProcessTable">
							<!-- 1. 콜센터 및 상담 -->
							<tr>
								<td rowspan="2"><img src="../../img/콜센터.jpg"></td>
								<td style="font-size: 30px;" class="processTitle">1. 콜센터 및
									상담</td>
							</tr>
							<tr>
								<td id="content">
									<p>
										반려동물이 무지개 다리를 건너면 우선 깨끗한 타월에 감싸 줍니다.<br> 다만 너무 뜨거운(온돌및
										직사광선)장소에 있지말고 서늘한 곳에 한치해 주시는 것이 좋습니다.<br> 반려동물 떠나 보낼 마음의
										준비가 되어있다면<br> 반려동물 장례식장 혜윰에 연락주시면 장례 일정을 잡아드립니다.
									</p>
									<p>
										<span id="tel">TEL</span>&nbsp;&nbsp;&nbsp;&nbsp;010-4033-4458
									</p>
								</td>
							</tr>

							<!-- 2. 입관식/추모식 -->
							<tr>
								<td rowspan="2"><img src="../../img/장례절차 사진/추모실.PNG"></td>
								<td style="font-size: 30px;" class="processTitle">2. 입관/추모식</td>
							</tr>
							<tr>
								<td id="content">
									<p>
										화장터에 도착하시면 안내원에 따라 간단한 서류를 작성합니다.<br> 동물 등록이 되어 있으신 분들은
										화장 증명서를 발급 해드리니, 가까운 동사무소에서 등록을 말소 하셔야 합니다.<br> 서류를 작성하시면
										마지막으로 사랑했던 아이와의 마지막 인사를 하게 됩니다.<br> 독립된 추모 공간에서 사랑했던 지난
										날들을 떠올리며 마지막 인사를 하게 됩니다.<br>
									</p>
								</td>
							</tr>
							<!-- 3. 화장식 -->
							<tr>
								<td rowspan="2"><img src="../../img/화장터.jpg"></td>
								<td style="font-size: 30px;" class="processTitle">3. 화장식</td>
							</tr>
							<tr>
								<td id="content">
									<p>
										추모식을 마치면 반려동물 전용 화장로로 이동하여 화장을 진행하게 됩니다.<br> 화장하는 과정은 모두
										참관 가능하며 철저한 개별 화장으로 진행 되고 있습니다.<br> 화장은 5KG 기준으로 30~40분
										정도의 시간이 소요됩니다.<br>
									</p>
								</td>
							</tr>
							<!-- 4. 유골 수습 -->
							<tr>
								<td rowspan="2"><img src="../../img/유골함.jpg"></td>
								<td style="font-size: 30px;" class="processTitle">4. 유골 수습</td>
							</tr>
							<tr>
								<td id="content">
									<p>
										화장을 마치고 유골은 수습하여 곱게 분골하여 친환경 유골함에 담아 전달해 드리고 있습니다.<br>
										납골당에 안치를 선택하신 고객님은 납골당에 안치하게 되며,<br> 친환경 유골함이기 때문에 땅에 묻어도
										썩지 않기 때문에 오랜 보관이 가능합니다.<br> 봉안당에 안치를 선택하신 고객님께서는 유골함과 함께
										보관되며,<br> 메모리얼 스톤을 선택하신 보호자님은 바로 제작에 들어 가게 됩니다.
									</p>
								</td>
							</tr>
							<!-- 5. 친환경 유골함 및 메모리얼 스톤 -->
							<tr>
								<td rowspan="2"><img src="../../img/메모리얼스톤.jpg"></td>
								<td style="font-size: 30px;" class="processTitle">선택 사항</td>
							</tr>
							<tr>
								<td id="content">
									<p>
										<b> - 봉안당</b><br> 혜윰은 24시간 유골에 손상이 가지않는 최적 온도로 365일 24시간
										유지되고 있어<br> 우리 사랑하는 아이를 보고 싶을 때 언제든 방문 하셔도 됩니다.<br>
										<b> - 메모리얼 스톤</b><br> 100%유골로 만들어 반려동물의 결정체이며 제작 소요 시간은
										1시간입니다.<br>
									</p>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- footer 시작-->
	<footer>
		<table id="footerTable">
			<tr>
				<th colspan="2">CUSTOMER CENTER</th>
				<th colspan="2">HYEYUMM</th>
			</tr>
			<tr>
				<td>24시 장례예약</td>
				<td>1577-0996</td>
				<td>동물장묘업 등록번호</td>
				<td><a id="animalProtectSys"
					href="https://www.animal.go.kr/front/awtis/shop/undertaker1List.do?bizKnCd=&boardId=shop&pageSize=0&longitude=&latitude=&menuNo=6000000131&searchUprCd=&searchOrgCd=&searchCoNm=%ED%8E%AB%ED%8F%AC%EB%A0%88%EC%8A%A4%ED%8A%B8">
						동물보호시스템 </a></td>
			</tr>
			<tr>
				<td>기타문의</td>
				<td>09시부터 18시까지</td>
				<td colspan="2">제 5540000-038-2016-0001호</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>potter3786@naver.com</td>
				<td>사업자 등록번호</td>
				<td>255-81-00588</td>
			</tr>
			<tr>
				<td>운영시간</td>
				<td>09시부터 20시</td>
				<td>통신판매업 신고번호</td>
				<td>제 2017-경기광주-0168호</td>
			</tr>
			<tr>
				<td><a href="" style="color: white;">오시는길</a></td>
				<td><a href="" style="color: white;">사이트맵</a></td>
				<td><a href="" style="color: white;">개인정보 처리방침</a></td>
				<td><a href="" style="color: white;">이용약관</a></td>
			</tr>
		</table>
		<p id="footerP" style="margin: 0;">
			해윰 | 사업자등록번호 : 0123456789호 | 동물장묘업 등록번호 | 대표자 : 배혜린 <br>
			Copyright © 2020-2020 hyeyum Institute All Right Reserved
		</p>
	</footer>

	<script>
		// $('#funeralProcessSection img').parent('td').width().css('height','300px');
		// $('#funeralProcessSection img').css('width', $('#funeralProcessSection img').parent('td').width()).css('height',$('#funeralProcessSection img').parent('td').height());
		// $('#funeralProcessSection img').css('width', $('#funeralProcessSection img').parent('td').width()).css('height','300px');
	</script>
</body>

</html>