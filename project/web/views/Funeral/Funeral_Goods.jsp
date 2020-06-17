<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 장례 상품  -->
<title>Funeral_Goods</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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

/* 기본 화면 크기 */
#center {
	border-style: none;
	margin: auto;
	text-align: center;
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

/* 장례용품 타이틀 설정 */
#goodsTitle {
	background-color: #242424;
	background: -webkit-linear-gradient(top, #3d3d3d, #242424);
	padding: 20px;
	margin: 0px;
	font-size: 25px;
	color: #d2c4b9;
}

/* 한페이지 크기 */
#bg_Main {
	height: 560px;
	background-image: url("../../img/장례용품 사진/배경/main.PNG");
	background-size: cover;
}

#bg_Main>p:nth-child(1) {
	margin: 0px;
	color: #b3a193;
	font-size: 40px;
	padding-top: 160px;
}

#bg_Main>div {
	display: flex;
	width: 800px;
	margin: auto;
	margin-top: 40px;
	/* background-color: blue; */
}

#bg_Main>div>div {
	background-color: #b3a193;
	background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
	width: 100px;
	height: 43px;
	margin: auto;
	padding: 17px 0px 0px 0px;
	border-radius: 10px;
}

#bg_Main>div>div>a {
	color: #242424;
	font-size: 18px;
	font-weight: 600;
}

/*수의, 관, 유골함, LUCETE, 액자 div에 대한 한화면의 크기*/
#bg_Collection {
	height: 690px;
	text-align: center;
	font-size: 50px;
	position: relative;
	background-color: white;
}

#bg_Collection * {
	font-family: 'Nanum Myeongjo', serif;
}

#bg_Collection #content {
	line-height: 50px;
	position: absolute;
	top: 180px;
	z-index: 1;
}

#bg_Collection #title {
	padding-top: 70px;
}

#bg_Collection img {
	position: absolute;
	top: 420px;
	right: 80px;
}

/*수의 background*/
#bg_Shroud {
	height: 690px;
	position: relative;
	background-image: url("../../img/장례용품 사진/배경/Shroud(수의).PNG");
	background-size: cover;
}

#bg_Shroud * {
	font-family: 'Nanum Myeongjo', serif;
}

#bg_Shroud p {
	margin-top: 0px;
}

#bg_Shroud #content {
	line-height: 50px;
	position: absolute;
	top: 200px;
	z-index: 1;
}

#bg_Shroud #title {
	padding-top: 100px;
}

#shroud1 {
	position: absolute;
	top: 350px;
	right: 450px;
}

#shroud2 {
	position: absolute;
	top: 350px;
	right: 80px;
}

[id^=shroud]>p {
	margin: 0px;
	font-weight: 800;
	font-size: large;
	padding-top: 10px;
}

/*관 background*/
#bg_Coffin {
	height: 690px;
	position: relative;
	background-image: url("../../img/장례용품 사진/배경/coffin(관).PNG");
	background-size: cover;
}

#bg_Coffin * {
	font-family: 'Nanum Myeongjo', serif;
}

#bg_Coffin p {
	margin-top: 0px;
}

#bg_Coffin #content {
	line-height: 50px;
	position: absolute;
	top: 200px;
	z-index: 1;
}

#bg_Coffin #title {
	padding-top: 100px;
}

#coffin1 {
	position: absolute;
	top: 360px;
	right: 450px;
}

#coffin2 {
	position: absolute;
	top: 360px;
	right: 80px;
}

[id^=coffin]>p {
	margin: 0px;
	font-weight: 800;
	font-size: large;
	padding-top: 10px;
}

/*유골함 background*/
#bg_Eco_Friendly {
	height: 690px;
	background-image: url("../../img/장례용품 사진/배경/Eco-Friendly(유골함).PNG");
	background-size: cover;
	position: relative;
}

#bg_Eco_Friendly * {
	font-family: 'Nanum Myeongjo', serif;
	color: #b3a193;
}

#bg_Eco_Friendly #underline {
	border-bottom: 15px solid #b3a193;
}

#bg_Eco_Friendly p {
	margin-top: 0px;
}

#bg_Eco_Friendly #content {
	line-height: 50px;
	position: absolute;
	top: 200px;
	z-index: 1;
}

