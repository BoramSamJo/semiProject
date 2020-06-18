<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="ko">
<head>
    <title></title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
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

        /* 장례용품 타이틀 설정 */
        #goodsTitle{
            background-color: #242424;
            background: -webkit-linear-gradient(top, #3d3d3d, #242424);
            padding: 20px;
            margin: 0px;
            font-size: 25px;
            color: #d2c4b9 ;
        }

        /* 한페이지 크기 */
        #bg_Main {
            height: 560px;
            background-image: url("../../img/장례용품 사진/배경/main.PNG");
            background-size: cover;
            
        }
        #bg_Main>p:nth-child(1){
            margin: 0px;
            color:#b3a193;
            font-size: 40px;
            padding-top: 160px;
        }
        #bg_Main>div{
           display: flex;
           width: 800px;
           margin: auto;
           margin-top: 40px;
           /* background-color: blue; */
        }
        #bg_Main>div>div{
           background-color: #b3a193;
           background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
           width: 100px;
           height: 43px;
           margin: auto;
           padding: 17px 0px 0px 0px;
           border-radius: 10px;
        }
        #bg_Main>div>div>a{
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
        #bg_Collection *{
            font-family: 'Nanum Myeongjo', serif;
        }
        #bg_Collection #content{
            line-height: 50px;
            position: absolute;
            top:180px;
            z-index: 1;
        }
        #bg_Collection #title{
            padding-top: 70px;
        }
        #bg_Collection img{
            position: absolute;
            top:420px;
            right:80px;
        }

        /*수의 background*/
        #bg_Shroud {
            height: 690px;
            position: relative;
            background-image: url("../../img/장례용품 사진/배경/Shroud(수의).PNG");
            background-size: cover;
        }
        #bg_Shroud *{
            font-family: 'Nanum Myeongjo', serif;
        }
        #bg_Shroud p{
            margin-top: 0px;
        }
        #bg_Shroud #content{
            line-height: 50px;
            position: absolute;
            top:200px;
            z-index: 1;
        }
        #bg_Shroud #title{
            padding-top: 100px;
        }
        #shroud1{
            position: absolute;
            top:350px;
            right:450px;
        }
        #shroud2{
            position: absolute;
            top:350px;
            right:80px;
        }
        [id^=shroud]>p{
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
        #bg_Coffin *{
            font-family: 'Nanum Myeongjo', serif;
        }
        #bg_Coffin p{
            margin-top: 0px;
        }
        #bg_Coffin #content{
            line-height: 50px;
            position: absolute;
            top:200px;
            z-index: 1;
        }
        #bg_Coffin #title{
            padding-top: 100px;
        }
        #coffin1{
            position: absolute;
            top:360px;
            right:450px;
        }
        #coffin2{
            position: absolute;
            top:360px;
            right:80px;
        }
        [id^=coffin]>p{
            margin: 0px;
            font-weight: 800;
            font-size: large;
            padding-top: 10px;
        }

        /*유골함 background*/
        #bg_Eco_Friendly {
            height: 690px;
            background-image: url("./../img/장례용품 사진/배경/Eco-Friendly(유골함).PNG");
            background-size: cover;
            position: relative;
        }
        #bg_Eco_Friendly *{
            font-family: 'Nanum Myeongjo', serif;
            color: #b3a193;
        }
        #bg_Eco_Friendly #underline{
            border-bottom: 15px solid #b3a193;
        }
        #bg_Eco_Friendly p{
            margin-top: 0px;
        }
        #bg_Eco_Friendly #content{
            line-height: 50px;
            position: absolute;
            top:200px;
            z-index: 1;
        }
        #bg_Eco_Friendly #title{
            padding-top: 100px;
        }
        #boneHouse1{
            position: absolute;
            top:360px;
            right:450px;
        }
        #boneHouse2{
            position: absolute;
            top:360px;
            right:80px;
        }
        [id^=boneHouse]>p{
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
        #bg_Lucete *{
            font-family: 'Nanum Myeongjo', serif;
            color: white;
        }
        #bg_Lucete p{
            margin-top: 0px;
        }
        #bg_Lucete #content{
            line-height: 50px;
            position: absolute;
            top:200px;
            z-index: 1;
        }
        #bg_Lucete #title{
            padding-top: 100px;
        }

        /*액자 background*/
        #bg_Photo_Frame {
            height: 690px;
            background-image: url("../../img/장례용품 사진/배경/Photo Frame(액자).PNG");
            background-size: cover;
            position: relative;
        }
        #bg_Photo_Frame *{
            font-family: 'Nanum Myeongjo', serif;
        }
        #bg_Photo_Frame p{
            margin-top: 0px;
        }
        #bg_Photo_Frame #content{
            line-height: 50px;
            position: absolute;
            top:200px;
            z-index: 1;
        }
        #bg_Photo_Frame #title{
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
        #img{
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

    </style>
    <!-- 노토산스kr 폰트 가져오기 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <!-- 나눔명조 폰트 가져오기 -->
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700;800&display=swap" rel="stylesheet">
</head>

