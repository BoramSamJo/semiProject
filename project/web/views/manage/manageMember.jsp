<%@page import="member.model.vo.Animal"%>
<%@page import="board.model.vo.Pagination"%>
<%@page import="member.model.vo.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<Member> mList = (ArrayList<Member>)request.getAttribute("member");
	ArrayList<Animal> aList = (ArrayList<Animal>)request.getAttribute("animal");
	
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
	}
	String isIns = (String)request.getAttribute("isIns");//보험서치한건지 판단
	if(isIns==null){
		isIns="false";
	}else{
		isIns="true";
	}
	String isFu = (String)request.getAttribute("isFu");//장례서치한건지 판단
	if(isFu==null){
		isFu="false";
	}else{
		isFu="true";
	}
	
	String sendCompleteDate = (String)request.getAttribute("sendCompleteDate");
	if(sendCompleteDate==null){
		sendCompleteDate="false";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
#manageMemberSection
:not
 
(
[
id
=
mainSideNav
]
 
)
{
position
:
 
relative
;

	
background-color
:
 
white
;


}
#memberArea {
	text-align: center;
	width: 90%;
}

/* ----------관리자 공통 상단 -----------*/
#Backarea {
	width: 100%;
	height: 220px;
	background: #d2c4b9;
	text-align: center;
	top: 0px;
	margin: 0px;
	margin-bottom: 30px;
}
/* 상단 명(ENG.VER) */
#myTilte1 {
	font-family: 'Noto Sans KR', sans-serif;
	margin: 0px;
	margin: auto;
	margin-top: 0px;
	font-size: 50px;
	padding-top: 40px;
	position: relative;
	width: 600px;
	/* background-color: violet; */
}
/* 상단 명(KO.VER) */
#myTilte2 {
	font-family: 'Noto Sans KR', sans-serif;
	margin-top: 0px;
	color: black;
	opacity: 0.5;
	font-size: 22px;
	padding-top: 40px;
}
/* 버튼류 공통 설정 */
#manageMemberSection button {
	border: 1px solid #242424;
	background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
	color: #242424;
}

#manageMemberSection button:hover {
	background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
	color: #b3a193;
}

.borderNone{
	border:none;
	border: 1px solid #b3a193;
	height: 30px;
	text-indent: 10px;
	color:#242424;
	font-weight:500;
	font-size:15px;
	border-radius: 3px;
}
/* input 텍스트 입력 창 공통설정 */
#manageMemberSection input:not([class=borderNone]) {
	border-radius: 3px;
	border: 1px solid #b3a193;
	height: 30px;
	text-indent: 10px;
}
/* < >화면 페이징처리 버튼 공통설정*/
.pagingBtns {
	border: 1px solid #242424;
	padding-bottom: 3px;
	padding-left: 7px;
	padding-right: 7px;
	border-radius: 2px;
}
/* 기타버튼 공통처리*/
.memberManageBtns {
	height: 30px;
	border-radius: 2px;
}
/* 라벨설정 */
#manageMemberSection label {
	font-weight: 530;
}
/* 서치공간 설정 */
#searchArea {
	margin-top: 50px;
	margin-bottom: 10px;
}
/* -----------예약/보험 테이블 영역-----------*/
.TableCSS1 {
	width: 100%;
	margin: auto;
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
	background: #d2c4b9;
}

.TableCSS1 td {
	font-family: 'Noto Sans KR', sans-serif;
	line-height: 3;
	height: 40px;
	vertical-align: top;
	border-bottom: 1px solid black;
}

.TableCSS1 tr:nth-of-type(2n) td {
	border-bottom: 1px solid lightgray;
}

.TableCSS1 tr:nth-of-type(2n+1) td {
	padding: 20px;
}

.TableCSS1 tr:nth-of-type(1+2n) td:nth-of-type(5) {
	width: 100px;
}

.TableCSS1 tr:nth-of-type(2n) td {
	border-right: 1px solid lightgray;
}
.TableCSS1 tr:nth-of-type(2n) td:last-child 
, .TableCSS1 tr:nth-of-type(2n) td:nth-of-type(9) {
	border-right: none;
}

