<%@page import="board.model.vo.Pagination"%>
<%@page import="insuranceView.model.vo.InsuranceManage"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<InsuranceManage> iList = (ArrayList)request.getAttribute("iList");
	ArrayList<String> endDate = (ArrayList)request.getAttribute("endDate");
	Pagination p = (Pagination)request.getAttribute("p");
	
	int listCount =0;
	int currentPage=0;
	int limit=0;		
	int maxPage=0;	
	int startPage=0;	
	int endPage=0;
	if(p.getListCount()==0){
		
	}else{		
		listCount = p.getListCount();
		currentPage = p.getCurrentPage();
		limit = p.getLimit();
		maxPage = p.getMaxPage();
		startPage = p.getStartPage();
		endPage = p.getEndPage();
	}
	
	String searchText ="";
	String searchKey ="";
	String isSearch = (String)request.getAttribute("isSearch");//서치서블릿의 결과인지 어쩐지 판단
	if(isSearch==null){
		isSearch="false";
	}else{
		isSearch="true";
		searchText = (String)request.getAttribute("searchText");
		searchKey = (String)request.getAttribute("searchKey");
	}
	
%>
<html lang="ko">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title></title>
        <script src = "http://code.jquery.com/jquery-latest.min.js"></script>
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
                height: 220px;
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
            font-size: 50px;
            padding-top:40px;
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
        #titleIcon{
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
            border-radius: 10px;
            font-weight: bold;
            width: 600px;
            height: 50px;
            text-align: center;
            line-height: 50px;
            background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
            color: #242424;
        }


        /* ----------검색창 영역------------*/
        #notiSection #selectCategory{
            position: absolute;
            margin-top: 13.5%;
            margin-left: -4%;
            margin-bottom: 10px;
            height: 40px;
            border: 1px solid #b3a193;
            border-radius:3px;
            text-indent:5px;
            width:130px;
            height:35px;
        }
        #notiSection #selectAnswer{
            position: absolute;
            margin-top: 13.5%;
            margin-left: 5.1%;
            margin-bottom: 10px;
            height: 40px;
            border: 1px solid #b3a193;
            border-radius:3px;
            text-indent:5px;
            width:130px;
            height:35px;
        }
        #notiSection #selectSearch{
            position: absolute;
            margin-top: 13.5%;
            margin-left: 14.2%;
            margin-bottom: 10px;
            height: 40px;
            border: 1px solid #b3a193;
            border-radius:3px;
            text-indent:5px;
            width:130px;
            height:35px;
        }
        #notiSection input[type=search]{
            position: absolute;
            top:230px;
            margin-top: 13.5%;
            margin-left: 23.7%;
            border:none;
            border-bottom: 1px solid #242424;
            width: 10%;
            outline: none;
        }
        #btntest{
            position: absolute;
            top:430px;
            right:190px;
            width: 55px;
            height: 30px;
            border: none;
            border-radius: 4px;
            background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
            color: #242424;
        }
        #btntest:hover{
            background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
            color: #b3a193;
        }
		.answerBtn{
			border: none;
            border-radius: 4px;
            width:80px;
            height:75px;
            font-weight:600;
            margin-top:10px;
			background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
            color: #242424;
            font-size:16px;
		}
		.answerBtn:hover{
			background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
            color: #b3a193;
		}
		.deleteBtn{
			border: none;
            border-radius: 4px;
            width:80px;
            height:75px;
            font-weight:600;
			background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
            color: #242424;
            font-size:16px;
		}
		.deleteBtn:hover{
			background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
            color: #b3a193;
		}
		textarea{
			border-radius:5px;
			border:1.5px solid #b3a193;
			font-size:18px;
			text-indent:10px;
		}
        /* -----------테이블 영역-----------*/
        .TableCSS1 {
            width: 75%;
            margin-top: 15%;
            margin-left: 13%;
            margin-bottom: 3%;
            border-collapse: collapse;
            text-align: center;
            line-height: 1.5;
            border-top: 3px solid black;
            border-bottom: 1px solid black;
        }
        .TableCSS1 th {
            font-family: 'Noto Sans KR', sans-serif;
            text-align: center;
            line-height: 3;
            height: 40px;
            font-weight: bold;
            vertical-align: top;
            border-bottom: 1px solid black;
            background: #d2c4b9;
        }
        .TableCSS1 td {
            font-family: 'Noto Sans KR', sans-serif;
            text-align: center;
            line-height: 3;
            width: 18%;
            height: 40px;
            vertical-align: top;
            border-bottom: 1px solid black;
        }
        .TableCSS1 th:nth-of-type(1) {
        	width:100px;
        }
        .TableCSS1 td:nth-of-type(1) {
        	width:100px;
        }
        .TableCSS1 th:nth-of-type(2) {
        	width:100px;
        }
        .TableCSS1 td:nth-of-type(2) {
        	width:100px;
        }
         .TableCSS1 th:nth-of-type(4) {
        	width:250px;
        }
        .TableCSS1 td:nth-of-type(4) {
        	width:250px;
        }
        .TableCSS1 th:nth-of-type(3), .TableCSS1 td:nth-of-type(5) {
        	width:110px;
        }
        .TableCSS1 td:nth-of-type(3), .TableCSS1 td:nth-of-type(5) {
        	width:110px;
        }
        .TableCSS1 td:nth-of-type(6), .TableCSS1 th:nth-of-type(7){
        	width:100px;
        }
        .TableCSS1 td:nth-of-type(6), .TableCSS1 td:nth-of-type(7) {
        	width:100px;
        }
        .off:hover{
            background: rgb(228, 227, 227);
        }

        /* 답글 안보이게 한 후 slid효과 주기 위함 */
        .answer{
            display: none;
        }

        /* 문의작성 버튼 */
        #writeQnaBtn{
            border: none;
            padding: 10px 25px;
            border-radius: 4px;
            background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
            color: #242424;
            font-weight: 700;
            margin-top: 30px;
        }
        /* < >화면 페이징처리 버튼 */
        .pagingBtns{
            border:1px solid #242424;
            border-radius:2px;
            background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
            color: #242424;
        }
        #notiSection button:hover{
            background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
            color: #b3a193;
        }

         /*-----------모달 창 영역---------- */
         #notiSection .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4);
        }
        #notiSection .modal-content {
            position: relative;
            border-radius: 10px;
            border: none;
            background-color:  white;
            margin: 15% auto;
            padding: 20px;
            width: 350px;
            height: 200px;
        }
        #notiSection input[type=password]{
            position: absolute;
            top:120px;
            left:70px;
            width: 250px;
            height: 30px;
            border-radius: 4px;
            border: 1px solid #b3a193;
            padding: 15px;
        }
        #notiSection input[type=submit]{
            position: absolute;
            top:170px;
            left:70px;
            color:#242424;
            border-radius: 4px;
            width: 250px;
            height: 30px;
        }

        .modal-content label{
            position: absolute;
            top:70px;
            left:50px;
        }

        #pwdcontent{
            position: absolute;
            top:-20px;
            left:0px;
            background: #242424;
            width: 390px;
            height: 50px;
            color: #b3a193;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
            line-height: 50px;
        }

        /* 끄기(X)버튼 스타일 적용 */
        #notiSection .close {
            color: #d2c4b9;
            position: absolute;
            top:-5px;
            left:355px;
            font-size: 28px;
            font-weight: bold;
            border: none;
        }
        #notiSection .close:hover,
        #notiSection .close:focus {
            color: white;
            cursor: pointer;
        }
            
      
        /*---------- 반응형 ----------*/
        @media only screen and (max-width: 1100px){
            #headline span{
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
                color:white;
            }
            #animalProtectSys{
                background-color: #b3a193;
                color: #242424;
                padding: 1.5px 4px 2px 4px;
                font-size: 12px;
                font-family: 'Noto Sans KR', sans-serif;
            }
      
      	/* 질문 줄 css */
      	.Q td{
      		padding:20px;
      	}
      	.Q{
      		display:none;
      		border-top: 1px solid lightgray;
      	}
      	/* 답변 줄 css */
      	.IChange{
      		display:none;
      	}

      	.pagingBtns:disabled{
      		background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
            color: #b3a193;
      	}
      	
      	#pwdcheckBtn{
      		width:100px;
      		height:30px;
      		position:absolute;
      		top:170px;
      		left:150px;
      		border:none;
      		border-radius:5px;
      		background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
            color: #242424;
      	}
      	#pwdcheckBtn:hover{
      		background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
            color: #b3a193;
      	}
      	.deleteInsBtn{
      		width:50px;
      		height:40px;
      		border:none;
      		border-radius:5px;
      		background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
            color: #242424;
      	}
        </style>
        <!-- 노토산스kr 폰트 가져오기 -->
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    </head>


    <body>
        <%@include file="../common/managebar.jsp"%>

        <!--section시작-->
        <section id="notiSection">
            <div id='Backarea'>
                <h1 id="notiTitle1">Insurance Manage</h1><h3 id="notiTitle2">보험 관리</h3>
            </div>
            <form action="<%=request.getContextPath()%>/search.ins" method="post" onsubmit="return testKey();">
            <div id = 'headline'><span>해지대상 고객님</span></div>
           		<select name="selectSearch" id="selectSearch">
                   <option selected value=''>카테고리 선택</option>
                   <option value="all">전체</option>
                   <option value="MEMBER_NAME">가입자 성함</option>
                   <option value="INS_NAME">보험 이름</option>
                   <option value="ENROLL_DATE">가입 날짜</option>
               </select>

            <input type='search' name="content" id="searchText">&nbsp;
            <button type="submit" name="search" id ="btntest">검색</button>
        </form>

              <div>
                <table class="TableCSS1" id=QnATable cellspacing="0" cellpadding="0">
                    <tr>
                        <th class="bar">번호</th>
                        <th>가입자</th>
                        <th>보험 이름</th>
                        <th>보험 내용</th>
                        <th>보험 가격</th>
                        <th>가입 날짜</th>
                        <th>만기 날짜</th>
                    </tr>
                   	<%if(iList.size()<1){ %>
                   	<tr>
                   		<td colspan="7">조회결과가 없습니다.</td>
                   	</tr>
                  	<%}else{%>
	                    <%for(int i = 0; i < iList.size(); i++){ %>
	                    <form method="post" id="deleteINo" action="<%=request.getContextPath()%>/del.ins">
	                    	<tr class="off" onclick="getPwd(this);" id='modaltest1'>
		                        <td class='init'><%=iList.get(i).getrNum()%></td>
		                        <td class='init'><%=iList.get(i).getMemberName() %></td>
		                        <td class='init'><%=iList.get(i).getInsName() %></td>
		                        <td class='init'><%=iList.get(i).getInsContent()%></td>
		                        <td class='init'><%=iList.get(i).getPrice()%></td>
		                        <td class='init'><%=iList.get(i).getEnrollDate().substring(0,10)%></td>
		                        <td class='init'><%=endDate.get(i)%></td>
		                    </tr>
		                    <tr class="Q">
		                    	<td></td>
		                    	<td class='init'></td>
		                    	<td style="text-align:left"><%=iList.get(i).getPhone()%></td>
		                    	<td class='init'><%=iList.get(i).getEmail()%></td>
		                    	<td ></td>
		                    	<td></td>
		                    	<td><button type="submit" class="deleteInsBtn" onclick="confirm('정말 해지하시겠습니까?')">해지</button></td>
		                    </tr>
	                    </form>
			              <%} %>
                    <%} %>
                 </table>
                 <%if(p.getListCount()==0){%>
					
				<%}else{ %>
					<%if(isSearch.equals("false")) {%>
		                 <button onclick="location.href='<%=request.getContextPath()%>/first.ins?currentPage=<%=1 %>'" class="pagingBtns" ><<</button>
		                 &nbsp;
		                 <button onclick="location.href='<%=request.getContextPath()%>/first.ins?currentPage=<%=currentPage-1 %>'" class="pagingBtns" ><</button>
		                 <%for(int pg = startPage; pg<=endPage; pg++){ %>
		                 	<%if(pg == currentPage){ %>
			                 	<button class="pagingBtns" disabled><%=pg %></button>
							<%}else{ %>
		                 		<button class="pagingBtns" onclick="location.href='<%=request.getContextPath()%>/first.ins?currentPage=<%=pg %>'" class="pagingBtns" ><%=pg %></button>
		                 	<%} %>
		                 <%} %>
		                 <button onclick="location.href='<%=request.getContextPath()%>/first.ins?currentPage=<%=currentPage+1 %>'" class="pagingBtns" >></button>
		                 &nbsp;
		                 <button onclick="location.href='<%=request.getContextPath()%>/first.ins?currentPage=<%=maxPage %>'" class="pagingBtns" >>></button>
		                 
	                 <%}else{ %>
	                 	<button onclick="location.href='<%=request.getContextPath()%>/search.ins?currentPage=<%=1 %>&content=<%=searchText%>&selectSearch=<%=searchKey%>';" class="pagingBtns" ><<</button>
		                 &nbsp;
		                 <button onclick="location.href='<%=request.getContextPath()%>/search.ins?currentPage=<%=currentPage-1 %>&content=<%=searchText %>&selectSearch=<%=searchKey%>';" class="pagingBtns" ><</button>
		                 <%for(int pg = startPage; pg<=endPage; pg++){ %>
		                 	<%if(pg == currentPage){ %>
			                 	<button class="pagingBtns" disabled><%=pg %></button>
							<%}else{ %>
		                 		<button class="pagingBtns" onclick="location.href='<%=request.getContextPath() %>/search.ins?currentPage=<%=pg %>&content=<%=searchText %>&selectSearch=<%=searchKey%>';" class="pagingBtns" ><%=pg %></button>
		                 	<%} %>
		                 <%} %>
		                 <button onclick="location.href='<%=request.getContextPath() %>/search.ins?currentPage=<%=currentPage+1 %>&content=<%=searchText %>&selectSearch=<%=searchKey%>';" class="pagingBtns" >></button>
		                 &nbsp;
		                 <button onclick="location.href='<%=request.getContextPath() %>/search.ins?currentPage=<%=maxPage %>&scontent=<%=searchText %>&selectSearch=<%=searchKey%>';" class="pagingBtns" >>></button>
	                 <%}%>
                 <%}%>
        </section>
        <br><br><br>

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
	
		<script>
		boardClicked = '';//클릭된 게시글 객체를 담을 변수
		function getPwd(object){
    		//전에 들어갔던 놈을 원상복귀
    		$(boardClicked).next().slideUp();
    		$(boardClicked).css('background', 'white');
    		//클릭한 게시글 비번과 객체를 담음
    		boardClicked = object;
    		
			//비공개글이면 비번입력 모달창을 띄우고 공개글이면 클릭시 그냥 띄우고
			$(boardClicked).next().slideDown();
            $(".Answer").css("background","rgb(245,245,245)");
            $('.Q').prev('tr').children().css('border-bottom','1px solid lightgray');
            $('.A').prev('tr').children().css('border-bottom','1px solid lightgray');
            $(boardClicked).css('background', 'lightgray');
    	}
		</script>

    </body>
</html>

