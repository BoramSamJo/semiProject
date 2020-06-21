<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="noticeBoard.model.vo.*, java.util.ArrayList"%>
    
    <%
    
    nPagenation pn = (nPagenation)request.getAttribute("pn");
   	ArrayList list = (ArrayList)request.getAttribute("list");
   
	noticeBoard nb = new noticeBoard();
   		
    /* 페이징처리를 위한 변수 선언 (pn객체)*/
    int listCount = pn.getListCount();
    int currentPage = pn.getCurrentPage();
    int maxPage = pn.getMaxPage();
    int startPage = pn.getStartPage();
	int endPage = pn.getEndPage(); 
	int pageBlock =pn.getPageBlock();
	int pageCount=pn.getPageCount();
	
    %>
    
	
<!DOCTYPE html>
<html>
<head>  
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	 /* ----------공통설정---------- */
            /* 전체설정 */
            html, body{
                margin: 0px;
                padding: 0px;
                /* background: palevioletred; */
            }
            body *{
                font-family: 'Noto Sans KR', sans-serif;
                text-decoration: none;
            }

            #notiSection{
                text-align: center;
                position: relative;
            }

            
            /* ----------고객센터 공통 상단 -----------*/
            #Backarea{
                width: 100%;
                height: 320px;
                background: #d2c4b9;
                text-align: center;
                top:0px;
                margin: 0px;
            }
             /* 상단 명(ENG.VER) */
            #notiTitle1{
                font-family: 'Noto Sans KR', sans-serif;
                margin: 0px;
                margin-top: 0px;
                margin-left: 50px;
                font-size: 50px;
                padding-top:140px;
                position: relative; 
            }
              /* 상단 명(KO.VER) */
            #notiTitle2{
                font-family: 'Noto Sans KR', sans-serif;
                margin-top:0px;
                color: black;
                opacity: 0.5;
                font-size: 22px;
                padding-top:40px;
            }
             /* 상단 강아지 이미지 */
            #notiSection img{
                width: 80px;
                height: 80px;
                position: absolute;
                margin-top: 130px;
                margin-left: -320px;
            }

            /* ----------고객센터 내 페이지 전환 영역----------- */
            #headline{
                position: absolute;
                margin-left: 30%;
                margin-top: 7%;
            }
            #headline span{
                font-family: 'Noto Sans KR', sans-serif;
                display:inline-block;
                border:none;
                font-weight: bold;
                width: 200px;
                height: 50px;
                text-align: center;
                line-height: 50px;
                background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
                color: #242424;
            }
            
             /*div에 색 채우기 */
            #headline span:nth-of-type(1){
                background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
                color: #b3a193;
                border-top-left-radius: 5px;
                border-bottom-left-radius: 5px;
                border-right: 1px solid black;
            }
            #headline span:nth-of-type(3){
                background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
                color: #242424;
                border-top-right-radius: 5px;
                border-bottom-right-radius: 5px;
                border-left: 1px solid black;
            }

            #headline span:nth-of-type(2):hover{
                background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
                color: #b3a193;
            }
            #headline span:nth-of-type(3):hover{
                background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
                color: #b3a193;
            }

            /* ----------검색창 영역---------- */
            #notiSection select{
                position: absolute;
                margin-top: 13.5%;
                margin-left: 16.2%;
                margin-bottom: 10px;
                height: 40px;
                border: 1px solid rgb(245,245, 245);
            }
            #notiSection input[type=text]{
                position: absolute;
                margin-top: 14.5%;
                margin-left: 23.7%;
                border: none;
                border-bottom: 1px solid black;
                width: 10%;
                outline: none;
            }
            #notiSection button[type=button]{
                position: absolute;
                margin-top: 14%;
                margin-left: 34%;
                width: 55px;
                height: 30px;
                border: none;
                border-radius: 4px;
                background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
                color: #242424;
            }
            #notiSection button[type=button]:hover{
                background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
                color: #b3a193;
            }
            
            /* -----------테이블 영역-----------*/
            .TableCSS1 {
                width: 75%;
                margin-top: 15%;
                margin-left: 13%;
                border-collapse: collapse;
                text-align: center;
                line-height: 1.5;
                border-top: 3px solid black;
                border-bottom: 1px solid black;
            }
            .TableCSS1 th {
                font-family: 'Noto Sans KR', sans-serif;
                line-height: 3;
                height: 40px;
                font-weight: bold;
                vertical-align: top;
                border-bottom: 1px solid black;
                background:  #d2c4b9;
                
            }
            .TableCSS1 td {
                font-family: 'Noto Sans KR', sans-serif;
                line-height: 3;
                width: 15%;
                height: 40px;
                vertical-align: top;
                border-bottom: 1px solid black;
            }
            .tablehover:hover{
                background: rgb(228, 227, 227);
            }
         
            #notiSection button{
                border:1px solid #242424;
                background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
                color: #242424;
            }
            /* 작성하기 버튼 */
            #insertBtn{
                height: 30px;
                border: none;
                border-radius: 4px;
                background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
                color: #242424;
            }
			 #insertBtn:hover{
				background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
                color: #b3a193;
			 }

            /*---------- 반응형 ----------*/
            @media only screen and (max-width: 1100px){
                #headline{
                    display:none;
                }
                #notiSection span{
                    display: none;
                }
                #notiSection select{
                   display: none;
                }
                #notiSection input[type=search]{
                    display: none;
                }
                #notiSection button[type=submit]{
                    display: none;
                }
            }

            /* -----------------footerCSS 시작------------------------ */
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
                margin-bottom: 0px;
            }
            #footerTable a{
                text-decoration: none;
            }
            #footerTable tr:nth-of-type(6) a{
                color:white;
            }
            #animalProtectSys{
                background-color: #b3a193;
                color: #242424;
                padding: 1.5px 4px 2px 4px;
                font-size: 12px;
                font-family: 'Noto Sans KR', sans-serif;
            }
            /* 풋터 끝 */


        /* 메뉴바 스타일 - 임의 디자인(한국에자이 참고) 추후 변경예정 */
        /* 헤더 전체 설정 */
        header{
            width:100%;
            position: absolute;
            top:0px;
            left:0px;
            position: fixed;
            z-index: 99;
            background-color: #242424;
            border-bottom: 5px solid #b3a193;
        }
        header *{
            list-style: none;
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
                width:60px;
                height: 4px;
                font-size: 55px;
                padding-bottom: 86px;
                padding-right: 35px;
                padding-left: 10px;
                background-color: #d2c4b9;
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
                padding:15px 0px 15px 0px;
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
                margin-top: 10px;
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
            /* #loginT tr:nth-of-type(1)>td{} */
            #loginT tr:nth-of-type(4){text-align: left;}

            #userIdLogIn{
                height: 37px;
            }
            #password{
                height: 37px;
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
                font-size: 12px;
            }

            /* input태그 설정(버튼, 체크박스 제외) */
            .modal input:not([id='submit']):not([type='checkbox']){
                width:290px;
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
                background: url('img/notCheck1.png') left/25px no-repeat; 
            }
            
        /* ------------------------로그인 css 끝-------------------------- */