#bg_Eco_Friendly #title {
	padding-top: 100px;
}

#boneHouse1 {
	position: absolute;
	top: 360px;
	right: 450px;
}

#boneHouse2 {
	position: absolute;
	top: 360px;
	right: 80px;
}

[id^=boneHouse]>p {
	margin: 0px;
	font-weight: 800;
	font-size: large;
	padding-top: 10px;
}

/*스톤 background*/
#bg_Lucete {
	height: 690px;
	background-image: url("../../img/장례용품 사진/배경/Lucete(스톤).PNG");
	background-size: cover;
	position: relative;
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

#bg_Lucete #title {
	padding-top: 100px;
}

/*액자 background*/
#bg_Photo_Frame {
	height: 690px;
	background-image: url("../../img/장례용품 사진/배경/Photo Frame(액자).PNG");
	background-size: cover;
	position: relative;
}

#bg_Photo_Frame * {
	font-family: 'Nanum Myeongjo', serif;
}

#bg_Photo_Frame p {
	margin-top: 0px;
}

#bg_Photo_Frame #content {
	line-height: 50px;
	position: absolute;
	top: 200px;
	z-index: 1;
}

#bg_Photo_Frame #title {
	padding-top: 100px;
}

/* 제목아래 underline*/
#underline {
	border-bottom: 15px solid #242424;
	width: 800px;
	height: 200px;
	float: left;
}

/*제목*/
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

/*이미지 크기*/
#img {
	width: 300px;
	height: 300px;
}

/* footer css */
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
	background: url('../../img/notCheck1.png') left/25px no-repeat;
}