<body>
   <%@include file="../common/menubar.jsp" %>
    <!-- section 시작 -->
    <section id="section">
        <div id="center">
            
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

            <h1 id="goodsTitle">장례 용품</h1>
            <div id="bg_Main">
                <p>사랑하는 반려동물을 위한 특별한 선물</p>
                <div id="menubar">
                    <div><a id="a" href="#11">수의 </a></div>
                    <div><a id="a" href="#bg_Coffin">관 </a></div>
                    <div><a id="a" href="#bg_Eco_Friendly">유골함 </a></div>
                    <div><a id="a" href="#bg_Lucete">LUCETE </a></div>
                    <div><a id="a" href="#bg_Photo_Frame">액자 </a></div>
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
                    <p>혜윰 제품들은 최고급 소재로 손수 제작되었습니다.<br>
                        혜윰은 당신을 기억한다는 의미로 아이들과의<br>
                        소중한 추억을 잊지 않기 위해서 준비되었습니다.</p>
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
                        <p>혜움 수의는 명주,인견 소재로 제작되어 있습니다.<br>
                            제작 시 이음과 재단을 포함한 모든 과정이<br> 
                            손수 제작된 최고급 수의 입니다.</p>
                    </div>
                </div>
                <div id="11">
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
                    <p>혜윰관은 최고급 오동나무 소재로 제작 되었으며,<br>
                        혜윰 자체 디자인 및 목공장인의 수작업으로 제작된 최고급 관입니다.<br>
                        오동나무관은 습기에 강하고 가벼우며<br>
                        세균의 침투를 막아주는 것이 특징입니다.</p>
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
                    <p>혜윰 친환경 유골함은 장소에 구애 받지 않고<br> 
                        영구적으로 보관할 수 있습니다.<br>
                        또한, 땅에 묻을 경우 흙속에서 공기,수분 등에 의해<br> 
                        완전 분해될 수 있도록 한것이며,<br>
                        부패 및 곰팡이 및 악취발생, 벌레 등<br> 
                        문제가 생기는 것을 방지 할 수 있습니다.</p>
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
                    <p><b>LUCETE</b><br>
                        밝게 빛나라 : spanish(Latin)<br><br>
                        혜윰의 LUCETE는, 소중한 추억들이 가장 아름답게 간직 할 수 있는 방법입니다.<br>
                        아이와의 추억이 영원할 수 있도록 혜윰에서 준비했습니다.<br>
                        가장 순수하게, 가장 가치있게, 영원히 함께 빛 날 수 있습니다.
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
                    <p>예식 후 아이를 기억하기 위한 최고급 레드오크 소재로<br>
                        제작된 액자를 제작해 드립니다.</p>
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