</style>
</head>
<body>
<%-- 	<%=pn %>
	<%=list %> --%>
<%@include file="../common/menubar.jsp"%>
        
         <!--section시작-->
        <section id="notiSection">
        <!-- 고객센터 공통 상단 -->
        <div id='Backarea'>
            <img id="titleIcon" src="img/CS_icon4.png">
            <h1 id="notiTitle1">HYE YUM CS CENTER</h1><h3 id="notiTitle2">혜윰 고객센터</h3>
        </div>
      <form id="searchformtest" name="searchform" method="get" action="<%=request.getContextPath()%>/list.bo">
        <div id = 'headline'><span onclick="goNoti()">공지사항</span><span onclick="goFAQ()">FAQ</span><span onclick="goQNA()">QnA</span></div>

        <!-- 검색하기 기능 -->
          <select name="selectBox" >
                <option selected disabled>카테고리 선택</option>
                <option value="ntilte">제목</option>
                <option value="ncontent">내용</option>
                <option value="ntitle_content">제목+내용</option>
            </select>
        <input type="text" name="word" value="">&nbsp;
        <button type="button" onclick="searchtest123();">검색</button>
        </form>
         <!--공지사항 테이블-->
         <div>
            <table class="TableCSS1" id="testtest1">
                <tr>
                <th scope="row">번호</th>
                <th scope="row">제목</th>
                <th scope="row">작성자</th>
                <th scope="row">작성일</th>
                <!-- <th scope="row">조회</th> -->
                </tr>
                    <%if(list.isEmpty()) {%>
                <tr>
                	<td>조회된 리스트가 없습니다.</td>
                </tr>
                <%}else{%>
                	<%for(int i=0; i<list.size(); i++) {%>
                	<tr><!-- 번호/제목/작성자/작성일/조회 -->
                		<input type = "hidden" value="<%=((noticeBoard)list.get(i)).getnNo() %>">  <!-- 게시글 상세 조회 시 필요한 게시글 번호 -->
                		<td><%=((noticeBoard)list.get(i)).getnNo() %></td> <!-- 번호 -->
                		<td><%=((noticeBoard)list.get(i)).getnTitle() %></td><!--제목 -->
                		<td><%=((noticeBoard)list.get(i)).getMemberNo() %></td><!-- 작성자 -->
                		<td><%=((noticeBoard)list.get(i)).getCreateDate() %></td><!-- 작성일-->
                	</tr>
                	<%} %>
                <%} %>
            </table><br>
            <!-- 이전 페이지 -->
            <button onclick = "location.href='<%=request.getContextPath() %>/list.bo?currentPage=<%=endPage-1 %>'"> < </button>
            <!-- 페이지 목록 -->
           <%for(int p=startPage; p<=endPage; p++) {%>
           		<%if (p==currentPage) {%>
            	<button disabled><%=p %></button>
            	<%}else{ %>
            	<button onclick= "location.href='<%=request.getContextPath() %>/list.bo?currentPage=<%=p %>'"><%=p %></button>
            	<%} %>
            <%} %> 
           
            <!-- 다음 페이지 -->
            <button onclick = "location.href='<%=request.getContextPath() %>/list.bo?currentPage=<%=startPage+1 %>'"> > </button><br><br>

        </div>
  
   <!-- 잘 뽑아오는 지 확인 -->      
 <%--   <%=list %> --%>
    </section>
    <br><br><br><br><br><br>




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

    <!------------------------------------------------------------------------------------------------------------------------------------------>
     <script src = "http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
    //공지사항 세부사항 보는 페이지로 넘어가기
    $(function(){
 				$("#testtest1 td").mouseenter(function(){
 					$(this).parent().css({"background":"lightgray","cursor":"pointer"});
 				}).mouseout(function(){
 					$(this).parent().css({"background":"white"});
 				}).click(function(){
 					var nno = $(this).parent().children("input").val();
 					location.href="<%=request.getContextPath()%>/detail.bo?nno=" + nno;
 				})
 			})    
    
    //검색
    function searchtest123(){
    	$("#searchformtest").attr("action","<%=request.getContextPath()%>/search.bo");
    	$("#searchformtest").submit();
    }
    
    //FAQ로 이동
    	function goFAQ(){
			location.href="<%=request.getContextPath()%>/list.fbo"; 
		}
    
    //QNA로 이동
     function goQNA(){
			location.href="<%=request.getContextPath()%>/QnAList.bo"; 
		}
 
    

    
    </script>
        
          <!------------------------------------------------------------------------------------------------------------------------------------------>
     <script>
        
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
                            btn.children().prop('src', 'img/noun_Close_52944.png').css({'width':'50', 'height':'50','padding-left':'20px', 'padding-top':'20px'});
                            //아코디언이 펴져서 스크롤 바 생기는걸로 박스가 가려지는걸 커버하기 위해 위치 조정
                            // $("#serveMenuBtn").css('right', -($('html').width()-$('#serveMenuBtn').width()-70));
                            // alert('asdf');
                        }else{
                            btn.css('font-weight', '500').css('padding-right', '40px');
                            btn.children().prop('src', 'img/noun_List_25956.png').css({'width':'90', 'height':'90','padding-left':'0px', 'padding-top':'0px'});
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
    </script>



      
</body>
</html>