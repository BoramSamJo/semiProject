<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 장례 가격 -->
<title>funeral_Price</title>

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

#funeralPriceFirstText {
	color: #b3a193;
	padding: 30px;
	font-size: 30px;
	background-color: rgb(65, 64, 64);
	background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
	font-weight: 500;
}

/* 장례가격 타이틀 설정 */
.funeralPriceTitle {
	/* background-color: #242424;
            background: -webkit-linear-gradient(top, #3d3d3d, #242424);
            padding: 20px;
            margin: 0px;
            font-size: 25px;
            color: #d2c4b9;
            text-align: center; */
	margin-top: 50px;
}

#funeral_service {
	text-align: center;
}

/* 테이블 상단  */
#thead {
	background: -webkit-linear-gradient(top, #3d3d3d, #242424);
	text-align: center;
	color: #b3a193;
	font-weight: 500;
}

/* 테이블 가운데로 고정 */
#table {
	margin: auto;
	margin-bottom: 40px;
}

/* 테이블 안에 글자 속성 */
#thead {
	font-size: 30px;
}

#tbody {
	font-size: 20px;
	color: #242424
}

/* 참고사항 */
#notes {
	width: 800px;
	margin: auto;
	text-align: left;
	font-size: 13px;
	color: #242424;
	font-weight: 500;
	width: 610px;
	line-height: 26px;
	margin-bottom: 70px;
	text-align: center;
	/* background-color: #b3a193; */
}

#table {
	width: 1100px;
	border: 1px solid #242424;
	/* 테이블간격없애기 */
	border-collapse: collapse;
}

#table #tbody td:nth-of-type(1) {
	background: -webkit-linear-gradient(top, #d3bdae, #b3a193);
	font-weight: 500;
}

.choiceProduct #tbody tr:nth-of-type(1) td:nth-of-type(2) {
	background: -webkit-linear-gradient(top, #d3bdae, #b3a193);
	font-weight: 500;
}

#table tr, #table td, #table th {
	border: 1px solid #242424;
	padding: 10px;
	font-size: 20px;
	text-align: center;
}

[id^=imgview] {
	width: auto;
	float: right;
	border: none;
	background-color: #242424;
	color: #b3a193;
	border-radius: 3px;
	padding: 5px;
}
/*이미지 크기*/
.img img {
	width: 400px;
	height: 340px;
	border-top: 1px solid #242424;
}
/*이미지를 보여줄 div*/
.img {
	position: relative;
	position: absolute;
	top: 580px;
	left: 200px;
	margin-left: 30%;
	display: none;
	width: 400px;
	height: 400px;
	background: #242424;
	color: #b3a193;
	border: 1px solid #242424;
	border-radius: 5px;
	background-size: cover;
	font-weight: 500;
}

#img4 {
	width: 800px;
}

