<%@page
	import="java.util.ArrayList, member.model.vo.Member, member.model.vo.Animal"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.regex.Matcher, java.util.regex.Pattern "%>

<%
	
	Member member = (Member)request.getAttribute("member");
	System.out.println(member);
	String userName = member.getmName();
	String phone = member.getPhone();
 	String address = member.getAddress();
	
	
 	ArrayList<Animal> animal = (ArrayList<Animal>)(request.getAttribute("animal"));
 	System.out.println("servlet에서 가져온 animal 객체 : "+animal);	

 	
%>




<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>예약하기</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!--이걸 넣어야지 날짜 다시 선택하기 함수가 실행함-->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
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

#reservationSection {
	text-align: center;
	position: relative;
	background-color: white;
}

/* hr설정 */
#reservationSection hr {
	border: none;
	border-bottom: 1px solid lightgray;
	width: 90%;
	margin-top: 60px;
	margin-bottom: 60px;
}

/* 버튼류 공통 설정 */
#reservationSection button {
	border: 1px solid #242424;
	background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
	color: #242424;
	padding: 11px;
	border: none;
	font-weight: 600;
}

#reservationSection button:hover {
	background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
	color: #b3a193;
}

/* input 텍스트 입력 창 공통설정 */
#reservationSection input {
	border-radius: 3px;
	border: 1px solid #b3a193;
	height: 40px;
	width: 200px;
/* 	text-indent: 10px; */
}

#reservationSection select {
	height: 40px;
	border-radius: 3px;
}

/* 아이디 찾기or 비번찾기 중 하나로 갈 버튼 */
.changeBtn {
	width: 120px;
	height: 50px;
	font-size: 20px;
}

/* 인증메일/번호 확인 버튼 */
.certification {
	width: 100px;
	height: 40px;
	font-size: 12px;
}

/* 찾기버튼 */
.searchBtn {
	width: 100px;
	font-size: 14px;
}

/* 예약하기 버튼 */
#doReservationBtn {
	width: 200px;
	height: 50px;
	margin-bottom: 60px;
	font-size: 16px;
	border-radius: 10px;
	outline: none;
}

/* ----------서치 공통 상단 -----------*/
#Backarea {
	width: 100%;
	height: 320px;
	background: #d2c4b9;
	text-align: center;
	top: 0px;
	margin: 0px;
	margin-bottom: 80px;
}

/* 상단 명(ENG.VER) */
#reservationTitle1 {
	font-family: 'Noto Sans KR', sans-serif;
	margin: 0px;
	margin: auto;
	margin-top: 0px;
	font-size: 50px;
	padding-top: 140px;
	position: relative;
	width: 600px;
	/* background-color: violet; */
}

/* 상단 명(KO.VER) */
#reservationTitle2 {
	font-family: 'Noto Sans KR', sans-serif;
	margin-top: 0px;
	color: black;
	opacity: 0.5;
	font-size: 22px;
	padding-top: 40px;
}

/* 각 타이틀 설정 */
.rTitle {
	color: #534b44;
	font-size: 28px;
}

/* 예약일자 및 시간 선택 영역 설정 */
#calendarWrap {
	width: 1350px;
	height: 500px;
	border: 5px solid #b3a193;
	border-radius: 10px;
	margin: auto;
	margin-top: 30px;
}

/* 예약 선택입력란 테이블 설정 */
#selectInputT {
	width: 550px;
	vertical-align: middle;
	border-collapse: collapse;
	list-style-type: square;
}

#selectInputT td {
	padding: 15px;
}

#selectInputT tr>td:nth-of-type(1) {
	width: 120px;
}

#selectInputT tr>td:nth-of-type(2) {
	width: 400px;
}

/* 입력정보 영역 */
#informWrap {
	display: flex;
	margin: auto;
	margin-top: 50px;
	margin-bottom: 60px;
}

.informEachWrap {
	margin: auto;
	background-color: white;
	border: 5px solid #b3a193;
	border-radius: 10px;
	width: 560px;
	padding: 20px;
}

/* 테이블 전체 설정 */
/* #reservationSection table{
                width:490px;
                margin: auto;
            }
            #reservationSection table td{
                font-weight: 550;
                color: #948478;
            }
            #reservationSection table td:nth-of-type(1){
                width:190px;
                font-size: 17px;
            } */
/* 예약날짜 및 시간이 이랑 겹치기때문에 변경함(예약자 정보 table 변경)*/
#selectInputT {
	width: 490px;
	margin: auto;
}

#selectInputT td {
	font-weight: 550;
	color: #948478;
}

#selectInputT td:nth-of-type(1) {
	width: 190px;
	font-size: 17px;
}

#selectInputT li {
	width: 120px;
}

/* ------- 예약용 css 시작 --------*/

/* 예약 날짜용 td,th 설정 */
#calendar td, #calendar th {
	width: 50px;
	height: 50px;
	text-align: center;
	font-size: 20px;
	font-family: 굴림;
	border: 2px solid;
	border-color: #d2c4b9;
	border-radius: 10px;
}

