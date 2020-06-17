<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<htmnl lang="ko">
    <head>
        <title>회원정보 찾기</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
        <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
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
            #idPwdSearchSection{
                text-align: center;
                position: relative;
                background-color: white;
            }
            
            /* 버튼류 공통 설정 */
            #idPwdSearchSection button:not([class=changeBtn]){
                border:1px solid #242424;
                background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
                color: #242424;
                padding: 11px;
                border-radius: 3px;
                border:none;
                font-weight: 650;
                width:100px;
            }
            #idPwdSearchSection button:hover{
                background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
                color: #b3a193;
            }
            /* input 텍스트 입력 창 공통설정 */
            #idPwdSearchSection input{
                border-radius: 3px;
                border:2px solid #b3a193;
                height:40px;
                width:200px;
                text-indent: 10px;
            }
            /* 아이디 찾기or 비번찾기 중 하나로 갈 버튼 */
            .changeBtn{
            	border:1px solid #242424;
                background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
                color: #242424;
                padding: 11px;
                border-radius: 3px;
                border:none;
                font-weight: 650;
                width: 120px; 
                height: 50px;
                font-size: 20px;
            }
            /* 인증메일/번호 확인 버튼 */
            .certification{
                width:100px;
                height: 40px;
                font-size: 12px;
            }
            /* 찾기버튼 */
            .searchBtn{
                width:100px;
                font-size: 14px;
            }

            /* ----------서치 공통 상단 -----------*/
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
            #searchTitle1{
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
            #searchTitle2{
                font-family: 'Noto Sans KR', sans-serif;
                margin-top:0px;
                color: black;
                opacity: 0.5;
                font-size: 22px;
                padding-top:40px;
            }

            /* 전체 감싸는영역 */
            .wrap{
                display: flex;
                margin-bottom: 60px;
            }
            .wrap *{
                margin: auto;
            }
            /* 각각의 타이틀 */
            .wrap h3,.wrap h2{
                color:#b3a193;
                margin: 30px;
                margin-top: 40px;
            }

            /* 각 영역의 백그라운드 */
            .searchArea{
                background-color: rgba(24, 24, 24, 0.8);
                border: 5px solid #b3a193;
                width:500px;
                height: 500px;
                margin-top: 30px;
                border-radius: 10px;
            }

            /* 전체 테이블 설정 */
            #idPwdSearchSection table{
                margin-bottom: 20px;
                width: 450px;
            }
            #idPwdSearchSection table td{
                padding:10px;
                color:#b3a193;
                font-weight: 550;
            }
            #idPwdSearchSection table tr td:nth-of-type(1){
            	text-align:left;
            }
            #checkAfter1{display:none;}
            #checkAfter2{display:none;}
			
            /* -----------------footerCSS 시작------------------------ */
            footer{
                background-color: #242424;
            }
            footer p{
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
        </style>
    </head>
    <body>
        <%@include file="../common/menubar.jsp"%>

        <section id="idPwdSearchSection">
             <!-- 서치 공통 상단 -->
             <div id='Backarea'>
                <h1 id="searchTitle1">Find ID/PWD</h1><h3 id="searchTitle2">아이디/비밀번호 찾기</h3>
            </div>
            
            <div id="selectDiv">
               <button type="button" id="searchIdBtn" class="changeBtn" >ID</button>
               <button type="button" id="searchPwdBtn" class="changeBtn" >Password</button>
            </div>

            <!-- 각각의 찾기 영역 -->
            <div class="wrap">
                <div class="searchArea" id="searchId">
                    <h2>아이디 찾기</h2>
                    <form>
                        <table id="idSearchTable" border="0px">
                            <tr>
                                <td>이름</td>
                                <td><input type="text" class="userText" name="userName" placeholder="이름을 입력해주세요"></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>이메일</td>
                                <td><input type="email" class="userText" name="useremail" placeholder="이메일을 입력하세요"></td>
                                <td><button type="button" class="certification" onclick="checkId();">인증메일 받기</button></td>
                            </tr>
                            <tr>
                                <td>인증번호</td>
                                <td><input type="text" class="userText" id="idNumber"></td>
                                <td><button type="button" class="certification" onclick="certificationCheck();">인증번호 확인</button></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td colspan="1"><label id="showCheck"></label></td>
                                <td></td>
                            </tr>
                        </table>
                        <button type="button" class="searchBtn" id="searchBtn1" onclick="showUserId();">찾기</button>
                        <button type="button" class="certification" id="checkAfter1" onClick="window.location.reload()">확인</button>
                    </form>
                </div>
                
                <div class="searchArea" id="searchPwd">
                    <h2>비밀번호 찾기</h2>
                    <form>
                        <table id="pwdSearchTable">
                            <tr>
                                <td>이름</td>
                                <td><input type="text" class="userText" name="userName2" placeholder="이름을 입력해주세요"></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>아이디</td>
                                <td><input type="text" class="userText" name="userId" placeholder="아이디를 입력해주세요"></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>이메일</td>
                                <td><input type="email" class="userText" name="useremail2" placeholder="이메일을 입력하세요"></td>
                                <td><button type="button" class="certification" onclick="checkPwd();">인증메일 받기</button></td>
                            </tr>
                            <tr>
                                <td>인증번호</td>
                                <td><input type="text" class="userText" id="pwdNumber"></td>
                                <td><button type="button" class="certification" onclick="certificationCheck2()">인증번호 확인</button></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td colspan="1"><label id="showCheck2"></label></td>
                                <td></td>
                            </tr>
                        </table>
                        <button type="button" class="searchBtns" id="searchBtn2" onclick="showUserPwd();">찾기</button>
                        <button type="button" class="certification" id="checkAfter2" onClick="window.location.reload()">확인</button>
                    </form>
                    

                </div>
            </div>
            
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

        <script>
            $("#searchPwdBtn").click(function(){
                $("#searchId").css("display","none");
                $("#searchPwd").css("display","block");
            });
            $("#searchIdBtn").click(function(){
                $("#searchId").css("display","block");
                $("#searchPwd").css("display","none");
            });

            // 인증메일 버튼 클릭시
            $("#certification1").click(function(){
                $(".certificationText1").css("opacity","1");
            });
            $("#certification2").click(function(){
                $(".certificationText2").css("opacity","1");
            });
        </script>
        
        <script>
        var gloCheck = 1;
        var checkNumber;

        	// 아이디 찾기시 회원정보 확인
        	function checkId(){
        		var name = $("[name=userName]").val();
        		var email = $("[name=useremail]").val();
        		
        		// 유효한 회원정보인지 확인
        			$.ajax({
        				url:"<%=request.getContextPath()%>/id.me",
        				type:"post",
        				data:{name:name, email:email},
            			success:function(data){
            				if(data==1){
        						alert("회원 정보를 다시 확인해주세요");
        						gloCheck = 0;
        					}else{
        						alert('인증메일이 발송됐습니다')
        						gloCheck = 1;
        					}
            			},
           				error:function(request,status,error){
        	            	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        	            }
        			});
        		

        		// SMTP로 인증번호 이메일 보내기
        		if(gloCheck==1){
        			$.ajax({
        				url:"<%=request.getContextPath()%>/checkEmail.me",
        				type:"post",
        				data:{email:email},
            			success:function(data){
            				console.log(data);
            				checkNumber = data;
            				gloCheck = 2;
            			},
           				error:function(request,status,error){
        	            	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        	            }
        			});
        		}
        	}
        	
        	// 인증 여부 나타내기
        	function certificationCheck(){
        		var check1 = $("#idNumber").val();
        		
        		if(check1==checkNumber){
        			$("#showCheck").text("인증되었습니다.");
        			gloCheck = 3;
        		}else{
        			$("#showCheck").text("인증번호가 틀립니다.");
        		}
        	}
        	
        	// 아이디, 가입일 띄어주기
        	function showUserId(){
        		if($('#showCheck').html()!="인증되었습니다."){
        			alert('인증번호 확인을 해주세요');
        		}
        		if(gloCheck == 3){
        			var name = $("[name=userName]").val();
            		var email = $("[name=useremail]").val();
            		
            		$("#idSearchTable").html("");
    				$("#idSearchTable").prepend("<tr>");
    				$("#idSearchTable").prepend("<td>가입일</td>");
    				$("#idSearchTable").prepend("<td style='text-align:center'"+">아이디</td>");
    				
        			$.ajax({
        				url:"<%=request.getContextPath()%>/id.me",
        				type:"post",
        				data:{name:name, email:email},
            			success:function(data){
       						for(var key in data){
       							var $tr = $("<tr>");
       	    					var $userId = $("<td style='text-align:center'>").text(data[key].mId);
       	    					var $userEnrollDate = $("<td>").text(data[key].enrollDate);
       	    					
       	    					$tr.append($userId);
       	    					$tr.append($userEnrollDate);
       	    					$("#idSearchTable").append($tr);
               				}
       						$("#searchBtn1").css("display","none");
       						$("#checkAfter1").css("display","block");
            			},
           				error:function(request,status,error){
        	            	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        	            }
        			});
        			
        		}
        	}
        	
        </script>
        
        <script>
        var gloCheck2 = 1;
        var checkNumber2;
        
        	// 비밀번호 찾기시 회원정보 확인
        	function checkPwd(){
        		var name = $("#idPwdSearchSection [name=userName2]").val();
        		var userId = $("#idPwdSearchSection [name=userId]").val();
        		var email = $("#idPwdSearchSection [name=useremail2]").val();
        		
        		$.ajax({
    				url:"<%=request.getContextPath()%>/pwd.me",
    				type:"post",
    				data:{name:name, userId:userId, email:email},
        			success:function(data){
        				if(data==1){
        					alert("회원 정보를 다시 확인해주세요");
        					gloCheck2 = 0;
    					}else{
    						alert('인증메일이 발송되었습니다')
    						gloCheck2 = 1;
    					}
        			},
       				error:function(request,status,error){
    	            	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    	            }
    			});
        		
        		// SMTP로 인증번호 이메일 보내기
        		if(gloCheck==1){
        			$.ajax({
        				url:"<%=request.getContextPath()%>/checkEmail.me",
        				type:"post",
        				data:{email:email},
            			success:function(data){
            				console.log(data);
            				checkNumber2 = data;
            				gloCheck2 = 2;
            			},
           				error:function(request,status,error){
        	            	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        	            }
        			});
        		}
        	}
        	
        	// 인증 여부 나타내기
        	function certificationCheck2(){
        		var check1 = $("#idPwdSearchSection #pwdNumber").val();
        		
        		if(check1==checkNumber2){
        			$("#idPwdSearchSection #showCheck2").text("인증되었습니다");
        			gloCheck2 = 3;
        		}else{
        			$("#idPwdSearchSection #showCheck2").text("인증번호가 틀립니다");
        		}
        	}
        	
        	function showUserPwd(){
        		if($('#showCheck2').text()!='인증되었습니다'){
        			alert('인증번호 확인을 해주세요')
        			return;
        		}
        		if(gloCheck2 == 3){
        			var name = $("#idPwdSearchSection [name=userName2]").val();
            		var userId = $("#idPwdSearchSection [name=userId]").val();
            		var email = $("#idPwdSearchSection [name=useremail2]").val();
            		
            		$("#idPwdSearchSection #pwdSearchTable").html("");
    				
        			$.ajax({
        				url:"<%=request.getContextPath()%>/newPwd.me",
        				type:"post",
        				data:{name:name, userId:userId, email:email},
            			success:function(data){
       							var $tr = $("<tr>");
       	    					var $userPwd = $("<td>").text(data);
       	    					
       	    					$tr.append("<td>고객님의 임시 비밀번호는 </td>");
       	    					$tr.append($userPwd);
       	    					$tr.append("<td> 입니다</td>");
       	    					$("#idPwdSearchSection #pwdSearchTable").append($tr);
 
		        				$("#idPwdSearchSection #searchBtn2").css("display","none");
		   						$("#idPwdSearchSection #checkAfter2").css("display","block");
            			},
           				error:function(request,status,error){
        	            	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        	            }
        			});
        		}
        	}
        	
        	
        </script>
    </body>
</htmnl>