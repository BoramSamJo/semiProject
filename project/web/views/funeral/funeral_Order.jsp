<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko">

<head>
    <title></title>
    <script src="http://code.jquery.com/jquery-latest.min.js">최신</script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
        rel="stylesheet">
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
        #funeralProcessArea {
            background-color: #d2c4b9;
        }

        /* 절차별 타이틀 설정 */
        .processTitle{
            font-family: 'Nanum Myeongjo', serif;
            padding: 35px;
            font-weight: 500;
            border-bottom: 2px solid #242424;
        }

        /* 맨위 장례서비스 종류(장례 비용, 장례 절차, 장례 용품)*/
        #funeral_menu {
            padding-top: 105px;
        }
        #funeral_menu_Inner{
            display: flex;
            text-align: center;
            width: 850px;
            margin: auto;
            /* background-color: aqua; */
        }
        #funeral_menu>div>div{
            margin:10px 20px 10px 20px;
            border: none;
            padding: 15px 45px 15px 45px;
            border-radius: 10px;
            width: 100px;
            background-color: #b3a193;
            background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
        }
        #funeral_menu>div>div:hover{
            background: -webkit-linear-gradient(top, #3d3d3d, #242424);
        }
        #funeral_menu>div>div:hover a{
            color: #b3a193;
        }
        #funeral_menu div a{
            color:#242424;
            font-weight: 700;
            font-size: 20px;
        }

        /* 장례절차 타이틀 설정 */
        #funeralProcessArea{
            background-color: #d2c4b9;
            padding-bottom: 50px;;
        }
        #funeralProcessTitle{
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
        #funeralProcessTable img{
            border-radius: 2px;
        }
        #funeralProcessTable td, #funeralProcessTable tr{
            border:none;
        }
        #funeralProcessTable tr:nth-of-type(5) td:nth-of-type(2),
        #funeralProcessTable tr:nth-of-type(9) td:nth-of-type(2),
        #funeralProcessTable tr:nth-of-type(1) td:nth-of-type(2){
            border-bottom:2px solid black;
        }
        #funeralProcessTable tr:nth-of-type(3) td:nth-of-type(2),
        #funeralProcessTable tr:nth-of-type(7) td:nth-of-type(2){
            border-bottom:2px solid #b3a193;
        }
        #funeralProcessTable tr:nth-of-type(1) td:nth-of-type(1){
            border-top-left-radius: 10px;
        }
        #funeralProcessTable tr:nth-of-type(1) td:nth-of-type(2){
            border-top-right-radius: 10px;
        }
        #funeralProcessTable tr:nth-of-type(9) td:nth-of-type(1){
            border-bottom-left-radius: 10px;
        }
        #funeralProcessTable tr:nth-of-type(10) td:nth-of-type(1){
            border-bottom-right-radius: 10px;
        }
        #funeralProcessTable p{
            margin: 0px;
        }

        /* 테이블영역 각각 색상주기 */
        #funeralProcessTable{
            color: #242424;
            border-spacing: inherit;
        }
        #funeralProcessTable tr:nth-of-type(1),#funeralProcessTable tr:nth-of-type(2){
            background-color: #b3a193;
        }
        #tel{
            display: inline-block;
            background-color: #383737;
            color: #b3a193;
            width: 45px;
            text-align: center;
        }
        #funeralProcessTable tr:nth-of-type(3),#funeralProcessTable tr:nth-of-type(4){
            background-color: #383737;
            color: #b3a193;
        }
        #funeralProcessTable tr:nth-of-type(5),#funeralProcessTable tr:nth-of-type(6){
            background-color: #b3a193;
        }
        #funeralProcessTable tr:nth-of-type(7),#funeralProcessTable tr:nth-of-type(8){
            background-color: #383737;
            color: #b3a193;
        }
        #funeralProcessTable tr:nth-of-type(9),#funeralProcessTable tr:nth-of-type(10){
            background-color: #b3a193;
        }
        #funeralProcessTable tr{
            height: 100px;
            /* margin: 20px; */
        }
        #funeralProcessTable td,
        #funeralProcessTable td p,
        #funeralProcessTable th {
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
    </style>
    <!-- 나눔명조 폰트 가져오기 -->
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700;800&display=swap" rel="stylesheet">
     <!-- 노토산스kr 폰트 가져오기 -->
     <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
</head>

