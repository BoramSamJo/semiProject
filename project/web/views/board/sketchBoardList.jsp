<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="board.model.vo.Pagination, java.util.ArrayList, board.model.vo.SketchBoard, board.model.vo.Attachment"%>
<%
	Pagination pn = (Pagination)request.getAttribute("pn");
	ArrayList<SketchBoard> list = (ArrayList<SketchBoard>)request.getAttribute("list");
	ArrayList<Attachment> fList = (ArrayList<Attachment>)request.getAttribute("fList");
	Member user = (Member) request.getSession().getAttribute("loginUser");
	
	int listCount = pn.getListCount();
	int currentPage = pn.getCurrentPage();
	int	limit = pn.getLimit();
	int	maxPage = pn.getMaxPage();
	int	startPage = pn.getStartPage();
	int	endPage = pn.getEndPage();

	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
/* ----------공통설정---------- */
/* 전체설정 */
html, body {
	margin: 0px;
	padding: 0px;
	/* background: palevioletred; */
}

body * {
	font-family: 'Noto Sans KR', sans-serif;
	text-decoration: none;
}

#notiSection {
	text-align: center;
	position: relative;
}

/* ----------고객센터 공통 상단 -----------*/
#Backarea {
	width: 100%;
	height: 320px;
	background: #d2c4b9;
	text-align: center;
	top: 0px;
	margin: 0px;
}
/* 상단 명(ENG.VER) */
#notiTitle1 {
	font-family: 'Noto Sans KR', sans-serif;
	margin: 0px;
	margin: auto;
	margin-top: 0px;
	font-size: 50px;
	padding-top: 140px;
	position: relative;
	left: 20px;
	width: 600px;
	/* background-color: violet; */
}
/* 상단 명(KO.VER) */
#notiTitle2 {
	font-family: 'Noto Sans KR', sans-serif;
	margin-top: 0px;
	color: black;
	opacity: 0.5;
	font-size: 22px;
	padding-top: 40px;
}
/* 상단 강아지 이미지 */
#headimg {
	width: 80px;
	height: 80px;
	position: absolute;
	margin-top: 130px;
	margin-left: -380px;
}

/* ----------검색창 영역------------*/
#search {
	margin-top: 50px;
}

#searchText {
	border: none;
	border-bottom: 2px solid #b3a193;
	width: 50%;
	outline: none;
}

#search img {
	width: 12%;
	position: relative;
	top: 40px;
}

@media only screen and (max-width: 1300px) {
	#search img {
		display: none;
	}
}

#btntest {
	width: 55px;
	height: 30px;
	border: none;
	border-radius: 4px;
	background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
	color: #242424;
}

#btntest:hover {
	background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
	color: #b3a193;
}

/* ----------게시글 영역---------- */
/* 이미지 뒤 배경틀 */
#background {
	background: #d2c4b9;
	margin: auto;
	margin-top: 40px;
	padding: 30px;
	width: 1000px;
	border-radius: 10px;
}

#boardTable {
	text-align: center;
	margin: auto;
	border: none;
	border-collapse: collapse;
}

#boardTable td {
	padding: 15px;
	background-color: white;
	opacity: 0.9;
	border: none;
}

#boardTable tr:nth-of-type(3n) td {
	border-bottom: 1px solid #242424;
}

#boardTable tr:nth-of-type(1) td {
	border-top: 1px solid #242424;
}

#boardTable img {
	width: 300px;
	border-radius: 8px;
	border: 2px solid #72665d;
}

/* 글쓰기 버튼 */
#write {
	border: none;
	padding: 10px 25px;
	border-radius: 4px;
	background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
	color: #242424;
	font-weight: 700;
	margin-top: 30px;
	margin-bottom: 60px;
}

#notiSection a {
	font-family: 'Noto Sans KR', sans-serif;
	text-decoration: none;
	color: #242424;
}

/* < >화면 페이징처리 버튼 */
.pagingBtns {
	border: 1px solid #242424;
	background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
	color: #242424;
}

#notiSection button:hover {
	background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
	color: #b3a193;
}

/* -----------------footerCSS 시작------------------------ */
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
	margin-bottom: 0px;
	margin-left: 30px;
	line-height: 30px;
	padding-left: 50px;
}

#footerTable a {
	text-decoration: none;
}

#footerTable tr:nth-of-type(6) a {
	color: white;
}

#animalProtectSys {
	background-color: #b3a193;
	color: #242424;
	padding: 1.5px 4px 2px 4px;
	font-size: 12px;
	font-family: 'Noto Sans KR', sans-serif;
}

#background img {
	witdh: 100px;
	height: 200px;
}

</style>
<!-- 노토산스kr 폰트 가져오기 -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
</head>