/* 예약 시간용 td 설정 */
#order td {
	width: 60px;
	height: 50px;
	text-align: center;
	font-size: 20px;
	font-family: 굴림;
	border: 2px solid;
	border-color: #d2c4b9;
	border-radius: 10px;
}

/* 예약 시간의 오전 오후에 td 설정 */
#time {
	width: 60px;
	height: 50px;
	text-align: center;
	font-size: 20px;
	font-family: 굴림;
	border: 2px solid;
	border-color: #d2c4b9;
	border-radius: 10px;
}

div{
 	text-align: center;
	/* border: 1px solid red; */
}

#selectInputT td{
 	text-align: left;
	/* border: 1px solid red; */
}

#informWrap div {
/* 	text-align: left; */
}

#removeDate{
	border-radius:5px;
}
#wrapChoice1{
	width:1350px;
	margin:auto;
	text-align:center;
	margin-top:20px;
	border-radius:5px;
	height:100px;
	background-color:#b3a193;
}

/* 선택한 날짜/시간 나오게 하기 */
#plusContent {
	display: inline-block;
	margin:auto;
	margin-top:27px;
}

#plusContent input {
	text-align: center;
	background-color: #d2c4b9;
	width: 250px;
	border-radius: 10px;
	font-size: 20px;
	font-weight:500;
	outline-style:none;
	font-weight:550;
}
#plusContent label {
	font-weight:550;
	font-size:17px;
	margin-right:10px;
	color:white;
}

/* 날짜/시간을 선택할시 클릭을 못하도록 가려줄 div */
#removeDate, #removeTime {
	position: absolute;
	background-color: rgba(000, 000, 000, 0.7);
	width: 415px;
	height: 450px;
	display: none;
}

/* 날짜/시간을 선택할시 가려줄 버튼  */
#select_btn_date, #select_btn_time {
	border-radius: 30px;
	font-size: 20px;
	color: #242424;
	background-color: #d0b7b5;
	border: none;
}

/* input tpye=number 화살표 지우기 */
input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}

/* 장례서비스 및 장례용품 선택 전체 div */
#funeralWrap {
	width: 1350px;
	height: 500px;
	border: 5px solid #b3a193;
	border-radius: 10px;
	margin: auto;
	margin-top: 30px;
}
/* 장례 서비스 종류 div 설정 */
#funeralService {
	width: 800px;
	height: 100px;
/* 	margin-left: 200px; */
	font-size: 30px;
	border: 5px solid #b3a193;
	border-radius: 10px;
	margin: auto;
}
/* 장례서비스 div*/
#showFS, #removeFS {
	position: absolute;
}
#showFS{
/* 	position: relative; */
/* 	background:#b3a193; */
	width:805px;
	height: 100px;
}
/* 각 장례서비스에 대한 크기 div */
#showFS div {
	width: 150px;
	display: inline-block;
	margin-left: 30px;
	margin-top: 25px;
	border-radius: 15px;
	border: 1.5px solid #242424;
	background-color:#b3a193;
}
/* 장례서비스 선택한 후 가려줄 div*/
#removeFS {
	background-color: rgba(000, 000, 000, 0.7);
	display: none;
	width: 800px;
	height: 100px;
	border-radius:3px;
}
/* 장례용품 선택 div */
#optionalGoods {
	margin-top: 20px;
	margin-left: 30px;
	border: 5px solid #b3a193;
	border-radius: 10px;
	margin: auto;
	width: 800px;
	height: 220px;
}
/* 장례용품 선택사항을 가로로 정령할 div*/
#optionalGoods div {
	display: inline-block;
	position: relative;
	/* margin-left: 20px; */
}
/* 장례용품 선택사항 table */
.select {
/* 	background-color:gray; */
	position:relative;
	top:-10px;
	left:55px;
}
#select3 {
	top:-35px;
	left:50px;
}
.select tr td {
	font-size: 20px;
	padding:8px;
	border: 2px solid #b3a193;
	border-radius: 10px;
	text-align: center;
}

.select tr th {
	background-color: #242424;
	color: #b3a193;
	font-size: 28px;
	border: 2px solid #b3a193;
	border-radius: 10px;
}


/* 장례 서비스를 선택한 후 출력 값*/
#contentView {
	width:1350px;
	margin:auto;
	text-align:center;
	margin-top:20px;
	border-radius:5px;
	height:100px;
	background-color:#b3a193;
}

#funeralVeiw{
	margin:auto;
	margin-top:25px;
}

#funeralVeiw label{
	font-size:18px;
	color:white;
	font-weight:550;
	margin-right:10px;
}

