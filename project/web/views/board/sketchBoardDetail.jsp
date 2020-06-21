<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="board.model.vo.*, java.util.ArrayList, java.sql.Date, member.model.vo.Member"%>
<%
	SketchBoard sb = (SketchBoard) request.getAttribute("sb");
	Attachment at = (Attachment) request.getAttribute("at");
	ArrayList<SbReply> rList = (ArrayList<SbReply>) request.getAttribute("rList");
	Member user = (Member) request.getSession().getAttribute("loginUser");
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

/* ----------테이블 영역---------- */
/*테이블 정렬*/
.tableCss1 {
	margin: auto;
	margin-top: 100px;
	width: 1100px;
	height: 60px;
}

.tableCss1 th {
	background: -webkit-linear-gradient(top, #d3c0af, #b3a193);
	color: #242424;
	height: 50px;
}

.tableCss1 td {
	background-color: white;
	height: 40px;
}
/*테이블 경계선 없애고 검은 선 적용*/
.tableCss1, .tableCss2, .tableCss3 {
	border-collapse: collapse;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}
/*테이블 내부 내들 가운데 정렬*/
.tableCss1 {
	text-align: center;
}

#notiSection #content {
	font-family: 'Noto Sans KR', sans-serif;
	text-align: center;
}

/* 작성한 컨텐츠 영역 */
#skContents {
	margin: auto;
	margin-top: 50px;
	margin-bottom: 50px;
	display: flex;
	width: 1050px;
	/* background-color: #d2b9d2; */
}

#imgContent {
	margin: auto;
}

#imgContent>img {
	border: 3px solid #4e3c2e;
}

#textContent {
	margin: auto;
	/* background-color: #b3a193; */
}

#textContent p {
	margin: auto;
	width: 550px;
}

/* ----------댓글영역---------- */
#readReply {
	margin-bottom: 30px;
}

#replyTable {
	width: 1100px;
	margin: auto;
	border-collapse: collapse;
}

#replyTable tr {
	height: 50px;
	text-indent: 30px;
}

#replyTable tr:nth-of-type(2n) td:nth-of-type(2), #replyTable tr:nth-of-type(2n) td:nth-of-type(3)
	{
	text-indent: 0px;
	text-align: center;
	width: 80px;
}

#replyTable tr:nth-of-type(2n+1), #replyTable tr:nth-of-type(2n+1),
	#replyTable tr:nth-of-type(2n) {
	text-align: left;
}

#replyTable button {
	border: none;
	background: none;
	width: 100px;
}

#replyTable button:hover {
	text-decoration: underline;
	color: gray;
}

#readReply img {
	width: 33px;
	height: 30px;
	position: relative;
	top: 8px;
}

#readReply tr:nth-of-type(2n) {
	height: 30px;
}

#readReply tr:nth-of-type(2n) td {
	border-top: 1px solid #242424;
	padding-top: 5px;
}

#readReply tr:nth-of-type(2n+1) {
	height: 60px;
}

#readReply tr:nth-of-type(2n+1) td {
	border-bottom: 1px solid #242424;
}

#readReply tr:nth-of-type(1) {
	background-color: rgba(24, 24, 24, 0.4);
	background: -webkit-linear-gradient(top, rgba(73, 72, 72, 0.4),
		rgba(24, 24, 24, 0.4));
	text-indent: 10px;
}

#readReply tr:nth-of-type(1) td {
	height: 90px;
}

#readReply tr:nth-of-type(1) td span {
	font-size: 20px;
	font-weight: 600;
	position: relative;
	top: -10px;
	/* background-color: #d2c4b9; */
}

#readReply tr:nth-of-type(1) img {
	width: 50px;
	height: 50px;
	position: relative;
	top: 5px;
	margin-right: 10px;
}

/* -----------댓글작성 영역 ----------*/
#writeReply {
	width: 1100px;
	margin: auto;
}

#writeReply form {
	display: flex;
}

#writeReply textarea {
	resize: none;
	border: 5px solid #b3a193;
	height: 100px;
	width: 1000px;
	border-radius: 3px;
}

/* 댓글 등록버튼 */
#replySubmit {
	border: none;
	background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
	color: #242424;
	border-radius: 4px;
	width: 80px;
	height: 100px;
	font-weight: 500;
	font-size: 16px;
	margin-left: 10px;
}