.tablehover:hover {
	background: rgb(228, 227, 227);
}

#memberArea p, #insCheckArea p {
	font-size: 14px;
}

#memberArea, #insCheckArea {
	margin: auto;
	/* margin-bottom: 70px; */
	padding-top: 10px;
	padding-bottom: 40px;
	/* border:5px solid #a39488; */
	border-radius: 10px;
	background-color: white;
}

#memberArea hr {
	border: none;
	border-bottom: 1px solid lightgray;
}

</style>
</head>
<body id="manageMemberSection">
	<%@include file="../common/managebar.jsp"%>

	<!-- 관리자페이지 공통 상단 -->
	<div id='Backarea'>
		<h1 id="myTilte1">Member Manage</h1>
		<h3 id="myTilte2">회원관리</h3>
	</div>

	<div id="memberArea">
		<h2 style="color: #685d55">회원정보</h2>

		<div id="searchArea" align="right">
			<form action="<%=request.getContextPath()%>/searchMember.me?">
	             <select name="selectFind" id="selectFind" style="height:32px;border-radius:3px">
	                    <option selected value='' disabled>카테고리 선택</option>
	                    <option value="FindUserName">회원명</option>
	                    <option value="FinduserId">아이디</option>
	                    <option value="FindPhone">전화번호</option>
	                    <option value="FindIns">보험가입자</option>
	                    <option value="FindFu">장례완료자</option>
	                </select>
	            <input type='text' name="searchText" id="searchText" disabled style="background:lightgray">&nbsp;
				<input type="number" name="completeDate" id="completeDate" placeholder="경과일 입력" disabled style="background:lightgray">
				<button id="findBtn" class="memberManageBtns">조회</button>
			</form>
			<div>
				<label for="insText">보험메일</label>
				<input type="radio" name="mailText" id="insText" value="insText" style="position:relative; top:9px;">
				<label for="fuText">장례메일</label>
				<input type="radio" name="mailText" id="fuText" value="fuText" style="position:relative; top:9px;">
				<label for="directMailText">직접입력:</label>
				<input type="text" id="directMailText">
				<button type="button" class="memberManageBtns" onclick="sendMail();">mail 전송</button>
			</div>
		</div>
		<div id="listResultArea" align="right" style="">
			<label>조회 결과 : <%=listCount %>명</label>
		</div>

		<table class="TableCSS1" border="0px">
			<tr>
				<th class="bar">회원번호</th>
				<th>이름</th>
				<th>아이디</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th colspan="4">주소</th>
				<%if(isIns.equals("true")){ %>
				<th>보험<br>가입일</th>
				<%}else if(isFu.equals("true")){ %>
				<th>장례일</th>
				<%}else{%>
				<th>가입일</th>
				<%}%>
