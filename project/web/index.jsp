<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.vo.Member, javax.servlet.http.Cookie"%>
<%
	Member loginUser = (Member)request.getSession().getAttribute("loginUser");
	
	Cookie[] cookies = request.getCookies();
	if(cookies!=null&&cookies.length>0){
		for(int i = 0; i < cookies.length; i++){
			if(cookies[i].getName().equals("loginCookie")){
				if(loginUser==null){
					//자동로그인시 loginUser나 세션에 id만 들어있도록 해놨으므로
					//추후 모든건 회원 아이디(userId라는 이름의 세션값)로만 데이터를 불러오게 해야한다
					request.getSession().setAttribute("userId", cookies[i].getValue());
					loginUser = new Member();
					loginUser.setmId(cookies[i].getValue());
					System.out.println(loginUser);
				}
			}
		}
	}
%>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>

        <meta charset="utf-8">
        <title>thekenwheeler.com</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width">
        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->

        <!-- build:css styles/main.css -->

        <!-- 이거보면 섹션바뀌는거 알수있음 -->
        <link rel="stylesheet" href="stylesheets/screen.css"> 
        <!-- endbuild -->
        <!-- build:js scripts/vendor/modernizr.js -->
         <!-- 브라우저 기능검사 -->
        <script src="http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.7.1/modernizr.min.js"></script>
        <!-- 섹션구분 원형의 css -->
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> 
        <!-- endbuild -->
        <style>
             /* 전체 설정 */
        body{
            margin: 0px;
            padding: 0px;
            /* background: palevioletred; */
        }
        body *{
            font-family: 'Noto Sans KR', sans-serif;
            text-decoration: none;
        }
            /* 로고제외 모든 배경이미지 크기 설정 */
            /* img:not(.logo){
                width: 100%;
                height: 100%;
            } */
            .sectionbar{
                width: 15px;
                height: 110px;
                position: absolute;
                top: 50%;
                right: 1%;
                z-index: 999;
                background: black;
                border-radius: 10px;
            }
             /* 전체 글씨체 지정 */
             body *{
                font-family: 'Noto Sans KR', sans-serif;
            }

           /* 사이드 스크롤 표시 바 */
           #fp-nav{
                width: 44px;
                height: 150px;

                border-radius: 20px;

                background-color: white;

                position: fixed;
                position: absolute;
                top:300px;
                right: -100px;

                z-index: 100;

                box-shadow: 2px 2px 7px rgb(51, 51, 51);
           }
           #fp-nav li, #fp-nav ul{
                font-family: none;
           }
           
           /* 헤더 설정 */
           header{
               position: absolute;
               position: fixed;
               top: 0.1;
               z-index: 1;
               width: 100%;
           }
           header *{
            list-style: none;
           }
            /* fixed 예약버튼 설정 */
            #reservation{
                width:45px;
                height: 45px;
                right: 8%;
                top:620px;
                position: relative;
                position: fixed;
                z-index: 9999999999;
                background-color: #b3a193;
                background-color: white;
            
                opacity: 1;
                text-align: center;
                
                margin: 0px;
                padding: 0px;
                border: 2px solid #b3a193;
                border-radius: 100px;

                opacity: 0;
            }
            #reservation a{
                position: absolute;
                left:0;
                top:0;
                width:40px;
                height: 40px;
                border-radius: 100px;
                text-indent:2px;
                line-height: 40px;
                color: #242424;
                color: #b3a193;
                font-weight: bolder;
                text-decoration: none;
                font-size: 16px;
                font-family: 'Noto Sans KR', sans-serif;
            }

           /* 1슬라이드 설정 시작-----------------------------------------------*/
           /* 1슬라이드 커버 */
           .s1Cover{
               background-color: rgb(63, 39, 33);
               opacity: 0.3;
               position: absolute;
               top:0px;
               width: 100%;
               height: 750px;
               text-align: center;
           }
           /* 1 슬라이드 문구1 */
           #s1Text1{
               color:white;
               font-size: 35px;
               font-weight: 400;
               position: absolute;
               top:290px;
               left:300px;
               opacity: 0;
               transition: 2s;
               z-index: 1;
               font-family: 'Nanum Myeongjo', serif;
           }
           /* 1 슬라이드 문구2 */
           #s1Text2{
               color:white;
               font-size: 35px;
               font-weight: 400;
               position: absolute;
               top:380px;
               left:300px;
               align-items: center;
               opacity: 0;
               transition: 2s;
               font-family: 'Nanum Myeongjo', serif;
           }
           #s1Text3{
               color:white;
               font-size: 35px;
               font-weight: 400;
               position: absolute;
               top:290px;
               left:300px;
               align-items: center;
               opacity: 0;
               transition: 2s;
               font-family: 'Nanum Myeongjo', serif;
           }
           /* 1슬라이드 수평선 */
           #diamond {
            width: 0;
            height: 0px;
            border: 1px solid transparent;
            border-bottom: 1px solid white;
            z-index: 3;
            position: relative;
            /* top:50px; */
            margin: 0px;
            transition: 2s;
            }
            #diamond:after {
            content: '';
            position: absolute;
            width: 0;
            height: 0px;
            top: 1px;
            left: -1px;
            border: 1px solid transparent;
            border-top: 1px solid white;
            }
            /* 1슬라이드 비디오 설정 */
            #s1Video1{
               position: relative;
               top:-110px;
           }
           #s1Main{
               width: 100%;
               position: absolute;
               top:0px;
               left:1600px;
               background-color: #242424;
           }
           #s1Main img{
                width: 100%;
                opacity: 0;
                transition: 1.5s;
           }
           /* 2슬라이드 시작 ------------------------------------------------*/
           /* 전체 설정 */
           .s2Cover{
               background-color: white;
               width: 100%;
               text-align: center;
               align-items: center;
               margin: 0;
               padding: 0;
               padding-top: 120px;
               padding-bottom: 20px;
           }
           /* 타이틀설정 */
           #s2Title{
            font-weight: 600;
            color: #242424;
            margin: 0px;
           }
           
           /* 시설안내 슬라이드부분 전체설정 */
           .s2SlideImgs{
               width: 100%;
               display: flex;
           }
           /* 시설안내 슬라이드 각 파트별 설정(주차장/내부시설/납골당) */
           .s2SlideImgs>div{
            display: flex;
            height: 400px;
            text-align: center;
           }
           /* 주차장 파트 설정 */
           #s2OuterBuilding{
            position: relative;
            left:0px;
             width: 100%;
           }
           #s2OuterBuilding>img{
             width: 60%;
             margin: auto;
           }
           /* 내부시설 파트 설정 */
           #s2InnerBuilding{
            position: absolute;
            left:1600px;
            width: 100%;
           
            }
            #s2InnerBuilding>img{
             width: 50%;
             margin: auto;
           }
            /* 납골당 파트 설정 */
            #s2NapGol{
                position: absolute;
                width: 100%;
                left:3200px;
            }
            #s2NapGol>img{
             width: 33%;
             margin: auto;
           }
           [id^=s2SlideImg]{
            width: 100px;
           }
           /* 시설안내 하단 작은이미지 설정 */
           #s2Imgs{
            display: flex;
           }
           [id^=s2Building]{
             width:24%;
             position: relative;
             height: 200px;
             margin-top: 20px;
           }
           .s2Cover>p{
               position: relative;
                z-index: 99999;
                /* background-color: teal; */
                box-sizing: border-box;
                color: #695f58;
                font-weight: 500;
            }
           @media only screen and (max-width: 1100px) {
            /* 시설안내 큰 이미지들 크기 조정 */
            .s2SlideImgs>div>img{
                height: 300px;
            }
           
            /* 시설안내 작은이미지들 크기 조정 */
            [id^=s2Building]{
             width:24%;
             position: relative;
             height: 100px;
           }
            }
            /* 시설안내 버튼설정 */
           #s2Btns{
            position: relative;
            margin: 0;
            padding:0;
            line-height: 20px;
            text-indent: -15px;
            color: white;
            width: 1px;
            /* background-color: turquoise; */
           }
           @media only screen and (max-width: 1100px) {
                #s2Btns{
                    color:black;
                }
           }
           #s2Btns li{
                opacity: 0.5; 
               font-size: 50px;
           }
           #s2Btns li:nth-of-type(1){
            position: relative;
           }
           #s2Btns li:nth-of-type(2){
            position: relative;
            top:-20px;
            left:50px;
           }
           #s2Btns li:nth-of-type(3){
            position: relative;
            top:-40px;
            left:100px;
           }
           #s2Btns li:nth-of-type(4){
            position: relative;
            top:-60px;
            left:150px;
           }

           /* 3슬라이드 시작 ------------------------------------------------*/
           #s3Background{
               width: 100%;
               background-color: #242424;
               padding-top: 110px;
               padding-right: 20px;
               padding-left: 20px;
               text-align: center;
           }
           #s3Background>img{
               position: absolute;
               top:0px;
               right:0px;
               width: 100%;
               height: 740px;
               opacity: 0.15;
               z-index: 1;
           }
           #s3Title{
               color:#b3a193;
               font-weight: 600;
           }
           #s3Background>div{
               display: flex;
               z-index: 10;
           }
           #s3Background>div>div{
                width: 330px;
                height: 450px;
                background-color: #d2c4b9;
                border-radius: 5px;
                border: 2px ridge #242424;
                margin: auto;
                z-index: 10;
            }
            #s3Content{
                text-align: center;
                align-items: center;
            }
            #s3Content>div{
                padding: 25px;
            }
            #s3Content>div *{
                margin: 20px;
            }
            #s3Content>div>p:nth-of-type(1){
                font-weight: 500;
            }
            #s3Content>div>p:nth-of-type(2){
                font-size: 14px;
            }
            #s3Content button{
                box-sizing: content-box;
                width:115px;
                height: 45px;
                border: none;
                border-radius: 2px;
                background-color: #242424;
                color: #d2c4b9;
                font-weight: bolder;
                font-size: 14px;
            }
            #s3Content button:hover{
                background-color: white;
                color: #b3a193;
                border: 2px solid #b3a193;
            }
    
           /* 4슬라이드 시작 ------------------------------------------------*/
            #s4Background{
                width: 100%;
               background-color: #242424;
               padding-top: 110px;
               text-align: center;
            }
            #s4Background>img{
               position: absolute;
               top:0px;
               right:0px;
               width: 100%;
               height: 740px;
               opacity: 0.1;
               z-index: 1;
           }

           #s4Title{
               font-weight: 600;
               color: #b3a193;
           }
           #s4Background>div{
               display: flex;
               z-index: 10;
           }
           #s4Background>div>div{
                width: 330px;
                height: 450px;
                background-color: #b3a193;
                border-radius: 5px;
                border: 2px ridge #242424;
                margin: auto;
                z-index: 10;
            }
            #s4Content{
                text-align: center;
                align-items: center;
            }
            #s4Content>div{
                padding: 25px;
            }
            #s4Content>div *{
                margin: 20px;
            }
            #s4Content>div>p:nth-of-type(1){
                font-weight: 500;
            }
            #s4Content>div>p:nth-of-type(2){
                font-size: 14px;
            }
            #s4Content button{
                box-sizing: content-box;
                width:115px;
                height: 45px;
                border: none;
                border-radius: 2px;
                background-color: #242424;
                color: #d2c4b9;
                font-weight: bolder;
                font-size: 14px;
            }
            #s4Content button:hover{
                background-color: white;
                color: #b3a193;
                border: 2px solid #b3a193;
            }
           /* 5슬라이드 시작 ------------------------------------------------*/
           #CONTECT{
                background-color: white;
                height: 500px;
                position: relative;
                text-align: center;
                align-items: center;
            }
            #CONTECT>p{
                /* background-color: red; */
                margin: 0px;
                color: #b3a193;
                font-size: 35px;
                font-weight: bold;
                position:absolute;
                top:10%;
                left:20%;
            }
            #CONTECT hr{
                position:absolute;
                top:19%;
                left:0%;
                width:47%;
                border: 1px solid #b3a193;
            }
            #CONTECT p:last-of-type{
                position:absolute;
                top:30%;
                left:20%;
                width:47%;
                color: #b3a193;
                font-size: 16px;
                text-align: left;
                font-weight: 600;
                /* background-color: green; */
                padding: 0px;
                margin: 0px;
                font-family: '굴림';
                line-height: 25px;
                letter-spacing: 0.05em;
            }
            iframe{
                margin-left: 150px;
                /* background-color: seagreen; */
                position:absolute;
                top:50%;
                margin-top: -225px;
                left:30%;
                /* padding: 10px; */
            }
            #nM{
                position: absolute;
                top:74%;
                left:20%;
                width: 200px;
                height: 40px;
                border-radius: 4px;
                background-color: #242424;
                color: #b3a193;
                border-color: #242424;
                border-style: solid;
                font-weight: 300;
            }
            #gM{
                position: absolute;
                top:87%;
                left:20%;
                width: 200px;
                height: 40px;
                border-radius: 4px;
                background-color: #b3a193;
                color: #242424;
                border-color: #b3a193;
                border-style: solid;
                font-weight: 300;
            }
            /* ------------------------------------------------------------------------------------------------- */
            /* 풋터 설정 */
            footer{
                background-color: #242424;

            }
            /* 풋터 콘텐츠 설정 */
            #footerTable{
                width: 1000px;
                margin-left: 30px;
                color:white;
            }
            #footerTable td{
                padding: 3px;
                padding-left: 50px;
                padding-right: 50px;
                font-size: 14px;
            }
            #footerTable th{
                text-align: left;
                padding-top: 10px;
                padding-bottom: 5px;
                padding-left: 50px;
                color:#b3a193;
            }
            /* 풋터 마지막 문구 설정 */
            #footerP{
                color:#534b44;
                font-size: 14px;
                margin-top: 10px;
                margin-left: 30px;
                line-height: 30px;
                padding-left: 50px;
            }
            #footerTable a{
                text-decoration: none;
            }
            #animalProtectSys{
                background-color: #b3a193;
                color: #242424;
                padding: 1.5px 4px 2px 4px;
                font-size: 12px;
                font-family: 'Noto Sans KR', sans-serif;
            }

            
        header{
            width:100%;
            position: fixed;
            position: absolute;
            z-index: 99;
            background-color: #242424;
            border-bottom: 5px solid #b3a193;
        }
        /* 내부 설정 */
        #navMenu{
            display:flex;
            /* margin: 0px;
            padding:0px; */
            margin-bottom: 0px;
            text-align: center;
            /* background-color: tomato; */
        }
        #navLogo{
            position: absolute;
            top: 23px;
            left: 20px;
        }
        #navMenu a{
            color:white;
        }
        #navMenu>li{
            position: relative;
            left: 25%;
            margin: 0px;
            padding:17px 0px 17px 0px;
            font-size: 17px;
            width: 190px;
            /* background-color: darkorange; */
        }
        #navMenu>li>ul{
            position: absolute;
            left: -1px;
            margin: 0px;
            margin-top: 15px;
            padding:0px;
            opacity: 0;
            transition: 0.5s;
            background-color: darkorchid;
        }
        #navMenu>li>ul>li{
            margin: 0px;
            padding:0px;
            font-size: 16px;
            width: 190px;
            line-height: 0px;
            transition: 0.5s;
            background-color: #363636;
            border: 1px outset #463f39;
        }
        #navMenu>li>ul>li:nth-of-type(1){
            border-top: 2px solid #b3a193;
        }
        /* 메뉴 호버 효과 */
        #navMenu>li:hover>a{
            color:#b3a193;
        }
        #navMenu>li:hover>ul{
            opacity: 1;
        }
        #navMenu>li:hover>ul>li{
            padding:20px 0px 20px 0px;
            line-height: 18px;
        }
        #navMenu>li:hover>ul>li:hover>a{
            color:#b3a193;
        }

        /* 반응형메뉴 설정 */
        #reactMenu{
            position: absolute;
            display: none;
        }
        
        /* 작은 화면일 때의 설정 */
        @media only screen and (max-width: 800px) {
            #serveLogo{
                top:20px
            }
            #serveMenuBtn{
                position: relative;
                width:100px;
                height: 0px;
                font-size: 55px;
                padding-bottom: 86px;
                padding-right: 30px;
                padding-left: 15px;
                background-color: #d2c4b9;
            }
            #serveMenuBtn>img{
                padding-top: 0px;
                padding-bottom: 10px;
                padding-right: 25px;
                padding-left: 0x;
            }
            .show{
                display: block;
            }
            .hide{
                display: none;
            }
            /* 메인메뉴 없애기 */
            #navMenu{
                display:none;
            }
            #navSmallLink{
                display:none;
            }
            /* 반응형메뉴 설정 */
            #serveSmallLink{
                width: 100%;
                padding:10px 0px 18px 0px;
                background-color: #b3a193;
                text-align: center;
                color: #242424;
            }
            #serveSmallLink a{
                margin-left: 10px;
                font-size: 20px;
                font-weight: bolder;
                padding: 1% 7% 1% 7%;
                background-color: #b3a193;
                /* color: #242424; */
            }
            #reactMenu{
                position: absolute;
                top:0px;
                left:0px;
                width: 100%;
                display: block;
                height: 90px;
                border-bottom: 5px solid #b3a193;
                background-color: #242424;
            }
            #serveMenu{
                margin: 0px;
                padding: 0px;
                background-color: white;
                display: none;
            }
            #serveMenu>li{
                color: #242424;
                font-size: 20px;
                /* background-color: blue; */
                padding: 5px;
                text-indent: 50px;
                margin-bottom: 25px;
                margin-top: 35px;
            }
            #serveMenu>li>a{
                color: #242424;
                font-weight: bolder;
                /* background-color: red; */
            }
            #serveMenu>li>ul{
                margin: 0px;
                padding: 0px;
                opacity: 0;
                transition: 0.5s;
                /* background-color: #242424; */
            }
            #serveMenu>li>ul>li{
                color: white;
                padding: 0px;
                line-height: 0px;
                height: 0px;
                transition: 0.5s;
                /* background-color: rgb(5, 53, 53); */

            }
            #serveMenu>li>ul>li:nth-of-type(1){
                border-top: 2px solid gray;
                color: white;
                margin-top: 10px;
                /* background-color: rgb(5, 53, 53); */
            }
            #serveMenu>li>ul>li>a{
                text-decoration: none;
                color:#242424;
                font-size: 18px;
                font-weight: 400;
            }
           
            #serveMenu hr{
                margin-bottom: 0px;
                width: 90%;
                border:none;
                border-bottom: 1px solid lightgray;
                margin: auto;
                margin-top: 22px;
                /* margin-bottom: 10px; */
            }
            .ulOpacity{
                opacity: 1;
            }
           
        }

             /* ------------------------로그인 css-------------------------- */
            /* 전체 화면 설정 */
            /* 로그인 모달팝업으로 가는 버튼 */
            #navSmallLink{
                position: relative;
                top:0px;
                right:30px;
                text-align: right;
            }
            #navSmallLink a{
                padding:3px;
                font-size: 13px;
                color: #b3a193;
            }
            #navSmallLink a:hover{
                text-decoration: underline;
            }

            /* 로그인 모달팝업 전체 설정 */
            .modal{
                font-family: 'Noto Sans KR', sans-serif;
                display: none;
                position: fixed;
                position: absolute;
                top:0px;
                left:0px;
                z-index: 999999999;
                width: 100%; /* Full width */
                /* height: 1000px; */
                /* 화면의 크기만큼 높이가 맞춰지게 기능걸어야겠다 */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.5); /* Black w/ opacity */
                font-family: 'Noto Sans KR', sans-serif;
            }

            /* 로그인단 위치설정 위함 +  로그인레이어 전체 크기*/
            #logIn{
                position: absolute;
                width:380px;
                /* background-color: rgb(231, 139, 26); */
                margin: 0px;
                padding: 0px;
            }
            /* 로그인단 헤더 */
            #logInHeader{
                background-color: #d2c4b9;
                background-color: #d0b7b5;
                background:-webkit-linear-gradient(top, #3b3b3b,#242424);
                padding: 10px 5px 15px 15px;
                margin: 0px;
                border-top-left-radius: 5px;
                border-top-right-radius: 5px;

                width: 382px;
            }
            #logInHeader p{
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
                top:-2px;
                right: 10px;
                font-size: 28px;
                font-weight: bold;
            }
            .close:hover,
            .close:focus {
                color: black;
                cursor: pointer;
            }

            /* 로그인단 섹션 */
            .logInSection{
                background-color: #b3a193;
                background-color: #242424;
                background-color: white;
                /* background-color: white; */
                padding: 10px;
                border-bottom-left-radius: 5px;
                border-bottom-right-radius: 5px;
            }

            /* 로그인단(테이블 형태) 설정 */
            #loginT{
                vertical-align: middle;
                border-collapse: collapse;
                height: 410px;
                text-align: center;
                margin:auto;
                margin-top: 5px;
                margin-bottom: 5px;
                /* border: 1px solid rgb(230, 224, 224); */
            }
            #loginT td{margin:0px; padding-top: 0px; padding-bottom: 0px;}
            #loginT tr{height:25px;}
            #loginT tr:nth-of-type(4){text-align: left;}

            #userIdLogIn{
                height: 37px;
            }
            #password{
                height: 37px;
            }
            /* 로그인 섹선 안 이미지 */
            .logInSection tr:nth-of-type(1) td{
				vertical-align: middle;
			}
            /* 로그인 버튼 설정 */
            #logBtn{
                box-sizing: content-box;
                width:280px;
                height: 27px;
                background:lightgray;
                border: none;
                border-radius: 2px;
                color: rgb(97, 96, 96);
                font-weight: bolder;
                font-size: 13px;
            }

            /* 로그인상태 유지 체크박스 */
            #maintenanceLogInLabel{
                
            }
			#maintenanceLogInLabel span{
			    font-size: 15px;
			    color:dimgray;
			    font-weight:500;
			}
			
            /* input태그 설정(버튼, 체크박스 제외) */
            .modal input:not([id='submit']):not([type='checkbox']){
                width:290px;
                height: 20px;
                border-radius: 2px;
                border: 1px solid rgb(172, 171, 171);
                padding: 5px;
            }

            /* 링크(a) 설정 */
            #smallInform>a{
                font-size: 10px;
                color: rgb(73, 73, 73);
                text-decoration: none;
            }

            /* 체크박스 이미지넣고 설정 */
            input[type=checkbox]:not([name='test']):not(#testAll) { display:none; }

            input[type=checkbox] + label { 
                display: inline-block; 
                cursor: pointer; 
                line-height: 22px; 
                padding-left: 25px; 
                background: url('img/notCheck1.png') left/30px no-repeat; 
            }
            
        /* ------------------------로그인 css 끝-------------------------- */
        </style>
        <!-- 노토산스kr 폰트 가져오기 -->
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
        <!-- 나눔명조 폰트 가져오기 -->
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
    </head>
    <body>
      	<!-- <헤더(상단 메뉴바) 시작> -->
	<!--헤더 시작-->
	<header id='nav'>
		<!-- 0. 모달 로그인 팝업 -->
		<div id="navSmallLink">
			<%if(loginUser==null){ %>
			<a id="moveToLogIn" class="TextmoveTo">로그인</a>
			<a class="TextmoveTo" href="views/member/memberJoin.jsp">회원가입</a>
			<%}else{ %>
			<a id="moveToLogOut2" class="TextmoveTo" onclick="goLogout();">로그아웃</a>
			<a class="TextmoveTo" id="moveToMyPage" href="<%=request.getContextPath()%>/first.ch">마이페이지</a>
			<%} %>
			<a class="TextmoveTo" href="#">오시는길</a>
		</div>
		<div class="modal" id="myModal">
			<!-- 1) 로그인단 + 우측 이미지 -->
			<div id="logIn" class="">
				<div id="logInHeader">
					<p>로그인</p>
					<span class="close">&times;</span>
				</div>
				<div class="logInSection">
					<form id="loginForm">
						<table id="loginT">
							<tr>
								<td><img src="LOGO/LOGO3.png" width="300" height="100"
									alt=""></td>
							</tr>
							<tr>
								<td><input type="text" name="userId" id="userIdLogIn"
									placeholder="아이디" required></td>
								<!-- <td rowspan="7"> 
                                        <span id="advertisement">
                                            &nbsp;&nbsp;&nbsp;&nbsp;<img src="img/심리센터8.png" width="240px" height="270px" alt="">
                                        </span>
                                    </td> -->
							</tr>
							<tr>
								<td><input type="password" name="userPwd" id="password"
									placeholder="비밀번호" required></td>
							</tr>
							<tr>
								<td><input src="checkboxImage/비활성화상태체크박스.png"
									type="checkbox" name="maintenanceLogIn" id="maintenanceLogIn"
									> <label for="maintenanceLogIn"
									id="maintenanceLogInLabel">&nbsp;로그인 상태 유지
										</label>
									<!-- 체크여부가져오기 위한 히든타입 태그 -->
									<input type="hidden" id="forMaintainCheck" value="false">
								</td>
							</tr>
							<tr>
								<td><input type="button" value="로그인" id="logBtn" disabled onclick="goLogin();">
								</td>
							</tr>
							<!-- 2) 아이디 찾기, 비번 찾기, 회원가입 링크 -->
							<tr>
								<td>
									<div id="smallInform" align='center'>
										<a href="views/member/mySearch.jsp" id="views/member/mySearch.jsp">아이디 찾기 |</a> <a href="views/member/mySearch.jsp" id="#"><b>비밀번호
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
			<img id="navLogo" src="LOGO/LOGO1.png" width="130" alt="로고이미지"
				id='bigwindow_logo'>
			<!-- <img src="img/logo1.png" alt="로고이미지" id = 'smallwindow_logo'> -->
			<li><a href="#" id='first' class="colorcss">장례서비스</a>
				<ul>
					<li><a href="<%=request.getContextPath()%>/views/funeral/funeral_Order.jsp">장례절차</a></li>
					<li><a href="<%=request.getContextPath()%>/views/funeral/funeral_Goods.jsp">장례용품</a></li>
					<li><a href="<%=request.getContextPath()%>/views/funeral/funeral_Price.jsp">장례비용</a></li>
					<li><a href="<%=request.getContextPath()%>/views/funeral/funeral_Lucete.jsp">LUCETTE</a></li>
					<li><a href="#">장례예약</a></li>
				</ul></li>
			<li><a href="<%=request.getContextPath() %>/views/insurance/insuranceMain.jsp" id='second' class="colorcss">보험서비스</a>
				<ul>
					<li><a href='<%=request.getContextPath() %>/views/insurance/insuranceMain.jsp'>보험소개</a></li>
					<li><a href='<%=request.getContextPath() %>/views/insurance/insuranceContent.jsp'>보장내용</a></li>
				</ul></li>
			<li><a href="#" id='third' class="colorcss">혜윰스케치북</a></li>
			<li><a href="<%=request.getContextPath()%>/list.bo" id='forth' class="colorcss">고객센터</a>
				<ul>
					<li><a href='<%=request.getContextPath()%>/list.bo'>공지사항</a></li>
					<li><a href='<%=request.getContextPath()%>/list.fbo'>FAQ</a></li>
					<li><a href='<%=request.getContextPath()%>/QnAList.bo'>QnA</a></li>
				</ul></li>
			<li><a href="<%=request.getContextPath()%>/views/member/forMember.jsp" id='fifth' class="colorcss">For Member</a></li>
		</ul>


		<!-- 반응형 메뉴 -->
		<div id='reactMenu'>
			<img id="serveLogo" src="LOGO/LOGO1.png" width="120" alt="로고이미지"
				id='bigwindow_logo'>
			<div id="serveMenuBtn">
				<img src="img/noun_List_25956.png" width="90" height="90">
			</div>
			<ul id="serveMenu">
				<div id="serveSmallLink">
					<%if(loginUser==null){ %>
					<a id="moveToLogIn2" class="TextmoveTo">로그인</a> 
					<a class="TextmoveTo" href="views/member/memberJoin.jsp">회원가입</a> 
					<%}else{ %>
					<a id="moveToLogOut2" class="TextmoveTo" onclick="goLogout();">로그아웃</a>
					<a id="moveToMyPage2" class="TextmoveTo" href="/project/first.ch">마이페이지</a>
					<%} %>
					<a class="TextmoveTo">오시는길</a>
				</div>

				<li id="serve1"><a href="#">장례서비스 </a>
					<hr>
					<ul>
						<li><a href="<%=request.getContextPath()%>/views/funeral/funeral_Order.jsp">장례절차</a></li>
						<li><a href="<%=request.getContextPath()%>/views/funeral/funeral_Goods.jsp">장례용품</a></li>
						<li><a href="<%=request.getContextPath()%>/views/funeral/funeral_Price.jsp">장례비용</a></li>
						<li><a href="<%=request.getContextPath()%>/views/funeral/funeral_Lucete.jsp">LUCETTE</a></li>
						<li><a href="#">장례예약</a></li>
					</ul></li>

				<li id="serve2"><a href="#">보험서비스</a>
					<hr>
					<ul>
						<li><a href='<%=request.getContextPath() %>/views/insurance/insuranceMain.jsp'>보험소개</a></li>
						<li><a href='<%=request.getContextPath() %>/views/insurance/insuranceContent.jsp'>보장내용</a></li>
					</ul></li>
				<li><a href="#"><a>혜윰스케치북</a>
					<hr></li>
				<li id="serve3"><a href="#">고객센터</a>
					<hr>
					<ul>
						<li><a href="<%=request.getContextPath()%>/list.bo">공지사항</a></li>
						<li><a href='<%=request.getContextPath()%>/list.fbo'>FAQ</a></li>
						<li><a href='<%=request.getContextPath()%>/QnAList.bo'>QnA</a></li>
					</ul></li>
				<li><a href="<%=request.getContextPath()%>/views/member/forMember.jsp">For Member</a>
				<hr></li>
			</ul>
		</div>
	</header>

        <!-- 예약 fixed 사이드바 와 관리자 바-->
      <%if(loginUser!=null&&((request.getSession().getAttribute("userId")!=null&&request.getSession().getAttribute("userId").equals("admin"))||((Member)request.getSession().getAttribute("loginUser")).getmId().equals("admin"))){%>
	        <aside id="reservation">         
	            <p><a href="<%=request.getContextPath() %>/views/common/managebar.jsp">관리</a></p>
	        </aside>
        <%}else{ %>
	        <aside id="reservation">         
	            <p><a href="">예약</a></p>
	        </aside>
        <%}%>

        <main>
        <!-- 첫번째 슬라이드부터 5번째까지 -->
        <!-- 1 -->
        <section id="section1" class="scene one videoWrapper" data-anchor="sec1">
            <!-- <span><img src="img/adult-1850704.jpg"></span> -->
            <!-- <span class="scroll-indicator">V</span> -->
            <video id="s1Video1" src="video/walkDog2.mp4" width="1700" frameborder="0" muted="muted" loop="loop" autoplay = "autoplay"></video>
            <!-- <video id="s1Video2" src="video/gliter1.mp4" width="1700" frameborder="0" muted="muted" loop="loop" autoplay = "autoplay"></video> -->
            <div id="s1Main">
                <img src="img/s2Image1.png">
                
            </div>
            <div class="s1Cover">
                <!-- <div id="diamond"></div> -->
            </div>
            <div id="s1Text1">
                우리 아이 별로 향하는 마지막 길까지
            </div> 
            <div id="s1Text2">
                추억할 수 있게
            </div>
            <div id="s1Text3">
                혜윰이 여러분을 도와드리겠습니다
            </div>
        </section>

        <!-- 2 -->
        <section id="section2" class="scene two" data-anchor="sec2">
            <div class="s2Cover">
                <h2 id="s2Title">시설소개</h2>
                <br>
                <p>Parking Spot</p>
                <br>
                <div class="s2SlideImgs">
                    <div id="s2OuterBuilding">
                        <img src="img/building/outerBuilding.jpg" id="s2SlideImg1">
                    </div>
                    <div id="s2InnerBuilding">
                        <img src="img/building/innerBuilding.jpg" id="s2SlideImg2">
                        <img src="img/building/innerBuilding3.jpg" id="s2SlideImg4">
                    </div>
                    <div id="s2NapGol">
                        <img src="img/building/innerBuilding2.jpg" id="s2SlideImg3">
                        <img src="img/building/납골당1.png" id="s2SlideImg3">
                        <img src="img/building/납골당2.png" id="s2SlideImg3">
                    </div>
                </div>
                <ul id="s2Btns">
                    <li id="s2Btns1"></li>
                    <li id="s2Btns2"></li>
                    <li id="s2Btns3"></li>
                </ul>
                <!-- <div id="s2imgs">
                    <img src="building/outerBuilding.jpg" id="s2Building1">
                    <img src="building/innerBuilding.jpg" id="s2Building2">
                    <img src="building/innerBuilding3.jpg" id="s2Building4">
                    <img src="building/innerBuilding2.jpg" id="s2Building3">
                </div> -->
            </div>
        </section>

        <!-- 3 -->
        <section id="section3" class="scene three" data-anchor-target="sec3">
            <div id="s3Background">
                <h2 id="s3Title">혜윰 장례서비스</h2>
                <br>
                <br>
                <div id="s3Content">
                    <div id="">
                        <img src="img/mainFuneral/noun_Cemetery_3153740.png" width="110" height="110">
                        <p>장례절차 안내</p>
                        <p>반려동물 장례, 이것만은<br> 꼭 알아두세요</p>
                        <br>
                        <button onclick="location.href='<%=request.getContextPath()%>/views/funeral/funeral_Order.jsp'">자세히 보기</button>
                    </div>
                    <div id="">
                        <img src="img/mainFuneral/noun_hugging dog_2388354.png" width="110" height="110">
                        <p>혜윰 이야기</p>
                        <p>우리가 반려동물 장례서비스를<br> 시작한 이유</p>
                        <br>
                        <button onclick="location.href='<%=request.getContextPath()%>/views/member/forMember.jsp'">자세히 보기</button>
                    </div>
                    <div id="">
                        <img src="img/mainFuneral/noun_Question_1246106.png" width="110" height="110">
                        <p>정식 장례업체</p>
                        <p>합법 장례식상 여부를<br> 꼭 확인하세요</p>
                        <br>
                        <button onclick="location.href='https://eanimal.kr'">자세히 보기</button>
                    </div>
                    <div id="">
                        <img src="img/mainFuneral/noun_customer service_853989.png" width="110" height="110">
                        <p>언제든 상담 받으세요</p>
                        <p>갑작스러운 작별에도
                            대처할 수 있도록<br> 
                            24시간 반려동물 장례전문가가<br> 대기중입니다</p>
                            <button onclick="location.href='QnAList.bo'">상담 바로가기</button>
                    </div>
                </div>
                <img src="img/dog-4494554_1920.jpg">
            </div>
        </section>

        <!-- 4 -->
        <section id="section4" class="scene four">
            <div id="s4Background">
                <h2 id="s4Title">혜윰 보험서비스</h2>
                <br>
                <br>
                <div id="s4Content">
                    <div id="">
                        <img src="img/mainIns/noun_Pets_36476.png" width="110" height="110">
                        <p>혜윰 보험소개</p>
                        <p>보험서비스,<br>어떻게 구성되어있나요?</p>
                        <br>
                        <button onclick="location.href='<%=request.getContextPath() %>/views/insurance/insuranceMain.jsp'">자세히 보기</button>
                    </div>
                    <div id="">
                        <img src="img/mainIns/noun_Pet_2697322.png" width="110" height="110">
                        <p>펫보험이 필요할까?</p>
                        <p>펫보험에 대한<br>다양한이야기들</p>
                        <br>
                        <button onclick="location.href='http://www.hani.co.kr/arti/animalpeople/companion_animal/886303.html'">자세히 보기</button>
                    </div>
                    <div id="">
                        <img src="img/mainIns/noun_Question_1227703.png" width="110" height="110">
                        <p>왜 혜윰 보험인가?</p>
                        <p>
                            누구나 간단하게 가입하는<br>
                             5분 초간단 보험<br>
                             지금 바로 가입하세요
                        </p>
                        <button onclick="location.href='https://eanimal.kr'">자세히 보기</button>
                    </div>
                    <div id="">
                        <img src="img/mainFuneral/noun_customer service_853989.png" width="110" height="110">
                        <p>언제든 상담 받으세요</p>
                        <p>우리아이 건강한 미래를 책임질 보험!<br>
                            24시간 반려동물 보험 전문가가<br> 대기중입니다</p>
                            <button onclick="location.href='mailto:potter3786@naver.com'">상담 바로가기</button>
                    </div>
                </div>
                <img src="img/mainFuneral/petforest-brandstory-sec3box1.png">
            </div>
        </section>

        <!-- 5 -->
        <section id="section5" class="scene five">
            <div id="CONTECT">
                <p>CONTECT</p>
                <hr>
                <p>
                    연락처&nbsp;&nbsp;<em>010-4853-3545</em><br><br>
                    오시는길<br>
                    서울특별시 관악구 신림동 <br>대학18길 26
                    월드빌 501호
                </p>
                <button id="nM" onclick="location.href='http://land.mahru.co.kr/naver'"><b>네이버 Map 바로가기</b></button>
                <button id="gM" onclick="location.href='https://www.google.co.kr/maps/place/%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C+%EA%B4%80%EC%95%85%EA%B5%AC+%EC%8B%A0%EB%A6%BC%EB%8F%99+%EB%8C%80%ED%95%9918%EA%B8%B8+26/@37.4647108,126.9347188,17z/data=!3m1!4b1!4m5!3m4!1s0x357c9fe16a0d8a0d:0x2ff104f7c7117906!8m2!3d37.4647108!4d126.9369075?hl=ko'"><b>구글 Map 바로가기</b></button>
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3166.8310500738476!2d126.93471881516473!3d37.464710779817054!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c9fe16a0d8a0d%3A0x2ff104f7c7117906!2z7ISc7Jq47Yq567OE7IucIOq0gOyVheq1rCDsi6Drprzrj5kg64yA7ZWZMTjquLggMjY!5e0!3m2!1sko!2skr!4v1589025212441!5m2!1sko!2skr" 
                width="40%" height="90%" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
            </div>

            <!-- 풋터를 마지막 영역 안에 위치 -->
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
                            <a id="animalProtectSys" href="https://www.animal.go.kr/front/awtis/shop/undertaker1List.do?bizKnCd=&boardId=shop&pageSize=0&longitude=&latitude=&menuNo=6000000131&searchUprCd=&searchOrgCd=&searchCoNm=%ED%8E%AB%ED%8F%AC%EB%A0%88%EC%8A%A4%ED%8A%B8">
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
                    해윰  |  사업자등록번호 : 0123456789호  |  동물장묘업 등록번호  |  대표자 : 배혜린
                    <br>
                    Copyright © 2020-2020 hyeyum Institute All Right Reserved
                </p>
            </footer>
        </section>

        <!-- 6 마지막껀 항상 작동이 이상~ -->
        <!-- <section id="section6" class="scene six">
            <img src="img/texture-1504364.jpg">
        </section> -->

        </main>

        <!-- build:js scripts/main.js -->
        <script  src="http://code.jquery.com/jquery-latest.min.js"></script>    
        <!-- jQuery 구버전과 최신버전 혼용가능하게하는 플러그인같은거 -->
        <script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script> 
        <script src="scripts/browserSwipe.js"></script>
        <script src="scripts/touchswipe.js"></script>
        <script src="scripts/main.js"></script>
        <!-- endbuild -->
        

         <!-- 사이드 스크롤 표시 바 -->
         <div id="fp-nav" class="right" >
             <!-- style="margin-top: -150px; display: none;" 이속성 잠시 생략 -->
             <ul>
                <li><a href="#sec1"><span></span></a></li>
                <li><a href="#sec2"><span></span></a></li>
                <li><a href="#sec3"><span></span></a></li>
                <li><a href="#sec4"><span></span></a></li>
                <li><a href="#sec5"><span></span></a></li>
             </ul>
         </div>


	<!-- jsp 관련 스크립트 -->
	<script>
		function goLogin(){
			var userId = $('#userIdLogIn');
			var userPwd = $('#password');
			var maintainCheck = $('#forMaintainCheck');
				alert('asdf');

			$.ajax({
				url:"<%=request.getContextPath()%>/login.me"
				, type:"get"
				, data:{userId:userId.val(), userPwd:userPwd.val(), maintainCheck:maintainCheck.val()}
				, success:function(data){
					if(data=='noneId'){
						alert('존재하지 않는 아이디 입니다');
						userId.focus();
					}else if(data=='successLogin'){
						alert('로그인 성공');
						//모달창은 reload가 안먹으므로 수동으로 꺼주자
						var modal = document.getElementById('myModal');
        				modal.style.display = 'none';
						
						if(modal.style.display=='none'){
							location.reload(true);
						}
					}else if(data=='failLogin'){
						alert('로그인 실패');
					}
				}
				, error:function(request, status, error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			})
		}

		function goLogout(){
			$.ajax({
				url:"<%=request.getContextPath()%>/logout.me"
				, success:function(data){
					if(data=='successLogout'){
						alert('로그아웃되었습니다');
						window.location.reload(true);
					}else{
						alert('로그아웃 실패')
					}
				}
				, error:function(request, status, error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			})
		}
	</script>
	<!------------------------------------------------------------------------------------------------------------------------------------------>
    <script>
        function currentDiv(){
            console.log($(".scene").prop("display",true));
        };
    </script>

    <script>
            // 1. 사이드 스크롤바 설정
            // if($('#section1').offset().top!=0){}

            window.setInterval(function(){
            
                $('section').each(function (index, element) {
                    if($(this).offset().top==0){
                        nowSection = $(this);
                    }
                });
                
                console.log(nowSection.prop('id'));

                if(nowSection.prop('id') == 'section1'){
                    $('#fp-nav').css('right', '-100px').css('transition', '0.8s');
                    $('#reservation').css('opacity', '0').css('transition', '0.5s');
                    if($('#s1Main>img').css('opacity')==0){
                        $('header').css('display', 'none');
                    }else{
                        $('header').css('display', 'block');
                    }
                    $('#fp-nav').find('li:nth-of-type(1)').css('opacity', '0.1').css('transition', '0.3s');
                    $('#fp-nav').find('li:nth-of-type(2)').css('color', 'lightgray');
                    $('#fp-nav').find('li:nth-of-type(3)').css('color', 'lightgray');
                    $('#fp-nav').find('li:nth-of-type(4)').css('color', 'lightgray');
                    $('#fp-nav').find('li:nth-of-type(5)').css('color', 'lightgray');
                    $('#fp-nav').find('li:nth-of-type(1)').css('opacity', '1').css('color', '#b3a193');
                }
                if(nowSection.prop('id') == 'section2'){
                    $('#fp-nav').css('right', '45px');
                    $('#reservation').css('opacity', '1');
                    $('header').css('display', 'block');
                    $('#fp-nav').find('li:nth-of-type(1)').css('color', 'lightgray');
                    $('#fp-nav').find('li:nth-of-type(2)').css('opacity', '0.1').css('transition', '0.3s');
                    $('#fp-nav').find('li:nth-of-type(3)').css('color', 'lightgray');
                    $('#fp-nav').find('li:nth-of-type(4)').css('color', 'lightgray');
                    $('#fp-nav').find('li:nth-of-type(5)').css('color', 'lightgray');
                    $('#fp-nav').find('li:nth-of-type(2)').css('opacity', '1').css('color', '#b3a193');
                }
                if(nowSection.prop('id') == 'section3'){
                    $('#fp-nav').find('li:nth-of-type(1)').css('color', 'lightgray');
                    $('#fp-nav').find('li:nth-of-type(2)').css('color', 'lightgray');
                    $('#fp-nav').find('li:nth-of-type(3)').css('opacity', '0.1').css('transition', '0.3s');
                    $('#fp-nav').find('li:nth-of-type(4)').css('color', 'lightgray');
                    $('#fp-nav').find('li:nth-of-type(5)').css('color', 'lightgray');
                    $('#fp-nav').find('li:nth-of-type(3)').css('opacity', '1').css('color', '#b3a193');
                }
                if(nowSection.prop('id') == 'section4'){
                    $('header').css('display', 'block');
                    $('#fp-nav').find('li:nth-of-type(1)').css('color', 'lightgray');
                    $('#fp-nav').find('li:nth-of-type(2)').css('color', 'lightgray');
                    $('#fp-nav').find('li:nth-of-type(3)').css('color', 'lightgray');
                    $('#fp-nav').find('li:nth-of-type(4)').css('opacity', '0.1').css('transition', '0.3s');
                    $('#fp-nav').find('li:nth-of-type(5)').css('color', 'lightgray');
                    $('#fp-nav').find('li:nth-of-type(4)').css('opacity', '1').css('color', '#b3a193');
                }
                if(nowSection.prop('id') == 'section5'){
                    $('header').css('display', 'none');
                    $('#fp-nav').find('li:nth-of-type(1)').css('color', 'lightgray');
                    $('#fp-nav').find('li:nth-of-type(2)').css('color', 'lightgray');
                    $('#fp-nav').find('li:nth-of-type(3)').css('color', 'lightgray');
                    $('#fp-nav').find('li:nth-of-type(4)').css('color', 'lightgray');
                    $('#fp-nav').find('li:nth-of-type(5)').css('opacity', '0.1').css('transition', '0.3s');
                    $('#fp-nav').find('li:nth-of-type(5)').css('opacity', '1').css('color', '#b3a193');
                }
                // if(nowSection.prop('id') == 'section6'){
                //    $('#fp-nav').find('li:nth-of-type(5)').css('color', 'pink');
                // }
        }, 1);
            
    </script>

    <script>
        // 2. 1슬라이드 설정
        // 1) 1슬라이드 문구 설정
        window.setTimeout(function(){
            $('#s1Text1').css('opacity', 1);
        }, 2000);
        window.setTimeout(function(){
            $('#s1Text2').css('opacity', 1);
        }, 4000);
        

        var widthT1 = $('html').innerWidth()/2 - $('#s1Text1').width()/2;
        $('#s1Text1').css({'left':widthT1});
        var widthT2 = $('html').innerWidth()/2 - $('#s1Text2').width()/2;
        $('#s1Text2').css({'left':widthT2});
        var widthT3 = $('html').innerWidth()/2 - $('#s1Text3').width()/2;
        $('#s1Text3').css({'left':widthT3});
        $(window).resize(function(){
            var widthT1 = $('html').innerWidth()/2 - $('#s1Text1').width()/2;
            $('#s1Text1').css({'left':widthT1});
            var widthT2 = $('html').innerWidth()/2 - $('#s1Text2').width()/2;
            $('#s1Text2').css({'left':widthT2});
            var widthT3 = $('html').innerWidth()/2 - $('#s1Text3').width()/2;
            $('#s1Text3').css({'left':widthT3});
        });

        // 2) 1슬라이드 수평선 설정
        $(function(){
            $(window).change(function () {
                var heightLogIn = $(document).scrollTop()+250;
                var widthLogIn = $('html').innerWidth()/2 - 120/1.5;
            
                $('#diamond').css({'top':heightLogIn, 'left':widthLogIn});
            }); 
            $(window).resize(function () { 
                var heightLogIn = $(document).scrollTop()+250;
                var widthLogIn = $('html').innerWidth()/2 - 120/1.5;
                
                $('#diamond').css({'top':heightLogIn, 'left':widthLogIn});
            });

            var heightLogIn = $(document).scrollTop()+250;
            var widthLogIn = $('html').innerWidth()/2 - 120;
            
            $('#diamond').css({'top':heightLogIn, 'left':widthLogIn});

            window.setTimeout(function(){
                var heightLogIn = $(document).scrollTop()+250;
                var widthLogIn = $('html').innerWidth()/2 - 120;
                
                $('#diamond').css({'top':heightLogIn, 'left':widthLogIn, 'border':'150px solid transparent', 'border-bottom': '1px solid white'}).
                $('#diamond:after').css({'border':'150px solid transparent', 'left':'-150px','border-top': '1px solid white'});
                // $('#diamond').animate({'top':heightLogIn, 'left':widthLogIn, 'border':'150px solid transparent'}, 3000, function(){
                //     alert('asdf');
                    
                // });
                // $('#diamond:after').animate({'border':'150px solid transparent', 'left':'-150px'}, 3000, function(){

                // });
            }, 1000);
        });

        // 3) 1슬라이드 비디오 설정
        window.setTimeout(function(){
            $('#s1Text1').css('transition', '0.5s').css('opacity','0');
            $('#s1Text2').css('transition', '0.5s').css('opacity','0');
            $('#s1Video1').animate({'left':'-1800px'},2500);
            $('#s1Main').animate({'left':'0px'},2000);
            
            // $('#s1Text1').css('display','block');
        }, 6000);//6000
        
        // 4) 1슬라이드 3번 문구 설정
        window.setTimeout(function(){
            $('#s1Text3').css('opacity', '1');
        }, 7000);//7000


        // 3) 1슬라이드 2번 배경 설정
        $('#s1Main').css('height', $('#section1').height());

        // 4) 1슬라이드 2번 배경의 이미지 크기 설정
        $('#s1Main img').css('height', $('#section1').height());
        // 5) 1슬라이드 2번 배경의 이미지 나타내기 설졍
        window.setTimeout(function(){
            $('#s1Main img').css('opacity', '1');
            $('#s1Text3').css('opacity', '0');
            $('.s1Cover').css('display','none');
        }, 9000);//9000

    </script>
  
    <script>
        // ---------------------------------------------------------------
        // 3. 2번 슬라이드 설정
        $(function(){
            // 1) 2번슬라이드 배경 크기 설정
            $('.s2Cover').css('height', $('#section2').height()+10);
            window.onresize = function(){
                $('.s2Cover').css('height', $('#section2').height()+10);
            }
            //2) 버튼 위치 설정
            var s2BtnsPosition = $('html').innerWidth()/2 - $('#s2Btns').width()/2;
            $('#s2Btns').css('left', s2BtnsPosition);
            window.onresize = function(){
                var s2BtnsPosition = $('html').innerWidth()/2 - $('#s2Btns').width()/2;
                $('#s2Btns').css('left', s2BtnsPosition);
            }

            //시간흐름에따른 시설안내 슬라이드 설정
            var interval1 = window.setInterval(function(){
                if($('#section2').offset().top==0){
                    setTimeout(function(){
                        clearInterval(interval1);
                    }, 1000)
                    $('#s2Btns1').css('opacity','1');
                    window.setTimeout(function(){
                        if($('html').width()>=1276){
                        $('#s2Btns').children().css('color', 'white');
                        }else{
                        $('#s2Btns').children().css('color', 'black');
                        }
                        $('.s2Cover>p').text('내부시설');
                        $('#s2Btns1').css('opacity','0.5');
                        $('#s2Btns2').css('opacity','1');
                        $('#s2OuterBuilding').animate({'left':'-1600px'},1000);
                        $('#s2InnerBuilding').animate({'left':'0px'},1000);
                        $('#s2NapGol').animate({'left':'1600px'},1000);
                    }, 3000);//000
                    window.setTimeout(function(){
                        $('#s2Btns').children().css('color', 'black');
                        $('.s2Cover>p').text('프리미엄 납골당');
                        $('#s2Btns2').css('opacity','0.5');
                        $('#s2Btns3').css('opacity','1');
                        $('#s2OuterBuilding').animate({'left':'-3200px'},1000);
                        $('#s2InnerBuilding').animate({'left':'-1600px'},1000);
                        $('#s2NapGol').animate({'left':'0px'},1000);
                    }, 7000);//000
                    window.setTimeout(function(){
                        if($('html').width()>=1106){
                        $('#s2Btns').children().css('color', 'white');
                        }else{
                        $('#s2Btns').children().css('color', 'black');
                        }
                        $('.s2Cover>p').text('Parking Spot');
                        $('#s2Btns3').css('opacity','0.5');
                        $('#s2Btns1').css('opacity','1');
                        $('#s2OuterBuilding').animate({'left':'0px'},1000);
                        $('#s2InnerBuilding').animate({'left':'1600px'},1000);
                        $('#s2NapGol').animate({'left':'3200px'},1000);
                    }, 11000);//000
        
                var interval2 = window.setInterval(function(){
                        window.setTimeout(function(){
                            if($('html').width()>=1276){
                            $('#s2Btns').children().css('color', 'white');
                            }else{
                            $('#s2Btns').children().css('color', 'black');
                            }
                            $('.s2Cover>p').text('내부시설');
                            $('#s2Btns1').css('opacity','0.5');
                            $('#s2Btns2').css('opacity','1');
                            $('#s2OuterBuilding').animate({'left':'-1600px'},1000);
                            $('#s2InnerBuilding').animate({'left':'0px'},1000);
                            $('#s2NapGol').animate({'left':'1600px'},1000);
                        }, 3000);//000
                        window.setTimeout(function(){
                            $('#s2Btns').children().css('color', 'black');
                            $('.s2Cover>p').text('프리미엄 납골당');
                            $('#s2Btns2').css('opacity','0.5');
                            $('#s2Btns3').css('opacity','1');
                            $('#s2OuterBuilding').animate({'left':'-3200px'},1000);
                            $('#s2InnerBuilding').animate({'left':'-1600px'},1000);
                            $('#s2NapGol').animate({'left':'0px'},1000);
                        }, 7000);//000
                        window.setTimeout(function(){
                            if($('html').width()>=1106){
                            $('#s2Btns').children().css('color', 'white');
                            }else{
                            $('#s2Btns').children().css('color', 'black');
                            }
                            $('.s2Cover>p').text('Parking Spot');
                            $('#s2Btns3').css('opacity','0.5');
                            $('#s2Btns1').css('opacity','1');
                            $('#s2OuterBuilding').animate({'left':'0px'},1000);
                            $('#s2InnerBuilding').animate({'left':'1600px'},1000);
                            $('#s2NapGol').animate({'left':'3200px'},1000);
                        }, 11000);//000
                        
                    },14000)
                }
            },1000);

            //시설안내 설명 설정
            
        });
    </script>

    <script>
        // 4. 3번 슬라이드 설정
        $('#s3Background').css('height', $('#section3').height());
    </script>

    <script>
        // 5. 4번 슬라이드 설정
        $('#s4Background').css('height', $('#section4').height());
    </script>

    <script>
        // 6. 5번 슬라이드 설정
        $('footer').css('height', $('#section5').height()-$('#contect').height())
    </script>
    <script>
        window.onload = function(){
            
        }
    </script>


     <!------------------------------------------------------------------------------------------------------------------------------------------>
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
                            // btn.css('padding-right', '40px');
                            btn.children().prop('src', 'img/noun_Close_52944.png').css({'width':'80', 'height':'60', 'padding-left':'10px'});
                            //아코디언이 펴져서 스크롤 바 생기는걸로 박스가 가려지는걸 커버하기 위해 위치 조정
                            // $("#serveMenuBtn").css('right', -($('html').width()-$('#serveMenuBtn').width()-70));
                            // alert('asdf');
                        }else{
                            // btn.css('padding-right', '40px');
                            btn.children().prop('src', 'img/noun_List_25956.png').css({'width':'90', 'height':'90'});
                            // $("#serveMenuBtn").css('right', -($('html').width()-$('#serveMenuBtn').width()-60));
                        }
                        layer.addClass('show');
                        layer.addClass('hide')
                    },
                )
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
                $(this).children('hr').css('display', 'none');
                $(this).siblings().children('hr').css('display', 'block');
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
        window.onclick = function(event){
            if(event.target == modal){
                modal.style.display = 'none';
            }
        }

        // X버튼 누르면 모달팝업 끄기
        var close = document.querySelector('.close');
        close.onclick = function() {
            modal.style.display = "none";
        }

        // 아이디/비번을 다 입력하면 로그인 버튼 활성화
        $(function(){
            $('#userIdLogIn').keyup(readyLogIn);
            $('#password').keyup(readyLogIn);
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
                    ($(this).next().css('background-image', "url('checkboxImage/innerbeigeOuterblack.png')"));
                    $('input:hidden').val('true');
                }else if($(this).prop('checked')==false){
                    $(this).next().css('background-image', "url('img/notCheck1.png')")
                    $('input:hidden').val('false');
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
            $('.modal').css('height',heightAll)
        });
    </script>

</body>
</html>