#contentView input{
	text-align: center;
	background-color: #b1a193;
	width: 150px;
	border-radius: 10px;
	font-size: 20px;
	font-weight:500;
	outline-style:none;
	font-weight:550;
	margin-right:20px;
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
	margin-bottom: 0px;
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
</style>
<!-- calendar 만들기 -->
<script>
        var today = new Date();//내 컴퓨터 로컬을 기준 오늘 날짜
        var date = new Date();//today의 Date를 세어주는 역할
        var out = 1; // td태그 클릭시 다음태그의 색깔을 지워줄 변수

        function prevCalendar() {//이전 달
            today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate()); // ex. 2020년 05월 01일
            //today.getFullYear() 현재 년도//today.getMonth() 월  //today.getDate() 일 
            //getMonth()는 0~11을 반환하기때문에 이전달 or 다음달에는 -1/+1을 해줘야한다.
            buildCalendar(); //달력 cell 만들어 출력 
        }

        function nextCalendar() {//다음 달
            today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate()); // ex. 2020년 7월 01일
            //today.getFullYear() 현재 년도//today.getMonth() 월  //today.getDate() 일 
            //getMonth()는 0~11을 반환하기때문에 이전달 or 다음달에는 -1/+1을 해줘야한다.
            buildCalendar();//달력 cell 만들어 출력
        }
        
        function buildCalendar() {//현재 달 달력 만들기
            //올해 1일을 넣어둘 변수(ex. 이번달 기준 2020년6월1일)
            var doMonth = new Date(today.getFullYear(), today.getMonth(), 1);
            //올해 마지막일을 넣어둘 변수(ex. 이번달 기준 2020년6월30일)
            var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);

            //올해, 2월 0일을 넣어둘 변수(이번달 마지막날), 매달 끝나는 달이 다르기때문에



            var tbCalendar = document.getElementById("calendar");
            //??년?월을 찍기위한 변수(ex. 2020년 6월)
            var tbCalendarYM = document.getElementById("tbCalendarYM");
            //테이블에 정확한 날짜 찍는 변수(html 태그에 보냄)
            tbCalendarYM.innerHTML = today.getFullYear() + "년 " + (today.getMonth() + 1) + "월";

            /*while은 이번달이 끝나면 다음달로 넘겨주는 역할*/
            // 이전달 or 다음달에 나올 tr 2줄까지 고정해주고 나머지는 다 지운다(즉 ??년??월 && (일~토)까지 만 아래 일은 지운다.)
            while (tbCalendar.rows.length > 2) {
                tbCalendar.deleteRow(tbCalendar.rows.length - 1);
                //테이블의 tr 갯수 만큼의 열 묶음은 -1칸 해줘야지(제거시 고정됨)
                //30일 이후로 담을달에 순서대로 열이 계속 이어진다.
            }
            var tr = null;
            tr = tbCalendar.insertRow();
            //테이블에 새로운 열 삽입//즉, 초기화
            var cnt = 0; //셀의 갯수를 세어주는 역할

            // console.log(doMonth.getDay());
            /* 달마다 1일이 시작하는 요일을 0~6(일~토)로 반환하여 그전까지 공백을 만들어 비워둔다. */
            for (i = 0; i < doMonth.getDay(); i++) { // getDay : 현재 요일 반환 0~6(일~토), ex. doMonth는 6월1일(월)의 값이 있는데 getDay메소드를 통해서 월요일인 1을 반환한다.
                td = tr.insertCell();//td 열을 가로로 정렬해서 만들어준다(cell = td)
                cnt++;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
            }

            /*달력 출력*/
            for (i = 1; i <= lastDate.getDate(); i++) {
                //1일부터 마지막 일까지 돌린다(ex. 올해 1일 ~ 30일까지)
                td = tr.insertCell();//td 열을 가로로 정렬해서 만들어준다(cell = td)
                td.innerHTML = i;//셀을 1부터 마지막 day까지 HTML 문법에 넣어줌

                // day별로 id 만들기(망할코드 No.1)
                $(td).attr("id", td.innerHTML);

                cnt++;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
                // console.log("cnt : " + i); 

                if (cnt % 7 == 0) {
                    // 토요일일 경우 다음 줄로 이동
                    tr = calendar.insertRow();
                }
                /*오늘의 날짜에 노란색 칠하기*/
                // 컴퓨터 로컬 날짜와 내가 만든 캘린더의 날짜를 비교하여 오늘날짜 구하기
                if (today.getFullYear() == date.getFullYear() //getFullYear : 올해 년도를 반환
                    && today.getMonth() == date.getMonth()     // getMonth : 올해 이번달을 반환
                    && i == date.getDate()) {                  // getDate : 오늘날짜를 반환
                    td.bgColor = "#d2c4b9";
                }
            }
            
        }

        


    </script>
</head>