<body>
    <%@include file="../common/menubar.jsp" %>

    <section id="funeralProcessSection">
        <div style="margin: auto;">
            <div id="funeral_menu">
                <div id="funeral_menu_Inner">
                    <div>
                        <a  target="_self" onclick="location.href='funeral_Price.jsp'">장례 비용</a>
                    </div >
                    <div>
                        <a  target="_self" onclick="location.href='funeral_Order.jsp'">장례 절차</a>
                    </div>
                    <div>
                        <a  target="_self" onclick="location.href='funeral_Goods.jsp'">장례 용품</a>
                    </div>
                    <div>
                        <a target="_self" onclick="location.href='funeral_Lucete.jsp'">LUCETE</a>
                    </div>
                </div>
            </div>

            <div id="funeral_service">
                <br><br>
                <div id="funeralProcessArea">
                    <h1 id="funeralProcessTitle">장례 절차</h1>
                    <div>
                        <table id="funeralProcessTable">
                            <!-- 1. 콜센터 및 상담 -->
                            <tr>
                                <td rowspan="2"><img src="../../img/콜센터.jpg"></td>
                                <td style="font-size: 30px;" class="processTitle">1. 콜센터 및 상담</td>
                            </tr>
                            <tr>
                                <td id="content">
                                    <p> 반려동물이 무지개 다리를 건너면 우선 깨끗한 타월에 감싸 줍니다.<br>
                                        다만 너무 뜨거운(온돌및 직사광선)장소에 있지말고 서늘한 곳에 한치해 주시는 것이 좋습니다.<br>
                                        반려동물 떠나 보낼 마음의 준비가 되어있다면<br> 
                                        반려동물 장례식장 혜윰에 연락주시면 장례 일정을 잡아드립니다.
                                    </p>
                                    <p><span id="tel">TEL</span>&nbsp;&nbsp;&nbsp;&nbsp;010-4033-4458</p>
                                </td>
                            </tr>

                            <!-- 2. 입관식/추모식 -->
                            <tr>
                                <td rowspan="2"><img src="../../img/장례절차 사진/추모실.PNG"></td>
                                <td style="font-size: 30px;" class="processTitle">2. 입관/추모식</td>
                            </tr>
                            <tr>
                                <td id="content">
                                    <p> 화장터에 도착하시면 안내원에 따라 간단한 서류를 작성합니다.<br>
                                        동물 등록이 되어 있으신 분들은 화장 증명서를 발급 해드리니,
                                        가까운 동사무소에서 등록을 말소 하셔야 합니다.<br>
                                        서류를 작성하시면 마지막으로 사랑했던 아이와의 마지막 인사를 하게 됩니다.<br>
                                        독립된 추모 공간에서 사랑했던 지난 날들을 떠올리며 마지막 인사를 하게 됩니다.<br>
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
                                    <p> 추모식을 마치면 반려동물 전용 화장로로 이동하여 화장을 진행하게 됩니다.<br>
                                        화장하는 과정은 모두 참관 가능하며 철저한 개별 화장으로 진행 되고 있습니다.<br>
                                        화장은 5KG 기준으로 30~40분 정도의 시간이 소요됩니다.<br>
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
                                    <p> 화장을 마치고 유골은 수습하여 곱게 분골하여 친환경 유골함에 담아 전달해 드리고 있습니다.<br>
                                        납골당에 안치를 선택하신 고객님은 납골당에 안치하게 되며,<br>
                                        친환경 유골함이기 때문에 땅에 묻어도 썩지 않기 때문에 오랜 보관이 가능합니다.<br>
                                        봉안당에 안치를 선택하신 고객님께서는 유골함과 함께 보관되며,<br>
                                        메모리얼 스톤을 선택하신 보호자님은 바로 제작에 들어 가게 됩니다.
                                    </p>
                                </td>
                            </tr>
                            <!-- 5. 친환경 유골함 및 메모리얼 스톤 -->
                            <tr>
                                <td rowspan="2"><img src="../../img/메모리얼스톤2.jpg"></td>
                                <td style="font-size: 30px;" class="processTitle"> 선택 사항</td>
                            </tr>
                            <tr>
                                <td id="content">
                                    <p> <b> - 봉안당</b><br>
                                        혜윰은 24시간 유골에 손상이 가지않는 최적 온도로 365일 24시간 유지되고 있어<br>
                                        우리 사랑하는 아이를 보고 싶을 때 언제든 방문 하셔도 됩니다.<br>
                                        <b> - 메모리얼 스톤</b><br>
                                        100%유골로 만들어 반려동물의 결정체이며 제작 소요 시간은 1시간입니다.<br>
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
                <td>
                    <a id="animalProtectSys"
                        href="https://www.animal.go.kr/front/awtis/shop/undertaker1List.do?bizKnCd=&boardId=shop&pageSize=0&longitude=&latitude=&menuNo=6000000131&searchUprCd=&searchOrgCd=&searchCoNm=%ED%8E%AB%ED%8F%AC%EB%A0%88%EC%8A%A4%ED%8A%B8">
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
                <td><a href="" style="color: white;">오시는길</a></td>
                <td><a href="" style="color: white;">사이트맵</a></td>
                <td><a href="" style="color: white;">개인정보 처리방침</a></td>
                <td><a href="" style="color: white;">이용약관</a></td>
            </tr>
        </table>
        <p id="footerP" style="margin: 0;">
            해윰 | 사업자등록번호 : 0123456789호 | 동물장묘업 등록번호 | 대표자 : 배혜린
            <br>
            Copyright © 2020-2020 hyeyum Institute All Right Reserved
        </p>
    </footer>

</body>

</html>