#replySubmit:hover {
	background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
	color: #b3a193;
}

/* 글 목록 버튼 */
#list {
	width: 100px;
	height: 50px;
	border: none;
	background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
	color: #242424;
	border-radius: 4px;
	font-weight: 500;
	font-size: 16px;
	margin-top: 30px;
	margin-bottom: 60px;
}

#list:hover {
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
		<!-- 혜윰 스케치북 공통 상단 -->
		<div id='Backarea'>
			<img src="<%=request.getContextPath()%>/img/CS_icon4.png" id=headimg>
			<h1 id="notiTitle1">HEY YUM SKETCH BOOK</h1>
			<h3 id="notiTitle2">혜윰 스케치북</h3>
		</div>

		<div id="content">
			<table class="tableCss1">
				<tr class="tableCss2">
					<th>작성자</th>
					<th>제목</th>
					<th>작성일</th>
					<th>조회수</th>
					<th>댓글</th>
				</tr>
				<tr class="tableCss3">
					<td><%=sb.getMemberName()%></td>
					<td><%=sb.getSbTitle()%></td>
					<!--colspan하면 위에 작성자 위치가 애매해서 비워둔 테이블-->
					<td><%=sb.getCreateDate()%></td>
					<td><%=sb.getCount()%></td>
					<td>?</td>
				</tr>
				<tr>
					<td colspan="5">
						<div id="skContents">
							<!--강아지 사진-->
							<%
								if ((sb.getSbNo()) == (at.getSbNo())) {
							%>
							<div id="imgContent">
								<img
									src="<%=request.getContextPath()%>/uploadFiles/<%=at.getOriginName()%>"
									width=400px;>
							</div>
							<%
								}
							%>
							<!--내용-->
							<div id="textContent">
								<!-- 사용자가 입력한 양식대로 텍스트가 뜨게 하려면 사용자 글작성창에서 script로 처리해야함(엔터를 줄바꿈인식)-->
								<p>
									<%=sb.getSbContent()%>
								</p>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</div>


		<div id="readReply">
			<!--댓글에 작성자 정보 불러와서 언동해야 됨-->

			<table id="replyTable">
				<tr>
					<td colspan="3"><img src="img/talk.png">&nbsp;<span>댓글</span></td>
				</tr>
				<%
					if (rList != null) {
				%>
				<%
					for (int i = 0; i < rList.size(); i++) {
				%>
				<tr id="nameTr">
					<td colspan="3" id="nameView"><img src=img/user.png>&nbsp;<%=rList.get(i).getMemberName()%></td>
				</tr>
				<tr id="replyTr">
					<td id="replyView"><input type="hidden" id="getRno"
						value="<%=rList.get(i).getrNo()%>"><input type="hidden"
						id="getMno" value="<%=rList.get(i).getMemberNo()%>"><%=rList.get(i).getrContent()%></td>
					<td align="right">
						<button type="submit" class="updateModifyBtns" id="modifyBtn">수정</button>
					</td>
					<td align="right">
						<button type="submit" class="updateDeleteBtns" id="deleteBtn">삭제</button>
					</td>
				</tr>
				<%
					}
				%>
				<%
					} else {
				%>
				<tr>
				</tr>
				<tr>
					<td colspan="3">작성된 글이 없습니다.</td>
				</tr>
				<%
					}
				%>
			</table>

		</div>
		<!--댓글 작성 시 바로 연동되서 올라가도록 처리해야 됨-->
		<div id="writeReply">
			<textarea rows="5" cols="150" placeholder="댓글을 남겨보세요"
				id="replyContent"></textarea>
			<button id="replySubmit">등록</button>
		</div>
		<!--글 목록 버튼 클릭 시 화면 전환 필요함-->
		<button id="list"
			onclick="location.href='<%=request.getContextPath()%>/list.sb'">글목록</button>

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


	<!------script------>
	<script>
            //목록으로 클릭 시 페이지 전환
          $(function(){
                $("#list").click(function(){
                location.href='<%=request.getContextPath()%>/list.sb';
                })
           })
            
          	<%-- var rNo = $("#getRno").val();
			var mNo = <%=user.getmNo()%>
			var mNo2 = $("#getMno").val();
     		var sbNo = <%=sb.getSbNo()%>;
     		 --%>
    		/* var changeContent = $("#replyContent").text(originContent).focus(); */
            var mNo = <%=user.getmNo()%>;
            var sbNo = <%=sb.getSbNo()%>;
            
            
           // 댓글 작성
           	$("#replySubmit").click(function(){
    			
           		var rContent = $("#replyContent").val();
           		
           		$.ajax({
           			url:"<%=request.getContextPath()%>/insertReply.sb",
           			type:"post",
           			data:{mNo:mNo, sbNo:sbNo, rContent:rContent},
           			success:function(data){
           				$replyTable = $("#replyTable");
           				$replyTable.html(""); // 기존의 댓글 삭제
           				
           				for(var i=0; i<data.length; i++){
           					if(i==0){
           						var $tr1 = $("<tr>");
           						/* var inner1="<img src="img/talk.png">&nbsp;<span>댓글</span>" */
           						var $td1 = $("<td>").attr("colspan","3").html("<img src='img/talk.png'>&nbsp;<span>댓글</span>");
           						$tr1.append($td1);
           						
           						var $tr2 = $("<tr>");
           						/* var inner2="<img src="img/user.png">&nbsp;<span>댓글</span>" */
           						var $td2 = $("<td>").attr("colspan","3").html("<img src='img/user.png'>&nbsp;<span>댓글</span>").text(data[i].memberName);
           						$tr2.append($td2);
           						
           						var $tr3 = $("<tr>");
           						var $td3 = $("<td>").text(data[i].rContent);
           						var hidden = $("<input>").attr({"type":"hidden","value":data[i].rNo});
           						var hidden2 = $("<input>").attr({"type":"hidden","value":data[i].MemberNo});
           						var $td4 = $("<td>");
           						var btn1 = $("<button>").attr("type","submit").addClass("updateModifyBtns").attr("id","modifyReply").text("수정");
           						var $td5 = $("<td>");
           						var btn2 = $("<button>").attr("type","submit").addClass("updateDeleteBtns").attr("id","deleteReply").text("삭제");
           						
           						$td3.append(hidden);
           						$td3.append(hidden2);
           						$td4.append(btn1);
           						$td5.append(btn2);
           						$tr3.append($td3);
           						$tr3.append($td4);
           						$tr3.append($td5);
           						
           						$replyTable.append($tr1);
           						$replyTable.append($tr2);
           						$replyTable.append($tr3);
           						
           						}else{
           							
           							var $tr2 = $("<tr>");
               						/* var inner2="<img src="img/user.png">&nbsp;<span>댓글</span>" */
               						var $td2 = $("<td>").attr("colspan","3").html("<img src='img/user.png'>&nbsp;<span>댓글</span>").text(data[i].memberName);
               						$tr2.append($td2);
               						
               						var $tr3 = $("<tr>");
               						var $td3 = $("<td>").text(data[i].rContent);
               						var hidden = $("<input>").attr({"type":"hidden","value":data[i].rNo});
               						var hidden2 = $("<input>").attr({"type":"hidden","value":data[i].MemberNo});
               						var $td4 = $("<td>");
               						var btn1 = $("<button>").attr("type","submit").addClass("updateModifyBtns").attr("id","modifyReply").text("수정");
               						var $td5 = $("<td>");
               						var btn2 = $("<button>").attr("type","submit").addClass("updateDeleteBtns").attr("id","deleteReply").text("삭제");
               						
               						$td3.append(hidden);
               						$td3.append(hidden2);
               						$td4.append(btn1);
               						$td5.append(btn2);
               						$tr3.append($td3);
               						$tr3.append($td4);
               						$tr3.append($td5);
               						
               						$replyTable.append($tr2);
               						$replyTable.append($tr3);
           						
           						}
           						$("#replyContent").text("");
          					}	
           			},
           			error:function(request,status,error){
                           alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                       }
           			
           		})
           	})
           

			// 댓글 수정
           $(".updateModifyBtns").mouseenter(function(){
        		$(this).css("cursor","pointer")
    		}).click(function(){
    			var mNo2 = $(this).parent().parent().children().children("#getMno").val();
    			/* console.log(mNo2); */
    			var rNo = $(this).parent().parent().children().children("#getRno").val();
           		var bool = confirm("댓글을 수정하시겠습니까?");
           		if(bool){
           			if(mNo==mNo2){
           			var originContent = $(this).parent().parent().children("#replyView").text();
           			/* console.log(originContent); */
                    var changeContent = $("#replyContent").text(originContent);
           			/* changeContent.text(); */
           			$(changeContent).focus();
           			$("#replySubmit").click(function(){
           				var changeContent2 = changeContent.val();
           				
/* 						console.log(mNo2);
           				console.log(sbNo);
           				console.log(rNo);
           				console.log(changeContent2); */
           				
    					$.ajax({
               			url:"<%=request.getContextPath()%>/modifyReply.sb",
               			type:"post",
               			data:{mNo:mNo2, sbNo:sbNo, rNo:rNo, changeContent:changeContent2},
               			success:function(data){
               				$replyTable = $("#replyTable");
               				$replyTable.html(""); // 기존의 댓글 삭제
               				
               				
               				for(var i=0; i<data.length; i++){
               					if(i==0){
               						var $tr1 = $("<tr>");
               						/* var inner1="<img src="img/talk.png">&nbsp;<span>댓글</span>" */
               						var $td1 = $("<td>").attr("colspan","3").html("<img src='img/talk.png'>&nbsp;<span>댓글</span>");
               						$tr1.append($td1);
               						
               						var $tr2 = $("<tr>");
               						/* var inner2="<img src="img/user.png">&nbsp;<span>댓글</span>" */
               						var $td2 = $("<td>").attr("colspan","3").html("<img src='img/user.png'>&nbsp;<span>댓글</span>").text(data[i].memberName);
               						$tr2.append($td2);
               						
               						var $tr3 = $("<tr>");
               						var $td3 = $("<td>").text(data[i].rContent);
               						var hidden = $("<input>").attr({"type":"hidden","value":data[i].rNo});
               						var $td4 = $("<td>");
               						var btn1 = $("<button>").attr("type","submit").addClass("updateModifyBtns").attr("id","modifyReply").text("수정");
               						var $td5 = $("<td>");
               						var btn2 = $("<button>").attr("type","submit").addClass("updateDeleteBtns").attr("id","deleteReply").text("삭제");
               						
               						$td3.append(hidden);
               						$td4.append(btn1);
               						$td5.append(btn2);
               						$tr3.append($td3);
               						$tr3.append($td4);
               						$tr3.append($td5);
               						
               						$replyTable.append($tr1);
               						$replyTable.append($tr2);
               						$replyTable.append($tr3);
               						
               						}else{
               							
               							var $tr2 = $("<tr>");
                   						/* var inner2="<img src="img/user.png">&nbsp;<span>댓글</span>" */
                   						var $td2 = $("<td>").attr("colspan","3").html("<img src='img/user.png'>&nbsp;<span>댓글</span>").text(data[i].memberName);
                   						$tr2.append($td2);
                   						
                   						var $tr3 = $("<tr>");
                   						var $td3 = $("<td>").text(data[i].rContent);
                   						var hidden = $("<input>").attr({"type":"hidden","value":data[i].rNo});
                   						var $td4 = $("<td>");
                   						var btn1 = $("<button>").attr("type","submit").addClass("updateModifyBtns").attr("id","modifyReply").text("수정");
                   						var $td5 = $("<td>");
                   						var btn2 = $("<button>").attr("type","submit").addClass("updateDeleteBtns").attr("id","deleteReply").text("삭제");
                   						
                   						$td3.append(hidden);
                   						$td4.append(btn1);
                   						$td5.append(btn2);
                   						$tr3.append($td3);
                   						$tr3.append($td4);
                   						$tr3.append($td5);
                   						
                   						$replyTable.append($tr2);
                   						$replyTable.append($tr3);
               						
               						
               						}
               						
			           				$("#replyContent").text("");

              					}
               				
               			},
               			error:function(request,status,error){
                               alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                           }
    			 		})
           				})
           				}else{
               				alert("댓글은 작성자만 수정가능합니다.");
           				}}else{
               			}
               			})
               		
               		
            		$(".updateDeleteBtns").mouseenter(function(){
                		$(this).css("cursor","pointer");
            		}).click(function(){
            			
            			var mNo2 = $(this).parent().parent().children().children("#getMno").val();
            			console.log(mNo2);
            			var rNo = $(this).parent().parent().children().children("#getRno").val();
            			console.log(rNo);
            			
            			var bool = confirm("댓글을 삭제하시겠습니까?");
            			
            			if(bool && mNo==mNo2){
            				
            			$.ajax({
                   			url:"<%=request.getContextPath()%>/deleteReply.sb",
                   			type:"post",
                   			data:{mNo:mNo2, sbNo:sbNo, rNo:rNo},
                   			success:function(data){
                   				$replyTable = $("#replyTable");
                   				$replyTable.html(""); // 기존의 댓글 삭제
                   				
                   				for(var i=0; i<data.length; i++){
                   					if(i==0){
                   						var $tr1 = $("<tr>");
                   						/* var inner1="<img src="img/talk.png">&nbsp;<span>댓글</span>" */
                   						var $td1 = $("<td>").attr("colspan","3").html("<img src='img/talk.png'>&nbsp;<span>댓글</span>");
                   						$tr1.append($td1);
                   						
                   						var $tr2 = $("<tr>");
                   						/* var inner2="<img src="img/user.png">&nbsp;<span>댓글</span>" */
                   						var $td2 = $("<td>").attr("colspan","3").html("<img src='img/user.png'>&nbsp;<span>댓글</span>").text(data[i].memberName);
                   						$tr2.append($td2);
                   						
                   						var $tr3 = $("<tr>");
                   						var $td3 = $("<td>").text(data[i].rContent);
                   						var hidden = $("<input>").attr({"type":"hidden","value":data[i].rNo});
                   						var $td4 = $("<td>");
                   						var btn1 = $("<button>").attr("type","submit").addClass("updateModifyBtns").attr("id","modifyReply").text("수정");
                   						var $td5 = $("<td>");
                   						var btn2 = $("<button>").attr("type","submit").addClass("updateDeleteBtns").attr("id","deleteReply").text("삭제");
                   						
                   						$td3.append(hidden);
                   						$td4.append(btn1);
                   						$td5.append(btn2);
                   						$tr3.append($td3);
                   						$tr3.append($td4);
                   						$tr3.append($td5);
                   						
                   						$replyTable.append($tr1);
                   						$replyTable.append($tr2);
                   						$replyTable.append($tr3);
                   						
                   						}else{
                   							var $tr2 = $("<tr>");
                       						/* var inner2="<img src="img/user.png">&nbsp;<span>댓글</span>" */
                       						var $td2 = $("<td>").attr("colspan","3").html("<img src='img/user.png'>&nbsp;<span>댓글</span>").text(data[i].memberName);
                       						$tr2.append($td2);
                       						
                       						var $tr3 = $("<tr>");
                       						var $td3 = $("<td>").text(data[i].rContent);
                       						var hidden = $("<input>").attr({"type":"hidden","value":data[i].rNo});
                       						var $td4 = $("<td>");
                       						var btn1 = $("<button>").attr("type","submit").addClass("updateModifyBtns").attr("id","modifyReply").text("수정");
                       						var $td5 = $("<td>");
                       						var btn2 = $("<button>").attr("type","submit").addClass("updateDeleteBtns").attr("id","deleteReply").text("삭제");
                       						
                       						$td3.append(hidden);
                       						$td4.append(btn1);
                       						$td5.append(btn2);
                       						$tr3.append($td3);
                       						$tr3.append($td4);
                       						$tr3.append($td5);
                       						
                       						$replyTable.append($tr2);
                       						$replyTable.append($tr3);
                   						
                   							}

                  					}
                   				
                   			},
                   			error:function(request,status,error){
                                   alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                               }
                   		})
            			}else{
            				alert("댓글은 작성자만 삭제가능합니다.");
            			}
               			});
           		

          

           
           
          <%--  $(function(){
        	   $("#modifyReply").click(function(){
        		   var mNo = <%=user.getmNo()%>
        		   var sbNo = <%=sb.getSbNo() %>; 
        		   var rContent = $("#replyContent").val();
        		   
        		   location.href='<%=request.getContextPath()%>/modify.sb?sbNo="+sbNo"&rNo="+rNo';
                   })
           }) --%>
        		
            
            
        </script>
</body>

</html>