#img4 img {
	width: 800px;
}
/*이미지 제목*/
#img_title {
	position: absolute;
	top: 12px;
	left: 0px;
	text-align: center;
	margin-left: 50px;
	font-size: 25px;
	/* background-color: blue; */
}
/*이미지 닫기(x) 크기*/
#close {
	float: right;
	margin-right: 20px;
	font-size: 40px;
	/* background-color: aliceblue; */
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
	background: url('img/notCheck1.png') left/25px no-repeat;
}
/* ------------------------로그인 css 끝-------------------------- */
</style>
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
					<li><a href="#" onclick="location.href='funeral_Lucete.jsp'">Lucete</a></li>
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

	<!-- section 시작 -->

	<section>
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
						<a href="#" onclick="location.href='funeral_Lecete.jsp'" target="_self">LECETE</a>
					</div>
					<div>
						<a href="#" onclick="location.href='reservation.jsp'" target="_self">장례예약</a>
					</div>
				</div>
			</div>
			<div id="center" style="position: relative;">
				<div style="text-align: center;">
					<p id="funeralPriceFirstText" style="font-size: 30px;">
						모든 장례는 철저히 개별 화장으로 진행되며<br> 100% 참관하실 수 있습니다
					</p>
				</div>
				<!--자세히보기 클릭시 보여줄 이미지들-->
				<div id="img1-1" class="img">
					<label id="img_title">일반 수의</label> <label id="close">X</label> <img
						src="../../img/장례용품 사진/수의1.png">
				</div>
				<div id="img1-2" class="img">
					<label id="img_title">고급 수의</label> <label id="close">X</label> <img
						src="../../img/장례용품 사진/수의2.png">
				</div>
				<div id="img2" class="img">
					<label id="img_title">관</label> <label id="close">X</label> <img
						src="../../img/장례용품 사진/오동나무관2.png">
				</div>
				<div id="img3" class="img">
					<label id="img_title">산골장</label> <label id="close">X</label> <img
						src="../../img/장례비용 사진/산골장.PNG">
				</div>
				<div id="img4" class="img">
					<label id="img_title">봉안당</label> <label id="close">X</label> <img
						src="../../img/장례비용 사진/봉안당.PNG">
				</div>
				<div id="img5" class="img">
					<label id="img_title">LUCETE(메모리얼 스톤)</label> <label id="close">X</label>
					<img src="../../img/메모리얼스톤2.jpg">
				</div>
				<div id="funeral_service">
					<!-- 장례 서비스 -->
					<h1 class="funeralPriceTitle">장례 패키지</h1>
					<table id="table">
						<thead id="thead">
							<tr>
								<td>혜움 장례 형식</td>
								<td>혜윰 장례 절차</td>
								<td>혜윰 장례 가격</td>
							</tr>
						</thead>
						<tbody id="tbody">
							<tr>
								<td>기본형</td>
								<td>화장 + 염습(수의X) + 유골함</td>
								<td>? 원</td>
							</tr>
							<tr>
								<td>일반형</td>
								<td>화정 + 염습(수의x) + 기능성유골함</td>
								<td>300,000원</td>
							</tr>
							<tr>
								<td>고급형</td>
								<td>화장 + 염습(삼베수의) + 화장관(오동나무관) + 기능성유골함</td>
								<td>600,000원</td>
							</tr>
							<tr>
								<td>VIP형</td>
								<td>화장 + 염습(삼베고급수의) + 화장관(오동나무관) + 납골당/수목장/메모리얼스톤 중 택1</td>
								<td>1,200,000원</td>
							</tr>
						</tbody>
					</table>

					<!-- 장례용품 선택형 -->
					<h1 class="funeralPriceTitle">선택형 장례상품</h1>
					<table id="table" class="choiceProduct">
						<thead id="thead">
							<tr>
								<td colspan="2">구분</td>
								<td>가격</td>
							</tr>
						</thead>
						<tbody id="tbody">
							<tr>
								<!-- <td style="border-right: none;">염습(일반수의 <button id="imgview1-1">자세히보기</button>
                                        /고급삼베수의)</td>
                                    <th style="border-left: none;"><button id="imgview1">자세히보기</button></th> -->
								<td>일반수의
									<button id="imgview1-1"
										style="margin-left: 15px; margin-bottom: 5px;">예시</button>
								</td>
								<td>고급수의
									<button id="imgview1-2"
										style="margin-left: 20px; margin-bottom: 5px;">예시</button>
								</td>
								<td>70,000원/80,000원</td>
							</tr>
							<tr>
								<!-- <td style="border-right: none;">오동나무관</td>
                                    <th style="border-left: none;"><button id="imgview2" style="margin-left: 30px;">자세히보기</button></th> -->
								<td colspan="2">오동나무관
									<button id="imgview2" style="margin-left: 30px;">예시</button>
								</td>
								<td>70,000원</td>
							</tr>
							<tr>
								<!-- <td style="border-right: none;">수목장(1년/2년)</td>
                                    <th style="border-left: none;"><button id="imgview3" >자세히보기</button></th> -->
								<td colspan="2">수목장(1년/2년)
									<button id="imgview3" style="margin-left: 30px;">예시</button>
								</td>
								<td>350,000원/550,000원(계약후 연장시 1년 150,000원)</td>
							</tr>
							<tr>
								<!-- <td style="border-right: none;">봉안당(1년)</td>
                                    <th style="border-left: none;"><button id="imgview4">자세히보기</button></th> -->
								<td colspan="2">봉안당(1년)
									<button id="imgview4" style="margin-left: 30px;">예시</button>
								</td>
								<td>위치에따라 가격 변동(1층~4층 : 100,000원~400,000원)</td>
							</tr>
							<tr>
								<!-- <td style="border-right: none;">메모리얼 스톤</td>
                                    <th style="border-left: none;"><button id="imgview5">자세히보기</button></th> -->
								<td colspan="2">LUCETE(메모리얼스톤)
									<button id="imgview5" style="margin-left: 30px;">예시</button>
								</td>
								<td>200,000원</td>
							</tr>
						</tbody>
					</table>
				</div>

				<!-- 참고사항 -->
				<div id="notes">
					<p>
						※ 5KG 기준이며, 5KG 초과 시 KG당 만원이 추가됩니다. (일반형은 10KG까지 고급형 VIP형은 20KG까지
						기준) <br> ※ 25KG 이하만 가능합니다. (25KG 이상은 현재 추가 화장로 개설 중이므로 설치 후
						서비스 가능합니다.)
					</p>
				</div>
			</div>
		</div>
	</section>
	<script>
		// 일반 수의 보여주기 및 숨기기
		$(function() {
			$("#imgview1-1").click(function() {
				$("#img1-1").show();
				$('#img1-2 ,#img2, #img3, #img4, #img5').hide(); // 고급수의사진을 보고 있을때 일반수의사진 자세히보기 버튼을 클릭시 일반 수의 그림외는 다 숨긴다. 
			});
			$("#img1-1").click(function() {
				$("#img1-1").hide();
			});
		});
		$(function() {
			$('#close').click(function() {
				$('#img1-1').hide();
			});
		});
		// 고급 수의 보여주기 및 숨기기
		$(function() {
			$("#imgview1-2").click(function() {
				$("#img1-2").show();
				$('#img1-1 ,#img2, #img3, #img4, #img5').hide();
			});
			$("#img1-2").click(function() {
				$("#img1-2").hide();
			});
		});
		$(function() {
			$('#close').click(function() {
				$('#img1-2').hide();
			});
		});
		// 오동나무관 보여주기 및 숨기기
		$(function() {
			$("#imgview2").click(function() {
				$("#img2").show();
				$('#img1-1 ,#img1-2, #img3, #img4, #img5').hide();
			});
			$("#img2").click(function() {
				$("#img2").hide();
			});
		});
		$(function() {
			$('#close').click(function() {
				$('#img2').hide();
			});
		});
		// 산골당 보여주기 및 숨기기
		$(function() {
			$("#imgview3").click(function() {
				$("#img3").show();
				$('#img1-1 ,#img1-2, #img2, #img4, #img5').hide();
			});
			$("#img3").click(function() {
				$("#img3").hide();
			});
		});
		$(function() {
			$('#close').click(function() {
				$('#img3').hide();
			});
		});
		// 봉안당 보여주기 및 숨기기
		$(function() {
			$("#imgview4").click(function() {
				$("#img4").show();
				$('#img1-1 ,#img1-2, #img2, #img3, #img5').hide();
			});
			$("#img4").click(function() {
				$("#img4").hide();
			});
		});
		$(function() {
			$('#close').click(function() {
				$('#img4').hide();
			});
		});
		// LUCETE 보여주기 및 숨기기
		$(function() {
			$("#imgview5").click(function() {
				$("#img5").show();
				$('#img1-1 ,#img1-2, #img2, #img3, #img4').hide();
			});
			$("#img5").click(function() {
				$("#img5").hide();
			});
		});
		$(function() {
			$('#close').click(function() {
				$('#img5').hide();
			});
		});
	</script>

	<!-- section 끝 -->

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
</body>

</html>