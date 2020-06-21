<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입창</title>
    <link rel="icon" href="data:;base64,iVBORw0KGgo="><!--404오류잡는 코드-->
    <style>
        /* 전체화면 설정 */
        html{
            margin: 0 auto;
            padding:0px;
            /* 임의의 배경 */
            /* background-image: url('img/adult-1850704.jpg'); */
            /* background-size: 100%;
            background-repeat: no-repeat; */
        }
        body{
            margin: 0px;
            padding:0px;
        }
        body *{
            font-family: 'Noto Sans KR', sans-serif;
        }
        /* section{
            background: blue;
        } */
        /* 타이틀 설정*/
        #joinTitleBack{
            width: 100%;
            height: 330px;
            background-color: #b3a193;
            position: absolute;
            top:-20px;
            opacity: 0.5;
        }
        h1{
            margin: 50px;
            margin-bottom: 0px;
            margin-top: 120px;
            position: relative;
            text-align: center;
            font-size: 50px;
        }
        h1+p{
            font-size: 14px;
            font-weight: 500;
            text-align: center;
            z-index: 1;
        }

        /* 회원가입 단계표시 영역 */
        #wrapExpressDiv{
            display: flex;
            position: relative;
            text-align: center;
            margin: 30px auto;
            border-radius: 5px;
            box-shadow: 1px 1px 1px gray;
            margin-bottom: 40px;
        }
        [id^=square]{
            width: 40%;
            height: 60px;
            margin-right: 0px;
            z-index: 1;
            background-color: lightgray;
            border-top:1px solid gray;
            border-bottom:1px solid gray;
            border-left:1px solid gray;

            font-size: larger;
            font-weight: bolder;
            font-family: 'Noto Sans KR', sans-serif;
            color: #242424;
            line-height: 20px;
        }
        [id^=triangle-right]:not(:nth-last-of-type(1)) {
            width: 0;
            height: 0;
            border-top: 30px solid transparent;
            border-left: 32px solid lightgray;
            border-bottom: 32px solid transparent;
            margin-left: 0px;
        }
        #triangle-right1{
            position: absolute;
            left:32%;
            border-left:37px solid #242424;
            z-index: 3;
        }
        #triangle-right2{
            position: absolute;
            left:64.2%;
            border-top: 30px solid transparent;
            border-left: 36px solid gray;
            border-bottom: 32px solid transparent;
            z-index: 3;

        }
        #triangle-right12{
            position: absolute;
            top:-30px;
            left:-38px;
            border-top: 30px solid transparent;
            border-left: 30px solid #242424;
            border-bottom: 32px solid transparent;
            z-index: 4;
        }
        #triangle-right22{
            position: absolute;
            top:-30px;
            left:-36px;
            
            border-top: 30px solid transparent;
            border-left: 30px solid lightgray;
            border-bottom: 32px solid transparent;
            z-index: 4;
        }
        #triangle-right3{
            width: 30px;
            height: 60px;
            background-color: lightgray;
            border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;
            border-top:1px solid gray;
            border-bottom:1px solid gray;
            border-right:1px solid gray;
            z-index: 88;
        }
        #square1{
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
            /* width:200px; */
            background-color: #242424;
            color:#b3a193;
        }
        #square1>p{
           
        }
        #square2>p{
            /* background-color: slategray; */
            padding-left: 30px;
        }
        #square3>p{
            /* background-color: slategray; */
            padding-left: 50px;
            border-left: none;
        }
        #square3{
            border-left: none;
        }
      
        /* 이용약관 영역 */
        #wrapTOS{
            /* margin: auto; */
        }
        /* 이용약관 라벨 글씨 설정 */
        #wrapTOS label{
            font-size: 16px;
            margin: 5px;
        }
        /* 이용약관 테이블 */
        #termsOfServiceWrapT{
            vertical-align: middle;
        }
        #termsOfServiceWrapT *{
            margin: 10px;
            margin-left: 15px;
            line-height: 50px;
        }
        #termsOfServiceWrapT p{
            line-height: 16px;
        }
        #termsOfServiceWrapT td{
            line-height: 0px;
        }
        /* 이용약관 박스 설정 */
        .termsOfService{
            width: 385px;
            height: 300px;
            
            overflow: auto;
            
            border: 1px solid lightgray;
            border-radius: 3px;
            font-size: 10px;
            color: rgb(73, 73, 73);
            /* margin-left: 20px; */
        }
        /* 이용약관/개인정보처리방침/고객센터 각각 이동하는 것 설정 */
        #smallInform>a{
            font-size: 10px;
            color: rgb(73, 73, 73);
            text-decoration: none;
        }
        /* 약관 동의하기 버튼 설정 */
        #agreeBtn{
            width: 400px;
            height: 50px;
            line-height: 10px;
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 18px;
            color: rgb(80, 79, 79);
            border:none;
            background-color:#d2c4b9;
            margin: 50px;
        }
        /* '필수' 박스 설정 */
        .neccesary{
            background-color: #b3a193;
            color: white;
            padding: 1.5px 4px 2px 4px;
            font-size: 12px;
            font-family: 'Noto Sans KR', sans-serif;
        }
        /* 회원가입의 이용약관/개인정보처리방침/고객센터 설정 */
        #smallInformJoin{
            margin-top: 10px;
            margin-bottom: 50px;
        }
        #smallInformJoin>a{
            font-size: 12px;
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
             background: url('../../img/notCheck1.png') left/30px no-repeat; 
         }

        /* 정보입력 영역 숨기기 */
        #wrapInput{
            display:none;
        }
        /* 회원가입 필수입력란 테이블 설정 */
        #necessaryInputT{
            width:800px; 
            vertical-align: middle;
            border-collapse: collapse;
            /* border: 1px solid rgb(230, 224, 224); */
        }
        #necessaryInputT td{padding:12px; margin:0px}
        /* #necessaryInputT td:nth-of-type(1){border: 1px solid rgb(230, 224, 224);}
        #necessaryInputT td:nth-of-type(2){border: 1px solid rgb(230, 224, 224); border-right: none;}
        #necessaryInputT td:nth-of-type(3){border: 1px solid rgb(230, 224, 224);border-left: none;} */
        #necessaryInputT tr>td:nth-of-type(1){width:300px;}
        #necessaryInputT tr>td:nth-of-type(2){width:150px;}
        #necessaryInputT tr>td:nth-of-type(3){width:580px;}

        /* 회원가입 타이틀영역 설정 */
        #joinTitle{
            margin: 40px;
            margin-bottom: 30px;
            text-indent: -570px;
        }
        #bulletTitle{
            position: relative;
            top:11px;
            margin-right: 15px;
        }
        #joinTitleText{
           font-size: 30px;
           font-weight: 500;
        }

        /* 리스트 블릿 설정 */
        memberJoinSection li {
            list-style: none;
            padding-left: 1em; 
            text-indent: -.7em;
        }
        memberJoinSection li:not(.bulletTitle):before {
            content: "§ ";
            color: #d0b7b5; /* or whatever color you prefer */
        }

        /* 회원가입 필수입력란 - 사용자에 입력양식 설명문구 설정 */
        /* 일단 두가지 해놨는데 뭘로 할까 */
        .RegExplain{
            font-size: 10px;
            color: rgb(73, 73, 73);
        }
        .RegExplainHover{
            font-size: 12px;
            text-decoration: underline;
            color:rgb(116, 101, 22);
        }
        /* 드롭다운 목록 설정*/
        .dropdown{
            height:32px;
            border-radius: 3px;
            vertical-align: middle;
        }
        /* 타입이 tel인 것들 설정 */
        input[type='tel']{
            width:45px;
        }
        /* 메일서비스 텍스트 설정 */
        .mailService label{
            font-size: 12px
        }
        /* 회원가입 선택입력란 테이블 설정 */
        #selectInputT{
            width:500px; vertical-align: middle;border-collapse: collapse; 
            /* border: 1px solid rgb(230, 224, 224); */
        }
        #selectInputT td{padding:15px;}
        /* #selectInputT td:nth-of-type(1){border: 1px solid rgb(230, 224, 224);}
        #selectInputT td:nth-of-type(2){border: 1px solid rgb(230, 224, 224); border-right: none;}
        #selectInputT td:nth-of-type(3){border: 1px solid rgb(230, 224, 224);border-left: none;} */
        #selectInputT tr>td:nth-of-type(1){width:120px;}
        #selectInputT tr>td:nth-of-type(2){width:400px;}
        
        /* 회원가입 선택입력란 캡션 설정 */
        caption{
            text-indent: -580px;
            margin-bottom: 20px;
            
        }
         /* 회원가입 선택입력란 kg 설정 */
        #wrapPKSAndKg{
            position: relative;
        }
        #kg{
            font-size: 10px;
            font-weight: bolder;
            position: absolute;
            top: 6px;
            left: 150px;
            z-index: 10;
        }


        /* 회원가입 버튼 */
        #submitInform{
            margin: 50px;
            height: 40px;
            line-height: 10px;
            font-size: 16px;
            border:none;
        }
        /* 수평선 설정 */
        hr{
            border: none;
            border-top: 1px solid #ccc;
            opacity: 0.6;
            margin: 50px;
        }
        /* input태그 설정(버튼 제외) */
        input:not([id='submit']){
            border-radius: 3px;
            border: 1px solid gray;
            padding: 5px;
        }

	
        /* 주소 관련 */
        #findAdress{
            padding: 10px;
        }
        #findAdress input{
            margin: 5px;
        }
        #sample4_postcode{
            width:80px;
        }
        #findAdress input:nth-of-type(3), input:nth-of-type(4){
            width: 220px;
        }
        #findAdress input:nth-of-type(5), input:nth-of-type(6){
            width: 200px;
        }
		
		[type=button]:not([id=toLogInBtn]):not([id=toHomeBtn]):not([id=agreeBtn]){
			background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
           color: #242424;
           border:none;
		}
		[type=button]:not([id=toLogInBtn]):not([id=toHomeBtn]):not([id=agreeBtn]):hover{
			background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
            color: #b3a193;
            border:none;
		}
		[type=button]:not([id=toLogInBtn]):not([id=toHomeBtn]):not([id=agreeBtn]):disabled{
			background:lightgray;
            color: #242424;
            border:none;
		}

        /* 가입완료 영역 */
        /* 전체 */
        #completeJoin{
            width: 100%;
            height: 600px;
            background-color: rgb(245, 244, 244);
            text-align: center;
            margin: 0 auto;
            position: relative;
            top:-75px;
            display: none;
           
        }
        /* 배경외의 컨텐츠 영역 위치 설정 */
        #completeJoinContentLocation{
            position:relative;
            top:0px;
            background-color: rgb(241, 241, 241);
            padding-top: 50px;
            padding-bottom: 50px;
            margin: auto;
            border-radius: 10px;
            border: 2px solid #eee7e2;
        }
        #completeJoin img{
            padding: 30px;
        }
        /* 세부 컨텐츠영역 */
        #alertCompleteJoin{
            /* background-color: lightgreen; */
            padding: 5px;
        }
        /* '회원가입' 글씨 */
        #alertCompleteJoin span{
            color:#d0b7b5;
            font-family: 'Noto Sans KR', sans-serif;
        }
        /* 설명문구 */
        #alertCompleteJoin p{
            line-height: 15px;
            color:#242424;
            font-family: 'Noto Sans KR', sans-serif;
        }
        /* 로그인하러 가기 버튼 */
        #toLogInBtn{
            box-sizing: content-box;
            width:115px;
            height: 45px;
            background-color: #242424;
            border: none;
            border-radius: 2px;
            color: #d2c4b9;
            font-weight: bolder;
            font-size: 14px;
            position: relative;
            left: -10px;
        }
        /* 홈으로 버튼 */
        #toHomeBtn{
            box-sizing: content-box;
            width:115px;
            height: 45px;
            background-color:  #d2c4b9;
            border: none;
            border-radius: 2px;
            color: #242424;
            font-weight: bolder;
            font-size: 14px;
            margin: 20px;
            position: relative;
            left: -10px;
        }
		
 
          
       /* fixed 예약버튼 설정 */
       aside[id='reservation']{
            width:45px;
            height: 45px;
            right: 8%;
            top:620px;
            position: relative;
            position: fixed;
            z-index: 9999999999;
            background-color: #d0b7b5;
           
            opacity: 1;
            text-align: center;
            
            margin: 0px;
            padding: 0px;
            border: 2px solid #242424;
            border-radius: 100px;
        }
        #reservation a{
            position: absolute;
            left:0;
            top:0;
            width:40px;
            height: 40px;
            border-radius: 100px;
            text-indent:5px;
            line-height: 45px;
            color: #242424;
            font-weight: bolder;
            text-decoration: none;
        }
        /* fixed 사이드바 */
        #side:not(#reservation){
            position: static;
            width:110px;
            right: 0%;
            top:100px;
            position: fixed;
            z-index: 9999990000;
            background-color: black;
            color: white;
            opacity: 0.7;
            text-align: center;
            margin: 0px;
        }
        #side p{
            /* background-color: rgb(47, 78, 68); */
            margin: 0px;
            padding: 14.5px 0px 14.5px 0px;
            font-size: 14px;
            border-bottom: 1px solid rgb(59, 57, 57);

        }
        #side p:first-child{
            border:none;
        }
        #side>p>a{
            padding: 14.5px 25px 14.5px 25px;
            margin: 0px;
            text-decoration: none;
            color: white;
        }
        #side p:nth-last-of-type(4){
            color: #d0b7b5;
            font-size: 15px;

            padding-top: 0px;
            line-height: 0px;
            padding-bottom: 17px;
        }

         /* 풋터 설정 */
        footer{
            background-color: #242424;
            position: relative;
            /* top:-75px; */
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
            margin:0px;
            margin-top: 10px;
            margin-left: 30px;
            line-height: 30px;
            padding-left: 50px;
        }
        #footerTable a{
            text-decoration: none;
            color: white;
        }
        #animalProtectSys{
            background-color: #b3a193;
            color: #242424;
            padding: 1.5px 4px 2px 4px;
            font-size: 12px;
            font-family: 'Noto Sans KR', sans-serif;
        }
    </style>
    <!-- 노토산스kr 폰트 가져오기 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