<!-- 				<th>펫</th> -->
				<th>상태</th>
				<th></th>
				<th>
					<input type="checkbox" name="selectAll" id="selectAll" style="width:20px;margin-top:10px">
				</th>
			</tr>
			<%if(mList==null||mList.isEmpty()){ %>
			<tr>
				<td colspan="13">조회할 회원이 없습니다</td>
			</tr>
			<%}else{%>
			<%for(int i = 0; i < mList.size(); i++){ %>
			<%if(!mList.isEmpty()){%>
			<tr class="off" id='modaltest1'>
				<td class='init'><%=mList.get(i).getrNo() %></td>
				<td class='init'><%=mList.get(i).getmName() %></td>
				<td class='init'><%=mList.get(i).getmId() %></td>
				<td class='init'><%=mList.get(i).getPhone() %></td>
				<td class='init'><%=mList.get(i).getEmail() %></td>
				<td class='init' colspan="4"><%=mList.get(i).getAddress() %></td>
				<td class='init'><%=mList.get(i).getEnrollDate().substring(0,10) %></td>
<!-- 				<td class='init'> -->
<%-- 					<%for(int j = 0; j < aList.size(); j++){ %> <%if(mList.get(i).getmNo()==aList.get(j).getmNo()){ %> --%>
<%-- 					보유 <%break;}else{%> <%if(j==aList.size()-1){ %> 없음 <%} %> <%}%> <%} %> --%>
<!-- 				</td> -->
				<td class='init'><%=mList.get(i).getStatus() %></td>
				<td class='init'>
					<!-- <button class="memberManageBtns">수정</button> -->
					<button class="memberManageBtns" onclick="goodBye('<%=mList.get(i).getmId()%>');">탈퇴</button>
				</td>
				<td class='init'>
					<form>
						<input type="checkbox" name="sendMailUser" value="<%=mList.get(i).getEmail() %>" style="width:20px;margin-top:10px;background:black"> 
					</form>
				</td>
			</tr>
			<%for(int j = 0; j < aList.size(); j++){ %>
			<%if(mList.get(i).getmNo()==aList.get(j).getmNo()){ %>
			<form action="<%=request.getContextPath() %>/updateAnimal.me" method="get">
			<tr class="A">
				<td><input type="hidden" name="mNo" value="<%=aList.get(j).getmNo() %>"></td>
				<td><img src="<%=request.getContextPath() %>/img/answerImg3.png" width="20px"></td>
				<td>반려동물</td>
				<%if(aList.get(j).getStatus().equals("N")){ %>
				<td colspan="1">
					<input type="text" name="status" class="status" value="[일반]" style="border:none; text-align:center" size="7">
					<input type="hidden" id="<%=aList.get(j).getaNo() %>" value="[일반]">
				</td>
				<%}else{ %>
				<td colspan="1">
					<input type="text" name="status" class="status" value="[장례완료]" style="border:none; text-align:center" size="7">
					<input type="hidden" id="<%=aList.get(j).getaNo() %>" value="[장례완료]">
				</td>
				<%} %>
				<%if(aList.get(j).getaName()==null){ %>
				<td colspan="1"><label>이름 : </label><input type="text"
					name="aName" value="미입력" size="6" class="borderNone"></td>
				<%}else{ %>
				<td><label>이름 : </label><input type="text" name="aName"
					value="<%=aList.get(j).getaName() %>" size="6" class="borderNone"></td>
				<%} %>
				<%if(aList.get(j).getKind().equals("()")){ %>
				<td colspan="1"><label>종 : </label><input type="text"
					name="aKind" value="미입력" size="10" class="borderNone"></td>
				<%}else{ %>
				<td colspan="1"><label>종 : </label><input type="text"
					name="aKind" value="<%=aList.get(j).getKind() %>" size="10" class="borderNone">
				</td>
				<%} %>
				<%if(aList.get(j).getWeight()==null){ %>
				<td colspan="1"><label>체중 : </label><input type="text"
					name="aWeight" class="aWeight" value="미입력" size="5" class="borderNone"> kg
					<input type="hidden" class="aWeight2" value="미입력">
				</td>
				<%}else{ %>
				<td colspan="1"><label>체중 : </label><input type="text"
					name="aWeight" class="aWeight" value="<%=aList.get(j).getWeight() %>" size="5" class="borderNone"> kg
					<input type="hidden" class="<%=aList.get(i).getmNo() %>" value="<%=aList.get(j).getWeight() %>">
				</td>
				<%} %>
				<td>
					<button type="submit" class="memberManageBtns">수정</button>
				</td>
				<td colspan="6"></td>
			</tr>
			</form>
			<%break;}else{ %>
			<%if(j==aList.size()-1){ %>
			<tr class="A">
				<td colspan="14" style="text-align: center">반려동물없음</td>
			</tr>
			<%} %>
			<%}%>
			<%} %>
			<%}%>
			<%} %>
			<%} %>
		</table>
		<br>
		
		<%if(p.getListCount()==0){%>

		<%}else{ %>
		<%if(isSearch.equals("false")) {%>
		<button
			onclick="location.href='<%=request.getContextPath() %>/manageMList.bo?currentPage=<%=1 %>'"
			class="pagingBtns"><<</button>
		&nbsp;
		<button
			onclick="location.href='<%=request.getContextPath() %>/manageMList.bo?currentPage=<%=currentPage-1 %>'"
			class="pagingBtns"><</button>
		<%for(int pg = startPage; pg<=endPage; pg++){ %>
		<%if(pg == currentPage){ %>
		<button class="pagingBtns" disabled><%=pg %></button>
		<%}else{ %>
		<button class="pagingBtns"
			onclick="location.href='<%=request.getContextPath() %>/manageMList.bo?currentPage=<%=pg %>'"
			class="pagingBtns"><%=pg %></button>
		<%} %>
		<%} %>
		<button
			onclick="location.href='<%=request.getContextPath() %>/manageMList.bo?currentPage=<%=currentPage+1 %>'"
			class="pagingBtns">></button>
		&nbsp;
		<button
			onclick="location.href='<%=request.getContextPath() %>/manageMList.bo?currentPage=<%=maxPage %>'"
			class="pagingBtns">>></button>

		<%}else{ %>
		<button
			onclick="location.href='<%=request.getContextPath() %>/manageMList.bo?currentPage=<%=1 %>&content=<%=searchText%>&selectBox=<%=searchKey%>';"
			class="pagingBtns"><<</button>
		&nbsp;
		<button
			onclick="location.href='<%=request.getContextPath() %>/manageMList.bo?currentPage=<%=currentPage-1 %>&content=<%=searchText %>&selectBox=<%=searchKey%>';"
			class="pagingBtns"><</button>
		<%for(int pg = startPage; pg<=endPage; pg++){ %>
		<%if(pg == currentPage){ %>
		<button class="pagingBtns" disabled><%=pg %></button>
		<%}else{ %>
		<button class="pagingBtns"
			onclick="location.href='<%=request.getContextPath() %>/manageMList.bo?currentPage=<%=pg %>&content=<%=searchText %>&selectBox=<%=searchKey%>';"
			class="pagingBtns"><%=pg %></button>
		<%} %>
		<%} %>
		<button
			onclick="location.href='<%=request.getContextPath() %>/manageMList.bo?currentPage=<%=currentPage+1 %>&content=<%=searchText %>&selectBox=<%=searchKey%>';"
			class="pagingBtns">></button>
		&nbsp;
		<button
			onclick="location.href='<%=request.getContextPath() %>/manageMList.bo?currentPage=<%=maxPage %>&scontent=<%=searchText %>&selectBox=<%=searchKey%>';"
			class="pagingBtns">>></button>
		<%}%>
		<%}%>

	<%if(isSearch.equals("true")){ %>
	<br>
	<br>
	<button onclick="location.href='<%=request.getContextPath() %>/manageMList.bo'" id="writeQnaBtn" class="memberManageBtns">전체보기</button>
	<br>
	<br>
	 <%} %>
	<br>
	</div>

	<script>
	//입력 제약조건(잘못되면 원래값으로 돌아가기)
	$('.status').each(function(index, item){ 
		$(item).blur(function(){
			if($(item).val()!='[일반]'&&$(item).val()!='[장례완료]'){
				alert('장례여부 입력 양식 : [일반] / [장례완료]');
				$(item).val($(item).next().val());
			}
		});
	})
	$('.aWeight').each(function(index, item){ 
		$(item).blur(function(){
			var regEx1 = /^[\d]{1,}[.]{0,1}[\d]{1,}$/;
			var regEx2 = /^[\d]{1,}$/;
	    	if(!regEx1.test($(item).val())&&!regEx2.test($(item).val())){
	    		alert('숫자와 .한개로만 입력되어야 합니다.');
	    		$(item).val($(item).next().val());
	    	}
		});
	})

	
		//탈퇴 버튼
		function goodBye(mId){
			var really = confirm('탈퇴처리 하시겠습니까?');
			if(really){
				location.href="<%=request.getContextPath()%>/memberGone.me?mId="+mId;
			}else{
				return;
			}
		}
		
		
		
		// 카테고리 선택해야 조회가능하게
		$('#findBtn').click(function(){
			if($('#selectFind').val()==''||$('#selectFind').val()==null){
				alert('카테고리를 선택해주세요');
				return false;
			}
		})
		
		//카테고리 선택에따른 서치창 변화
		$('#selectFind').change(function(){
			if($('#selectFind').val()!=''&&$('#selectFind').val()!=null){
				$('#searchText').prop('disabled', false).css('background', 'white');
				
				if($('#selectFind').val()=='FindFu'||$('#selectFind').val()=='FindIns'){
					$('#searchText').prop('disabled', true).css('background', 'lightgray');
					$('#completeDate').prop('disabled', false).css('background', 'white');
				}else{
					$('#completeDate').prop('disabled', true).css('background', 'lightgray');
				}
			}else{
				$('#searchText').prop('disabled', true).css('background', 'lightgray');
			}
			
		});
		
		  //체크박스 모두동의
        $("#selectAll").change(function(){
            var bool = $(this).prop('checked');
            if(bool){
                $('input:checkbox').prop('checked',bool).next().css('background-image', "url('<%=request.getContextPath()%>/checkboxImage/innerbeigeOuterblack.png')");
            }else{
                $('input:checkbox').prop('checked',bool).next().css('background-image', "url('<%=request.getContextPath()%>/img/notCheck1.png')");
            }
        });

        //체크박스 모두 동의한 후, 하나라도 해제되면 모두동의항목도 체크 해제
        $('input:checkbox').each(function(index, item){
            $(this).change(function(){
                if($(this).prop('checked')==false){
                    $('#selectAll').next().css('background-image', "url('<%=request.getContextPath()%>/img/notCheck1.png')");
                    $('#selectAll').prop('checked', false);
                }
            });
        });
		
        //보낼 메일 선택시, 라디오버튼이나 직접입력 중 하나만 가능하게
        $('#directMailText').focus(function(){
        	$('input:radio').each(function(index, item, value){
        		$(item).prop('checked', false);
        	})
        })
    	$('input:radio').change(function(){
	        $(this).each(function(index, item, value){
      			if($(item).prop('checked')==true){
					$('#directMailText').val('');       			
      			}
	       	})
     	})
     	
        //메일보내기
        function sendMail(){
        	//먼저 선택된 회원이 있는지 검증위한 변수
        	var isChecked = false;
        	
        	//메일보낼 회원의 이메일을 배열에 담음
        	var users = document.getElementsByName('sendMailUser');
    		var usersEmail = [];
        	$(users).each(function(index, item, value){
        		if($(item).prop('checked')==true){
        			usersEmail.push($(item).val());
        			isChecked = true;
        		}
        	})
			
        	//선택된 회원이 있는지 검증
        	if(isChecked==false){
        		alert('선택한 회원이 없습니다')
        		return;
        	}
        	
        	//보낼 메일텍스트를 선택
        	var sendMailText = '';
        	if($('#directMailText').val()==''){
	        	$('input:radio').each(function(index, item, value){
	        		if($(item).prop('checked')==true){
	        			sendMailText = $(item).val();
	        		}
	        	})
        	}else{
	        	sendMailText = $('#directMailText').val();
        	}
        	
        	//보낼 메일을 선택하지 않으면 리턴
        	if(sendMailText==''){
        		alert('보낼 메일을 선택하셔야 합니다')
        		return;
        	}
        	
        	//경과일을 담을 변수 생성
        	var passDate = <%=sendCompleteDate%>;
        	//서블릿 가기
        	$.ajax({
  				 url:'<%=request.getContextPath()%>/sendManyEmail.me'
  				, type:'post'
  				, traditional : true
  				, data:{usersEmail:usersEmail, sendMailText:sendMailText, passDate:passDate}
  				, success:function(data){
  					alert(data);
  				}
  				, error:function(request, status, error){
           			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
           		}
  			})
        }
	</script>

</body>
</html>