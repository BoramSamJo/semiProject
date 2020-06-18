<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<link
		href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap"
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
	/* 풋터 끝 */
	
	/*보험소개, 보장내용 가입안내 메뉴 스타일 적용*/
	#header-title {
		/* 메뉴바때문에 패딩탑 지정해서 메뉴바있을 공간 만듬 */
		padding-top: 95px;
		padding-bottom: 10px;
		width: 100%;
		height: 100px;
		font-size: 2em;
		text-align: center;
		font-weight: 700;
		background: #d2c4b9;
	}
	
	#headline {
		/* position: absolute; */
		margin: auto;
		margin-top: 40px;
		text-align: center;
		/* background-color: #d0b7b5; */
	}
	
	#headline>span {
		display: inline-block;
		background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
		font-weight: bold;
		width: 200px;
		height: 55px;
		text-align: center;
		line-height: 55px;
		border-radius: 10px;
		margin: 10px;
		cursor: pointer;
		font-size: 18px;
	}
	
	#headline>span:hover {
		background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
		color: #b3a193;
		cursor:pointer;
	}
	
	#headline>span:nth-of-type(2) {
		background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
		color: #b3a193;
	}
	
	/*-------------------------------------------------------------  */
	#wrap {
		margin: auto;
		padding-top: 10px;
		background: white;
		border: 8px solid #b3a193;
		width: 800px;
		border-radius: 10px;
		margin-top: 40px;
		margin-bottom: 100px;
	}
	
	/*가입안내 div 스타일 적용*/
	#infoHeader {
		font-size: 2em;
		font-weight: 500;
		padding-bottom: 10px;
	}
	
	#infoHeader :after {
		content: "";
		display: block;
		border-bottom: 3px solid #242424;
		width: 220px;
	}
	
	/*테이블 스타일 적용*/
	#detail1 {
		text-align: left;
		border: 1px solid black;
		text-align: center;
		border-collapse: collapse;
	}
	
	#detail1 {
		border-top: none;
	}
	
	#detail1 tr, #detail1 th, #detail1 td {
		border: 1px solid black;
	}
	
	#detail1 tr:nth-of-type(1)>td {
		border: none;
		text-align: left;
	}
	
	#detail1 tr:nth-of-type(1) {
		border: none;
	}
	
	#detail1 tr th:nth-of-type(1) {
		width: 250px;
	}
	
	#detail1 td th:nth-of-type(1) {
		width: 250px;
	}
	
	/*버튼 스타일 적용*/
	#lastLine {
		margin: auto;
		width: 330px;
		text-align: center;
	}
	
	#lastLine button {
		margin: 30px;
		font-size: 15px;
		font-weight: 500;
		width: 100px;
		height: 40px;
		border-radius: 10px;
		border: none;
		box-shadow: 1px 1px 1px gray;
		background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
	}
	
	#lastLine button:hover {
		background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
		color: #b3a193;
		cursor:pointer;
	}
	
	/*보험료 계산하기 모달창 스타일 적용*/
	.modal {
		display: none;
		position: fixed;
		z-index: 1;
		left: 0;
		top: 0;
		width: 100%;
		height: 100%;
		background-color: rgb(0, 0, 0);
		background-color: rgba(0, 0, 0, 0.4);
	}
	
	/* 보험료 계산하기 모달창 스타일 적용*/
	.modal_pop {
		background-color: #fefefe;
		margin: 15% auto;
		padding: 0px 10px 20px 15px;
		border: 2px solid #242424;
		width: 400px;
		height: 250px;
		border-radius: 8px;
	}
	
	.modal_pop table td {
		padding: 10px;
	}
	/* 모달창 버튼 설정 */
	.modal_pop button {
		background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
		color: #242424;
		font-size: 14px;
		font-weight: 500;
		border: none;
		padding: 3px 10px 3px 10px;
		border-radius: 2px;
	}
	
	/* 보험료 계산하기 모달창 끄기(X)버튼 스타일 적용 */
	.close {
		color: #aaa;
		float: right;
		font-size: 28px;
		font-weight: bold;
	}
	
	/* 보험료 계산하기 모달창 스타일 적용*/
	.close:hover, .close:focus {
		color: black;
		text-decoration: none;
		cursor: pointer;
	}
	
	#orderSubmit:hover{
		background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
		color: #b3a193;
		cursor:pointer;
	}
	</style>

