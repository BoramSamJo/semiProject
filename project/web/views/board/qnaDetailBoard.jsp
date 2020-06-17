<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="ko">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
/* ----------공통설정---------- */
/* 전체설정 */
html, body {
	margin: 0px;
	padding: 0px;
	/* background: palevioletred; */
}

body * {
	font-family: 'Noto Sans KR', sans-serif;
	text-decoration: none;
}

#notiSection {
	text-align: center;
	position: relative;
}
/* 인풋태그,드롭박스,textarea 버튼제외 테두리 */
#notiSection input, #notiSection select, #notiSection textarea {
	border: 1px solid #b3a193;
}
/* ----------고객센터 공통 상단 -----------*/
#Backarea {
	width: 100%;
	height: 320px;
	background: #d2c4b9;
	text-align: center;
	top: 0px;
	margin: 0px;
}
/* 상단 명(ENG.VER) */
#notiTitle1 {
	font-family: 'Noto Sans KR', sans-serif;
	margin: 0px;
	margin-top: 0px;
	margin-left: 50px;
	font-size: 50px;
	padding-top: 140px;
	position: relative;
}
/* 상단 명(KO.VER) */
#notiTitle2 {
	font-family: 'Noto Sans KR', sans-serif;
	margin-top: 0px;
	color: black;
	opacity: 0.5;
	font-size: 22px;
	padding-top: 40px;
}
/* 상단 강아지 이미지 */
#headimg {
	width: 80px;
	height: 80px;
	position: absolute;
	margin-top: 130px;
	margin-left: -320px;
}

#smallTitles {
	display: flex;
	margin-top: 50px;
}
/* 문의작성 */
#smallTitle {
	position: relative;
	font-size: 20px;
}
/* 문의작성 앞 작은 이미지 */
#img1 {
	position: relative;
	width: 40px;
	height: 40px;
	margin-left: 17%;
	top: 14px;
}
/* 고객센터번호 */
#notiSection h5 {
	font-family: 'Noto Sans KR', sans-serif;
	position: absolute;
	top: 358px;
	margin-left: 65%;
	color: #b3a193;
	font-size: 18px;
}
/*---------- 혜윰의 중심 문단---------- */
#meddleContent {
	display: flex;
	margin: auto;
	width: 880px;
	/* background-color: violet; */
}

#middleText {
	text-align: left;
}

#notiSection p {
	font-family: 'Noto Sans KR', sans-serif;
}

#notiSection p:nth-of-type(1) {
	font-size: 35;
}

#notiSection p:nth-of-type(3) {
	font-size: 11;
	color: lightgrey;
}

#notiSection span {
	color: #776658;
}

#smalltext {
	color: lightgrey;
	font-size: 13;
}
/* 문단 오른쪽 큰 이미지 */
#img2 {
	position: relative;
	top: 20px;
	left: 80px;
	width: 250px;
	height: 200px;
}

#explain {
	line-height: 30px;
}

/* -----------테이블 영역-----------*/
#wrapTable>table {
	margin: auto;
	padding: 0px;
	margin-left: 8%;
	margin-top: 2%;
	/* height: 1000px; */
}

.tdCss {
	font-family: 'Noto Sans KR', sans-serif;
	padding: 12px;
	text-align: left;
	font-weight: bold;
}
/* 각 라벨 앞 작은 이미지 */
.tdCss img {
	position: absolute;
	margin-left: -40px;
	margin-top: 0px;
	width: 30px;
	height: 30px;
}

#notiSection input[type=password] {
	width: 100%;
	height: 30px;
	border-radius: 4px;
	/* border: 1px solid black; */
	margin-left: 8%;
}

#notiSection input[type=text] {
	border-radius: 4px;
	/* border: 1px solid black; */
	width: 100%;
	height: 30px;
	margin-left: 8%;
}

#notiSection label:nth-of-type(1) {
	margin-left: 8%;
}

/* 카테고리 */
#notiSection select {
	margin-left: 8%;
	width: 100%;
	border-radius: 4px;
	/* border: 1px solid black; */
	height: 30px;
}
/* 글 내용 */
#notiSection textarea {
	font-family: 'Noto Sans KR', sans-serif;
	margin-left: 8%;
	resize: none;
	border-radius: 4px;
	/* border: 1px solid black; */
}