<body>
	<%@include file="../common/menubar.jsp" %>
	
	<section id="reservationSection">
		<!-- 예약페이지 공통 상단 -->
		<div id='Backarea'>
			<h1 id="reservationTitle1">FUNERAL RESERVATION</h1>
			<h3 id="reservationTitle2">장례 예약</h3>
		</div>

		<h2 class="rTitle">예약일자 및 시간 선택</h2>
		<h5>예약을 원하시는 일자와 시간을 선택해주세요</h5>
		<div id="calendarWrap">
			<div id="reload_calendar"
				style="display: inline-block; width: 415px; height: 415px; margin-top: 45px;">
				<div style="position: absolute;">
					<table id="calendar" align="center" style="border-color: #d2c4b9">
						<tr>
							<th><label onclick="prevCalendar()"> << </label></th>
							<th align="center" id="tbCalendarYM" colspan="5">yyyy년 m월</th>
							<th><label onclick="nextCalendar()"> >> </label></th>
						</tr>
						<tr>
							<th align="center">일</th>
							<th align="center">월</th>
							<th align="center">화</th>
							<th align="center">수</th>
							<th align="center">목</th>
							<th align="center">금</th>
							<th align="center">토</th>
						</tr>
					</table>
				</div>
				<!-- 날짜를 선택할시 클릭을 못하도록 가려줄 div-->
				<div id="removeDate">
					<p style="font-size: 20px; color: #d0b7b5; margin-top: 170px;">
						<u>날짜를 선택하셨습니다.</u>
					</p>
					<button type="button" id="select_btn_date">▶ 날짜 다시 선택하기</button>
				</div>
			</div>
			<!-- 예약 시간을 띄워줄 div-->
			<div
				style="display: inline-block; width: 415px; height: 415px; margin-left: 30px;">
				<div id="reload_order" style="position: absolute;">
					<table id="order" style="margin-top: 60px; margin-left: 30px;">
						<tr>
                            <th id="time">오전</th>
                            <td>10:00</td>
                            <td>10:30</td>
                            <td>11:00</td>
                            <td>11:30</td>
                        </tr>
                        <!-- 오전 과 오후의 간격을 벌어줄 td -->
                        <tr>
                            <td colspan="5" style="border: none;"></td>
                        </tr>
                        <tr>
                            <th id="time">오후</th>
                            <td>13:00</td>
                            <td>13:30</td>
                            <td>14:00</td>
                            <td>14:30</td>
                        </tr>
                        <tr>
                            <th></th>
                            <td>15:00</td>
                            <td>15:30</td>
                            <td>16:00</td>
                            <td>16:30</td>
                        </tr>
                        <tr>
                            <th></th>
                            <td>17:00</td>
                            <td>17:30</td>
                            <td>18:00</td>
                            <th></th>
                        </tr>
					</table>
				</div>
				<!-- 날짜를 선택할시 클릭을 못하도록 가려줄 div-->
				<div id="removeTime">
					<p style="font-size: 20px; color: #d0b7b5; margin-top: 170px;">
						<u>시간을 선택하셨습니다.</u>
					</p>
					<button type="button" id="select_btn_time" onclick="reset();">▶
						시간 다시 선택하기</button>
				</div>
			</div>
		</div>

		<!--선택한 날짜/시간 나오게 하기-->
		<!-- insertlist.f -->
		<form id="joinForm" action="<%=request.getContextPath()%>/view.f"
			method="get">
			<div style=";" id="wrapChoice1">
				<div id="plusContent" style="margin-right: 30px;">
					<label>선택하신 날짜 : </label> <input type="text" id="plusDate"
						name="plusDate" value="" readonly>
				</div>
				<div id="plusContent" style="margin-right: 10px;">
					<label>선택하신 시간 : </label> <input type="text" id="plusTime"
						name="plusTime" value="" readonly>
				</div>
			</div>
			<!-- 오늘 calendar를 뿌려줄 함수 -->
			<script>
            buildCalendar();
        </script>
			</div>

			<hr>

			<h2 class="rTitle">장례서비스 선택</h2>
			<h5>장례서비스 및 원하시는 장례 용품을 선택해주세요</h5>
			<div id="funeralWrap">
				<h3>장례 서비스 선택</h3>
				<div id="funeralService">
					<div id="showFS">
						<div id="original">기본형</div>
						<div id="nomal">일반형</div>
						<div id="advanced">고급형</div>
						<div id="vip">VIP형</div>
					</div>
					<div id="removeFS">
						<button type="button" id="select_btn_service"
							style="margin-top: 35px;">장례서비스 다시 선택하기</button>
					</div>
				</div>
				<h3>장례용품 선택사항</h3>
				<div id="optionalGoods">
					<div style="width: 300px; left: -150px;">
						<div id="showSelect1" style="position: absolute;">
							<table id="select1" class="select">
								<tr>
									<th>수의</th>
								</tr>
								<tr>
									<td>일반수의</td>
								</tr>
								<tr>
									<td>고급수의</td>
								</tr>
								<tr>
									<td>해당없음</td>
								</tr>
							</table>
						</div>
						<div id="removeSelect1"
							style="background-color: rgba(000, 000, 000, 0.7); position: absolute; top:-10px; left:187px;  border-radius:3px; width: 130px; height: 205px; visibility: hidden;">
							<button type="button" id="select_btn_select1"
								style="margin-top: 70px;">
								수의 다시<br>선택하기
							</button>
						</div>
					</div>
					<div style="width: 400px; left: -310px;">
						<div id="showSelect2" style="position: absolute;">
							<table id="select2" class="select">
								<tr>
									<th>관</th>
								</tr>
								<tr>
									<td>오동나무관</td>
								</tr>
								<tr>
									<td>해당없음</td>
								</tr>
							</table>
						</div>
						<div id="removeSelect2"
							style="background-color: rgba(000, 000, 000, 0.7); position: absolute;  top:-10px; left:233px;  border-radius:3px; width: 160px; height: 205px; visibility: hidden;">
							<button type="button" id="select_btn_select2"
								style="margin-top: 80px;">
								관 다시<br>선택하기
							</button>
						</div>
					</div>
					<div style="width: 700px; left: 50px;">
						<div id="showSelect3" style="position: absolute;">
							<table id="select3" class="select">
								<tr>
									<th colspan="2">화장후 선택</th>
								</tr>
								<tr>
									<td>수목장1년</td>
									<td>수목장2년</td>
								</tr>
								<tr>
									<td>봉안당1년</td>
									<td>LECETE</td>
								</tr>
								<tr>
									<td colspan="2">해당없음</td>
								</tr>
							</table>
						</div>
						<div id="removeSelect3"
							style="background-color: rgba(000, 000, 000, 0.7); position: absolute;  top:-35px; left:370px; border-radius:3px;  width: 280px; height: 205px; visibility: hidden;">
							<button type="button" id="select_btn_select3"
								style="margin-top: 70px;">화장후 다시 선택하기</button>
						</div>
					</div>
				</div>
				<!-- 선택한 장례서비스 및 선택용품 나오게 하기 -->
			</div>
			<div id="contentView"
				style="margin-top: 20px; background-color: #d2c4b9;">
				<div id="funeralVeiw" style="display: inline-block;">
					<label>장례 서비스 : </label> <input type="text" id="funeralSelect"
						name="funeralSelect" value="" readonly> <label>수의
						: </label> <input type="text" id="funeralSelect1" name="funeralSelect1"
						value="" readonly> <label>관 : </label> <input type="text"
						id="funeralSelect2" name="funeralSelect2" value="" readonly>
					<label>화장후 선택 : </label> <input type="text" id="funeralSelect3"
						name="funeralSelect3" value="" readonly>
				</div>
			</div>
			<hr>

			<h2 class="rTitle">예약자 정보</h2>
			<div id="informWrap">
				<div id="userInfo" class="informEachWrap">
					<!-- 회원이므로 여긴 알아서 채워짐 -->

					<table id="selectInputT" align="center">
						<tr>
							<td>
								<li>보호자 성함</li>
							</td>
							<td><input type="text" id="userName" name="userName"
								value="<%=userName %>" size="15"></td>
						</tr>
						<tr>
							<td>
								<li>연락처</li>
							</td>
							<td><input type="text" id="phone" name="phone"
								value="<%=phone %>" size="15"></td>
						</tr>
						<tr>
							<td>
								<li>주소</li>
							</td>
							<td><input type="text" id="address" name="address"
								value="<%=address %>" size="15"></td>
						</tr>
					</table>
				</div>
				<% for(int i=0;i<animal.size();i++){%>
				<% if(member.getmNo() == animal.get(i).getmNo()){%>
				<%System.out.println(member.getmNo()); %>
				<%System.out.println(i + "번쨰 객체 : "+animal.get(i).getmNo()); %>
				<% String aName = animal.get(i).getaName();  %>
				<%System.out.println(i + "번쨰 aName 객체 : "+aName); %>
				<%String pKindMain = animal.get(i).getKind();  %><!-- 패턴으로 ()안에 값을 추출한다.  -->
				<%String pKindMainR = ""; %>
				<!--  group(0) : 전체, group(1) : ()안의 값  참고 사이트 :https://enterkey.tistory.com/353  -->
				<%Pattern p = Pattern.compile("[(](.*?)[)]"); %>
				<%Matcher m = p.matcher(pKindMain); %>

				<%while(m.find()){ %>
				<%pKindMainR = m.group(1); %>
				<%System.out.println("패턴으로뽑아낸 값 : " +pKindMainR); %>
				<% }%>
				<!-- kind에서 ()를 제외한 나머지 값을 추출 String -->
				<%String pKindServe = animal.get(i).getKind(); %>
				<% int text = pKindServe.indexOf(")"); %>
				<% String pKindServeR = pKindServe.substring(text+1); %>
				<%System.out.println("패턴으로 뽑아낸 값 : "+pKindServeR); %>
				<%String weight = animal.get(i).getWeight(); %>
				
				<div id="petInfo" class="informEachWrap">
					<table id="selectInputT" style="text-align:left">
						<tr >
							<td>
								<li>아이 이름</li>
							</td>
							<td><input type="text" name="pName" id="pName"
								value="<%=aName %>" placeholder="아이이름을 입력해주세요." readonly></td>
						</tr>
						<tr>
							<td>
								<li>아이 몸무게</li>
							</td>
							<td><span id="wrapPKSAndKg"> <!-- onkeydown="onlyNumber(event)" onkeyup="removeChar(event)" -->
									<input type="number" name="pWeight" id="pWeight"
									value="<%=weight %>" placeholder="00.0" maxlength="5" readonly
									onkeypress="isNumberKey(event);" onkeyup="delHangle(event);"
									oninput="numberMaxLength(this);"> <span id="kg">kg</span>
							</span></td>
						</tr>
						<tr>
							<td>
								<li>아이 품종</li>
							</td>
							<td><select name="pKindMain" id="pKindMain" class="dropdown">
									<option value="강아지" id="dog" name='<%=pKindMainR%>'>강아지</option>
									<option value="고양이" id="cat" name='<%=pKindMainR%>'>고양이</option>
									<option value="기타동물" id="ect" name="<%=pKindMainR%>">기타동물</option>
							</select> <input type="text" name="pKindServe" id="pKindServe" value="a"
								placeholder="상세품종" size="15" readonly></td>
						</tr>
					</table>
				</div>
				<%break; }else if(member.getmNo() != animal.get(i).getmNo() && i== animal.size()-1){ %>
				<div id="petInfo" class="informEachWrap">
					<table id="selectInputT" align="center">
						<tr>
							<td>
								<li>아이 이름</li>
							</td>
							<td><input type="text" name="pName" id="pName" value="입력하세요"
								placeholder="아이이름을 입력해주세요."></td>
						</tr>
						<tr>
							<td>
								<li>아이 몸무게</li>
							</td>
							<td><span id="wrapPKSAndKg"> <!-- onkeydown="onlyNumber(event)" onkeyup="removeChar(event)" -->
									<input type="text" name="pWeight" id="pWeight" value="00.0"
									placeholder="00.0" maxlength="5"
									onkeypress="isNumberKey(event);" onkeyup="delHangle(event);"
									oninput="numberMaxLength(this);"> <span id="kg">kg</span>
							</span></td>
						</tr>
						<tr>
							<td>
								<li>아이 품종</li>
							</td>
							<td><select name="pKindMain" id="pKindMain" class="dropdown">
									<option value="강아지" id="dog" name="강아지">강아지</option>
									<option value="고양이" id="cat" name="고양이">고양이</option>
									<option value="기타동물" id="ect" name="기타동물">기타 동물</option>
							</select> <input type="text" name="pKindServe" id="pKindServe"
								value="입력해주세요" placeholder="상세품종" size="15"></td>
						</tr>
					</table>
				</div>
				<%} }%>
			</div>

			<button type="button" id="doReservationBtn">예약</button>
		</form>

		<script>
	var a = $('option').attr('name'); //고양이
	var b = $("option").text();
	
	console.log(a); // 고양이
	console.log(b);
	// 품종에 대해 value값을 배열로 지정
	var options = $('#pKindMain').find('option').map(function() {
	      return $(this).val();
	}).get()

	
	for(var i=0;i<options.length;i++){
		console.log(options[i]); // 강아지, 고양이, 특수동물
		  if(a == "강아지"){
			 $('#pKindMain').val('강아지');
		  }else if(a == "고양이"){
			  $('#pKindMain').val('고양이');
		  }else if(a == "기타동물"){
			  $('#pKindMain').val('기타동물');
		  } 
		
		/* if(options[0] == pKindMainR){
			$("#pKindMain option[id='강아지']").prop({'selected':'selected'});
		}else if(options[1] == pKindMainR){
			$("#pKindMain option[value='고양이']").prop({'selected':'selected'});
		}else if(options[2] == pKindMainR){
			$("#pKindMain option[value='특수동물']").prop({'selected':'selected'});
		} */
	}
	
	/* 		
			$("#pKindMain option[value='고양이']").prop({'selected':'selected'});
			$("#pKindMain option[value='특수동물']").prop({'selected':'selected'});
	 */		
	</script>
		<script>
		 var date = $("#plusDate").val();
		var time = $("#plusTime").val();
		var select = $("#funeralSelect").val();
		var select1 = $("#funeralSelect1").val();
		var select2 = $("#funeralSelect2").val();
		var select3 = $("#funeralSelect3").val();
		
		$("#doReservationBtn").click(function(){
			if($("#plusDate").val() != "" && $("#plusTime").val() != "" && $("#funeralSelect").val() != ""
					&& $("#funeralSelec1t").val() != "" && $("#funeralSelect2").val() != "" && $("#funeralSelect3").val() != ""){
				//
				alert("예약이 완료 되었습니다");
				$("#doReservationBtn").prop({'type':'submit'});
				
				
			}else{
				alert("모든값을 입력해주세요!");
				} 
		});
			
			
			// input태그 값이 있는지 없는지 확인
            // 이값들을 관리자에 뿌려준다?
            /* $("#doReservationBtn").click(function () {
                // 값을 넘겨주고 화면에 새로고침이 필요할경구
                // window.location.reload(true);
                if (!$("input").val() && !$("#plusDate").val() && !$("#plusTime").val()) {
                    alert("모든 값을 입력해주세요");
                } else {
                    alert("예약이 접수 되었습니다.");
                    var userName = $("#userName").val();
                    var phone = $("#phone").val();
                    var address = $("#address").val();
                    console.log("userName : " + userName + " , " + "phone : " + phone + " , " + "address : " + address);

                    var pName = $("#pName").val();
                    var pWeight = $("#pWeight").val();
                    var pKindMain = $("#pKindMain option:selected").val();
                    var pKindServe = $("#pKindServe").val();
                    console.log("pName : " + pName + " , " + "pWeight : " + pWeight + " , " + "pKindMain : " + pKindMain + " , " + "pKindServe : " + pKindServe);

                    var Date = $("#plusDate").html()
                    var Time = $("#plusTime").html()
                    console.log("Date : " + Date + " , " + "Time : " + Time);
                }

            }); */
		</script>
		<!-- 클릭시 색깔입히고, 선택못하게 막는 함수 모음 -->
		<script>
            // day 클릭시 요일을 반환
            // 날짜 클릭시 div화면을 가리고(투명도) 날짜를 다시 선택하라는 버튼을 눌렀을시 초기화
            $("#calendar td").click(function () {
                var dateText = $(this).text();
                var datePrint = tbCalendarYM.innerHTML + dateText + "일"; // 날짜를 선택한 후에 아래 div에 나오게할 변수

                // 캘린더 아래 div에 날짜 출력
                // $("#plusDate").html("선택하신 날짜는 " + datePrint + " 입니다.");
                $("#plusDate").attr("value",datePrint);
                $(this).css({ "background": "#d0b7b5" });

                alert("날짜를 선택하셨습니다.");

                $("#removeDate").show();
                // console.log(today.getDate());
                if (today.getDate() == $("td:[id ^= '" + today.getDate() + "']").text()) { //today.getDate() = 12 /  td의 값중에서 오늘 날짜가 포함된 값을 출력
                    $("#" + today.getDate() + "").css({ "background": "none" });
                }
            });

            // select_btn_date 버튼을 클릭시 화면을 reload(새로고침) 해준다.(야매)
            $("#select_btn_date").click(function () {
                $("#removeDate").hide();
                $("#calendar td").css({ "background": "none" });

                if (today.getDate() == $("td:[id ^= '" + today.getDate() + "']").text()) { //today.getDate() = 12 /  td의 값중에서 오늘 날짜가 포함된 값을 출력
                    $("#" + today.getDate() + "").css({ "background": "#d2c4b9" });
                }
                $("#plusDate").attr("value","변경할 날짜를 선택해 주세요.");
                
            });

            // time 클릭시 시간을 반환
            // 시간 클릭시 div화면을 가리고(투명도) 시간을 다시 선택하라는 버튼을 눌렀을시 초기화
            $("#order td").click(function () {
                var timeText = $(this).text(); // ex. 13:00
               var time = timeText.substring(0, 2); //12를 기준으로 오전,오후를 뽑아내기위한 변수 ex. 13:00 => 13
                // console.log(time);
                if (time <= 12) {
                    // $("#plusTime").html("선택하신 시간은 오전 " + timeText + " 입니다.");
                    $("#plusTime").attr("value","오전 "+timeText);
                } else {
                    // $("#plusTime").html("선택하신 시간은 오후 " + timeText + " 입니다.");
                    $("#plusTime").attr("value",timeText);
                } 
                $("#plusTime").attr("value","오후 "+timeText);
                $(this).css({ "background": "#d0b7b5" });
                alert("시간을 선택하셨습니다.");
                $("#removeTime").show();
            });
            // select_btn_time 버튼을 클릭시 화면을 reload(새로고침) 해준다.(야매)
            $("#select_btn_time").click(function () {
                $("#removeTime").hide();
                $("#order td").css({ "background": "none" });

                $("#plusTime").attr("value","변경할 시간을 선택해 주세요.");
            });
            
            

             /* 장례서비스 클릭시 div 색상 변경 */
             $("#showFS div").click(function(){
                  
  
                        	alert("장례 서비스를 선택하셨습니다.")
                            $(this).css({ "background": "#d0b7b5" });
                            $("#removeFS").show();
                            var select = $(this).text();
                            $("#funeralSelect").attr("value",select);
 
                    });

                    /* 장례서비스 다시 선택하기 버튼 클릭시 초기화 */
                    $("#select_btn_service").click(function(){
                        $("#removeFS").hide();
                        $("#showFS div").css({ "background": "none" });
                        $("#funeralSelect").attr("value","다시선택해주세요.");
                    });
					/* 장례용품 선택사항 수의용  */
                    $("#select1 tr td").click(function(){
                            $(this).css({ "background": "#d0b7b5" });
                            $("#removeSelect1").css({"visibility":"visible"});
                            var select1 = $(this).text();
                            $("#funeralSelect1").attr("value",select1);
                        });
                        $("#select_btn_select1").click(function(){
                            $("#removeSelect1").css({"visibility":"hidden"});
                            $("#select1 tr td").css({ "background": "none" });
                            $("#funeralSelect1").attr("value","다시선택해주세요.");
                        });
						/* 장례용품 선택사항 관용 */
                        $("#select2 tr td").click(function(){
                            $(this).css({ "background": "#d0b7b5" });
                            $("#removeSelect2").css({"visibility":"visible"});
                            var select2 = $(this).text();
                            $("#funeralSelect2").attr("value",select2);
                        });
                        $("#select_btn_select2").click(function(){
                            $("#removeSelect2").css({"visibility":"hidden"});
                            $("#select2 tr td").css({ "background": "none" });
                            $("#funeralSelect2").attr("value","다시선택해주세요.");
                        });
						/* 장례용품 선택사항 화장후 선택용 */
                        $("#select3 tr td").click(function(){
                            $(this).css({ "background": "#d0b7b5" });
                            $("#removeSelect3").css({"visibility":"visible"});
                            var select3 = $(this).text();
                            $("#funeralSelect3").attr("value",select3);
                        });
                        $("#select_btn_select3").click(function(){
                            $("#removeSelect3").css({"visibility":"hidden"});
                            $("#select3 tr td").css({ "background": "none" });
                            $("#funeralSelect3").attr("value","다시선택해주세요.");
                        });
        </script>
		<script>
            // 숫자외 다른 글자 입력시 바로 지우기            
            // function onlyNumber(event) {
            //     event = event || window.event;
            //     var keyID = (event.which) ? event.which : event.keyCode;
            //     if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 110 || keyID == 190)
            //         // 48~57 =1~9 || 96~105 = num 1~9 || 8 = backspace || 46 = delete ||  37 = 왼방향키 || 39 = 오른방향키 || 110 = 숫자패드. || 190 = 키보드.
            //         // https://blog.lael.be/post/75
            //         return;
            //     else
            //         return false;
            // }
            // function removeChar(event) {
            //     event = event || window.event;
            //     var keyID = (event.which) ? event.which : event.keyCode;
            //     if (keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 110 || keyID == 190)
            //         return;
            //     else
            //         event.target.value = event.target.value.replace(/[^0-9]/g, "");
            // }

            /* input=number maxLenght number의 maxLength가 안먹기때문에 함수로 실행해야한다. */
            function numberMaxLength(e){
                if(e.value.length > e.maxLength){
                    e.value = e.value.slice(0,e.maxLength);
                }
            }
            /* 한글 지우기 */
            function delHangle(e){
                // var removeK = e.srcElement || e.target;
                var values = event.srcElement.value; 
                //사용해서 동일한 함수를 가지고 여러가지 이벤트를 감지하는 방법하나의 함수만으로 어느곳에서 발생한 값인지 알수 있다.
                
                if(/[ㄱ-ㅎ ㅏ-ㅡ 가-핳 a-z A-Z]/g.test(values)){
                    e.srcElement.value=null;
                }
            }
            /* 숫자만 나오게 */
            function isNumberKey(e){
                // var KeyID = (e.which) ? e.which : event.keyCode;
                var values = event.srcElement.value;

                if(event.keyCode < 48 || event.keyCode > 57){
                    if(event.keyCode !=46){
                        return false;
                    }
                }
                /* 점이 두개 나올 경우 */
                var jum = /^\d*[.]\d*$/;
                if(jum.test(values)){
                    if(event.keyCode == 46){
                        alert("점을 두개이상 사용 함");
                        // document.getElementById("pWeight").value = null;
                        $("#pWeight").val("다시입력해주세요");
                        // $("#pWeight").val("");
                        return false;
                    }
                }
                /* 소수점 앞 두자리 */
                // var number2 = /^\d{2}$/;
                // if(number2.test(values)){
                //     if(KeyID != 46){
                //         // alert("두자리 이하의 숫자만 입력 가능");
                //         // $("#pWeight").val("");
                //         return false;
                //     }
                // }
                /* 소수점 뒤 한자리 */
                // var jam2 = /^\d*[.]\d{0}$/;
                // if(jam2.test(values)){
                //     // alert("소수 둘째자리까지만 입력 가능");
                //     return false;
                // }
                return false;
            }

            
        </script>

	</section>


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
</body>



<script>
    // 이용약관 전체동의
    $(function () {
        $("[name=agreeCheckAll]").click(function () {
            var bool = $(this).prop("checked");
            $("[name=agreeCheck1]").prop("checked", bool);
            $("[name=agreeCheck2]").prop("checked", bool);
            console.log(bool);
        });
    });
    // 하나라도 체크안할시 전체동의가 풀리도록
    $(function () {
        $("[name=agreeCheck2]").click(function () {
            var bool = $(this).prop("checked");
            if ($("[name=agreeCheck1]").prop("checked")) {
                $("[name=agreeCheckAll]").prop("checked", bool);
            } else {
                $("[name=agreeCheckAll]").prop("checked", false);
            }
        });
        $("[name=agreeCheck1]").click(function () {
            var bool = $(this).prop("checked");
            if ($("[name=agreeCheck2]").prop("checked")) {
                $("[name=agreeCheckAll]").prop("checked", bool);
            } else {
                $("[name=agreeCheckAll]").prop("checked", false);
            }
        });
    });



</script>

</html>