</head>
<body>
	<!--헤더 시작-->
	<header> 
		<%@include file="../common/menubar.jsp"%>
	</header>

	<!--섹션 시작-->
		<section>
			<div id="header-title">
				<p>HYEYUM INSURANCE</p>
			</div>

			<div id="headline">
				<span onclick="location.href='insuranceMain.jsp';">보험소개</span> <span
					onclick="location.href='insuranceContent.jsp';">보장내용</span> <span
					onclick="location.href='insuranceConfirm.jsp';">가입안내</span>
			</div>

			<div id="wrap">
				<table id="detail1" align="center" width="500px" height="400px"
					style="border-bottom: none; border-left: none; border-right: none;">
					<tr>
						<td>
							<div id="infoHeader">
								<p>
									<img src="../../img/CS_icon4.png" width="40px" height="40px">&nbsp;보장내용
								</p>
							</div>
						</td>
					</tr>
					<tr>
						<th style="background-color: #d2c4b9;">보장명</th>
						<th style="background-color: #d2c4b9;">보장내용</th>
					</tr>
					<tr>
						<td>상품(순종견)</td>
						<td>나이따라 가격 달라요</td>
					</tr>
					<tr>
						<td>상품(똥개)</td>
						<td>나이따라 가격 달라요</td>
					</tr>
					<tr>
						<td>상품(순종묘)</td>
						<td>나이따라 가격 달라요</td>
					</tr>
					<tr>
						<td>상품(똥고양이)</td>
						<td>나이따라 가격 달라요</td>
					</tr>
				</table>
				<div colspan="2" id="lastLine"
					style="border-bottom: none; border-left: none; border-right: none;">
					<button id="terms" onclick="showTerms();">약관보기</button>
					<button id="confirm" onclick="showIns();">신청하기</button>
				</div>
			</div>

			<!-- 신청하기 클릭 시 계산하기 모달창 띄우기 -->
			<form action="<%=request.getContextPath()%>/calculate.ins" method="post" onsubmit="return validate();">
				<div id="modal_confirm" class="modal">

					<!-- 반려묘 모달창 띄우기 -->
					<div class="modal_pop" align="center">
						<span class="close">&times;</span>

						<p id="title" style="font-weight: bold;">
							<img src="../../img/catpaw-removebg-preview.png" width="40px" height="40px">반려동물의 정보를 선택하세요
						</p>
						<div id="information_animal">
							<table id="orderInfo" align="center">
								<tr>
									<th align="center">반려동물 나이</th>
									<td align="center"><select id="age" name="age">
											<option value="0">--</option>
											<option value="1">만1세</option>
											<option value="2">만2세</option>
											<option value="3">만3세</option>
											<option value="4">만4세</option>
											<option value="5">만5세</option>
											<option value="6">만6세</option>
											<option value="7">만7세</option>
											<option value="8">만8세</option>
									</select></td>
								</tr>
								<tr>
									<th rowspan="2" align="center">종류</th>
									<td><input type="radio" id="dog1" class="animal" name="animal" value="품종견"><label for="dog1">품종견</label>
										&nbsp; 
										<input type="radio" id="dog2" class="animal" name="animal" value="믹스견"><label for="dog2">믹스견</label>
									</td>
								</tr>
								<tr>
									<td><input type="radio" id="cat1" class="animal" name="animal" value="품종묘"><label for="cat1">품종묘</label>
										&nbsp; 
										<input type="radio" id="cat2" class="animal" name="animal" value="믹스묘"><label for="cat2">믹스묘</label>
									</td>
								</tr>
							</table>
						</div>
						<div id="btnArea">
							<button type="submit" id="orderSubmit">신청하기</button>
						</div>

					</div>
					</div>
			</form>


		</section>

		<br clear="both"> <br>

		<!--풋터 시작-->
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

		<script>
            //약관 띄우기
            function showTerms() {
                window.open("terms.jsp", "terms", "width=400, height=400 left=500px top=100px");
            }
	
                /* window.open("insuranceRequest.jsp", "ins", "width=500, height=500 left=500px top=100px"); */

                // 모달창 세팅
                var confirm = document.getElementById('confirm');
				
                var orderSubmit = document.getElementById('orderSubmit');
                
                var span = document.getElementsByClassName("close")[0];

                var cal_cat = document.getElementById("cal_cat");

                // 보험료 계산하기 클릭 시 모달 창 띄우기
                confirm.onclick = function () {
                    modal_confirm.style.display = "block";
                }

                // 끄기(X)버튼 누르면 모달창 끄기
                span.onclick = function () {
                    modal_confirm.style.display = "none";
                }

                // 끄기(X)버튼 이외의 공간 누르면 모달창 끄기
                window.onclick = function (event) {
                    if (event.target == modal_confirm) {
                        modal_confirm.style.display = "none";
                    }
                }
                
                orderSubmit.onclick = function validate(){
                	var age = $("#age").val();
                    
                    var kind = $('input[name="animal"]:checked').val();
        			
                    console.log(kind);
                    if (age == "0") {
                        alert("반려동물의 나이를 선택하세요");
                        return false;
                    } else if(kind != null && age!= "0") {
                    	return true;
        				window.open("about:blank","CalculateIns.java").close();
                    } else {
                    	alert("반려동물의 종류를 선택하세요");
                        return false;
                    }
                }
            
		</script>
</body>
</html>