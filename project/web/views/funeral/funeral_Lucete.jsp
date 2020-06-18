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

        /* LUCETE 타이틀 설정 */
        #luceteTitle{
            background-color: #242424;
            background: -webkit-linear-gradient(top, #3d3d3d, #242424);
            padding: 20px;
            margin: 0px;
            font-size: 25px;
            color: #d2c4b9 ;
        }

        /*스톤 background*/
        #bg_Lucete {
            height: 590px;
            position: relative;
        }
        #bg_Lucete img{
            position: absolute;
            top: 0px;
            left: 0px;
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
        #bg_Lucete #underline{
            position: relative;
            z-index: 100;
        }
        #bg_Lucete #title{
            padding-top: 100px;
            z-index: 100;
        }

        /*스톤 특징 background*/
        #bg_Lucete_Characteristics{
            height: 890px;
            background-image: url("../../img/LUCETE/2.PNG");
            background-size: cover;
        }
        #bg_Lucete_Characteristics *{
            font-family: 'Nanum Myeongjo', serif;
            color: rgb(63, 62, 62);
        }
        #bg_Lucete_Characteristics #underline{
            margin-top: 110px;
            border-bottom: 15px solid rgb(63, 62, 62);
        }
        #bg_Lucete_Characteristics #content{
            line-height: 50px;
            z-index: 1;
            margin-top: 100px;
        }

        /*스톤 장점 background*/
        #bg_Lucete_Advantage{
            height: 690px;
            background-image: url("../../img/LUCETE/4.png");
            background-size: cover;
        }
        #bg_Lucete_Advantage *{
            font-family: 'Nanum Myeongjo', serif;
            color: white;
        }
        #bg_Lucete_Advantage #underline{
            border-bottom: 15px solid white;
        }
        #bg_Lucete_Advantage #content{
            line-height: 50px;
            z-index: 1;
            margin-top: 100px;
        }

        /*스톤 필요성 backgroud*/
        #bg_Lucete_Necessity{
            height: 650px;
            position: relative;
            background-image: url("../../img/LUCETE/3.PNG");
        }
        #bg_Lucete_Necessity *{
            font-family: 'Nanum Myeongjo', serif;
            color: white;
        }
        #bg_Lucete_Necessity #content{
            line-height: 50px;
            z-index: 100;
            margin-top: 100px;
        }
        #bg_Lucete_Necessity>img{
            position: absolute;
            top:0px;
            left:0px;
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
        }
    </style>
    <!-- 나눔명조 폰트 가져오기 -->
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700;800&display=swap" rel="stylesheet">
</head>
<body>
<%@include file="../common/menubar.jsp" %>
<!-- section 시작 -->
<section>
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
    <div id="center">
        <h1  id="luceteTitle" style="text-align: center;">혜 윰 LUCETE</h1>
        
            <div id="bg_Lucete">
                <div>
                    <div id="underline">
                        <div>
                            <p id="title" style="color: white;">혜 윰 LUCETE&nbsp;-&nbsp;메모리얼 스톤</p>
                        </div>
                    </div>
                </div>
                <div id="content" style="color: white;">
                    <p><b>LUCETE</b><br>
                        밝게 빛나라 : spanish(Latin)<br><br>
                        혜윰의 LUCETE는, 소중한 추억들이 가장 아름답게 간직 할 수 있는 방법입니다.<br>
                        아이와의 추억이 영원할 수 있도록 혜윰에서 준비했습니다.<br>
                        가장 순수하게, 가장 가치있게, 영원히 함께 빛 날 수 있습니다.
                    </p>
                </div>
                <img src="../../img/장례용품 사진/배경/Lucete(스톤).PNG" width="1900px" height="690" alt="">
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
                    <p> 1. 부패, 냄새 변형이 없는 유리화된 무기물입니다.<br>
                        2. 사리(참된 수행의 결과로 생겨나는 구슬모양의 유골) 후 미관상 아름답습니다.<br>
                        3. 반지, 목걸이 등 악세사리에 부착이 가능한 준보석입니다.
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
                    <p> 1. LUCETE로 소중한 우리아이의 기억을 떠올려 사별에 따른 비탄의 심리치유가 가능한 효과가 있습니다.<br>
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
                    <p> 1. 화장 후 납골당, 봉안당의 유골의 부패, 해충서식, 시멘트화 현상으로 보관이 어려울 수 있습니다.<br>
                        2. 사회적 비용증가 및 화장 문화의 의미가 퇴색되었습니다.<br>
                        3. 애완동물주들에게 슬픔을 승화 시켜 줍니다.
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