/* 테이블 뒷 배경 네모선 */
#notiSection #wrapTable {
	height: 800px;
	width: 65%;
	border: 11px solid #d2c4b9;
	border-radius: 30px;
	margin: auto;
	margin-bottom: 100px;
	margin-top: 30px;
}

@media only screen and (max-width: 1100px) {
	#notiSection #wrapTable {
		height: 850px;
		width: 80%;
	}
}

@media only screen and (max-width: 500px) {
	#notiSection #wrapTable {
		height: 850px;
		width: 90%;
	}
}

/* ----------취소/등록버튼 ---------- */
#btns {
	/* background-color: violet; */
	width: 200px;
	margin: auto;
	margin-top: 25px;
}

#notiSection input[type=submit] {
	position: relative;
	padding: 10px 25px;
	border-radius: 4px;
	background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
	color: #242424;
	border: none;
	font-weight: 500;
	font-size: 14px;
}

#notiSection input[type=button] {
	margin-right: 2%;
	padding: 10px 25px;
	border-radius: 4px;
	background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
	color: #242424;
	border: none;
	font-weight: 500;
	font-size: 14px;
}

#notiSection input[type=submit]:hover {
	background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
	color: #b3a193;
}

#notiSection input[type=button]:hover {
	background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
	color: #b3a193;
}

/* ----------파일추가하기 영역---------- */
.filebox input[type="file"] {
	position: absolute;
	width: 0;
	height: 0;
	padding: 0;
	overflow: hidden;
	border: 0;
}

.filebox label {
	display: inline-block;
	padding: 5px 20px;
	vertical-align: middle;
	background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
	color: #242424;
	cursor: pointer;
	border-radius: 5px;
	margin-left: 8%;
	font-size: 14px;
}

.filebox label:hover {
	background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
	color: #b3a193;
}

.filebox .upload-name {
	display: inline-block;
	height: 30px;
	width: 78%;
	font-size: 12px;
	padding: 2px 10px;
	vertical-align: middle;
	border: 1px solid black;
	border-radius: 5px;
}

/* 반응형 */
@media only screen and (max-width: 1300px) {
	#notiSection table {
		float: none;
		width: 100%;
	}
	#notiSection input[type=text], #notiSection input[type=password],
		#notiSection select, #notiSection textarea {
		float: none;
		width: 70%;
	}
	.filebox .upload-name {
		float: none;
		width: 55%;
	}
	.radio {
		float: none;
		width: 10%;
	}
	#img2 {
		display: none;
	}
	#meddleContent {
		width: 550px;
	}
	#middleText {
		text-align: center;
		margin: auto;
	}
}

/* -----------------footerCSS 시작------------------------ */
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
	margin-bottom: 0px;
}

#footerTable a {
	text-decoration: none;
}

#footerTable tr:nth-of-type(6) a {
	color: white;
}