/* ------------------------로그인 css 끝-------------------------- */
</style>
<!-- 노토산스kr 폰트 가져오기 -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
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
				<%-- href="<%=request.getContextPath()%>/views/Funeral_Order.jsp" --%>
					<!-- <li><a onclick="location.href='Funeral_Order.jsp'">장례절차</a></li> -->
					
					<!-- 버튼이 제일 무난함? -->
					<!-- <li><button onclick="location.href='Funeral_Order.jsp'">장례절차</button></li> -->
					
					<!-- jsp에서는 href가 될때가 있고 안될때가 있다. why? -->
					<!-- <li><a href="Funeral_Order.jsp">장례절차</a></li>
					<li><a href="Funeral_Goods.jsp">장례용품</a></li>
					<li><a href="Funeral_Price.jsp">장례비용</a></li>
					<li><a href="Funeral_Lucete.jsp">Lucete</a></li> -->
									
					
					<!-- 404에러 -->
					<%-- <li><a href="<%=request.getContextPath()%>/views/Funeral_Order.jsp">장례절차</a></li>
					<li><a href="<%=request.getContextPath()%>/views/Funeral_Goods.jsp">장례용품</a></li>
					<li><a href="<%=request.getContextPath()%>/views/Funeral_Price.jsp">장례비용</a></li>
					<li><a href="<%=request.getContextPath()%>/views/Funeral_Lucete.jsp">Lucete</a></li> --%>
					
					
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
						<li><a href="#" onclick="goOrder();">장례절차</a></li>
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
	<section id="section">
		<div id="center">

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

			<h1 id="goodsTitle">장례 용품</h1>
			<div id="bg_Main">
				<p>사랑하는 반려동물을 위한 특별한 선물</p>
				<div id="menubar">
					<div>
						<a id="a" href="#bg_Shroud">수의 </a>
					</div>
					<div>
						<a id="a" href="#bg_Coffin">관 </a>
					</div>
					<div>
						<a id="a" href="#bg_Eco_Friendly">유골함 </a>
					</div>
					<div>
						<a id="a" href="#bg_Lucete">LUCETE </a>
					</div>
					<div>
						<a id="a" href="#bg_Photo_Frame">액자 </a>
					</div>
				</div>
			</div>
			<div id="bg_Collection">
				<div>
					<div id="underline">
						<div>
							<p id="title">혜 윰 COLLECTION</p>
						</div>
					</div>
				</div>
				<div id="content">
					<p>
						혜윰 제품들은 최고급 소재로 손수 제작되었습니다.<br> 혜윰은 당신을 기억한다는 의미로 아이들과의<br>
						소중한 추억을 잊지 않기 위해서 준비되었습니다.
					</p>
				</div>
				<div>
					<img src="../../img/장례용품 사진/collection.PNG">
				</div>
			</div>
			<div id="bg_Shroud">
				<div>
					<div id="underline">
						<div>
							<p id="title">혜 윰 SHROUD&nbsp;-&nbsp;수의</p>
						</div>
					</div>
				</div>
				<div id="content">
					<div>
						<p>
							혜움 수의는 명주,인견 소재로 제작되어 있습니다.<br> 제작 시 이음과 재단을 포함한 모든 과정이<br>
							손수 제작된 최고급 수의 입니다.
						</p>
					</div>
				</div>
				<div>
					<div id="shroud1">
						<!-- <img src="image/장례용품 사진/일반수의.jpg"> -->
						<img id="img" src="../../img/장례용품 사진/수의1.png">
						<p>일반 수의</p>
					</div>
					<div id="shroud2">
						<!-- <img src="image/장례용품 사진/고급형수의.jpg"> -->
						<img id="img" src="../../img/장례용품 사진/수의2.png">
						<p>고급 수의</p>
					</div>
				</div>
			</div>
			<div id="bg_Coffin">
				<div>
					<div id="underline">
						<div>
							<p id="title">혜 윰 COFFIN&nbsp;-&nbsp;관</p>
						</div>
					</div>
				</div>
				<div id="content">
					<p>
						혜윰관은 최고급 오동나무 소재로 제작 되었으며,<br> 혜윰 자체 디자인 및 목공장인의 수작업으로 제작된
						최고급 관입니다.<br> 오동나무관은 습기에 강하고 가벼우며<br> 세균의 침투를 막아주는 것이
						특징입니다.
					</p>
				</div>
				<div>
					<div id="coffin1">
						<img id="img" src="../../img/장례용품 사진/오동나무관1.png">
					</div>
					<div id="coffin2">
						<img id="img" src="../../img/장례용품 사진/오동나무관2.png">
					</div>
				</div>
			</div>
			<div id="bg_Eco_Friendly">
				<div>
					<div id="underline">
						<div>
							<p id="title">혜 윰&nbsp;친환경&nbsp;유골함</p>
						</div>
					</div>
				</div>
				<div id="content">
					<p>
						혜윰 친환경 유골함은 장소에 구애 받지 않고<br> 영구적으로 보관할 수 있습니다.<br> 또한,
						땅에 묻을 경우 흙속에서 공기,수분 등에 의해<br> 완전 분해될 수 있도록 한것이며,<br> 부패
						및 곰팡이 및 악취발생, 벌레 등<br> 문제가 생기는 것을 방지 할 수 있습니다.
					</p>
				</div>
				<div>
					<div id="boneHouse1">
						<!-- <img id="img" src="image/장례용품 사진/기본형 백자 유골함.PNG"> -->
						<!-- <img id="img" src="image/장례용품 사진/기본형_백자_유골함(여백(x).png"> -->
						<img id="img" src="../../img/장례용품 사진/유골함(봉안당).jpg">
					</div>
					<div id="boneHouse2">
						<!-- <img id="img" src="image/장례용품 사진/무지개 화이트 유골함.PNG"> -->
						<!-- <img id="img" src="image/장례용품 사진/무지개_화이트_유골함(여백x).png"> -->
						<img id="img" src="../../img/장례용품 사진/유골함(봉안당)1.jpg">
					</div>
				</div>
			</div>
			<div id="bg_Lucete">
				<div>
					<div id="underline" style="border-bottom: 10px solid white;">
						<div>
							<p id="title">혜 윰 LUCETE&nbsp;-&nbsp;메모리얼 스톤</p>
						</div>
					</div>
				</div>
				<div id="content">
					<p>
						<b>LUCETE</b><br> 밝게 빛나라 : spanish(Latin)<br>
						<br> 혜윰의 LUCETE는, 소중한 추억들이 가장 아름답게 간직 할 수 있는 방법입니다.<br>
						아이와의 추억이 영원할 수 있도록 혜윰에서 준비했습니다.<br> 가장 순수하게, 가장 가치있게, 영원히 함께
						빛 날 수 있습니다.
					</p>
				</div>
			</div>

			<div id="bg_Photo_Frame">
				<div>
					<div id="underline">
						<div>
							<p id="title">혜 윰 PHOTO FRAME&nbsp;-&nbsp;액자</p>
						</div>
					</div>
				</div>
				<div id="content">
					<p>
						예식 후 아이를 기억하기 위한 최고급 레드오크 소재로<br> 제작된 액자를 제작해 드립니다.
					</p>
				</div>
			</div>

			<!-- 참고 -->
			<!-- <a href="https://petforest.co.kr/page/forest-collection/forest-collection.php#section7">참고용</a> -->
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
        //hover시 header배경, hr 변화
        // $(function(){
        //     $("#first,#second,#third,#forth,#fifth,.list li ul,.list li ul li a").hover(function(){
        //         $("header").css({"background":"pink"});
        //         $("hr").css({"border":"none","width":"100%","border-top":"4px solid rebeccapurple"});
        //     },function(){
        //         $("header").css("background","palevioletred");
        //         $("hr").css({"border":"none", "width":"90%","border-top":"1.5px solid white"});
        //     })
        // })
        

        // $('#reactMenu').css('height', $('#serveMenu').height());
        
        
        //반응형(작은화면) MENU hover시 메뉴 나오도록
        $(document).ready(function(){
            var btn = $("#serveMenuBtn");
            var layer = $("#serveMenu");
            btn.click(function(){ //효과 click으로 할까 hover로 할까
                layer.slideToggle(
                    "slide",
                    function(){
                        if(layer.css('display')!='none'){
                            btn.css('font-weight', 'bolder').css('padding-right', '40px');
                            btn.children().prop('src', '../../img/noun_Close_52944.png').css({'width':'50', 'height':'50','padding-left':'20px', 'padding-top':'20px'});
                            //아코디언이 펴져서 스크롤 바 생기는걸로 박스가 가려지는걸 커버하기 위해 위치 조정
                            // $("#serveMenuBtn").css('right', -($('html').width()-$('#serveMenuBtn').width()-70));
                            // alert('asdf');
                        }else{
                            btn.css('font-weight', '500').css('padding-right', '40px');
                            btn.children().prop('src', '../../img/noun_List_25956.png').css({'width':'90', 'height':'90','padding-left':'0px', 'padding-top':'0px'});
                            // $("#serveMenuBtn").css('right', -($('html').width()-$('#serveMenuBtn').width()-60));
                        }
                        layer.addClass('show');
                        layer.addClass('hide')
                    },
                
            })
            btn.click(function(){
            
            });
       
        })
       

        // 서브메뉴 크기 지정
        $('#serveMenu').css('height', $('#section2').height());
        // 반응형메뉴의 서브메뉴 각 항목 나타내고 다른항목 없애기
        $('#serveMenu>li').each(function (index, element) {
            // element == this
            $(this).click(function(){
                var otherStyle = {'padding':'0px', 'line-height':'0px', 'height':'0px'}
                $(this).children('ul').css('opacity', 1);
                $(this).find('li').css({'color':'white', 'padding':'10px', 'line-height':'18px', 'height':'50px'});
                $(this).siblings().find('li').css(otherStyle);
                $(this).siblings().children('ul').css('opacity', 0);
            })
            
        });
       
        
        // 서브메뉴 버튼 위치 조정
        // alert($('html').width()-$('#serveMenuBtn').width()-10);
        $("#serveMenuBtn").css('right', -($('html').width()-$('#serveMenuBtn').width()-46));
        $(window).resize(function(){
            $("#serveMenuBtn").css('right', -($('html').width()-$('#serveMenuBtn').width()-46));
        })
        //서브로고 위치 조정
        $('#serveLogo').css('position', 'absolute').css('left', $('html').width()/2 - $('#servelogo').width()/2-65);
        $(window).resize(function(){
            $('#serveLogo').css('position', 'absolute').css('left', $('html').width()/2 - $('#servelogo').width()/2-65);
        })
    </script>

	<!-- 4. 로그인 모달창 동적제어 -->
	<script>
        // 로그인단 중앙으로 위치지정 - 나중에 네비바 추가되면 그거 고려해서 다시 좌표설정
        $(window).scroll(function () {
            var heightLogIn1 = $(document).scrollTop()+$('body>header').height()+50;
            var heightLogIn2 = $(document).scrollTop()+$('#reactMenu').height()+80;
            var widthLogIn = $('html').innerWidth()/2 - $('#logIn').width()/2;
            
            if($('#reactMenu').css('display')=='none'){
                $('#logIn').css({'top':heightLogIn1, 'left':widthLogIn});
            }else{
                $('#logIn').css({'top':heightLogIn2, 'left':widthLogIn});
            }
        }); 
        $(window).resize(function () { 
                
            var heightLogIn1 = $(document).scrollTop()+$('body>header').height()+50;
            var heightLogIn2 = $(document).scrollTop()+$('#reactMenu').height()+80;
            var widthLogIn = $('html').innerWidth()/2 - $('#logIn').width()/2;
            
            if($('#reactMenu').css('display')=='none'){
                $('#logIn').css({'top':heightLogIn1, 'left':widthLogIn});
            }else{
                $('#logIn').css({'top':heightLogIn2, 'left':widthLogIn});
            }
        });


        // 수평선 길이 설정
        $(function(){
            var logInWidth = $('#logInT').css('width');
            $('hr').css('width', logInWidth);
        })

        // 로그인 링크 클릭하면 로그인 모달팝업 띄우기(띄울때 로그인단 위치선정도)
        var moveToLogIn = document.querySelector('#moveToLogIn');
        var moveToLogIn2 = document.querySelector('#moveToLogIn2');
        var modal = document.getElementById('myModal');

        moveToLogIn.onclick = function(){
            modal.style.display = "block";

            var heightLogIn = $(document).scrollTop()+$('body>header').height()+50;
            var widthLogIn = $('html').innerWidth()/2 - $('#logIn').width()/2;
            
            $('#logIn').css({'top':heightLogIn, 'left':widthLogIn});

        };
        moveToLogIn2.onclick = function(){
            // $('#serveMenu').css('display', 'none');
            modal.style.display = "block";

            var heightLogIn = $(document).scrollTop()+$('#reactMenu').height()+50;
            var widthLogIn = $('html').innerWidth()/2 - $('#logIn').width()/2;
            
            $('#logIn').css({'top':heightLogIn, 'left':widthLogIn});

        };

        // 모달 팝업 외의 공간을 클릭하면 모달팝업 끄기
        // window.onclick = function(event){
        //     if(event.target == modal){
        //         modal.style.display = 'none';
        //     }
        // }

        // X버튼 누르면 모달팝업 끄기
        var close = document.querySelector('.close');
        close.onclick = function() {
            modal.style.display = "none";
        }

        // 아이디/비번을 다 입력하면 로그인 버튼 활성화
        $(function(){
            $('#userIdLogIn').blur(readyLogIn);
            $('#password').blur(readyLogIn);
        })
        function readyLogIn(){
            if($('#userIdLogIn').val()!=''&&$('#password').val()!=''){
                $('#logBtn').prop('disabled', false).css({'background':'#b3a193', 'color':'#242424'});
            }
            if($('#userIdLogIn').val()==''||$('#password').val()==''){
                $('#logBtn').prop('disabled', true).css({'background':'lightgray', 'color':'gray'});
            }
        }

        // 체크여부에따라 체크박스 이미지(라벨) 와리가리(색바뀜)
        $('input:checkbox').each(function(index, item){
            $(this).change(function(){
                if($(this).prop('checked')==true){
                    ($(this).next().css('background-image', "url('checkboxImage/활성화체크박스검정에베이지.png')"));
                
                }else if($(this).prop('checked')==false){
                    $(this).next().css('background-image', "url('img/notCheck1.png')")
                }
            });
        });


        // 모달팝업의 세로길이 맞춰주는 기능
        $(function(){
            var heightAll = $('html').height();
            $('.modal').css('height',heightAll)
        
        })
        $(window).resize(function () { 
            var heightAll = $('html').height();
            $('.modal').css('height',heightAll);
        });
        
        // 버튼 클릭시 화면으로 이동할 script
        // 장례절차로 이동
        function goOrder() {
        	location.href="<%=request.getContextPath()%>/Funeral/Funeral_Order.jsp";
		}
        
     
    
    </script>
</body>
</html>