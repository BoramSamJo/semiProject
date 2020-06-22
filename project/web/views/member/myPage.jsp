<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="myPage.model.vo.*, member.model.vo.Member, java.util.ArrayList"%>
<%
	Member m = (Member)request.getAttribute("m");
	ArrayList<Animal> anList = (ArrayList<Animal>)request.getAttribute("aList");
	ArrayList<CalendarViews> rList = (ArrayList<CalendarViews>)request.getAttribute("rList");
	ArrayList<IList> iList = (ArrayList<IList>)request.getAttribute("iList");
%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <title>마이페이지</title>
        <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
        
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

            #myPageSection{
                text-align: center;
                position: relative;
                background-color: white;
            }

            /* 버튼류 공통 설정 */
            #myPageSection button{
                border:1px solid #242424;
                background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
                color: #242424;
            }
            #myPageSection button:hover{
                background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
                color: #b3a193;
            }
            /* input 텍스트 입력 창 공통설정 */
            #myPageSection input{
                border-radius: 3px;
                border:1px solid #b3a193;
                height:25px;
                text-indent: 10px;
            }
             /* < >화면 페이징처리 버튼 공통설정*/
            .pagingBtns{
                border:1px solid #242424;
                padding-bottom: 3px;
                padding-left: 7px;
                padding-right: 7px;
                border-radius: 2px;
            }
            /* 수정하기 버튼 공통설정 */
            #memberFixArea button{
                padding: 5px 10px;
                border-radius: 3px;
                font-weight: 500;
                color:#242424;
                border:none;
            }
            /* 주소찾기 버튼설정 */
            #findAddressBtn{
                background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
                color: #242424;
                border-radius: 3px;
                font-weight: 500;
                border:none;
                padding-right: 17px;
            }
            #findAddressBtn:hover{
                background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
                color: #b3a193;
            }

            /* ----------마이페이지 공통 상단 -----------*/
            #Backarea{
                    width: 100%;
                    height: 320px;
                    background: #d2c4b9;
                    text-align: center;
                    top:0px;
                    margin: 0px;
                    margin-bottom: 30px;
            }
            /* 상단 명(ENG.VER) */
            #myTilte1{
                font-family: 'Noto Sans KR', sans-serif;
                margin: 0px;
                margin: auto;
                margin-top: 0px;
                font-size: 50px;
                padding-top:140px;
                position: relative; 
                width: 600px;
                /* background-color: violet; */
            }
            /* 상단 명(KO.VER) */
            #myTilte2{
                font-family: 'Noto Sans KR', sans-serif;
                margin-top:0px;
                color: black;
                opacity: 0.5;
                font-size: 22px;
                padding-top:40px;
            }

             /* -----------예약/보험 테이블 영역-----------*/
             .TableCSS1 {
                width: 75%;
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
            #reservationCheckArea p, #insCheckArea p{
                font-size: 14px;
            }
            #reservationCheckArea, #insCheckArea{
                margin: auto;
                /* margin-bottom: 70px; */
                padding-top: 10px;
                padding-bottom: 40px;
                width: 76%;
                /* border:5px solid #a39488; */
                border-radius: 10px;
                background-color: white;
            }
            
            #myPageSection hr{
                border:none;
                border-bottom: 1px solid lightgray;
            }

            /* 회원정보 수정 영역 */
            #memberFixTitle{
                margin-top: 50px;
                margin-bottom: 30px;
                color:#685d55;
            }
            #memberFixArea{
                margin: auto;
                margin-bottom: 0px;
                /* margin-top: 50px; */
                padding-top: 30px;
                padding-bottom: 30px;
                width: 800px;
                border:5px solid #b3a193;
                border-radius: 10px;
                background-color: rgba(24, 24, 24, 0.9);
                color:#b3a193;
            }
            #memberFixArea p{
                margin: 0px;
            }
            #memberFixTable{
                margin: auto;
                margin-bottom: 20px;
                font-size: 18px;
                border-collapse: collapse;
                border:none;
                width:700px;
                color:#b3a193;
            }
            #memberFixArea td{
                padding: 15px 25px;
            }
            #memberFixArea tr:nth-of-type(1)
            ,#memberFixArea tr:nth-of-type(2)
            ,#memberFixArea tr:nth-of-type(3)
            ,#memberFixArea tr:nth-of-type(6)
            ,#memberFixArea tr:nth-of-type(7)
            ,#memberFixArea tr:nth-of-type(9)
            ,#memberFixArea tr:nth-of-type(11)
            ,#memberFixArea tr:nth-of-type(13){
               border-bottom: 1px solid #b3a193;
            }
            #memberFixTable td:nth-of-type(1){
                width:130px;
                text-align:left;
                /* background-color: #d2c4b9; */
                /* border-bottom: 1px solid #242424; */
            }
            #memberFixTable td:nth-of-type(2){
               font-size: 16px;
               text-align:left;
            }
            #memberFixTable td:nth-of-type(3){
                width:100px;
                padding:0px;
            }
            /* 각 목록 앞에 스타일 */
            .square{
                display: inline-block;
                width: 10px;
                height: 10px;
                background-color: #b3a193;
                border-radius:3px;
                font-size: 20px;
                /* margin-top: 10px; */
            }
            .fixTdTitle{
                text-align: right;
                padding-right: 0px;
                margin-right: 0px;
                font-size: 14px;
            }
            /* 수정하기 버튼 누르기전 */
            .secretPwd{display: none;}
            .secretEmail{display: none;}
            .certificationshow{display: none; }
            .secretPhone{display: none;}
            .secretMap{display: none;}
            .secretPet{display: none;}
            .hiddenPetInfo{display: none;}
            #changePetInfo2{display:none;}
            .hiddenPetInfo input{width:80px;}
            
            #dropUser{background-color:rgba(24, 24, 24, 0.9)}


            /* -----------------footerCSS 시작------------------------ */
            footer{
                background-color: #242424;
                margin: 0px;
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
                margin-bottom: 0px;
                margin-left: 30px;
                line-height: 30px;
                padding-left: 50px;
            }
            #footerTable a{
                text-decoration: none;
                margin: 0px;
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
            footer p{
                margin: 0px;
            }
            /* 풋터 끝 */
            
        </style>
        <!-- 노토산스kr 폰트 가져오기 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    </head>
    <body>
        <%@include file="../common/menubar.jsp"%>
        <header></header>


        <section id="myPageSection">
             <!-- 마이페이지 공통 상단 -->
             <div id='Backarea'>
                <h1 id="myTilte1">MyPage</h1><h3 id="myTilte2">마이페이지</h3>
            </div>

            <!-- 예약내역 확인 -->
            <!-- 강의 예제처럼 내역이 없으면 예약내역이 없습니다 뜨게 -->
            <div id="reservationCheckArea">
                <h2 style="color:#685d55">예약 내역</h2>
                <p>* 예약 상품에 대한 자세한 정보가 궁금하시다면 1577-0996으로 문의주세요</p>
                <table class="TableCSS1">
                    <tr><th scope="row">번호</th><th scope="row">보호자 성함</th><th scope="row">반려동물 이름</th><th scope="row">예약일</th><th scope="row">예약시간</th></tr>
                   	<%if(rList.isEmpty()){ %>
                   		<td colspan="5">예약 내역이 없습니다.</td>
                   	<%} else{%>
                    	<%for(int i=0; i<rList.size(); i++){ %>
	                    	<tr class="tablehover"><td scope="row"><%=i+1%></td><td><%=m.getmName()%></td>
	                    	<td><%=rList.get(i).getaName()%></td>
	                    	<td><%=rList.get(i).getReservationDate().substring(0,10)%></td><td><%=rList.get(i).getReservationTime()%>시</td></tr>
                		<%} %>
                	<%} %>
                </table><br>
                <button onclick="prevbtn" class="pagingBtns"><</button>
                <button onclick="nextbtn" class="pagingBtns">></button>
            </div>
            <hr style="width: 76%; color:lightgray">
            <!-- 내가 가입한 보험 확인 -->
            <!-- 강의 예제처럼 내역이 없으면 가입내역이 없습니다 뜨게 -->
            <div id="insCheckArea">
                <h2 style="color:#685d55">보험 가입 내역</h2>
                <p>* 보험 상품에 대한 자세한 정보가 궁금하시다면 1577-0996으로 문의주세요</p>
                <table class="TableCSS1">
	                    <tr><th scope="row">번호</th><th scope="row">가입자 성함</th><th scope="row">반려동물 이름</th><th scope="row">가입일</th><th scope="row">가입상품</th></tr>
       		 	<%if(iList.isEmpty()){ %>
               		<td colspan="5">보험 내역이 없습니다.</td>
               	<%} else{%>
	                <%for(int i=0; i<iList.size(); i++){ %>
	                    <tr class="tablehover"><td scope="row"><%=i+1 %></td><td><%=m.getmName() %></td><td><%=anList.get(i).getaName() %></td><td><%=iList.get(i).getEnrollDate().substring(0,10)%></td><td><%=iList.get(i).getInsName() %></td></tr>
                	<%} %> 
                <%} %>
                </table><br>
                <button onclick="prevbtn" class="pagingBtns"><</button>
                <button onclick="nextbtn" class="pagingBtns">></button>
            </div>
            <hr style="width: 76%; color:lightgray">

            <!-- 회원 정보 수정 -->
            <!-- 가입할때 반려동물 정보 입력하는데, 수정란이 없음 -->
            <h2 align="center" id="memberFixTitle">회원정보 수정</h2>
            <div id="memberFixArea">
                <table id="memberFixTable" style="vertical-align:center">
                    <form id="pwdInfo">
                        <tr>
                            <td><span class="square"></span>&nbsp;&nbsp;<label>이름</label></td>
                            <td colspan="3"><label id="userName"><%=m.getmName()%></label></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><span class="square"></span>&nbsp;&nbsp;<label>아이디</label></td>
                            <td colspan="3"><label id="userId"><%=m.getmId()%></label></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><span class="square"></span>&nbsp;&nbsp;<label>비밀번호</label></td>
                            <td colspan="3"></td>
                            <td><button type="button" id="pwdChangeBtn">수정</button></td>
                        </tr>
                        <tr class="secretPwd" style="height:0px;">
                            <td class="fixTdTitle" style="text-align:right">변경할 비밀번호</td>
                            <td colspan="3"><input type="password" name="changePwd1" class="changePwd"></td>
                            <td></td>
                        </tr>
                        <tr class="secretPwd" style="padding:0px;">
                            <td class="fixTdTitle" style="text-align:right">비밀번호 확인</td>
                            <td colspan="3"><input type="password" name="changePwd2" class="changePwd">&nbsp;<p id="checkShow"></p>
                            </td>
                            <td><button type="reset" class="cancel">취소</button>&nbsp;<button type="button" onclick="checkPwd();">변경</button></td>
                        </tr>
                    </form>

                    <form>
                        <tr>
                            <td><span class="square"></span>&nbsp;&nbsp;<label>이메일</label></td>
                            <td colspan="3"><label id="emailShow"><%=m.getEmail()%></label></td>
                            <td><button type="button" id="emailChangeBtn">수정</button></td>
                        </tr>
                        <tr class="secretEmail">
                            <td class="fixTdTitle">변경할 이메일</td>
                            <td colspan="3">
                                <input type="email" name="userEmail" required>
                                &nbsp;
                                <button type="reset" class="cancel">취소</button>
                            </td>
                            <td><button type="button" id="certification" onclick="checkEmail();">인증메일 받기</button></td>
                        </tr>
                        <tr class="certificationshow">
                            <td class="fixTdTitle">인증번호 입력</td>
                            <td colspan="3"><input type="email" name="certificationCheck">
                            <button type="button" onclick="certificationMail();">확인</button><br><br>
                            <p id="resultEmail"></p></td>
                            <td><button type="button" onclick="changeEmail();">변경</button></td>
                        </tr>
                    </form>

                    <form>
                        <tr>
                            <td><span class="square"></span>&nbsp;&nbsp;<label>연락처</label></td>
                            <td colspan="3"><label id="phoneShow"><%=m.getPhone()%></label></td>
                            <td><button type="button" id="phoneChangeBtn">수정</button></td>
                        </tr>
                        <tr class="secretPhone">
                            <td class="fixTdTitle"><label></label></td>
                            <td colspan="3">
                                <input type="text" name="phoneChange">
                                &nbsp;
                                <button type="reset" class="cancel">취소</button>&nbsp;<button type="button" onclick="checkPhone();">변경</button>
                            </td>
                            <td></td>
                        </tr>
                    </form>

                    <form>
                        <tr>
                            <td><span class="square"></span>&nbsp;&nbsp;<label>주소</label></td>
                            <td colspan="3"><label id="addressShow"><%=m.getAddress()%></label></td>
                            <td><button type="button" id="mapChangeBtn">수정</button></td>
                        </tr>
                        <tr class="secretMap">
                            <td class="fixTdTitle"></td>
                            <td colspan="3" style="line-height: 60px;">
                                <input id="zonecode" type="text" style="width:160px;" readonly/>
                                <input id="findAddressBtn" type="button" onClick="openDaumZipAddress();" value = "주소 찾기" /><br>
                                <input type="text" id="address" style="width:160px; margin-bottom: 10px;" readonly/>&nbsp;
                                <input type="text" id="address_etc" style="width:160px;" placeholder="상세주소"><br>
                            </td>
                            <td><button type="reset" class="cancel">취소</button>&nbsp;<button type="button" onclick="checkAddress();">변경</button></td>
                        </tr>
                    </form>
                    <form id="petInfo">
                    	<tr class="petDetailInfo1">
                    		<td><span class="square"></span>&nbsp;&nbsp;<label>반려동물</label></td>
                    		<td>이름</td>
                    		<td>품종</td>
                    		<td>체중</td>
                    		<td><button type="button" id="changePetInfo" onclick="petChangeBtn();" >수정</button></td>
                    	</tr>
                    </form>
                    <form>
                    	<%if(anList.isEmpty()){ %>
                    		<tr class="hiddenPetInfo">
                    			<td><input type="hidden" name="animalNo">
                    			<input type="text" name="changeName"></td>
               	    			<select name="changeKind">
               	    					<option value="강아지">강아지</option>
               	    					<option value="고양이">고양이</option>
               	    					<option value="기타">기타</option>
               	    				</select>
               	    				<input type="text" name="changeDetail">
               	    			
               	    			<input type="text" name="changeWeight">
               	    			<td><button type="button" id="changePetInfo" onclick="petChangeBtn();" style="width:70px;">수정</button></td></td>
                    		</tr>
                    	<%} else{ %>
	                   		<%for(int i=0; i<anList.size(); i++){ %>
	   		                	<tr class="petDetailInfo2">
	           	        			<td></td>
	               	    			<td><%=anList.get(i).getaName()%></td>
	               	    			<td><%=anList.get(i).getKind()%></td>
	               	    			<td><%=anList.get(i).getWeight()+"kg" %></td>
	               	    			<td></td>
	                    		</tr>
	                    		<tr class="hiddenPetInfo">
	                    			<td><input type="hidden" name="animalNo" value="<%=anList.get(i).getaNo()%>"></td>
	                    			<td colspan="3"><input type="text" name="changeName" style="width:75px;" value="<%=anList.get(i).getaName()%>">
	                    			&nbsp;
	               	    			<select name="changeKind" style="width:75px; height:30px; border-radius:3px;">
	               	    					<option value="강아지">강아지</option>
	               	    					<option value="고양이">고양이</option>
	               	    					<option value="기타">기타</option>
               	    				</select>
               	    				<input type="text" name="changeDetail" style="width:75px; height:25px;" value="<%=anList.get(i).getKind()%>">
	               	    			&nbsp;
	               	    			<input type="text" name="changeWeight" style="width:75px; height:25px;" value="<%=anList.get(i).getWeight()%>">
	               	    			</td>
	                    		</tr>
	                   		<%} %>
                   		
	                   	<%} %>
                   		<tr id="changePetInfo2">
                   			<td></td>
                   			<td colspan="3" style="text-align:right;"><button type="reset" class="cancel">취소</button>&nbsp;&nbsp;<button type="button"  onclick="petChangeBtn2();">수정</button>&nbsp;&nbsp;<button type="button" onclick="deleteAnimal();">사망</button></td>
                   			<td>
                   		</tr>
                    </form>
                    <tr>
                    	<td></td>
                    	<td colspan="3" ></td>
                    	<td></td>
                    </tr>
                    <tr>
                    	<td></td>
                    	<td colspan="3" style="text-align:center;"><button type="button" onclick="goHome();" style="padding:10px 20px; margin-left:-50px;">홈으로</button></td>
                    	<td style="text-align:center;"><button type="button" id="dropUser" onclick="deleteUser();" style="background:#242424; color:#b3a193">회원탈퇴</button></td>
                    	
                    </tr>
                </table>
            </div>
            <br>
            <br>
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
    </body>
    <script>
        // 비밀번호 수정하기 버튼 클릭
        $(function(){
            $("#pwdChangeBtn").click(function(){
                $(".secretPwd").css({"display":"table-row"});
                // console.log("버튼누름");
            });
        });

        // 이메일 수정하기버튼 클릭
        $(function(){
            $("#emailChangeBtn").click(function(){
                $(".secretEmail").css({"display":"table-row"});
            });
            $("#certification").click(function(){
                $(".certificationshow").css({"display":"table-row"});
            });
        });

        // 연락처 수정하기버튼 클릭
        $(function(){
            $("#phoneChangeBtn").click(function(){
                $(".secretPhone").css({"display":"table-row"});
            });
        });

        // 주소 수정하기버튼 클릭
        $(function(){
            $("#mapChangeBtn").click(function(){
                $(".secretMap").css({"display":"table-row"});
            });
        });

        // 취소버튼
        $(function(){
            $(".cancel").click(function(){
                $(".secretPwd").css({"display":"none"});
                $(".secretEmail").css({"display":"none"});
                $(".secretPhone").css({"display":"none"});
                $(".secretMap").css({"display":"none"});
                $(".certificationshow").css({"display":"none"});
                $(".hiddenPetInfo").css("display","none");
                $("#changePetInfo2").css("display","none");
            });
        });

    </script>

    <!-- 다음 주소찾기 API -->
    <script type="text/javascript">
        function openDaumZipAddress() {
            new daum.Postcode({
                oncomplete:function(data) {
                    jQuery("#postcode1").val(data.postcode1);
                    jQuery("#postcode2").val(data.postcode2);
                    jQuery("#zonecode").val(data.zonecode);
                    jQuery("#address").val(data.address);
                    jQuery("#address_etc").focus();
                    console.log(data);
                }
            }).open();
        }
    </script>
    
    <!-- 변경할 데이터 체크 -->
    <script>
    	// 비밀번호 변경
    	function checkPwd(){
    		var userId="<%=m.getmId()%>"
    		var pwd1 = $("[name=changePwd1]").val();
    		var pwd2 = $("[name=changePwd2]").val();
    		
    		if(pwd1==pwd2){
    			$.ajax({
    				url:"<%=request.getContextPath()%>/pwd.ch",
    				type:"post",
    				data:{userId:userId, pwd:pwd1},
	    			success:function(data){
	    				if(data=="permit"){
	    					alert("비밀번호가 변경되었습니다.");
	    					$("[name=changePwd1]").text("");
	    					$("[name=changePwd2]").text("");
						}else{
							alert("비밀번호 변경이 실패하였습니다.");
						}
	    	            $(".secretPwd").css({"display":"none"});
	    			},
	   				error:function(request,status,error){
		            	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		            }
    			});
    		}else{
    			alert("비밀번호를 다시 확인해주세요.");
    		}
    	}

    	// 연락처 변경
    	function checkPhone(){
    		var userId="<%=m.getmId()%>"
    		var phone=$("[name=phoneChange]").val();
    		
    		$.ajax({
				url:"<%=request.getContextPath()%>/phone.ch",
				type:"post",
				data:{userId:userId, phone:phone},
    			success:function(data){
    				$("#phoneShow").text("");
    				$("#phoneShow").text(data);
    	            $(".secretPhone").css({"display":"none"});
    			},
   				error:function(request,status,error){
	            	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	            }
			});
    	}
    	
    	// 주소 변경
    	function checkAddress(){
    		var userId="<%=m.getmId()%>"
    		var zoneCode = $("#zonecode").val();
    		var address = $("#address").val();
    		var address2 = $("#address_etc").val();
    		
    		$.ajax({
				url:"<%=request.getContextPath()%>/address.ch",
				type:"post",
				data:{userId:userId, zoneCode:zoneCode, address:address, address2:address2},
    			success:function(data){
    				$("#addressShow").text("");
    				$("#addressShow").text(data);
    	            $(".secretMap").css({"display":"none"});
    			},
   				error:function(request,status,error){
	            	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	            }
			});
    	}
    	
    	function canclePetInsert(){
    		$(".secretPet").css("display","none");
    		$("#petInsertBtn").css("display","table-row");
    		$(".petDetailInfo").css("display","table-row");
    		$("#changePetInfo").css("display","table-row");
    	}

    	function petChangeBtn(){
    		$(".hiddenPetInfo").css("display","table-row");
    		$("#changePetInfo2").css("display","table-row");
    		
    	}
    	
    	// 반려동물 정보 추가/변경
    	function petChangeBtn2(){
    		var userNo = <%=m.getmNo()%>;
    		var animalNo = $("[name=animalNo]").val();
    		var name = $("[name=changeName]").val();
    		var kind = $("[name=changeKind]").val();
    		var detail = $("[name=changeDetail]").val();
    		var weight = $("[name=changeWeight]").val();
	    		
    		$.ajax({
				url:"<%=request.getContextPath()%>/change.an",
				type:"post",
				data:{userNo:userNo,animalNo:animalNo, name:name, kind:kind, detail:detail, weight:weight},
    			success:function(data){
					$(".petDetailInfo2").html("");
    				
    				for(var key in data){
    					var $tr = $("<tr>");
    					var $name = $("<td>").text(data[key].aName);
    					var $kind = $("<td>").text(data[key].kind)
    					var $weight = $("<td>").text(data[key].weight)
    					
    					$(".petDetailInfo2").append("<td>");
    					$(".petDetailInfo2").append($name);
    					$(".petDetailInfo2").append($kind);
    					$(".petDetailInfo2").append($weight);
    				}
    	            $("#changePetInfo2").css({"display":"none"});
    	            $(".hiddenPetInfo").css({"display":"none"});
    			},
   				error:function(request,status,error){
	            	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	            }
			});
    	}
    	
    	// 반려동물 사망
    	function deleteAnimal(){
    		var userNo = <%=m.getmNo()%>;
    		var animalNo = $("[name=animalNo]").val();
    		
    		$.ajax({
				url:"<%=request.getContextPath()%>/del.an",
				type:"post",
				data:{animalNo:animalNo, userNo:userNo},
    			success:function(data){
					$(".petDetailInfo2").html("");
    				
    				for(var key in data){
    					var $tr = $("<tr>");
    					var $name = $("<td>").text(data[key].aName);
    					var $kind = $("<td>").text(data[key].kind)
    					var $weight = $("<td>").text(data[key].weight+"kg")
    					
    					$tr.append("<td>");
    					$tr.append($name);
    					$tr.append($kind);
    					$tr.append($weight);
    					$("#memberFixTable").append($tr);
    				}
    	            $("#changePetInfo2").css({"display":"none"});
    	            $(".hiddenPetInfo").css({"display":"none"});
    			},
   				error:function(request,status,error){
	            	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	            }
			});
    	}
    	
    </script>
    
    
    
    <!-- 사용자 입력 제약조건 -->
    <script>
    	$("#petWeight").keyup(function(evnet){
    		var input = $(this).val();
    		$(this).val(input.replace(/[^0-9/g]/,''));
    	});
    </script>
     <!-- 동적제어 시작(script 영역) -->
    <!-- 1. 회원가입 필수 입력란 관련 기능(정규표현식, 비밀번호 일치확인, 아이디와 비밀번호 중복여부 확인) -->
    <script>
        $(function(){
            var styleFalse = {'color': 'red', 'font-size':'11px'};
            var styleTrue = {'color': '#b3a193', 'font-size':'11px'};

            //비밀번호 정규표현식 및 확인, 한글자씩 검증, change시 강제 검증
            $('[name=changePwd1]').change(function(){
                var regEx = /^([^^&])\w[^^&]{5,16}$/;
                if(!regEx.test($(this).val())){
                    $('#checkShow').html('7~16자의 영문자, 숫자, 특수문자(^, &제외)를 사용').css(styleFalse)
                    $(this).prop('value', '').focus();
                }else{
                    $('#resultPwd1').html('비밀번호로 사용 가능합니다.').css(styleTrue)
                }
            }).keyup(function(){
                if($(this).val()!=$('[name=changePwd2]').val()&&$('[name=changePwd2]').val()!=''){
                    $('#checkShow').html('비밀번호가 일치하지 않습니다.').css(styleFalse)
                }
                if($(this).val()==$('[name=changePwd2]').val()&&$('[name=changePwd2]').val()!=''){
                    $('#checkShow').html('비밀번호가 일치합니다.').css(styleTrue)
                }
            });

            $('[name=changePwd2]').change(function(){
                if($(this).val()!=$('[name=changePwd1]').val()){
                    $('#checkShow').html('비밀번호가 일치하지 않습니다').css(styleFalse)
                    $('[name=changePwd2]').prop('value', '').focus();
                }else{
                    $('#checkShow').html('비밀번호가 일치합니다.').css(styleTrue)
                }
            }).keyup(function(){
                if($(this).val()==$('[name=changePwd1]').val()&&$('[name=changePwd2]').val()!=''){
                    $('#checkShow').html('비밀번호가 일치합니다.').css(styleTrue)
                }
                if($(this).val()!=$('[name=changePwd1]').val()&&$(this).val()!=''){
                    $('#checkShow').html('비밀번호가 일치하지 않습니다.').css(styleFalse);
                }
            });
                       
            // 아이디와 비밀번호 중복여부 확인, 알림창으로, change시 강제 검증
            $('[name=changePwd1]').change(function(){
                if($(this).val() == <%=m.getmId()%>&&$('[name=changePwd1]').val()!=''){
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
            $('[name=userEmail]').change(function(){
                // var regEx = /^[\S]{1,}@[\S]{1,}$/;//드롭다운 활용하므로 안씀
                var regEx = /^[\S]{1,}@[\S]{1,}$/;
                if(!regEx.test($(this).val())||$(this).val()==''){
                    $('#resultEmail').html('<abbr class="RegExplainHover" title="공백이거나 공백이 들어갔는지 확인해보세요">이메일 입력 안될때</abbr>').css(styleFalse)
                    $(this).prop('value', '').focus();
                }else{
                    $('#resultEmail').prop('value', '');
                }
            })
            $('[name=userEmail]').blur(function(){
                if($('[name=userEmail]').val()==''){
                    $(this).prop('value', '').focus();
                    $('#resultEmail').html('메일 아이디를 입력해주세요').css('font-size', '10px').css(styleFalse);
                }else{
                    $('#resultEmail').prop('value', '');
                }
                if($('[name=userEmail]').val()!=''
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
                    $(this).focus();
                }
                if($('#siteName').children('option:selected').val() != 'choice'
                    &&$('#siteName').children('option:selected').val() != 'direct'
                    &&$('#email').val()!=''){
                        alert('asdf');
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
        })
    </script>
    
    <script>
    	// 회원탈퇴
    	function deleteUser(){
    		var userNo = <%=m.getmNo()%>
    		$.ajax({
				url:"<%=request.getContextPath()%>/del.me",
				type:"post",
				data:{userNo:userNo},
    			success:function(data){
					alert("회원 탈퇴를 성공하였습니다.");
					location.href = "<%=request.getContextPath()%>/index.jsp";
    			},
   				error:function(request,status,error){
	            	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	            }
			});
    	}
    </script>
    
    <script>
    var gloCheck;
    var checkAfter;
    	function checkEmail(){
    		var email = $("[name=userEmail]").val();
    		$.ajax({
				url:"<%=request.getContextPath()%>/checkEmail.me",
				type:"post",
				data:{email:email},
    			success:function(data){
    				console.log(data);
    				checkAfter = data;
    				gloCheck = 1;
    			},
   				error:function(request,status,error){
	            	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	            }
			});
    	}
    	
    	function certificationMail(){
    		if(checkAfter==$("[name=certificationCheck]").val()){
    			$("#resultEmail").text("인증번호가 확인되었습니다.");
    			gloCheck = 2
    		}else{
    			$("#resultEmail").text("인증번호가 틀립니다.");
    		}
    	}
    	
    	// 이메일 변경
    	function changeEmail(){
    		<%-- var userId = <%=request.getSession().getAttribute("userId")%>; --%>
    		var userId="asdf";
    		var email = $("[name=userEmail]").val();
    		if(gloCheck==2){
    			$.ajax({
    				url:"<%=request.getContextPath()%>/email.ch",
    				type:"post",
    				data:{userId:userId, email:email},
        			success:function(data){
        				$("#emailShow").text("");
        				$("#emailShow").text(data);
        				$(".secretEmail").css("display","none");
        				$(".certificationshow").css("display","none");
        			},
       				error:function(request,status,error){
    	            	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    	            }
    			});
    		}else{
    			alert("이메일변경 실패");
    		}
    	}
    	function goHome(){
    		location.href="<%=request.getContextPath()%>/index.jsp";
    	}
    </script>
</html>