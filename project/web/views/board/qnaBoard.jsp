<%@page import="board.model.vo.Pagination"%>
<%@page import="board.model.vo.QAnswer"%>
<%@page import="board.model.vo.QnABoard"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<QnABoard> qList = (ArrayList<QnABoard>)request.getAttribute("qList");
	ArrayList<QAnswer> qAList = (ArrayList<QAnswer>)request.getAttribute("qAList");
	
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
		searchText = (String)request.getAttribute("content");
		searchKey = (String)request.getAttribute("selectBox");
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
            background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
            color: #242424;
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
            border-right: 1px solid black;
        }
        #headline span:nth-of-type(3){
            background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
            color: #b3a193;
            border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;
            border-left: 1px solid black;
        }

        #headline span:hover{
            background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
            color: #b3a193;
        }

        /* ----------검색창 영역------------*/
        #notiSection select{
            position: absolute;
            margin-top: 13.5%;
            margin-left: 16.2%;
            margin-bottom: 10px;
            height: 40px;
            border: 1px solid rgb(245,245, 245);
        }
        #notiSection input[type=search]{
            position: absolute;
            top:315px;
            margin-top: 14.5%;
            margin-left: 23.7%;
            border:none;
            border-bottom: 1px solid #242424;
            width: 10%;
            outline: none;
        }
        #btntest{
            position: absolute;
            top:530px;
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
      	.A{
      		display:none;
      	}
      	.A td{
      		padding:20px;
      	}
      	
      	/* 테이블 안 이미지 */
      	.A td:nth-of-type(2){
/*       		padding-top:50px; */
			vertical-align:center;
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
        </style>
        <!-- 노토산스kr 폰트 가져오기 -->
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    </head>


    <body>
        <%@include file="../common/menubar.jsp"%>

        <!--section시작-->
        <section id="notiSection">
            <div id='Backarea'>
                <img id="titleIcon" src="img/CS_icon4.png">
                <h1 id="notiTitle1">HYE YUM CS CENTER</h1><h3 id="notiTitle2">혜윰 고객센터</h3>
            </div>
            <form action="<%=request.getContextPath()%>/searchQ.bo" method="post" onsubmit="return testKey();">
            <div id = 'headline'><span onclick="goNoti()">공지사항</span><span onclick="goFAQ()">FAQ</span><span>QnA</span></div>
              <select name="selectBox" id="selectCategory">
                    <option selected value=''>카테고리 선택</option>
                    <option value="title">제목</option>
                    <option value="writer">작성자</option>
                </select>
            <input type='search' name="content" id="searchText">&nbsp;
            <button type="submit" name="search" id ="btntest">검색</button>
        </form>

              <!--QnA영역-->
              <div>
                <table class="TableCSS1" id=QnATable cellspacing="0" cellpadding="0">
                    <tr>
                        <th class="bar">번호</th>
                        <th>공개</th>
                        <th>분류</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>답변</th>
                    </tr>
                   	<%if(qList.size()<1){ %>
                   	<tr>
                   		<td colspan="7">조회할 QnA게시글이 없습니다</td>
                   	</tr>
                   	<%}else{%>
	                    <%for(int i = 0; i < qList.size(); i++){ %>
	                    	<%if(!qAList.isEmpty()){%>
	                    	<tr onclick="getPwd(<%=qList.get(i).getqPwd() %>, this);" class="off" id='modaltest1'>
		                        <td class='init'><%=qList.get(i).getRowNum() %></td>
		                        <%if(qList.get(i).getqPwd().equals("0")){ %>
		                        <td class='init'>[공개]</td>
		                        <%}else{ %>
		                        <td class='init'>[비공개]</td>
		                        <%} %>
		                        <td class='init'><%=qList.get(i).getqCName() %></td>
		                        <td class='init'><%=qList.get(i).getqTitle() %></td>
		                        <td class='init'><%=qList.get(i).getmName() %></td>
		                        <td class='init'><%=qList.get(i).getCreateDate().substring(0,10) %></td>
		                        <td class='init'>
		                        <%for(int j = 0; j < qAList.size(); j++){ %>
		                        	<%if(qList.get(i).getqNo()==qAList.get(j).getqNo()){ %>
		                        		완료
		                        	<%break;}else{%>
			                        	<%if(j==qAList.size()-1){ %>
			                        	대기
			                        	<%} %>
		                        	<%}%>
	                        	<%} %>
		                        </td>
		                    </tr>
		                    <tr class="Q">
		                    	<td></td>
		                    	<td colspan="5" style="text-align:left"><%=qList.get(i).getqContent() %></td>
		                    	<td></td>
		                    </tr>
		                    	<%for(int j = 0; j < qAList.size(); j++){ %>
				                    <%if(qList.get(i).getqNo()==qAList.get(j).getqNo()){ %>
				                    <tr class="A">
				                        <td><img src="/project/img/answerImg3.png" width="35px"></td>
				                        <td colspan="5" style="text-align:left">
				                            <%=qAList.get(j).getaContent() %>
				                        </td>
				                    	<td></td>
				                    </tr>
				                    <%break;}else{ %>
					                    <%if(j==qAList.size()-1){ %>
					                    <tr class="A">
					                    	<td><img src="/project/img/answerImg3.png" width="35px"></td>
				                    		<td colspan="5" style="text-align:left">아직 답변이 없습니다. 급히 상담이 필요한 경우 1588-5177로 문의주세요</td>
					                    	<td></td>
				                    	</tr>
				                    	<%} %>
				                    <%}%>
			                    <%} %>
	                    	<%}else if(qAList.isEmpty()){%>
	                    	<tr onclick="getPwd(<%=qList.get(i).getqPwd() %>, this);" class="off" id='modaltest1'>
		                        <td class='init'><%=qList.get(i).getRowNum() %></td>
		                        <%if(qList.get(i).getqPwd().equals("0")){ %>
		                        <td class='init'>[공개]</td>
		                        <%}else{ %>
		                        <td class='init'>[비공개]</td>
		                        <%} %>
		                        <td class='init'><%=qList.get(i).getqCName() %></td>
		                        <td class='init'><%=qList.get(i).getqTitle() %></td>
		                        <td class='init'><%=qList.get(i).getmName() %></td>
		                        <td class='init'><%=qList.get(i).getCreateDate().substring(0,10) %></td>
		                        <td>대기</td>
		                    </tr>
		                    <tr class="Q">
		                    	<td></td>
		                    	<td colspan="5" style="text-align:left"><%=qList.get(i).getqContent() %></td>
		                    	<td></td>
		                    </tr>
		                     <tr class="A">
		                    	<td><img src="/project/img/answerImg3.png" width="35px"></td>
	                    		<td colspan="5" style="text-align:left">아직 답변이 없습니다. 급히 상담이 필요한 경우 1588-5177로 문의주세요</td>
		                     	<td></td>
	                    	</tr>
	                    	<%}%>
	                    <%} %>
	                    <%} %>
                 </table>
				<%if(p.getListCount()==0){%>
					
				<%}else{ %>
					<%if(isSearch.equals("false")) {%>
		                 <button onclick="location.href='<%=request.getContextPath() %>/QnAList.bo?currentPage=<%=1 %>'" class="pagingBtns" ><<</button>
		                 &nbsp;
		                 <button onclick="location.href='<%=request.getContextPath() %>/QnAList.bo?currentPage=<%=currentPage-1 %>'" class="pagingBtns" ><</button>
		                 <%for(int pg = startPage; pg<=endPage; pg++){ %>
		                 	<%if(pg == currentPage){ %>
			                 	<button class="pagingBtns" disabled><%=pg %></button>
							<%}else{ %>
		                 		<button class="pagingBtns" onclick="location.href='<%=request.getContextPath() %>/QnAList.bo?currentPage=<%=pg %>'" class="pagingBtns" ><%=pg %></button>
		                 	<%} %>
		                 <%} %>
		                 <button onclick="location.href='<%=request.getContextPath() %>/QnAList.bo?currentPage=<%=currentPage+1 %>'" class="pagingBtns" >></button>
		                 &nbsp;
		                 <button onclick="location.href='<%=request.getContextPath() %>/QnAList.bo?currentPage=<%=maxPage %>'" class="pagingBtns" >>></button>
		                 
	                 <%}else{ %>
	                 	<button onclick="location.href='<%=request.getContextPath() %>/searchQ.bo?currentPage=<%=1 %>&content=<%=searchText%>&selectBox=<%=searchKey%>';" class="pagingBtns" ><<</button>
		                 &nbsp;
		                 <button onclick="location.href='<%=request.getContextPath() %>/searchQ.bo?currentPage=<%=currentPage-1 %>&content=<%=searchText %>&selectBox=<%=searchKey%>';" class="pagingBtns" ><</button>
		                 <%for(int pg = startPage; pg<=endPage; pg++){ %>
		                 	<%if(pg == currentPage){ %>
			                 	<button class="pagingBtns" disabled><%=pg %></button>
							<%}else{ %>
		                 		<button class="pagingBtns" onclick="location.href='<%=request.getContextPath() %>/searchQ.bo?currentPage=<%=pg %>&content=<%=searchText %>&selectBox=<%=searchKey%>';" class="pagingBtns" ><%=pg %></button>
		                 	<%} %>
		                 <%} %>
		                 <button onclick="location.href='<%=request.getContextPath() %>/searchQ.bo?currentPage=<%=currentPage+1 %>&content=<%=searchText %>&selectBox=<%=searchKey%>';" class="pagingBtns" >></button>
		                 &nbsp;
		                 <button onclick="location.href='<%=request.getContextPath() %>/searchQ.bo?currentPage=<%=maxPage %>&scontent=<%=searchText %>&selectBox=<%=searchKey%>';" class="pagingBtns" >>></button>
	                 <%}%>
                 <%}%>
                </div>
             <%if(request.getSession().getAttribute("userId")!=null||request.getSession().getAttribute("loginUser")!=null){ %>
            	<button onclick="yesLogin();" id="writeQnaBtn">문의작성</button>
             <%}else{ %>
            	<button onclick="notLogin();" id="writeQnaBtn">문의작성</button>
             <%} %>
             
            <%if(isSearch=="true"){ %>
            <button onclick="reloadForWhole();" id="writeQnaBtn">전체보기</button><br><br>
           <%} %>
           
            <!--비밀번호 입력 모달창 띄우기-->
            <div id='pwdModal' class="modal">
                <div class="modal-content" align='center'>
                    <p id="pwdContent" style="font-weight: bold;">비밀번호 확인<span class='close' id="closeBtn">&times;</span></p>
                    <label>글 작성 시 입력한 비밀번호를 입력해 주세요</label><input type="password" name="password" id="boardPwd" placeholder="비밀번호" required><br><br><br>
                    <div id="pwdcheck">
                        <form>
                            <input type="button" value="확인" id='pwdcheckBtn' onclick="checkPwd();">
                        </form> 
                    </div>
                </div>

            </div>

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
       	//공지사항으로 이동
       	function goNoti(){
       		location.href="<%=request.getContextPath()%>/list.bo";
       	}
        //FAQ로 이동
    	function goFAQ(){
			location.href="<%=request.getContextPath()%>/list.fbo"; 
		}
       	</script>
        <script>
        	originBoardPwd = '';//db에서 온 각게시글의 BoardPwd를 담을 전역변수
        	boardClicked = '';//클릭된 게시글 객체를 담을 변수
        	//전역변수에 클릭한 게시글의 비번을 담음
        	function getPwd(pwd, object){
        		//전에 들어갔던 놈을 원상복귀
        		$(boardClicked).next().slideUp();
        		$(boardClicked).next().next().slideUp();
        		$(boardClicked).css('background', 'white');
        		
        		//클릭한 게시글 비번과 객체를 담음
        		originBoardPwd = pwd;
        		boardClicked = object;
        		
				//비공개글이면 비번입력 모달창을 띄우고 공개글이면 클릭시 그냥 띄우고
				if(pwd=='0'){
					$(boardClicked).next().slideDown();
                    $(boardClicked).next().next().slideDown();
                    $(".Answer").css("background","rgb(245,245,245)");
                    $('.Q').prev('tr').children().css('border-bottom','1px solid lightgray');
                    $('.A').prev('tr').children().css('border-bottom','1px solid lightgray');
                    $(boardClicked).css('background', 'lightgray');
				}else{
					var modal = document.getElementById('pwdModal');
	        		modal.style.display = "block";
	        		$('#boardPwd').val('');
	        		$('#boardPwd').focus();
				}
        	}

        	
        	//게시글 비밀번호 확인버튼 눌렀을때
            function checkPwd(){
            	 if($('#boardPwd').val()==originBoardPwd){
            		 var modal = document.getElementById('pwdModal');
            		 modal.style.display = "none";
            		 $('#boardPwd').val('');
            		 $(boardClicked).next().slideDown();
                     $(boardClicked).next().next().slideDown();
                     $(".Answer").css("background","rgb(245,245,245)");
                     $('.Q').prev('tr').children().css('border-bottom','1px solid lightgray');
                     $('.A').prev('tr').children().css('border-bottom','1px solid lightgray');
                     $(boardClicked).css('background', 'lightgray');
            	 }else{
            		 alert('비밀번호를 다시 확인해주세요');
            	 }
             }
        	
        	//모달창 그냥 끄는것 설정
        	$(function(){
        		var modal = document.getElementById('pwdModal');
                var closeBtn = document.getElementById('closeBtn');

                // 모달창 끄기
                closeBtn.onclick = function () {
                    modal.style.display = "none";
                }
                window.onclick = function (event) {
                    if (event.target == modal) {
                        modal.style.display = "none";
                    }
                }
        	})
        	
        	
			//검색어 검증
			function testKey(){
        		if($('#selectCategory').val()==''){
        			alert('검색할 카테고리를 선택하세요');
        			return false;        			
        		}
        		if($('#searchText').val()==''){
        			alert('검색어를 입력하세요');
        			return false;
        		}
        		return true;
        	}
        	
        	//전체보기 버튼 함수
        	function reloadForWhole(){
        		location.href="<%=request.getContextPath()%>/QnAList.bo";
        	}
        	
        	//문의작성 로그인 여부에 따른 기능
        	function yesLogin(){
        		location.href="<%=request.getContextPath()%>/views/board/qnaDetailBoard.jsp";
        	}
        	function notLogin(){
        		var doLogin = confirm('로그인해야만 작성가능합니다. 로그인 하시겠습니까?');
        		if(doLogin==true){
        			$('#moveToLogIn2').click();
        		}
        	}
        
        </script>
    </body>
</html>

