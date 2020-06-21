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
	
	//넘겨받은 쿼리(없으면 기본형)
	String query = (String)request.getAttribute("query");
	if(query==null){
		query = "SELECT * FROM QNABOARD";
	}
	
	//줄 쿼리
	String givenQuery ="";
	//카테고리로 검색헀다 온 경우
	String category ="";
	String isC = (String)request.getAttribute("isC");//서치서블릿의 결과인지 어쩐지 판단
	if(isC==null){
		isC="false";
	}else if(isC=="true"){
		category = (String)request.getAttribute("category");
		givenQuery = (String)request.getAttribute("givenQuery");
	}else if(isC=="past"){//거쳐진 경우
		
	}
	
	//답변여부로 검색했다 온 경우
	String isAnswer ="";
	String isA= (String)request.getAttribute("isA");//서치서블릿의 결과인지 어쩐지 판단
	if(isA==null){
		isA="false";
	}else if(isA=="true"){
		isAnswer = (String)request.getAttribute("isAnswer");
		givenQuery = (String)request.getAttribute("givenQuery");
	}else if(isA=="past"){//거쳐진 경우
		
	}
	
	//검색어로 검색했다 온 경우
	String selectBox ="";
	String searchText ="";
	String isT= (String)request.getAttribute("isT");//서치서블릿의 결과인지 어쩐지 판단
	if(isT==null){
		isT="false";
	}else if(isT=="true"){
		selectBox = (String)request.getAttribute("selectBox");
		searchText = (String)request.getAttribute("searchText");
		givenQuery = (String)request.getAttribute("givenQuery");
	}else if(isT=="past"){//거쳐진 경우
		
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
            margin-bottom:50px;
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
        #notiSection #selectCategory{
            position: absolute;
            margin-top: 13.5%;
            margin-left: -8%;
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
            margin-left: 1.1%;
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
            margin-left: 10.2%;
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
            margin-left: 19.7%;
            border:none;
            border-bottom: 1px solid #242424;
            width: 10%;
            outline: none;
        }
        #btntest{
            position: absolute;
            top:425px;
            right:250px;
            width: 55px;
            height: 35px;
            border: none;
            border-radius: 4px;
            background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
            color: #242424;
        }
        #btntest:hover{
            background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
            color: #b3a193;
        }
        #resetSearchBtn{
         	position: absolute;
            top:425px;
            right:190px;
            width: 55px;
            height: 35px;
            border: none;
            border-radius: 4px;
            background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
            color: #242424;
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
        <%@include file="../common/managebar.jsp"%>
		<input type="hidden" id="hiddenQuery" value="<%=query%>">
        <!--section시작-->
        <section id="notiSection">
            <div id='Backarea'>
                <h1 id="notiTitle1">CS CENTER Manage</h1><h3 id="notiTitle2">고객센터 관리</h3>
            </div>
            <div id = 'headline'><span onclick="location.href='CS_NotiMain.html';">공지사항</span><span onclick="location.href='CS_FAQ.html';">FAQ</span><span  onclick="location.href='<%=request.getContextPath()%>/manageQList.bo';" >QnA</span></div>
            	<%if(isC.equals("true")||isC.equals("past")) {%>
            	<select name="selectCategory" id="selectCategory" onchange="selectC(this);" disabled>
                   <option selected value='' class="choice" disabled>카테고리 선택</option>
                   <option value="all">카테고리 전체</option>
                   <option value="reser">예약문의</option>
                   <option value="insFu">보험/장례문의</option>
                   <option value="price">가격문의</option>
                   <option value="etc">기타문의</option>
               </select>
            	<%}else {%>
           		<select name="selectCategory" id="selectCategory" onchange="selectC(this);">
                   <option selected value='' class="choice" disabled>카테고리 선택</option>
                   <option value="all">카테고리 전체</option>
                   <option value="reser">예약문의</option>
                   <option value="insFu">보험/장례문의</option>
                   <option value="price">가격문의</option>
                   <option value="etc">기타문의</option>
               </select>
               <%} %>
               
               <%if(isA.equals("true")||isA.equals("past")) {%>
               <select name="selectAnswer" id="selectAnswer" onchange="selectA(this);" disabled>
                    <option selected value='' class="choice" disabled>답변 여부</option>
                    <option value="all">전체</option>
                    <option value="answer">답변</option>
                    <option value="noAnswer">미답변</option>
                </select>
                <%}else {%>
                <select name="selectAnswer" id="selectAnswer" onchange="selectA(this);">
                    <option selected value='' class="choice" disabled>답변 여부</option>
                    <option value="all">전체</option>
                    <option value="answer">답변</option>
                    <option value="noAnswer">미답변</option>
                </select>
                <%} %>
                
                <%if(isT.equals("true")||isT.equals("past")) {%>
              	<select name="selectSearch" id="selectSearch" onchange="selectS(this);" disabled>
                    <option selected value='' class="choice" disabled>검색어 분류</option>
                    <option value="all">검색하지 않음</option>
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                    <option value="writer">작성자</option>
                </select>
                <%}else {%>
                <select name="selectSearch" id="selectSearch" onchange="selectS(this);">
                    <option selected value='' class="choice" disabled>검색어 분류</option>
                    <option value="all">검색하지 않음</option>
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                    <option value="writer">작성자</option>
                </select>
                <%} %>
            	<input type='search' name="content" id="searchText">&nbsp;
            	<button type="submit" name="search" id ="btntest" onclick="searchKeyWord();">검색</button>
            <button type="button" name="resetSearch" id ="resetSearchBtn" onclick="reloadForWhole();">초기화</button>

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
				                    <%if(qList.get(i).getqNo()==qAList.get(j).getqNo()){%>
				                    <tr class="A">
				                        <td><img src="/project/img/answerImg3.png" width="35px"></td>
				                        <td colspan="5" style="text-align:left">
				                        	<textarea id="textArea" name="" rows="6" cols="95" style="resize:none"><%=qAList.get(j).getaContent()%></textarea>
				                        </td>
				                    	<td>
				                    		<button class="deleteBtn" onclick="deleteQnA(<%=qList.get(i).getqNo()%>, <%=qAList.get(j).getQaNo()%>);">삭제</button>
				                    		<button class="answerBtn" onclick="updateAnswer('<%=qList.get(i).getmNo()%>','<%=qList.get(i).getqNo()%>', <%=qAList.get(j).getQaNo()%>, this);">수정</button>
				                    	</td>
				                    </tr>
				                    <% break;}else { %>
				                    	<%if(j==qAList.size()-1){ %>
					                    <tr class="A">
					                    	<td><img src="/project/img/answerImg3.png" width="35px"></td>
				                    		<td colspan="5" style="text-align:left">
				                    			<textarea id="textArea" name="" rows="6" cols="95" style="resize:none"></textarea>
				                    		</td>
					                    	<td>
    						                    <button class="deleteBtn" onclick="deleteQnA(<%=qList.get(i).getqNo()%>, <%=qAList.get(j).getQaNo()%>);">삭제</button>
					                    		<button class="answerBtn" onclick="writeAnswer('<%=qList.get(i).getmNo()%>','<%=qList.get(i).getqNo()%>',this);">답변</button>
					                    	</td>
				                    	</tr>
			                    		<%} %>
				                    <%}%>
			                    <%} %>
	                    <%} %>
                    <%} %>
                 </table>
				<%if(p.getListCount()==0){%>
					
				<%}else{ %>
					<%if(isC.equals("true")) {%>
	                 	<button onclick="location.href='<%=request.getContextPath()%>/searchQC.bo?currentPage=<%=1 %>&category=<%=category%>&givenQuery=<%=givenQuery%>';" class="pagingBtns" ><<</button>
		                 &nbsp;
		                 <button onclick="location.href='<%=request.getContextPath()%>/searchQC.bo?currentPage=<%=currentPage-1 %>&category=<%=category %>&givenQuery=<%=givenQuery%>';" class="pagingBtns" ><</button>
		                 <%for(int pg = startPage; pg<=endPage; pg++){ %>
		                 	<%if(pg == currentPage){ %>
			                 	<button class="pagingBtns" disabled><%=pg %></button>
							<%}else{ %>
		                 		<button class="pagingBtns" onclick="location.href='<%=request.getContextPath() %>/searchQC.bo?currentPage=<%=pg %>&category=<%=category %>&givenQuery=<%=givenQuery%>';" class="pagingBtns" ><%=pg %></button>
		                 	<%} %>
		                 <%} %>
		                 <button onclick="location.href='<%=request.getContextPath() %>/searchQC.bo?currentPage=<%=currentPage+1 %>&category=<%=category %>&givenQuery=<%=givenQuery%>';" class="pagingBtns" >></button>
		                 &nbsp;
		                 <button onclick="location.href='<%=request.getContextPath() %>/searchQC.bo?currentPage=<%=maxPage %>&category=<%=category %>&givenQuery=<%=givenQuery%>';" class="pagingBtns" >>></button>
		                 
	                 <%}else if(isA.equals("true")){ %>
		                 <button onclick="location.href='<%=request.getContextPath()%>/manageSearchQA.bo?currentPage=<%=1 %>&isAnswer=<%=isAnswer %>&givenQuery=<%=givenQuery %>';" class="pagingBtns" ><<</button>
		                 &nbsp;
		                 <button onclick="location.href='<%=request.getContextPath()%>/manageSearchQA.bo?currentPage=<%=currentPage-1 %>&isAnswer=<%=isAnswer %>&givenQuery=<%=givenQuery %>';" class="pagingBtns" ><</button>
		                 <%for(int pg = startPage; pg<=endPage; pg++){ %>
		                 	<%if(pg == currentPage){ %>
			                 	<button class="pagingBtns" disabled><%=pg %></button>
							<%}else{ %>
		                 		<button class="pagingBtns" onclick="location.href='<%=request.getContextPath()%>/manageSearchQA.bo?currentPage=<%=pg %>&isAnswer=<%=isAnswer %>&givenQuery=<%=givenQuery %>';" class="pagingBtns" ><%=pg %></button>
		                 	<%} %>
		                 <%} %>
		                 <button onclick="location.href='<%=request.getContextPath()%>/manageSearchQA.bo?currentPage=<%=currentPage+1 %>&isAnswer=<%=isAnswer %>&givenQuery=<%=givenQuery %>';" class="pagingBtns" >></button>
		                 &nbsp;
		                 <button onclick="location.href='<%=request.getContextPath()%>/manageSearchQA.bo?currentPage=<%=maxPage %>&isAnswer=<%=isAnswer %>&givenQuery=<%=givenQuery %>';" class="pagingBtns" >>></button>
		                 
		              <%}else if(isT.equals("true")){ %>
		                 <button onclick="location.href='<%=request.getContextPath()%>/manageSearchQS.bo?currentPage=<%=1 %>&selectBox=<%=selectBox %>&searchText=<%=searchText %>&givenQuery=<%=givenQuery %>';" class="pagingBtns" ><<</button>
		                 &nbsp;
		                 <button onclick="location.href='<%=request.getContextPath()%>/manageSearchQS.bo?currentPage=<%=currentPage-1 %>&selectBox=<%=selectBox %>&searchText=<%=searchText %>&givenQuery=<%=givenQuery %>';" class="pagingBtns" ><</button>
		                 <%for(int pg = startPage; pg<=endPage; pg++){ %>
		                 	<%if(pg == currentPage){ %>
			                 	<button class="pagingBtns" disabled><%=pg %></button>
							<%}else{ %>
		                 		<button class="pagingBtns" onclick="location.href='<%=request.getContextPath()%>/manageSearchQS.bo?currentPage=<%=pg %>&selectBox=<%=selectBox %>&searchText=<%=searchText %>&givenQuery=<%=givenQuery %>';" class="pagingBtns" ><%=pg %></button>
		                 	<%} %>
		                 <%} %>
		                 <button onclick="location.href='<%=request.getContextPath()%>/manageSearchQS.bo?currentPage=<%=currentPage+1 %>&selectBox=<%=selectBox %>&searchText=<%=searchText %>&givenQuery=<%=givenQuery %>';" class="pagingBtns" >></button>
		                 &nbsp;
		                 <button onclick="location.href='<%=request.getContextPath()%>/manageSearchQS.bo?currentPage=<%=maxPage %>&selectBox=<%=selectBox %>&searchText=<%=searchText %>&givenQuery=<%=givenQuery %>';" class="pagingBtns" >>></button>
		                 
	                 <%}else{ %>
		                 <button onclick="location.href='<%=request.getContextPath()%>/manageQList.bo?currentPage=<%=1 %>'" class="pagingBtns" ><<</button>
		                 &nbsp;
		                 <button onclick="location.href='<%=request.getContextPath()%>/manageQList.bo?currentPage=<%=currentPage-1 %>'" class="pagingBtns" ><</button>
		                 <%for(int pg = startPage; pg<=endPage; pg++){ %>
		                 	<%if(pg == currentPage){ %>
			                 	<button class="pagingBtns" disabled><%=pg %></button>
							<%}else{ %>
		                 		<button class="pagingBtns" onclick="location.href='<%=request.getContextPath()%>/manageQList.bo?currentPage=<%=pg %>'" class="pagingBtns" ><%=pg %></button>
		                 	<%} %>
		                 <%} %>
		                 <button onclick="location.href='<%=request.getContextPath()%>/manageQList.bo?currentPage=<%=currentPage+1 %>'" class="pagingBtns" >></button>
		                 &nbsp;
		                 <button onclick="location.href='<%=request.getContextPath()%>/manageQList.bo?currentPage=<%=maxPage %>'" class="pagingBtns" >>></button>
	                 <%}%>
		                 
                 <%}%>
                </div>
        </section>


        <!------------------------------------------------------------------------------------------------------------------------------------------>
        <script>
        	boardClicked = '';//클릭된 게시글 객체를 담을 변수
        	//전역변수에 클릭한 게시글의 비번을 담음
        	function getPwd(pwd, object){
        		//전에 들어갔던 놈을 원상복귀
        		$(boardClicked).next().slideUp();
        		$(boardClicked).next().next().slideUp();
        		$(boardClicked).css('background', 'white');
        		//클릭한 게시글 비번과 객체를 담음
        		boardClicked = object;
        		
				//비공개글이면 비번입력 모달창을 띄우고 공개글이면 클릭시 그냥 띄우고
				$(boardClicked).next().slideDown();
                $(boardClicked).next().next().slideDown();
                $(".Answer").css("background","rgb(245,245,245)");
                $('.Q').prev('tr').children().css('border-bottom','1px solid lightgray');
                $('.A').prev('tr').children().css('border-bottom','1px solid lightgray');
                $(boardClicked).css('background', 'lightgray');
        	}

        	//전체보기 버튼 함수
        	function reloadForWhole(){
        		location.href="<%=request.getContextPath()%>/manageQList.bo";
        	}
        	
        	
        	//답변작성
        	function writeAnswer(mNo, qNo, t){
        		var mNo = mNo;
        		var qNo = qNo;
        		var qAContent = $(t).parent().prev().children('textArea').val();
        		var isUpdate = "false";

        		if(qAContent==''){
        			alert('내용을 작성해야 합니다')
        			return;
        		}
        		
        		$.ajax({
	  				 url:'<%=request.getContextPath()%>/writeAnswer.bo'
	  				, type:'post'
	  				, data:{mNo:mNo, qNo:qNo, qAContent:qAContent, isUpdate:isUpdate}
	  				, success:function(data){
	  					alert(data);
	  				}
	  				, error:function(request, status, error){
	           			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
           			}
	 			})
	  			location.reload();
        	}
        	
        	//답변 수정
        	function updateAnswer(mNo, qNo, qANo, t){
        		var mNo = mNo;
        		var qNo = qNo;
        		var qAContent = $(t).parent().prev().children('textArea').val();
        		var qANo = qANo;
        		var isUpdate = "true";
        		
        		if(qAContent==''){
        			alert('내용을 작성해야 합니다')
        			return;
        		}
        		
        		$.ajax({
	  				 url:'<%=request.getContextPath()%>/writeAnswer.bo'
	  				, type:'post'
	  				, data:{mNo:mNo, qNo:qNo, qAContent:qAContent, isUpdate:isUpdate, qANo:qANo}
	  				, success:function(data){
	  					alert(data);
	  				}
	  				, error:function(request, status, error){
	           			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
           			}
	 			})
	  			location.reload();
        	}
        	
        	//게시글과 답변 삭제
        	function deleteQnA(qNo, qANo){
        		var qNo = qNo;
        		var qANo = qANo;
        		var isUpdate = "false";
        		
        		var isTrue = confirm('정말 삭제하시겠습니까?');
        		if(!isTrue){
        			return;	
        		}
        		
        		$.ajax({
	  				 url:'<%=request.getContextPath()%>/deleteQ.bo'
	  				, type:'post'
	  				, data:{qNo:qNo, qANo:qANo}
	  				, success:function(data){
	  					alert(data);
	  				}
	  				, error:function(request, status, error){
	           			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
           			}
	 			})
	  			location.reload();
        	}
        	
        	//게시글 조회(가져온걸가지고 다른걸 선택하면 가져온 조회된 게시물 그 안에서 또 조회하고 이런식으로 할거임.)
        	//카테고리별 조회
        	givenQuery = $('#hiddenQuery').val();
       		alert(givenQuery);
        		
        	function selectC(t){
        		if($(t).val()=='all'){
        			$(t).prop('disabled', true);
        			return;
        		}
        		
        		location.href ="<%=request.getContextPath()%>/manageSearchQC.bo?category="+$(t).val()+"&givenQuery="+givenQuery;
        	}
        	
        	//답변여부별 조회
        	function selectA(t){
        		if($(t).val()=='all'){
        			$(t).prop('disabled', true);
        			return;
        		}
        		
        		location.href ="<%=request.getContextPath()%>/manageSearchQA.bo?isAnswer="+$(t).val()+"&givenQuery="+givenQuery;
        	}
        	
        	//검색어의 카테고리 검증
        	function selectS(t){
        		if($(t).val()=='all'){
        			$('#searchText').prop('disabled', true).css({'border':'none'}).val('');
        			return;
        		}else{
        			$('#searchText').prop('disabled', false).css({'border-bottom':'1px solid #242424'});
        		}
        	}
        	
        	
        	//검색어 검증 후 조회
			function searchKeyWord(){
        		if($('#searchText').prop('disabled')){
        			alert('검색하지 않음을 선택하셨습니다')
        			return;
        		}
        		if($('#searchText').val()==''){
        			alert('검색어를 입력하세요');
        			return;
        		}else{
	        		if($('#selectSearch').val()==null){
	        			alert('검색어 분류를 선택하세요');
	        			return;        			
	        		}
        		}
        		
        		location.href ="<%=request.getContextPath()%>/manageSearchQS.bo?selectBox="+$('#selectSearch').val()+"&searchText="+$('#searchText').val()+"&givenQuery="+givenQuery;
        	}
        	
        	
        </script>
    </body>
</html>