</head>
<body oncontextmenu="return false"><!-- 마우스 우클릭해서 새로고침 못하게 마우스 우클릭 막기-->
	<%@include file="../common/menubar.jsp"%>

   
 <!-- <섹션(컨텐츠) 시작> -->
    <section id="memberJoinSection">

        <!-- 2. 회원가입 페이지(단계식) -->
        <!-- 1) 타이틀 및 타이틀 배경 -->
        <div id="joinTitleBack"></div>
        <h1>Join Us</h1>
        <p>
            당신의 소중한 가족이자 따뜻한 친구와의 마지막 이별을
            혜윰과 함께 하세요<br> 아름다운 이별은 추억을 더욱 빛나게 합니다
        </p>

        <!-- 2) 회원가입 단계식 표시영역 -->
        <div id="wrapExpressDiv">
           <div id="square1" class="expressDiv1">
                <p>이용약관 동의</p>
           </div>
           <div id="triangle-right1" class="expressDiv1">
                <div id="triangle-right12" class="makeLine"> </div>
           </div>
           <div id="square2" class="expressDiv2">
                <p>회원정보 입력</p>
            </div>
            <div id="triangle-right2" class="expressDiv2">
                <div id="triangle-right22" class="makeLine"></div>
            </div>
            <div id="square3" class="expressDiv3">
                <p>가입 완료</p>
            </div>
            <div id="triangle-right3" class="expressDiv3">

            </div>
        </div>

        <!-- 3) 이용약관 동의 단계 컨텐츠 -->
       <div id="wrapTOS">
            <form method="get" action="" id="termsOfServiceWrap">
                <table id="termsOfServiceWrapT" align="center">
                    <tr>
                        <td colspan="2">
                            <input type="checkbox" name="selectAll" id="selectAll" class="common">&nbsp;<label for="selectAll">&nbsp;이용약관, 개인정보 수집 및 이용, 위치정보 이용약관(선택), 프로모션 안내 메일 수신(선택)에 모두 동의합니다</label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" class="common" name="selectTOS" id="selectTOS1">&nbsp;<label for="selectTOS1">&nbsp;혜윰 이용약관 동의<span class="neccesary">필수</span></label>
                            <div class="termsOfService hyeyum">
                                <p>
                                <b>여러분을 환영합니다.</b><br>
                                혜윰 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
                            
                                구현편의상 이하 생략(완성 후 넣겠음)
                                혜윰 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
                            
                                구현편의상 이하 생략(완성 후 넣겠음)
                                혜윰 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
                            
                                구현편의상 이하 생략(완성 후 넣겠음)
                                </p>
                            </div>
                        </td>
                        <td>
                            <input type="checkbox" class="common" name="selectTOS" id="selectTOS2">&nbsp;<label for="selectTOS2">&nbsp;개인정보 수집 및 이용에 대한 안내<span class="neccesary">필수</span></label>
                            <div class="termsOfService pesonalInformation">
                                <p>
                                    정보통신망법 규정에 따라 네이버에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.
                                    <br><br>
                                    <b>1. 수집하는 개인정보</b><br>
                                    이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 네이버 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 네이버는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.
                            
                                    구현편의상 이하 생략(완성 후 넣겠음)
                                    이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 네이버 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 네이버는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.
                            
                                    구현편의상 이하 생략(완성 후 넣겠음)
                                    이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 네이버 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 네이버는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.
                            
                                    구현편의상 이하 생략(완성 후 넣겠음)
                                </p>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="checkbox" class="common" name="selectTOS" id="selectTOS3">&nbsp;<label for="selectTOS3">&nbsp;이벤트 등 프로모션 알림 메일 수신(선택)</label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2">
                            <input type="button" value="동의하기" id="agreeBtn" disabled>
                        </td>
                    </tr>
                </table>
                <!--  이용약관/개인정보처리방침/고객센터 각각 이동하는(아주 작은) 링크ㅉ-->
                <div id="smallInformJoin" align='center'>
                    <a href="#" id="usingTOS">이용약관/</a>
                    <a href="#" id="personalTOS"><b>개인정보처리방침</b></a><span style="font-size: 10px; font-weight: lighter;">/</span>
                    <a href="#">고객센터</a>
                    <!-- <hr> -->
                </div>
            </form>
       </div>

     
         <!-- 4) 회원정보 입력 단계 컨텐츠 -->
        <div id="wrapInput" align='center'>
            <div id="joinTitle">
                <img  id='bulletTitle' src="../../img/joinTitleBullet1.png" width="45" height="45" alt="">
                <span id="joinTitleText">정보 입력</span>
            </div>
            <!-- 4-1) 회원정보 필수 입력란 -->
            <form id="memberJoinForm" action="#">
                <table id="necessaryInputT" align="center">
                    <tr>
                        <td><label for="name"><li type="square">이름</li></label></td>
                        <td><input type="text" name="name" id="name" required></td>
                        <td><label id="resultName"></label></td>
                    </tr>
                    <tr>
                        <td><label for="userId"><li type="square">아이디</li></label></td>
                        <td><input type="text" name="userId" id="userId" required></td>
                        <td>
                            <input type="button" value="중복확인" onclick="checkId();">
                            <span class='RegExplain' id="resultId">
                                5-20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="password1"><li type="square">비밀번호</li></label></td>
                        <td><input type="password" name="password1" id="password1" required></td>
                        <td>
                            <abbr class="RegExplainHover" title="7~16자의 영문자, 숫자, 특수문자(^, &제외)를 사용">입력양식</abbr>
                            <label id="resultPwd1"  class="RegExplain">
                                7~16자의 영문자, 숫자, 특수문자(^, &제외)를 사용
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="password2"><li type="square">비밀번호 확인</li></label></td>
                        <td><input type="password" name="password2" id="password2" required></td>
                        <td>
                            <label id="resultPwd2"></label>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="email"><li type="square">이메일</li></label></td>
                        <td><input type="text" name="email" id="email" required></td>
                        <td>
                            <span>@</span>&nbsp;
                            <input type="text" name="directSiteName" id="directSiteName" required size="5" disabled>
                            <select name="siteName" id="siteName" class="dropdown">
                                <option value="choice" selected>선택하세요</option>
                                <option value="naver.com">naver.com</option>
                                <option value="daum.net">daum.net</option>
                                <option value="google.com">google.com</option>
                                <option value="hanmail.net">hanmail.net</option>
                                <option value="direct" id="directChoice">직접 입력</option>
                            </select>
                            &nbsp;<input type="button" id="sendEmailBtn" value="본인인증" onclick="sendEmail();">
                            &nbsp;<input type="button" id="resetEmailCheckBtn" value="인증 초기화" onclick="resetEmailCheck();">
                            <br>
                            <label id="resultEmail"></label>
                        </td>
                    </tr>
                    <tr>
                    	<td style="text-align:right">
                    		<label style="font-size:14px;">인증번호 입력</label>
                    	</td>
                    	<td>
                    		<input type="text" name="checkEmail" id="checkEmail">
                    	</td>
                    	<td>
                    		<input type="button" name="emailCheckBtn" id="emailCheckBtn" value="확인" onclick="checkEmailF();" style="padding-left:10px; padding-right:10px;">
                    		&nbsp;&nbsp;<label id="resultEmailCheck" style="font-size:12px; color:#242424"></label>
                    	</td>
                    </tr>
                    <tr>
                        <td><label for="tel"><li type="square">전화번호</li></label></td>
                        <td colspan="2">
                            <select name="tel1" id="tel1" class="dropdown" style="width: 50px;">
                                <option value="" selected>선택하세요</option>
                                <option value="010">010</option>
                                <option value="011">011</option>
                                <option value="016">016</option>
                                <option value="017">017</option>
                                <option value="018">018</option>
                                <option value="019">019</option>
                            </select>
                            <span>-</span>
                            <input type="tel" name="tel2" id="tel2" required>
                            <span>-</span>
                            <input type="tel" name="tel3" id="tel3" required>
                            <label id="resultTel"></label>
                        </td>
                    </tr>
                    <tr>
                        <td><label for=""><li type="square">주소</li></label></td>
                        <td colspan="2">
                            <div id="findAdress">
                                <input class="address" type="text" id="sample4_postcode" placeholder="우편번호">
                                <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
                                <input class="address" type="text" id="sample4_roadAddress" placeholder="도로명주소">
                                <input class="address" type="text" id="sample4_jibunAddress" placeholder="지번주소">
                                <span id="guide" style="color:#999;display:none"></span>
                                <input class="address" type="text" id="sample4_detailAddress" placeholder="상세주소">
                                <input class="address" type="text" id="sample4_extraAddress" placeholder="참고항목">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td><label for=""><li type="square">정보수신메일</li></label></td>
                        <td colspan="2" class="mailService">
                            <label for="">
                                혜윰에서 제공하는 정보수신메일을 받으시겠습니까?
                            </label>&nbsp;
                            <input type="radio" name="mailServiceArgree" id="mailServiceArgreeY" value="Y" checked>
                            <label for="mailServiceArgreeY">예</label>
                            <input type="radio" name="mailServiceArgree" id="mailServiceArgreeN" value="N">
                            <label for="mailServiceArgreeN">아니오</label>
                        </td>
                    </tr>
                </table>

                
                <hr> 
                

                <!-- 4-2) 회원정보 선택입력란 -->
                <table id="selectInputT" align="center">
                    <caption>* 아래는 선택사항입니다.</caption>
                    <tr>
                        <td><li>아이 이름</li></td>
                        <td><input type="text" name="pName" id="pName" placeholder="아이이름을 입력해주세요."></td>
                    </tr>
                    <tr>
                        <td><li>아이 몸무게</li></td>
                        <td>
                            <span id="wrapPKSAndKg">
                                <input type="text" name="pWeight" id="pWeight"  placeholder="00.0">
                                <span id="kg">kg</span>
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td><li>아이 품종</li></td>
                        <td>
                            <select name="pKindMain" id="pKindMain" class="dropdown">
                            	<option value="" selected>선택하세요</option>
                                <option value="개">강아지</option>
                                <option value="고양이">고양이</option>
                                <option value="기타종류">기타 동물</option>
                            </select>
                            <input type="text" name="pKindServe" id="pKindServe" placeholder="상세품종" size="15">
                        </td>
                    </tr>
                </table>

                <!-- 회원정보 제출 버튼-->
                <input type="button" value="가입하기" id="submitInform" onclick="goJoin();">
            </form>
        </div>
        
        <!-- 5) 가입 확인 단계 컨텐츠-->
        <div id="completeJoin">
           <div id="completeJoinContentLocation">
                <img src="../../img/회원가입체크1거무스름.png" width='120' height="100" alt="">
                <div id="alertCompleteJoin">
                    <h2><span>회원가입</span>이 완료되었습니다.</h2>
                    <p>(주)혜윰-반려동물상조서비스 회원으로 가입되셨습니다.</p>
                    <p>누구보다 정성스런 마음으로 여러분을 모시겠습니다.</p>
                </div>
                <button type="button" id="toHomeBtn" onclick="memberCompleteGoHome();">홈으로</button>
                <button type="button" id="toLogInBtn" onclick="memberCompleteGoLog();">로그인</button>
           </div>
        </div>
    </section>


    <!-- 풋터(하단 마침 블록) 시작 -->
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

    

    <!-- 동적제어 시작(script 영역) -->
    <!-- 1. 회원가입 필수 입력란 관련 기능(정규표현식, 비밀번호 일치확인, 아이디와 비밀번호 중복여부 확인) -->
    <script>
        //  <참고 사항>
        //  1) ★★★
        //      입력이되었어도 조건 안맞을시 제출안되게하는 기능과 
        //      입력안하고 넘어갈 수 있는것 입력하게하는 기능 추가해야함
        //     ★★★
        //     -> 처리필요 항목(강제검정x 항목) : 이름,  이메일, 전화번호, 주소, 정보수신메일 동의 여부
        //  2) ★★★필수항목들 required처리 해야함★★★
        //  3) 이메일 인증기능 구현할 것인가?
        //  4) 휴대폰 인증 할것인가?
        //  5) 서버 연결되면 주소 api 잘 작동하는지 확인 => 확인 완료\^^/
        //  <궁금점>
        //  1) 주소는 신주소/구주소 중 하나만 선택해서 들어가게 해야할까 아니면 다할까
        $(function(){
            var styleFalse = {'color': 'red', 'font-size':'11px'};
            var styleTrue = {'color': 'green', 'font-size':'11px'};
            //이름 정규표현식, 한글자씩 검증
            $('#name').change(function(){
                var regEx = /^[가-힣]{2,}$/;
                if(!regEx.test($('#name').val())){
                    $('#resultName').html('이름은 한글로 2자이상이어야 합니다.').css(styleFalse);
                    $(this).val('').focus();
                }else{
                    $('#resultName').html('확인되었습니다.').css(styleTrue);
                }
            })

            //아이디 정규표현식, change시 강제 검증
            $('#userId').change(function(){
                var regEx = /^[0-9a-z-_]{5,20}$/;
                if(!regEx.test($(this).val())){
                    $('#resultId').css({'color':'red', 'font-weight':'bold'});
                    $(this).prop('value', '').focus();
                }else{
                    $('#resultId').css({'color':'black', 'font-weight':'400'});
                }
            });

            //비밀번호 정규표현식 및 확인, 한글자씩 검증, change시 강제 검증
            $('#password1').change(function(){
                var regEx = /^([^^&])\w[^^&]{5,16}$/;
                if(!regEx.test($(this).val())){
                    $('#resultPwd1').html('7~16자의 영문자, 숫자, 특수문자(^, &제외)를 사용').css(styleFalse)
                    $(this).prop('value', '').focus();
                }else{
                    $('#resultPwd1').html('비밀번호로 사용 가능합니다.').css(styleTrue)
                }
            }).keyup(function(){
                if($(this).val()!=$('#password2').val()&&$('#password2').val()!=''){
                    $('#resultPwd2').html('비밀번호가 일치하지 않습니다.').css(styleFalse)
                }
                if($(this).val()==$('#password2').val()&&$('#password2').val()!=''){
                    $('#resultPwd2').html('비밀번호가 일치합니다.').css(styleTrue)
                }
            });

            $('#password2').change(function(){
                if($(this).val()!=$('#password1').val()){
                    $('#resultPwd2').html('비밀번호가 일치하지 않습니다').css(styleFalse)
                    $('#password2').prop('value', '').focus();
                }else{
                    $('#resultPwd2').html('비밀번호가 일치합니다.').css(styleTrue)
                }
            }).keyup(function(){
                if($(this).val()==$('#password1').val()&&$('#password2').val()!=''){
                    $('#resultPwd2').html('비밀번호가 일치합니다.').css(styleTrue)
                }
                if($(this).val()!=$('#password1').val()&&$(this).val()!=''){
                    $('#resultPwd2').html('비밀번호가 일치하지 않습니다.').css(styleFalse);
                }
            });
                       
            // 아이디와 비밀번호 중복여부 확인, 알림창으로, change시 강제 검증
            $('#password1').change(function(){
                if($(this).val() == $('#userId').val()&&$('#password1').val()!=''){
                    alert('아이디와 같은 비밀번호는 사용할 수 없습니다.');
                    $(this).prop('value', '').focus();
                    $('#resultPwd1').html('7~16자의 영문자, 숫자, 특수문자(^, &제외)를 사용').css('color', 'black');
                }
            });
            $('#userId').change(function(){
                if($(this).val() == $('#password1').val()&&$('#password1').val()!=''){
                    alert('아이디와 같은 비밀번호는 사용할 수 없습니다.');
                    $(this).prop('value', '');
                }
            }); 
  
            //이메일 정규표현식 및 이메일 확인(현재는 양식만 확인)
            $('#email').blur(function(){
                // var regEx = /^[\S]{1,}@[\S]{1,}$/;//드롭다운 활용하므로 안씀
                var regEx = /^[^@^ ]{1,}$/;
                if(!regEx.test($(this).val())||$(this).val()==''){
                    $('#resultEmail').html('<abbr class="RegExplainHover" title="이메일 아이디에 공백이나 @가 들어갔는지 확인해보세요">이메일 입력 안될때</abbr>').css(styleFalse)
                    $('#email').focus();
                }else{
                    $('#resultEmail').prop('value', '');
                }
            })
            $('#email').blur(function(){
                if($('#email').val()==''){
                    $(this).prop('value', '').focus();
                    $('#resultEmail').html('메일 아이디를 입력해주세요').css('font-size', '10px').css(styleFalse);
                }else{
                    $('#resultEmail').prop('value', '');
                }
                if($('#email').val()!=''
                &&!($('#siteName').children('option:selected').val() == 'choice'
                ||$('#siteName').children('option:selected').val() == 'direct')){
                    $('#resultEmail').html('확인되었습니다.').css(styleTrue);
                }
            });
            $('#siteName').change(function(){
                if($('#email').val()!=''
                &&!($('#siteName').children('option:selected').val() == 'choice'
                ||$('#siteName').children('option:selected').val() == 'direct')){
                    $('#resultEmail').html('확인되었습니다.').css(styleTrue);
                }
                if($('#siteName').children('option:selected').val() == 'choice'
                ||$('#siteName').children('option:selected').val() == 'direct'){
                    $('#resultEmail').html('');
                }
            });
            $('#directSiteName').blur(function(){
                if($('#email').val()!=''&&$('#directSiteName').val()!=''){
                    $('#resultEmail').html('확인되었습니다.').css(styleTrue);
                }else{
                    $('#resultEmail').html('전부 입력해주세요').css(styleFalse);
                }
                if($('#siteName').children('option:selected').val() != 'choice'
                    &&$('#siteName').children('option:selected').val() != 'direct'
                    &&$('#email').val()!=''){
                        $('#resultEmail').html('확인되었습니다.').css(styleTrue);
                }
            })

            // 이메일주소 드롭다운 선택에 따라 직접입력창 활성화여부와 값을 설정
            $('#siteName').change(function(){
                var selectedValue = $('#siteName').children('option:selected').html();
                
                if(selectedValue==$('#directChoice').html()){
                    $('#directSiteName').prop('disabled', false).focus().prop('value', '');
                }else if(!$('#directSiteName').prop('disabled')){
                    $('#directSiteName').prop('disabled', true).prop('value', '');
                }
                
                if($('#directSiteName').prop('disabled')){
                    $('#directSiteName').css('background', 'lightgray');
                }else if($('#directSiteName').prop('disabled')==false){
                    $('#directSiteName').css('background', 'white');
                }
            });
            if($('#directSiteName').prop('disabled')){
                    $('#directSiteName').css('background', 'lightgray');
            }

            //전화번호 정규표현식
            $('#tel2').blur(function(){
                var regEx = /^[\d]{4}$/;
                if(!regEx.test($(this).val())){
                    $('#resultTel').html('4자리의 숫자를 입력하세요.').css(styleFalse)
                    $(this).prop('value', '').focus();
                }else{
                    $('#resultTel').html('');
                }
            });
            $('#tel3').blur(function(){
                var regEx = /^[\d]{4}$/;
                if(!regEx.test($(this).val())){
                    $('#resultTel').html('4자리의 숫자를 입력하세요.').css(styleFalse)
                    $(this).prop('value', '').focus();
                }else{
                    $('#resultTel').html('');
                }
            });
	
            
            //동물 무게 정규표현식(숫자와 .만 가능하게)
            $('#pWeight').change(function(){
            	var regEx = /^[\d,]{1,}[.]{0,1}[\d]{1,}$/;
            	if(!regEx.test($(this).val())){
            		alert('숫자와 .한개로만 입력되어야 합니다.');
            		$('#pWeight').val('').focus();
            	}
            });
            
            
            
            
            
        })
    </script>
    
    <!-- 새로고침/뒤로가기 막기 관련 기능 -->
	<script>
		
		//마우스 클릭으로 인한 새로고침 막기
		
	
		
		// 회원가입 중 새로고침 막기
		$(function(){
			window.onkeydown = function(){				
				if (event.keyCode == 116) {
			        alert("가입 중엔 새로고침을 할 수 없습니다.");
			        event.keyCode = 2;
			        return false;
			    } else if (event.ctrlKey
			            && (event.keyCode == 78 || event.keyCode == 82)) {
			        return false;
			    }
			}
			
			
		})
		
	</script>
	
	<!-- 아이디 중복체크 관련 기능 -->
	<script>
		//아이디 중복확인
		idCheckTrue = false;
		function checkId(){
			var userId = $('#userId');
			if(userId.val()==''){
				alert('아이디를 입력해주세요');
				userId.focus();
				return;
			}
			
			$.ajax({
				url:"<%=request.getContextPath()%>/idCheck.me"
				, type:"post"
				, data:{userId:userId.val()}
				, success:function(data){
					if(data=="success"){
						alert('사용하실 수 있는 아이디 입니다.')
						idCheckTrue = true;
					}else if(data=="fail"){
						alert('이미 존재하는 아이디 입니다.')
						userId.val('').focus();
					}
				}
				, error:function(request, status, error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			})
		}
		
		$('#userId').change(function(){
			idCheckTrue = false;
		})
	</script>
	
	<!-- 이메일 본인인증 기능 관련 -->
	<script>
		checkSuccess='';//인증값을 저장하는 변수
		completeCheck=-1;//인증이 완료되었는가 여부 변수
		
		function sendEmail(){
			//이메일을 입력했는지 체크
			if($('#email').val()==''){
				alert('이메일 아이디를 입력하고 진행해주세요')
				$('#email').focus();
				return;
			}
			
			if($('#directSiteName').val()==''&&($('#siteName').val()==''||$('#siteName').val()=='choice')){
				alert($('#siteName').val());
				alert('이메일 주소를 입력하고 진행해주세요');
				return;
			}
			
			//이미 인증받은 메일인가 체크
			if(completeCheck==1){
				alert('이미 인증받으셨습니다');
				return;
			}
			
			//이메일 데이터 통합하기
			var email1 = $('#email');
           	var eamil2 ="";
           	if($('#directSiteName').prop('disabled')==true){
           		email2 = $('#siteName');
           	}else{
           		email2 = $('#directSiteName');
           	}
           	
			$.ajax({
				url:"<%=request.getContextPath()%>/checkEmail.me"
				, type:"post"
				, data:{email:email1.val()+'@'+email2.val()}
				, success:function(data){
					//너무 말도 안되는 이메일을 작성한 경우
					if(checkSuccess==1){
						alert('이메일 오류입니다. 다시 작성해주세요');
						$('#email').val('');
						return;
					}
					
					checkSuccess = data;
					intervalEmail();
					$('#sendEmailBtn').prop('disabled', true);
					$('#emailCheckBtn').prop('disabled', false);
					alert('인증번호를 보냈습니다');
				}
				, error:function(request, status, error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			})
		}
		
		//인증 남은시간 보여주고 인증 시간 끝나면 리셋해주기
		function intervalEmail(){
			var min = 2;
			var sec = 59;
			intervalE = window.setInterval(function(){
				if(sec<10){
					$('#resultEmailCheck').text('남은 시간 0' + min + ':0' + sec);
				}else{
					$('#resultEmailCheck').text('남은 시간 0' + min + ':' + sec);
				}
				
				if(sec==0&&min==0){
					$('#resultEmailCheck').text('');
					alert('인증가능 시간이 끝났습니다. 다시 인증해 주세요');
					checkSuccess='reset';
					$('#emailCheckBtn').prop('disabled', true);
					$('#emailCheckBtn').prop('disabled', false);
					clearInterval(intervalE);
				}
				sec--;
				if(sec==0&&min!=0){
					min--;
					sec=59;
				}
			},1000);
		}

		//인증번호 확인 함수
		function checkEmailF(){
			//이메일 인증을 누르고 진행하였는가
			if(checkSuccess=='success'){
				alert(checkSuccess);
				alert('이미 완료되었습니다');
				return;
			}
			//이메일이 입력되었는가
			if($('#email').val()==''){
				alert('먼저 이메일을 입력해주세요');
				return;
			}
			//이메일을 변경한 경우
			if(checkSuccess=="reset"){
				alert('다시 인증하셔야 합니다');
				return;
			}
			
			//인증 안받고 누른 경우
			if(checkSuccess==''){
				alert('인증메일을 받고 진행해주세요')
				return;
			}
			
			//인증번호 입력란에 값을 넣고 버튼을 눌렀는가
			if($('#checkEmail').val().length==0){
				alert('인증번호를 입력해주세요');
				return;
			}
			//본격적으로 인증번호 비교
			var compare = document.getElementById('checkEmail').value;
			
			if(checkSuccess==compare){
				alert('인증에 성공하셨습니다');
				checkSuccess='success';
				completeCheck=1;
				
				$('#sendEmailBtn').prop('disabled', false);
				$('#emailCheckBtn').prop('disabled', true);
				
				clearInterval(intervalE);
				$('#resultEmailCheck').text('인증 성공');
			}else if(checkSuccess==''){
				alert('본인 인증 버튼을 눌러주세요');
			}else if(checkSuccess=='reset'){
				alert('다시 인증해주세요');
			}else{
				alert('맞지 않는 번호입니다.')
				$('#checkEmail').val('');
			}
		}
		
		//인증 초기화 함수
		function resetEmailCheck(){
			$('#sendEmailBtn').prop('disabled', false);
			$('#emailCheckBtn').prop('disabled', true);
			$('#resultEmailCheck').text('');
			checkSuccess='';
			completeCheck=-1;

			//처음엔 인터벌이 존재하지 않으므로
			if(typeof(intervalE)!='undefined'){
				clearInterval(intervalE);				
			}
		}
		
		//이메일 입력란이 바뀌었을 경우 자동으로 인증 초기화
		$('#email').change(function(){
			resetEmailCheck();
		})
		$('#directSiteName').change(function(){
			resetEmailCheck();
		})
		$('#siteName').change(function(){
			resetEmailCheck();
		})
		
	</script>
	
    <!-- 본격 회원 가입 관련 영역 -->
    <script>
    	//회원가입화면에서 로그인 할 시 회원가입화면을 벗어나게 
    	<%if(request.getSession().getAttribute("loginUser")!=null){%>
			location.href="<%=request.getContextPath()%>/index.jsp";
		<%}%>

		//회원가입하러 가기
        function goJoin(){
        	 var regEx1 = /^[가-힣]{2,}$/;
             if(!regEx1.test($('#name').val())){
                 alert('이름을 확인해주세요');
                 $('#name').focus();
                 return;
             }
             var regEx2 = /^[0-9a-z-_]{5,20}$/;
             if(!regEx2.test($('#userId').val())){
            	 alert('아이디를 확인해주세요');
                 $('#userId').focus();
                 return;
             }
             
             if(idCheckTrue==false){
            	 alert('아이디 중복확인을 해주세요');
            	 return;
             }
             
             var regEx3 = /^([^^&])\w[^^&]{5,16}$/;
             if(!regEx3.test($('password1').val())){
            	 alert('비밀번호를 확인해주세요');
                 $('#password1').focus();
                 return;
             }
             
             if($('#password1').val()!=$('#password2').val()){
            	 alert('비밀번호 확인을 해주세요');
            	 return;
             }
             
             if(!(completeCheck==1)){
            	 alert('이메일 본인 인증을 받아야합니다.');
            	 return;
             }
             
             if($('#name').val().trim().length==0
            	|| $('#userId').val().trim().length==0
            	|| $('#password1').val().trim().length==0
            	|| $('#password2').val().trim().length==0
            	|| $('#resultEmail').text()!='확인되었습니다.'
            	|| $('#tel1').val().length==0
            	|| $('#tel2').val().length==0
            	|| $('#tel3').val().length==0
            	|| $('#email').val().length==0
             	){
            	 alert('필수항목을 입력하셔야 합니다');
            	 return;
             }
			
             if($('#sample4_postcode').val().length==0
    			||$('#sample4_roadAddress').val().length==0
    			||$('#sample4_jibunAddress').val().length==0
    			||$('#sample4_detailAddress').val().length==0
    			||$('#sample4_extraAddress').val().length==0
             	){
            	 alert('주소를 전부 입력해 주세요');
            	 return;
             }
             
             if($('#siteName').val()=='choice'){
            	 alert('이메일 주소를 제대로 선택해주세요');
            	 return;
             }
             
             
           	var userName = $('#name');
           	var userId = $('#userId');
           	var userPwd = $('#password1');
           	var email1 = $('#email');
           	var eamil2 ="";
           	if($('#directSiteName').prop('disabled')==true){
           		email2 = $('#siteName');
           	}else{
           		email2 = $('#directSiteName');
           	}
           	var tel1 = $('#tel1');
           	var tel2 = $('#tel2');
           	var tel3 = $('#tel3');
           	
           	var address1 = $('#sample4_postcode')
           	var address2 = $('#sample4_roadAddress')
           	var address3 = $('#sample4_jibunAddress')
           	var address4 = $('#sample4_detailAddress')
           	var address5 = $('#sample4_extraAddress')
           	
           	var informMail = "";
           	if($('#mailServiceArgreeY').prop('checked')==true){
           	 	informMail = $('#mailServiceArgreeY');
           	}else{
           	 	informMail = $('#mailServiceArgreeN');
           	}

           	var pName = $('#pName');
           	var pWeight = $('#pWeight');
           	
        	var pKindMain =$('#pKindMain');
           	var pKindServe =$('#pKindServe');
           	
           	if(pKindMain.val().trim().length==0||pKindServe.val().trim().length==0||pName.val().trim().length==0||pWeight.val().trim().length==0){
           	var continueInput = confirm('반려동물 정보를 모두 입력하지 않으셨습니다. 마저 입력하시겠습니까?');
           		if(continueInput==true){
           			return;
           		}
           	}
           	
           	$.ajax({
           		url:"<%=request.getContextPath()%>/join.me"
           		, type:"post"
           		, data:{userName:userName.val(), userId:userId.val(), userPwd:userPwd.val()
           			, email:email1.val()+'@'+email2.val(), phone:tel1.val()+tel2.val()+tel3.val()
           			, address:'('+address1.val()+')'+address2.val()+address3.val()+address4.val()+address5.val()
           			, informMail:informMail.val(), pName:pName.val()
           			, pWeight:pWeight.val(), pKind:'('+pKindMain.val()+')'+pKindServe.val()
           			}
           		, success:function(data){
           			if(data=="success"){
           				alert('가입이 완료되었습니다');
			           	//가입하기 버튼 클릭시 가입완료단계로
			            if($('#name').val() != null){
			                // $('#submitInform').prop('disabled', false);
			                // var bool = $('#submitInform').prop('disabled');
			                // if(bool==false){
			                    // alert('asdf');
			                    $('#submitInform').prop('disabled', false).css({'outline-style': 'auto',
			                    'outline-color': '#242424'});
			                    $('#wrapInput').css('display', 'none');
			                    $('#completeJoin').css('display', 'block');
			
			                    $('#square2').css({'background-color':'lightgray', 'color':'#242424'})
			                    $('#triangle-right22').css({'border-left':'32px solid lightgray'});
			                
			                    $('#square3').css({'background-color':'#242424', 'color':'#b3a193'})
			                    $('#triangle-right3').css({'background':'#242424'});
			                    
			                    // 섹션의 여백을 줄이기 위해 섹션 크기를 줄여줌
			                    // var sectionHeight = $('section').height();
			                    // alert(sectionHeight);
			                    var a = $('html').height()
			                    $('body').css('height', 900);
			                    $('footer').css('top', '-65px')
			                    // $('#wrapExpressDiv').css('margin-bottom', '0px');
			                // }else{
			                // }
			                //줄어든 창의 크기에 맞춰 다시 로그인 모들창 크기 조정
			                var heightAll = $('html').height();
			                $('.modal').css('height',heightAll)
			            }
           			}else if(data=="failM"){
           				alert('가입 오류입니다');
           			}else if(data=="failP"){
           				alert('반려동물 정보가 제대로 입력되지 않았습니다. 마이페이지에서 수정해주세요')
           			}
           		}
           		, error:function(request, status, error){
           			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
           		}
           	})
			
 		
        }
    </script>

    <!-- 기타 화면제어  -->
    <script>
        // <참고사항>
        // 1) 나중에 이미지 경로, 이름 등을 다 바꿔야 함
        $(function(){
            //회원가입 단계표시영역 가로 크기 지정
            var totalWidth = $('#necessaryInputT').width();
            $('#wrapExpressDiv').css('width',totalWidth-2);

            //회원가입 단계표시영역 색상 지정
            // $('#square1').css({'background': '#242424'}).next().css('border-left', '35px solid #242424');
            // $('#square2').css({'background': '#242424'}).next().css('border-left', '35px solid #242424');
            // $('#square3').css({'background': '#242424'}).next().css('background', ' #242424');
        })
        // 약관영역 크기를 단계표시영역과 같게
        $(function(){
            $('#termsOfServiceWrapT').css('width', $('#wrapExpressDiv').width()+10);
        })
        /* 가입완료 영역 크기를 단계표시 영역과 같게*/
        $(function(){
            $('#completeJoinContentLocation').css('width', $('#wrapExpressDiv').width()-4);
        })
        /* hr태그 길이를 단계표시 영역과 같게*/
        $(function(){
            $('hr').css('width', $('#wrapExpressDiv').width()+10);
        })
            /* 회원가입 선택사항 테이블 크기를 단계표시 영역과 같게*/
        $(function(){
            $('#selectInputT').css('width', $('#wrapExpressDiv').width()+10);
        }) 
        /* 회원가입 버튼 크기를 단계표시 영역과 같게*/
        $(function(){
            $('#submitInform').css('width', $('#wrapExpressDiv').width()+10);
        })
        
        
        $(function(){
            // 약관 동의하기 버튼 활성화/비활성화 설정
            $('.common').change(agreeBtnEnable);
            
            function agreeBtnEnable(){
                var TOS1 = $('#selectTOS1').prop('checked');
                var TOS2 = $('#selectTOS2').prop('checked');
                if(TOS1 == true && TOS2 == true){
                    $('#agreeBtn').prop('disabled', false).css({background:'#b3a193', color:'#242424'});
                }else{
                    $('#agreeBtn').prop('disabled', true).css({background:'#d2c4b9', color:'rgb(80, 79, 79)'});
                }
            }

            // 체크여부에따라 체크박스 이미지(라벨) 와리가리(색바뀜)
            $('input:checkbox').each(function(index, item){
                $(this).change(function(){
                    if($(this).prop('checked')==true){
                        ($(this).next().css('background-image', "url('../../checkboxImage/innerbeigeOuterblack.png')"));
                        
                    }else if($(this).prop('checked')==false){
                        $(this).next().css('background-image', "url('../../img/notCheck1.png')");
                    }
                });
            });

             //체크박스 모두동의 => 이건 회원가입건데..?
            $("#selectAll").change(function(){
                var bool = $(this).prop('checked');
                if(bool){
                    $('[name=selectTOS]').prop('checked',bool).next().css('background-image', "url('../../checkboxImage/innerbeigeOuterblack.png')");
                    agreeBtnEnable();
                }else{
                    $('[name=selectTOS]').prop('checked',bool).next().css('background-image', "url('../../img/notCheck1.png')");
                    $('#agreeBtn').prop('disabled', true).css({background:'#d2c4b9', color:'rgb(80, 79, 79)'});
                }
            });
        

            //체크박스 모두동의 항목 설정
            $("#selectAll").change(function(){
                var bool = $(this).prop('checked');
                if(bool){
                    $('[name=selectTOS]').prop('checked',bool).next().css('background-image', "url('../../checkboxImage/innerbeigeOuterblack.png')");
                }else{
                    $('[name=selectTOS]').prop('checked',bool).next().css('background-image', "url('../../img/notCheck1.png')");
                }
            });

            //체크박스 모두 동의한 후, 하나라도 해제되면 모두동의항목도 체크 해제
            $('input:checkbox').each(function(index, item){
                $(this).change(function(){
                    if($(this).prop('checked')==false){
                        $('#selectAll').next().css('background-image', "url('../../img/notCheck1.png')");
                        $('#selectAll').prop('checked', false);
                    }
                });
            });

            //약관 동의하기 버튼 클릭시 단계변함 + 정보입력 화면으로
            $('#agreeBtn').click(function(){
                if($(this).prop('disabled')){

                }else{
                    $('#agreeBtn').prop('disabled', false).css({'outline-style': 'auto',
                    'outline-color': '#242424'});
                    $('#wrapTOS').css('display', 'none');
                    $('#wrapInput').css('display', 'block');

                    $('#square1').css({'background-color':'lightgray', 'color':'#242424'})
                    $('#triangle-right12').css({'border-left':'32px solid lightgray'});
                    
                    $('#square2').css({'background-color':'#242424', 'color':'#b3a193'})
                    $('#triangle-right22').css({'border-left':'32px solid #242424'});
                    
                    var heightAll = $('html').height();
                    $('.modal').css('height',heightAll)
                }
            });

          //가입완료단게 로그인으로 폼
            function memberCompleteGoLog(){
            	alert('adf');
            	if($('#moveToLogIn').css('display')=='none'){
	            	$('#moveToLogIn2').click();            		
            	}else{
	            	$('#moveToLogIn').click();            		
            	}
            }
            //홈으로
            function memberCompleteGoHome(){
            	alert('adf');
            	location.replace('<%=request.getContextPath()%>/index.jsp');
            }
            
        })
    </script>
    <!-- 이용약관, 개인정보처리방침 클릭시 팝업창 띄우기 => 디자인 미완!!!! -->
    <script>
        var usingTOS = document.getElementById('usingTOS');
        usingTOS.onclick = function(){
            var a = window.open("usingTOS.html", "이용약관", "toolbar=no,scrollbars=yes, resizable=yes, top=100, left=600, width=400,height=400");
        }
        var personalTOS = document.getElementById('personalTOS');
        personalTOS.onclick = function(){
            window.open("personalTOS.html", "개인정보처리방침", "toolbar=no,scrollbars=yes, resizable=yes, top=100, left=600, width=400,height=400");
        }
    </script>

    <!-- 5. 다음 주소 api -->
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.

        function sample4_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var roadAddr = data.roadAddress; // 도로명 주소 변수
                    var extraRoadAddr = ''; // 참고 항목 변수

                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraRoadAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraRoadAddr !== ''){
                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample4_postcode').value = data.zonecode;
                    document.getElementById("sample4_roadAddress").value = roadAddr;
                    document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                    
                    // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                    if(roadAddr !== ''){
                        document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                    } else {
                        document.getElementById("sample4_extraAddress").value = '';
                    }

                    var guideTextBox = document.getElementById("guide");
                    // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                    if(data.autoRoadAddress) {
                        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                        guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                        guideTextBox.style.display = 'block';

                    } else if(data.autoJibunAddress) {
                        var expJibunAddr = data.autoJibunAddress;
                        guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                        guideTextBox.style.display = 'block';
                    } else {
                        guideTextBox.innerHTML = '';
                        guideTextBox.style.display = 'none';
                    }
                }
            }).open();
        }
    </script>