#animalProtectSys {
	background-color: #b3a193;
	color: #242424;
	padding: 1.5px 4px 2px 4px;
	font-size: 12px;
	font-family: 'Noto Sans KR', sans-serif;
}
</style>
<!-- 노토산스kr 폰트 가져오기 -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
</head>
<body>
	<%@include file="../common/menubar.jsp"%>

	<!--section시작-->
	<section id="notiSection">
		<!-- 고객센터 공통 상단 -->
		<div id='Backarea'>
			<img src="<%=request.getContextPath() %>/img/CS_icon4.png" id=headimg>
			<h1 id="notiTitle1">HYE YUM CS CENTER</h1>
			<h3 id="notiTitle2">혜윰 고객센터</h3>
		</div>
		<div id="smallTitles">
			<img src="<%=request.getContextPath() %>/img/CS_icon3.png" id='img1'>
			<h3 id="smallTitle">문의작성</h3>
			<h5>고객센터 1577-7011</h5>
		</div>
		<div id="meddleContent">
			<div id="middleText">
				<p>
					<span><b>혜윰의 중심은</b></span> 항상 <span><b>고객님</b></span>입니다.
				</p>
				<p id="explain">
					혜윰을 이용하면서 느끼신 궁금사항이나 바라는 점을 알려주세요.<br> 고객님의 소중한 의견으로 한 뼘 더 자라는
					혜윰이 되겠습니다<br> <span id='smalltext'>고객님의 요청사항을 정확히 확인하고,
						빠르게 개선하기 위해 담당자가 연락을 드릴 수 있습니다.</span>
				</p>
			</div>
			<img src="<%=request.getContextPath() %>/img/CS_customer.png" id='img2'>
		</div>

		<div id="wrapTable">
			<table>
				<form name="qnaInsertForm" id='qnaInsertForm' action="<%=request.getContextPath()%>/insertQnA.bo">

					<colgroup>
						<col width='20%'>
						<col width='80%'>
					</colgroup>

					<table>
						<tr>
							<td class='tdCss'><img src="<%=request.getContextPath() %>/img/service.png">제목</td>
							<td><input type='text' placeholder="게시글 제목을 입력하세요"
								id='title' name="title" required></td>
						</tr>
						<tr>
							<td class='tdCss' name="public1" id="public"><img
								src="<%=request.getContextPath() %>/img/service.png">공개설정</td>
							<td><label for="publicR">공개</label><input type="radio"
								name="isOpen" id="publicR" value="yes" class="radio">
								<label for="privateR">비공개</label><input type="radio"
								name="isOpen" id="privateR" value="no" class="radio" checked>
							</td>
						</tr>
						<tr>
							<td class='tdCss'><img src="<%=request.getContextPath() %>/img/service.png">비밀번호</td>
							<td><input type="password" name="password" id="pass"
								placeholder="비밀번호" required></td>
						</tr>
						<tr>
							<td class="tdCss"><img src="<%=request.getContextPath() %>/img/service.png">카테고리 선택</td>
							<td><select name="category" id="category" required>
									<option selected value=''>카테고리를 선택해주세요</option>
									<option value="reservation">예약문의</option>
									<option value="price">가격문의</option>
									<option value="insFu">보험/장례문의</option>
									<option value="etc">기타문의</option>
							</select></td>
						</tr>
						<tr>
							<td></td>
							<td><textarea rows="20" cols="100" placeholder="내용을 입력해주세요"
									id='content' name="content" required></textarea></td>
						</tr>
						<tr>
							<td></td>
							<td colspan="2"><div align='right'></td>
						</tr>
					</table>
					<br>
					<div id="btns">
						<input type='button' value='취소' onclick="reset" id="reset">
						<input type='submit' value='등록' onclick="upload" id='upload'>
					</div>
				</form>
			</table>
	</section>


	<!--footer시작-->
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
				<td><a href="">오시는길</a></td>
				<td><a href="">사이트맵</a></td>
				<td><a href="">개인정보 처리방침</a></td>
				<td><a href="">이용약관</a></td>
			</tr>
		</table>
		<p id="footerP">
			해윰 | 사업자등록번호 : 0123456789호 | 동물장묘업 등록번호 | 대표자 : 배혜린 <br>
			Copyright © 2020-2020 hyeyum Institute All Right Reserved
		</p>
	</footer>



	<!-------------------------------------------------------------------------------------------------------------------------------------->
	<script>
			//공개버튼 클릭하면 비밀번호입력불가하게, 비공개하면 반대로
			$('#publicR').click(function(){
				$('#pass').prop('disabled', true);
				$('#pass').css('background', 'lightgray');
			})
			$('#privateR').click(function(){
				$('#pass').prop('disabled', false);
				$('#pass').css('background', 'white').focus();
			})
			
			//비밀번호 정규표현식
			$('#pass').blur(function(){
				var regEx = /^[\d]{4}$/;
				if(!regEx.test($(this).val())){
					alert('비밀번호는 숫자 4자리여야 합니다');
					$(this).val('');
				}
			});
		
            
            //취소 버튼 qna목록 페이지로 전환
             $(function(){
                $('#reset').click(function(){
                    location.href = '<%=request.getContextPath()%>/QnAList.bo?currentPage=1';
                })
                
            })


        </script>

</body>
</html>