<body>
	<!--헤더 시작-->
	<header>
		<%@include file="../common/menubar.jsp"%>
	</header>
	<!--섹션 시작-->
	<section id="notiSection">
		<!-- 스케치북 공통 상단 -->
		<div id='Backarea'>
			<img id='headimg'
				src="<%=request.getContextPath() %>/img/CS_icon4.png">
			<h1 id="notiTitle1">HEY YUM SKETCH BOOK</h1>
			<h3 id="notiTitle2">혜윰 스케치북</h3>
		</div>

		<div id="search">
			<img src="<%=request.getContextPath() %>/LOGO/LOGO1.png"> 
			<input id="searchText" name="searchArea" type="text" placeholder="SEARCH">
			<button type="button" name="search" id="btntest" onclick="return validate();">검색</button>
		</div>
		
		<div id="background">
			<!--jsp에서 한 행당 3개씩나오게 처리하면됩니다-->
			<!-- 화면전환은 함수로  -->
			<table id="boardTable">
				<%if(!list.isEmpty() && !fList.isEmpty()) {%>
				<%for(int i=0; i<list.size(); i++){%>
				<%if(i%3==0){ %>
				<tr>
					<%} %>
					<%if(((SketchBoard)list.get(i)).getSbNo() == ((Attachment)fList.get(i)).getSbNo()){%>

					<td class="clickArea"><input type="hidden" value="<%= ((Attachment)fList.get(i)).getSbNo()%>">
						<div>
						 <img src="<%=request.getContextPath() %>/uploadFiles/<%=((Attachment)fList.get(i)).getOriginName() %>">
						</div>
						<div>
						<%=((SketchBoard)list.get(i)).getSbTitle() %>
						</div>
						<div>
						작성일 : <%=((SketchBoard)list.get(i)).getCreateDate() %>&nbsp;&nbsp;&nbsp;조회수 : <%= ((SketchBoard)list.get(i)).getCount()%>
						</div>
					</td>

					<% }%>
					
					<%if((i+1)%3==0){ %>
				
				</tr>
					<%} %>
					<%}}else{ %>
				<tr id="noneBoard">
					<td>작성된 게시글이 없습니다.</td>
				</tr>
					<%} %>
			</table>


		</div>
		<br>

		<!--페이지 변환되는 작업 해야 됨-->
		<div class="pagingArea" align="center">
			<button class="pagingBtns"
				onclick="location.href='<%=request.getContextPath() %>/list.sb?currentPage=1'">
				<<</button>
			<button class="pagingBtns"
				onclick="location.href='<%=request.getContextPath() %>/list.sb?currentPage=<%=currentPage-1 %>'">
				<</button>

			<% for(int p = startPage ; p <= endPage ; p ++) {%>
			<%if(p == currentPage) {%>
			<button class="pagingBtns" disabled><%=p %></button>
			<%}else{ %>
			<button class="pagingBtns"
				onclick="location.href='<%=request.getContextPath() %>/list.sb?currentPage=<%=p %>'"><%=p %></button>
			<% } %>
			<% } %>

			<button class="pagingBtns"
				onclick="location.href='<%=request.getContextPath() %>/list.sb?currentPage=<%=currentPage+1 %>'">
				></button>
			<button class="pagingBtns"
				onclick="location.href='<%=request.getContextPath() %>/list.sb?currentPage=<%=maxPage %>'">
				>></button>
		</div>


		<!--버튼클릭 시 글쓰기 페이지로 전환-->
		<button id="write" value="write">작성하기</button>
	</section>

	<!--풋터 시작-->
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
				<td><a id="animalProtectSys"
					href="https://www.animal.go.kr/front/awtis/shop/undertaker1List.do?bizKnCd=&boardId=shop&pageSize=0&longitude=&latitude=&menuNo=6000000131&searchUprCd=&searchOrgCd=&searchCoNm=%ED%8E%AB%ED%8F%AC%EB%A0%88%EC%8A%A4%ED%8A%B8">
						동물보호시스템 </a></td>
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
			해윰 | 사업자등록번호 : 0123456789호 | 동물장묘업 등록번호 | 대표자 : 배혜린 <br>
			Copyright © 2020-2020 hyeyum Institute All Right Reserved
		</p>
	</footer>

	<script>

        	$(".clickArea").mouseenter(function(){
        		$(this).children().css("cursor","pointer");
    		}).click(function(){
       			var sbNo = $(this).children("input").val();

       			<%if(user != null) {%>
    			location.href="<%=request.getContextPath()%>/detail.sb?sbNo="+sbNo;
				<%}else{%>
				alert("상세보기는 로그인한 고객님만 가능합니다.");
				<%}%>
    			})
        	
    			
        	$("#write").mouseenter(function(){
        		$(this).css("cursor","pointer");
    		}).click(function(){
    			<%if(user != null) {%>
    			location.href="<%=request.getContextPath() %>/views/board/sketchBoardWrite.jsp";
				<%}else{%>
				alert("게시글 작성은 로그인한 고객님만 가능합니다.");
				<%}%>
    			});
			
        	
        	function validate(){
        		var searchText = $("#searchText").val();
        		console.log(searchText);
        		
        		if(searchText == ""){
        			alert("검색어를 입력하세요");
        			return false;
        		}else{
        			location.href="<%=request.getContextPath()%>/search.sb?searchText="+searchText;
        		}
        	}
        		
       		
        </script>
</body>

</html>