</body>
</html>


<!-- 다음 지도 api 질의 -->
<!-- 12. 팝업창에서 검색 후 결과를 클릭해도 반응이 없습니다.
혹시 웹서버 환경에서 확인하고 계신가요? '정적페이지'로 브라우저에서 파일을 오픈하여 사용할 경우에는 host정보를 알 수 없어 데이터 전달이 되지 않습니다.

13. 팝업창이 비어 있는 채로 뜹니다.
혹시 document.domain을 사용하고 계신가요? Daum 우편번호 서비스를 사용하시는 페이지에서는 document.domain값을 임의로 세팅하는 경우에 일부 IE 브라우저에서 제대로 동작하지 않습니다.

14. 검색 후 결과 클릭한 후 팝업이 닫히지 않습니다(값이 입력되거나 또는 입력되지 않는 상황).
FAQ 13번의 이슈가 아니라면, javascript 실행시 오류가 난 경우입니다. oncomplete 함수에서 사용하는 변수가 정확한지, input tag의 id값을 잘못 사용하고 있는지 확인해 보시길 바랍니다. 브라우저의 개발자 도구 활용을 권장합니다. (팝업형의 경우 개발자 도구는 팝업창에 focus를 두고 개발자 도구를 띄우셔야 합니다.)

예를 들면, document.getElementById() 함수 이용시,
IE9이하에서는 input tag의 name값으로도 노드를 가져올 수 있지만, 그 외 브라우저에서는 null을 리턴합니다.
그렇기 때문에 반드시 id 속성을 사용하시기 바라며,
그렇지 못할 경우에 다른 셀렉터 함수(document.querySelector, jQuery selector 등)를 사용하시기 바랍니다 -->