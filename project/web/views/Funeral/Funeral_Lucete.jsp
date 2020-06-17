<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 루세떼(메모리얼 스톤) -->
<title>Funeral_Lucete</title>
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

/* 제목아래 underline*/
#underline {
	border-bottom: 15px solid white;
	width: 800px;
	height: 200px;
	float: left;
}

#title {
	font-size: 45px;
	margin-left: 180px;
}
/*내용*/
#content {
	height: 200px;
	font-size: 25px;
	margin-left: 100px;
	margin-top: 50px;
	text-align: left;
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

/* LUCETE 타이틀 설정 */
#luceteTitle {
	background-color: #242424;
	background: -webkit-linear-gradient(top, #3d3d3d, #242424);
	padding: 20px;
	margin: 0px;
	font-size: 25px;
	color: #d2c4b9;
}

/*스톤 background*/
#bg_Lucete {
	height: 590px;
	position: relative;
}

#bg_Lucete img {
	position: absolute;
	top: 0px;
	left: 0px;
}

#bg_Lucete * {
	font-family: 'Nanum Myeongjo', serif;
	color: white;
}

#bg_Lucete p {
	margin-top: 0px;
}

#bg_Lucete #content {
	line-height: 50px;
	position: absolute;
	top: 200px;
	z-index: 1;
}

#bg_Lucete #underline {
	position: relative;
	z-index: 100;
}

#bg_Lucete #title {
	padding-top: 100px;
	z-index: 100;
}

/*스톤 특징 background*/
#bg_Lucete_Characteristics {
	height: 890px;
	background-image: url("../../img/LUCETE/2.PNG");
	background-size: cover;
}

#bg_Lucete_Characteristics * {
	font-family: 'Nanum Myeongjo', serif;
	color: rgb(63, 62, 62);
}

#bg_Lucete_Characteristics #underline {
	margin-top: 110px;
	border-bottom: 15px solid rgb(63, 62, 62);
}

#bg_Lucete_Characteristics #content {
	line-height: 50px;
	z-index: 1;
	margin-top: 100px;
}

/*스톤 장점 background*/
#bg_Lucete_Advantage {
	height: 690px;
	background-image: url("../../img/LUCETE/4.png");
	background-size: cover;
}

#bg_Lucete_Advantage * {
	font-family: 'Nanum Myeongjo', serif;
	color: white;
}

#bg_Lucete_Advantage #underline {
	border-bottom: 15px solid white;
}

#bg_Lucete_Advantage #content {
	line-height: 50px;
	z-index: 1;
	margin-top: 100px;
}

/*스톤 필요성 backgroud*/
#bg_Lucete_Necessity {
	height: 650px;
	position: relative;
	background-image: url("../../img/LUCETE/3.PNG");
}

#bg_Lucete_Necessity * {
	font-family: 'Nanum Myeongjo', serif;
	color: white;
}

#bg_Lucete_Necessity #content {
	line-height: 50px;
	z-index: 100;
	margin-top: 100px;
}

#bg_Lucete_Necessity>img {
	position: absolute;
	top: 0px;
	left: 0px;
	width: 1900px;
	height: 690px;
	z-index: 0;
}

/* footer css */
/* 풋터 설정 */
footer {
	background-color: #242424;
	z-index: 1;
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
} /* 메뉴바 스타일 - 임의 디자인(한국에자이 참고) 추후 변경예정 */
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
					<li><a href="<%=request.getContextPath()%>/Funeral_Order.jsp">장례절차</a></li>
					<li><a href="<%=request.getContextPath()%>/Funeral_Goods.jsp">장례용품</a></li>
					<li><a href="<%=request.getContextPath()%>/Funeral_Price.jsp">장례비용</a></li>
					<li><a href="<%=request.getContextPath()%>/Funeral_Lucete.jsp">Lucete</a></li>
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
						<li><a href="#">장례절차</a></li>
						<li><a href="#">장례용품</a></li>
						<li><a href="#">장례비용</a></li>
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
		<div id="funeral_menu">
			<div id="funeral_menu_Inner">
				<div>
					<a href="Funeral_Price.html" target="_self">장례 비용</a>
				</div>
				<div>
					<a href="Funeral_Oder.html" target="_self">장례 절차</a>
				</div>
				<div>
					<a href="Funeral_Goods.html" target="_self">장례 용품</a>
				</div>
				<div>
					<a href="Funeral_Lucete.html" target="_self">LUCETE</a>
				</div>
			</div>
		</div>
		<div id="center">
			<h1 id="luceteTitle" style="text-align: center;">혜 윰 LUCETE</h1>

			<div id="bg_Lucete">
				<div>
					<div id="underline">
						<div>
							<p id="title" style="color: white;">혜 윰
								LUCETE&nbsp;-&nbsp;메모리얼 스톤</p>
						</div>
					</div>
				</div>
				<div id="content" style="color: white;">
					<p>
						<b>LUCETE</b><br> 밝게 빛나라 : spanish(Latin)<br>
						<br> 혜윰의 LUCETE는, 소중한 추억들이 가장 아름답게 간직 할 수 있는 방법입니다.<br>
						아이와의 추억이 영원할 수 있도록 혜윰에서 준비했습니다.<br> 가장 순수하게, 가장 가치있게, 영원히 함께
						빛 날 수 있습니다.
					</p>
				</div>
				<img src="../../img/장례용품 사진/배경/Lucete(스톤).PNG" width="1900px" height="690"
					alt="">
			</div>
			<div id="bg_Lucete_Characteristics">
				<div style="height: 300px;">
					<div id="underline">
						<div style="margin-top: 120px;">
							<p id="title" style="color: rgb(63, 62, 62);">혜 윰 LUCETE 특징</p>
						</div>
					</div>
				</div>
				<div id="content" style="color: white;">
					<p>
						1. 부패, 냄새 변형이 없는 유리화된 무기물입니다.<br> 2. 사리(참된 수행의 결과로 생겨나는 구슬모양의
						유골) 후 미관상 아름답습니다.<br> 3. 반지, 목걸이 등 악세사리에 부착이 가능한 준보석입니다.
					</p>
				</div>
			</div>
			<div id="bg_Lucete_Advantage">
				<div style="height: 200px;">
					<div id="underline">
						<div style="margin-top: 120px;">
							<p id="title">혜 윰 LUCETE 장점</p>
						</div>
					</div>
				</div>
				<div id="content" style="color: white;">
					<p>
						1. LUCETE로 소중한 우리아이의 기억을 떠올려 사별에 따른 비탄의 심리치유가 가능한 효과가 있습니다.<br>
						2. 납골당, 봉안당과 달리 직접 보관 하기 때문에 관리비용등을 줄일 수 있습니다.
					</p>
				</div>
			</div>
			<div id="bg_Lucete_Necessity">
				<!-- <img src="image/LUCETE/3.PNG" alt=""> -->
				<div style="height: 200px;">
					<div id="underline">
						<div style="margin-top: 120px;">
							<p id="title" style="color: white;">혜 윰 LUCETE 필요성</p>
						</div>
					</div>
				</div>
				<div id="content" style="color: white;">
					<p>
						1. 화장 후 납골당, 봉안당의 유골의 부패, 해충서식, 시멘트화 현상으로 보관이 어려울 수 있습니다.<br>
						2. 사회적 비용증가 및 화장 문화의 의미가 퇴색되었습니다.<br> 3. 애완동물주들에게 슬픔을 승화 시켜
						줍니다.
					</p>
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
</body>
</html>