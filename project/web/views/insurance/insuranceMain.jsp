<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
    <style>
         /* 전체설정 */
         body{
            margin: 0px;
            padding: 0px;
            /* background: palevioletred; */
        }
        body *{
            font-family: 'Noto Sans KR', sans-serif;
            text-decoration: none;
        }
        /* href 링크 밑줄 및 색깔 수정*/
        #a {
            text-decoration: none;
        }
        
        #insSection input, #insSection select, #insSection textarea{
            border:1px solid #b3a193;
            border-radius: 3px;
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
        footer p{
            margin: 0px;
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
        #footerTable tr:nth-of-type(6) a{
            color:white;
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
            font-family: 'Noto Sans KR', sans-serif;
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
            margin:10px;
            cursor:pointer;
            font-size: 18px;
        }

        #headline>span:hover {
            background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
            color: #b3a193;
        }

        #headline>span:nth-of-type(1) {
            background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
            color: #b3a193;
        }

        /*혜윰보험 div 스타일 적용*/
        #infoHeader {
            font-size: 2em;
            font-weight: 500;
            padding-bottom: 10px;
            width: 890px;
            margin: auto;
        }

        #infoHeader :after {
            content: "";
            display: block;
            border-bottom: 3px solid #242424;
            width: 210px;
        }


        /* 영역 위치 조정용 */
        #area1{
            display: flex;
            margin:auto;
            width: 100%;
            /* background-color: aqua; */
        }
        #arrow{
            /* position: relative; */
           opacity: 0;
        }
        #arrow img{
            width: 30px;
            position: relative;
            top:225px;
        }
        /*보험소개, 보험료계산하기 div 스타일 적용*/
        #infoContent,
        #calculateIns {
            border-radius: 5px;
            border: 2px solid #242424;
            margin: 50px;
            margin-top: 10px;
            margin-bottom: 10px;
            opacity: 0;
        }

        /*보험소개 div 스타일적용*/
        #infoContent {
            position: relative;
            background-color: #d2c4b9;
            width: 1000px;
            height: 500px;
        }
        @media only screen and(max-width:1300px) {
            #infoContent,#arrow {
                display: none;
                margin-left:0px;
            }
        }
        #detailContent{
            position: relative;
            /* width:1000px; */
        }
        #detailText2>p{
            font-size: 30px;
            font-weight: 700;
            line-height: 35px;
            opacity: 0;
            z-index: 1;
            text-align: center;
            font-family: 'Nanum Myeongjo', serif;
            font-weight: 800px;
            color:white;
            width: 100%;
            background-color: rgba(24, 24, 24, 0.8);
            padding-top: 15px;
            padding-bottom: 15px;
            position: relative;
            top:-50px;
        }
        #detailText1{
            margin:30px;
            font-size: 25px;
            font-weight: 800;
            line-height: 40px;
            opacity: 0;
            z-index: 1;
            text-align: left;
        }
        #detailText1 p{
        }
        #contentImg1{
            position: absolute;
            top:110px;
            left:40px;
            opacity: 0;
        }
         #contentImg2{
            z-index: 0; 
            opacity:0.9; 
            position:absolute; 
            top:-30px; 
            left:0px;
            width:999px;
            height: 500px;
        }
        #calculateIns {
            background-color: #d2c4b9;
            width: 400px;
            height: 500px;
        }

        /*보험료 계산하기 div 내부 테이블 스타일 적용*/
        #calTable th {
            font-size: 2em;
        }

        #calTable li {
            font-size: 0.7em;
        }

        #calTable button {
            background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
            color: #b3a193;
            font-size: 16px;
            font-weight: 600;
            width: 210px;
            height: 50px;
            border-radius: 5px;
            border:none;
            box-shadow: 1px 1px 1px gray;
        }

        /*보험료 계산하기 모달창 스타일 적용*/
        .insmodal {
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
        .insmodal_pop {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 0px 10px 20px 15px;
            border: 2px solid #242424;
            width: 400px;
            height: 220px;
            border-radius: 8px;
        }
        .insmodal_pop table td{
           padding:10px; 
        }   
        /* 모달창 버튼 설정 */
        .insmodal_pop button{
            background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
            color: #242424;
            font-size: 14px;
            font-weight: 500;
            border: none;
            padding: 3px 10px 3px 10px;
            border-radius: 2px;
          /*   position:absoulte;
           	margin-bottom:-100px;  */
        }

        /* 보험료 계산하기 모달창 끄기(X)버튼 스타일 적용 */
        .insclose {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        /* 보험료 계산하기 모달창 스타일 적용*/
        .insclose:hover,
        .insclose:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        /*팝업창 글씨크기 지정*/
        #dogInfo td,
        #catInfo td {
            font-size: 14px;
        }
        
        button:hover{
		background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
		color: #b3a193;
		cursor:pointer;
		}
		
    </style>
    <!-- 노토 세리프 kr 폰트 불러오기 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@700&display=swap" rel="stylesheet">
    <!-- 나눔명조 폰트 불러오기 -->
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&display=swap" rel="stylesheet">
</head>
<body>
    <%@include file="../common/menubar.jsp"%> 
    <!--섹션 시작-->
    <section id="insSection">
        <div id="header-title">
            <p>HYEYUM INSURANCE</p>
        </div>

        <div id="headline">
            <span onclick="location.href='insuranceMain.jsp'">보험소개</span>
            <span onclick="location.href='insuranceContent.jsp'">보장내용</span>
            <span onclick="location.href='#'">가입안내</span>
        </div>

        <div id="fullContent">
            <div id="infoHeader">
                <p><img src="../../img/CS_icon4.png" width="40px" height="40px">&nbsp;혜윰보험</p>
            </div>
            
            <div id="area1">
                <div id="infoContent">
                    <div id="detailContent">
                        <img id="contentImg1" src="../../img/보험소개배경.png" width="300px" alt="">
                        <!-- <video style="z-index: 0; opacity:0.9; position:absolute; top:-29.5px; right:1px;" src="video/puppy.mp4" autoplay="autoplay" muted="muted"></video> -->
                        <div id="detailText1">
                            <p>우리 아이 건강을 위한<br>든든한 의료 실비보험!<br>
                                반려견, 반려묘의 의료비를<br> 든든하게 보장합니다</p>
                            </div>
                            <img id="contentImg2" src="../../img/dog-2299480.jpg" alt="">
                        <div id="detailText2">
                            <p>우리 아이 건강을 위한<br>든든한 의료 실비보험!<br>
                                <br>
                                반려견, 반려묘의 의료비를<br> 든든하게 보장합니다</p>
                        </div>
                        <br>
                    </div>
                </div>
                <div id="arrow">
                    <img src="../../img/insurence_Arrow.png" alt="">
                </div>
                <div id="calculateIns">
                    <table id="calTable" align="center" width="400px" height="500px">
                        <tr align="center">
                            <th colspan="2"><img src="../../img/question_mark-removebg-preview.png" width="30px"
                                    height="30px">&nbsp;보험료계산하기</th>
                        </tr>
                        <tr align="center">
                            <td><input type="radio" value="dog" name="pet" id="dog"><label for="dog"><img
                                        src="../../img/ins_dog-removebg-preview.png" width="80px" height="80px">반려견</label>
                            </td>
                            <td><input type="radio" value="cat" name="pet" id="cat"><label for="cat"><img
                                        src="../../img/ins_cat-removebg-preview.png" width="80px" height="80px">반려묘</label>
                            </td>
                        </tr>
                        <tr align="center">
                            <td colspan="2"><button value="submit" id="select" onclick="message();">가입 형태를 선택해주세요</button>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <ul style="text-align:left">
                                    <li>만 8세까지 가입이 가능하며, 재가입을 통해 만 20세까지 보장됩니다.</li>
                                    <li>과거 상해와 질병 이력이 있는 경우, 가입이 제한될 수 있습니다.</li>
                                    <li>반려동물의 종류와 연령에 따라 보장 가입이 제한될 수 있습니다.</li>
                                    <li>혜윰에서는 반려동물 중 반려견, 반려묘에 대해서만<br>보험 서비스를 제공하고 있습니다</li>
                                </ul>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>

        <!-- 보험료 계산하기 클릭 시 모달 창 띄우기-->
        <form action="<%=request.getContextPath()%>/calculate.ins" method="post" onsubmit="return validate1();">
        <div id="modal_dog" class="insmodal">

            <!-- 반려견 모달창 띄우기 -->
            <div class="insmodal_pop" align="center">
                <span class="insclose">&times;</span>

                <p id="title" style="font-weight: bold;"><img src="../../img/dogpaw-removebg-preview.png" width="40px"
                        height="40px">&nbsp;반려견의 정보를 입력해 주세요</p>
                <div id="information_dog">
                    <table id="dogInfo">
                        <tr>
                            <td colspan="2">반려견의 나이</td>
                            <td>
                            	<select id="dogAge" name="age">
                            		<option value="">--</option>
                            		<option value="1">만1세</option>
                            		<option value="2">만2세</option>
                            		<option value="3">만3세</option>
                            		<option value="4">만4세</option>
                            		<option value="5">만5세</option>
                            		<option value="6">만6세</option>
                            		<option value="7">만7세</option>
                            		<option value="8">만8세</option>
                            	</select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">반려견의 종류</td>
                            <td><input type="radio" id="dog1" name="animal" value="품종견"><label for="dog1">품종견</label>
                                &nbsp;&nbsp;&nbsp;
                                <input type="radio" id="dog2" name="animal" value="믹스견"><label for="dog2">믹스견</label>
                            </td>
                        </tr>
                    </table>
                </div>
                <br>
                <button id="cal_dog">이전</button>
                &nbsp;&nbsp;&nbsp;
                <button type="submit">보험료 계산하기</button>
            </div>
        </div>
        </form>

        <!-- 보험료 계산하기 클릭 시 모달 창 띄우기-->
        <form action="<%=request.getContextPath()%>/calculate.ins" method="post" onsubmit="return validate2();">
        <div id="modal_cat" class="insmodal">
 
            <!-- 반려묘 모달창 띄우기 -->
            <div class="insmodal_pop" align="center">
                <span class="insclose">&times;</span>

                <p id="title" style="font-weight: bold;"><img src="../../img/catpaw-removebg-preview.png" width="40px"
                        height="40px">반려묘의 정보를 입력해 주세요</p>
                <div id="information_cat">
                    <table id="catInfo">
                        <tr>
                            <td colspan="2">반려묘의 나이</td>
                            <td>
                            	<select id= "catAge" name="age">
                            		<option value="">--</option>
                            		<option value="1">만1세</option>
                            		<option value="2">만2세</option>
                            		<option value="3">만3세</option>
                            		<option value="4">만4세</option>
                            		<option value="5">만5세</option>
                            		<option value="6">만6세</option>
                            		<option value="7">만7세</option>
                            		<option value="8">만8세</option>
                            	</select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">반려묘의 종류</td>
                            <td><input type="radio" id="cat1" name="animal" value="품종묘"><label for="cat1">품종묘</label>
                                &nbsp;&nbsp;&nbsp;
                                <input type="radio" id="cat2" name="animal" value="믹스묘"><label for="cat2">믹스묘</label>
                            </td>
                        </tr>
                    </table>
                </div>
                <br>
                <button id="cal_cat">이전</button>
                &nbsp;&nbsp;&nbsp;
                <button type="submit">보험료 계산하기</button>
            </div>
		</div>
		</form>
    </section>
    
    <br><br>
    <!--풋터시작-->
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
                <td>
                    <a id="animalProtectSys"
                        href="https://www.animal.go.kr/f
                        ront/awtis/shop/undertaker1List.do?bizKnCd=&boardId=shop&pageSize=0&longitude=&latitude=&menuNo=6000000131&searchUprCd=&searchOrgCd=&searchCoNm=%ED%8E%AB%ED%8F%AC%EB%A0%88%EC%8A%A4%ED%8A%B8">
                        동물보호시스템
                    </a>
                </td>
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
            해윰 | 사업자등록번호 : 0123456789호 | 동물장묘업 등록번호 | 대표자 : 배혜린
            <br>
            Copyright © 2020-2020 hyeyum Institute All Right Reserved
        </p>
    </footer>

    <!--동적제어 시작-->
    <script>
        // 반려동물 종류 미선택 시 메세지 띄우기
        function message() {
            alert("반려동물의 종류를 선택하세요");
        };
        // 라디오버튼 선택 시 버튼 문구 변경
        $(function () {
            // 반려견 라디오버튼 선택 시 버튼 문구 변경
            $("#dog").change(function () {

                var result = $(this).prop('checked')

                if (result) {
                    $('#select').html('보험료 계산하기');
                }

                // 모달창 세팅
                var modal_dog = document.getElementById('modal_dog');

                var select = document.getElementById("select");

                var span = document.getElementsByClassName("insclose")[0];

                var cal_dog = document.getElementById("cal_dog");

                // 보험료 계산하기 클릭 시 모달 창 띄우기
                select.onclick = function () {
                    modal_dog.style.display = "block";
                }

                // 끄기(X)버튼 누르면 모달창 끄기
                span.onclick = function () {
                    modal_dog.style.display = "none";
                }

                // 끄기(X)버튼 이외의 공간 누르면 모달창 끄기
                window.onclick = function (event) {
                    if (event.target == modal_dog) {
                        modal_dog.style.display = "none";
                    }
                }

                cal_dog.onclick = function () {
                    modal_dog.style.display = "none";
                }
            });
        });

        //반려견 종류 선택 모달 창 속성 설정
        function validate1() {
        	if(<%=request.getSession().getAttribute("userId")==null&&request.getSession().getAttribute("loginUser")==null%>){
        		alert('보험에 가입하려면 로그인을 하셔야 합니다');
        		return false;
        	}
        	
            var result1 = $("#dog1").prop("checked");
            var result2 = $("#dog2").prop("checked");

            var result3 = $("#dogAge").val();

            /* var regExp = /^[0-9]{8}$/ */
	
           	
            if (result3 == "") {
                alert("반려견의 나이를 선택하세요");
                return false;
            } else if (result1 || result2) {
                location.href = "insuranceConfirm.html";
            } else {
                alert("반려견의 종류를 선택하세요");
                return false;
            }
        };

        // 라디오버튼 선택 시 버튼 문구 변경
        $(function () {
            // 반려묘 라디오버튼 선택 시 버튼 문구 변경
            $(function () {
                $("#cat").change(function () {
                    var result = $(this).prop('checked')
                    if (result) {
                        $('#select').html('보험료 계산하기');
                    }

                    // 모달창 세팅
                    var modal_cat = document.getElementById('modal_cat');

                    var select = document.getElementById("select");

                    var span = document.getElementsByClassName("insclose")[1];

                    var cal_cat = document.getElementById("cal_cat");

                    // 보험료 계산하기 클릭 시 모달 창 띄우기
                    select.onclick = function () {
                        modal_cat.style.display = "block";
                    }

                    // 끄기(X)버튼 누르면 모달창 끄기
                    span.onclick = function () {
                        modal_cat.style.display = "none";
                    }

                    // 끄기(X)버튼 이외의 공간 누르면 모달창 끄기
                    window.onclick = function (event) {
                        if (event.target == modal_cat) {
                            modal_cat.style.display = "none";
                        }
                    }

                    cal_cat.onclick = function () {
                        modal_cat.style.display = "none";
                    }
                });
            });
        })

        //반려묘 종류 선택 모달 창 속성 설정
       	
        function validate2(){
        	if(<%=request.getSession().getAttribute("userId")==null&&request.getSession().getAttribute("loginUser")==null%>){
        		alert('보험에 가입하려면 로그인을 하셔야 합니다');
        		return false;
        	}
        	
           	var result1 = $("#cat1").prop("checked");
            var result2 = $("#cat2").prop("checked"); 

            var result3 = $("#catAge").val();

           /* var regExp = /^[0-9]{8}$/ */

            if (result3 == "") {
                alert("반려묘의 나이를 선택하세요");
                return false;
            } else if (result1 || result2) {
                location.href = "<%=request.getContextPath()%>/calculate.ins";
            } else {
                alert("반려묘의 종류를 선택하세요");
                return false;
            }
           
        };

       
        // $(window).resize(function(){
        //     $('#infoContent').css('margin-left', '0px')
        // })
        
        
        // 효과
        $('#infoContent').css('left', '250px').css('opacity', '0').css('transition', '2s');
        window.setTimeout(function(){
            $('#infoContent').css('left', '200px').css('opacity', '1');
        }, 1000);
        window.setTimeout(function(){
            $('#detailText2 p').css('opacity', '1').css('transition', '1s');
        }, 3000);

        window.setTimeout(function(){
            $('#detailText2 p').css('opacity', '0')
        },7000);
        // if($('html').innerWidth()<=1300){
        //     $('#infoContent').animate({'margin-left':'0px', 'position': 'relative','left':'0px','width': '400px','height': '500px'},9000,'linear');
        // }else{
            $('#infoContent').animate({'margin-left':'300px', 'position': 'relative','left':'0px','width': '400px','height': '500px'},9000,'linear');
        // }
        window.setTimeout(function(){
            $('#contentImg2').css('opacity', '0');
            $('#contentImg2').css('display', 'none');
            $('#contentImg1').css('opacity', '0.5').css('transition', '4s');
            $('#arrow').css('opacity', '1').css('transition', '2s');
            $('#calculateIns').css('opacity', '1').css('transition', '2s');
            $('#detailText1').css('text-align', 'center').css('opacity', '1').css('transition', '1s');
        }, 9000);
        window.setTimeout(function(){
        }, 9000);

    </script>

</body>

</html>