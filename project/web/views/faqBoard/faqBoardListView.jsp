<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="faqBoard.model.vo.*,java.util.ArrayList"%>
    
 	<%faqBoard fb = (faqBoard)request.getAttribute("faqBoard"); %> 
    
     <%
     fPagenation fpn = (fPagenation)request.getAttribute("fpn");
     ArrayList list = (ArrayList)request.getAttribute("list");
     

   		
    /* 페이징처리를 위한 변수 선언 (pn객체)*/
    int listCount = fpn.getListCount();
    int currentPage = fpn.getCurrentPage();
    int maxPage =fpn.getMaxPage();
    int startPage = fpn.getStartPage();
	int endPage = fpn.getEndPage(); 
	int pageBlock =fpn.getPageBlock();
	int pageCount=fpn.getPageCount();

    %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src = "http://code.jquery.com/jquery-latest.min.js"></script>
	<style>
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
            background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
            color: #242424;
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
            border-right: 1px solid black;
        }
        #headline span:nth-of-type(3){
            border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;
            border-left: 1px solid black;
        }
        #headline span:nth-of-type(2){
            background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
            color: #b3a193;
        }
        #headline span:hover{
            background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
            color: #b3a193;
        }

        /* -----------FAQ카테고리 영역----------- */
        #FAQCategory{
            position: relative;
            top:400px;
        }
        #FAQCategory span{
            font-family: 'Noto Sans KR', sans-serif;
            display:inline-block;
            background: rgb(245,245,245);
            width: 223px;
            height: 120px;
            text-align: center;
            line-height: 180px;
        }
        #FAQcategory span:nth-of-type(1){
            border: 2px solid black;
        }
        #FAQCategory span:hover{
            border: 2px solid black;
            font-weight: bold;
        }
        #FAQCategory span img:nth-of-type(1){
            width: 40px;
            height: 40px;
            margin-left: 1%;
            margin-top: 2%; 
            text-align:center;
        }

         /* ----------검색창 영역------------*/
         #searchArea{
             position: relative;
             top:380px;
             left:-230px;
             z-index: 100;
         }
         #notiSection input[type=text]{
            /* position: absolute;
            top:0px;
            left:200px; */
            border: none;
            border-bottom: 2px solid black;
            width: 40%;
            outline: none;
        }
        #notiSection button[type=button]{
            /* position: absolute;
            top:690px;
            left:830px; */
            width: 55px;
            height: 30px;
            border-radius: 4px;
            border:none;
            background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
            color: #242424;
        }
        #notiSection button[type=button]:hover{
            background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
            color: #b3a193;
        }
        /* Customer service 번호 적어놓은 네모 영역 */
        #customerBox{
            position: absolute;
            top:550px;
            left:900px;
            border-radius: 18px;
            padding-left: 3%;
            background: rgb(245,245, 245);
            width: 24%;
            height: 200px;
        }
        #customerBox{
            font-family: 'Noto Sans KR', sans-serif;
            text-align:left;
            font-size: 18px;
            font-weight: bold;
        }
        #notiSection p:nth-of-type(2){
            font-family: 'Noto Sans KR', sans-serif;
            text-align:left;
            font-size: 28px;
            font-weight: bold;
            color: #d2c4b9;
        }
        #notiSection p:nth-of-type(3){
            font-family: 'Noto Sans KR', sans-serif;
            text-align:left;
            font-size: 13px;
            color: lightgray;
        }
            
       
         /* -----------테이블 영역-----------*/
        .TableCSS2 {
            position: relative;
            top:400px;
            font-family: 'Noto Sans KR', sans-serif;
            table-layout:fixed;
            width: 79%;
            margin: auto;
            border-collapse: collapse;
            line-height: 1.5;
            border-top: 3px solid black;
            border-bottom: 1px solid black;
            text-align: left;
            margin-top: 30px;
        }

        .TableCSS2 td {
            font-family: 'Noto Sans KR', sans-serif;
            height: 40px;
            line-height: 3;
            width: 25%;
            vertical-align: center;
            border-bottom: 1px solid black;
        }
        .TableCSS2 td:nth-of-type(1) {
            /* background:-webkit-linear-gradient(top, #e2d5ca,#d2c4b9); */
            background-color: #d2c4b9;
            border-right: 1px solid gray;
            width:20%;
            text-align: center;
        }
        .TableCSS2 td:nth-of-type(2) {
            padding: 5px 20px;
        }
        .TableCSS2 tr:hover{
            background: rgb(228, 227, 227);
        }
        /* 클릭 시 slide효과 위해 */
        .Answer{
            display: none;
        }
        .second{
            width: 100%;
            white-space: nowrap;
        }

        /* 반응형 */
        @media only screen and (max-width: 1200px){
                #headline{
                    display: none;
                }
                #notiSection input[type=search]{
                    display: none;
                }
                #notiSection button[type=submit]{
                    display: none;
                }
                #notiSection div:nth-of-type(2){
                    position: absolute;
                    top:360px;
                    left:0px;
                    float: none;
                    width: 75%;
                    height: 200px;
                    margin-left: 10%;
                    margin-top: 0%;
                    margin-bottom:20%;
                }
                
                .TableCSS2 {
                    position: relative;
                    top:200px;
                }
                #FAQCategory span{
                   margin-top:5%;
                    width:110px;
                }
                #FAQCategory{
                    position: relative;
                    top:200px;
                }
                footer{
                    margin:0px;
                }
            }
            /* -----------------footerCSS 시작------------------------ */
            footer{
                background-color: #242424;
                margin-top: 500px;
            }
            footer p{
                margin:0px;
            }
            /* 풋터 콘텐츠 설정 */
            #footerTable{
                width: 1000px;
                margin-left: 30px;
                color:white;
                margin-top:200px;
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
	</style>
	 <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	
</head>
<body>
	<!--header시작-->
        <header></header>

        <!--section시작-->
        <section id="notiSection">
        <%-- <%=fpn %>
        <%=list %> --%>
            <div id='Backarea'>
                <img id="titleIcon" src="img/CS_icon4.png">
                <h1 id="notiTitle1">HYE YUM CS CENTER</h1><h3 id="notiTitle2">혜윰 고객센터</h3>
            </div>
            <form  id="searchformtest"  name="searchform" method="get" action="<%=request.getContextPath()%>/search.fbo">
                <div id = 'headline'><span onclick="location.href='CS_NotiMain.html';">공지사항</span><span onclick="location.href='CS_FAQ.html';">FAQ</span><span  onclick="location.href='CS_QnA.html';" >QnA</span></div>
                <div id="searchArea">
                    <input type='text'name="word" placeholder="SEARCH">&nbsp;
                    <button type="button" onclick="searchtest123();">검색</button>
                </div>
            </form>
            <div id="customerBox">
            <!--자주묻는질문 영역-->
                <p>Customer Center</p>
                <p>080-007-7378</p>
                <p>토요일,일요일 및 공휴일은 휴무입니다.<br>
                    평일 09:00am - 05:00pm/점심 12:20pm-01:20pm
                </p>
            </div><br><br><br>

            <!--자주묻는 질문 카테고리-->
            <form id='imgtest'>
                <div id='FAQCategory'>
                	 <span id="cate0" onclick="cate0test();"><img src="img/test.png">전체</span> 
                    <span id="cate1" onclick="cate1test();"><img src="img/reservation.png">예약문의</span>
                    <span id="cate2" onclick="cate2test();"><img src="img/price.png">가격문의</span>
                    <span id="cate3" onclick="cate3test();"><img src="img/service.png">보험/장례</span>
                    <span id="cate4" onclick="cate4test();"><img src="img/etc-removebg-preview.png">기타문의</span>
                </div>
            </form> 
            <div>
           
            	<!-- FAQ테이블 -->
                <table class="TableCSS2" id="FAQTable" cellspacing="0" cellpadding="0" border="0" >
                	<%if(list.isEmpty()){ %>
                		<tr>
                			<td>조회된 리스트가 없습니다.</td>
                		</tr>
                	<%}else{ %>
                		<%for(int i=0; i<list.size();i++) {%>
                    <tr onclick="Question(0);" class="off" >
                     	<input type="hidden" value="<%=((faqBoard)list.get(i)).getFno() %>" name="fno" id="fnotest1"><!-- 넘길 FAQ글 번호 -->  
                     	<input type="hidden" value="<%=((faqBoard)list.get(i)).getCno() %>" name="cno" id="cnotest"><!-- 넘길 카테고리  번호 -->             
                        <td class='init'>Q</td>       
                        <td class="second"><%=((faqBoard)list.get(i)).getfTitle() %></td><!-- 제목 -->
                       
                        
                        <td></td>   
                        <%--  <input type = "hidden" value="<%=((faqBoard)list.get(i)).getfTitle() %>" name="ftitle"><!-- 넘길 제목 -->
                        <input type = "hidden" value="<%=((faqBoard)list.get(i)).getfContent() %>" name="fcontent"><!--넘길 내용 --> --%>
                        
                       	<td><button id ="updatetest123">수정하기</button></td>
                        <td><input type="submit" value="삭제하기" id="deletetest123"></td> 
                    </tr>
                    <tr class="Answer">
                        <td>A</td>
                        <td colspan="4" id="testcontent"><%=((faqBoard)list.get(i)).getfContent() %> </td><!-- 내용 -->
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <%} %>
                    <%} %>
                       
                 </table>
                 <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                 
   
             <!-- 페이징 처리 -->
             
             <!-- 이전 페이지 -->
            <button onclick = "location.href='<%=request.getContextPath() %>/list.fbo?currentPage=<%=endPage-1 %>'"> < </button>
            <!-- 페이지 목록 -->
           <%for(int p=startPage; p<=endPage; p++) {%>
           		<%if (p==currentPage) {%>
            	<button disabled><%=p %></button>
            	<%}else{ %>
            	<button onclick= "location.href='<%=request.getContextPath() %>/list.fbo?currentPage=<%=p %>'"><%=p %></button>
            	<%} %>
            <%} %> 
           
            <!-- 다음 페이지 -->
            <button onclick = "location.href='<%=request.getContextPath() %>/list.fbo?currentPage=<%=startPage+1 %>'"> > </button><br><br>
            
            <!-- 글 작성하기 insert 관리자만 가능하도록 나중에 추가 -->     
            <button id="insertBtn"onclick="location.href='views/faqBoard/faqBoardInsertForm.jsp'">작성하기</button>
            </div>
           
        </section>

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
       //삭제하기
       $(function(){
			$("#deletetest123").click(function(){
				var bool = confirm("게시글을 삭제하시겠습니까?");
				var fno = $("#fnotest1").val();
				var cno = $("#cnotest").val();
				
				if(bool){
				location.href="<%=request.getContextPath()%>/delete.fbo?fno=" + fno; 
				alert("게시글이 삭제되었습니다.");
				}
			})
		})    
       </script>
       
       <script>
            // FAQ 클릭 시 사라졌다 보이기
            $(function(){
                $(".off").click(function(){
                    if($(this).next().css('display')=='none'){
                        $(this).next().slideDown();
                        $(".Answer").css("background","rgb(245,245,245)");
                    }else{
                        $(this).next().slideUp();
                    }
                })
            })

            //수정
          <%--   function updatetest123(){
            	var bool = confirm("게시글을 수정하시겠습니까?");
            	
            	if(bool){
            		$("#deletetest").submit();
         			$("#deletetest").attr("action","<%=request.getContextPath()%>/update.fbo");
            		alert("게시글이 수정 되었습니다.");
            	}
            } --%>
            
            //검색
            function searchtest123(){
            	$("#searchformtest").submit();
            }

        </script>
        
        <!-- --------------------카테고리 페이지 전환--------------------- -->
        <script>
        //카테고리로 페이지 전환
         function cate0test(){
        	 var cate = $("#cate0").text();
        	 console.log(cate);

        	 
        	 $.ajax({
        		 	url:"<%=request.getContextPath()%>/cate.fbo",
        			type:"post",
        			data:{cate:cate},
        			success:function(data){
        				
        				 $listTable = $("#FAQTable");
        				 $listTable.html(""); //기존 글 삭제  */
        					
        				for(var key in data){
        					
        					var $tr1 = $("<tr>"); 
        					var $tr2 = $("<tr>"); 
        					var $td = $("<td>");
        					var $td1=$("<td>").text("Q");
        					var $td2=$("<td>").text("A");
        					
        					var $ftitletd = $("<td>").text(data[key].fTitle);
        					var $fcontenttd = $("<td>").text(data[key].fContent); 

        				 	$tr1.append($td1);
        					$tr1.append($ftitletd);
        					$tr1.append($td);
        					$tr1.append($td);
        					$tr1.append($td);
  
        					
        					$tr2.append($td2);
        					$tr2.append($fcontenttd);
        					$tr2.append($td);
        					$tr2.append($td);
        					$tr2.append($td); 

        					$listTable.append($tr1);
        					$listTable.append($tr2); 
        					
        					
        					
        				}
        				
        			},
        			error:function(data){
        				alert("실패");			
        			}
        	 })
        }
        function cate1test(){
        	 var cate = $("#cate1").text();
        	 console.log(cate);

        	 
        	 $.ajax({
        		 	url:"<%=request.getContextPath()%>/cate.fbo",
        			type:"post",
        			data:{cate:cate},
        			success:function(data){
        				
        				 $listTable = $("#FAQTable");
        				 $listTable.html(""); //기존 글 삭제  */
        					
        				for(var key in data){
        					
        					var $tr1 = $("<tr>"); 
        					var $tr2 = $("<tr>"); 
        					/* var $td = $("<td>").click(funcion(){
        						$fcontenttd.slideDown();
        					}else{
        						$fcontenttd.slideUp();
        					}); */
        					var $td = $("<td>");
        				
        					var $td1=$("<td>").text("Q");
        					var $td2=$("<td>").text("A");
        					
        					
        					var $ftitletd = $("<td>").text(data[key].fTitle);
        					var $fcontenttd = $("<td>").text(data[key].fContent); 

        				 	$tr1.append($td1);
        					$tr1.append($ftitletd);
        					$tr1.append($td);
        					$tr1.append($td);
        					$tr1.append($td);
        	

        					$tr2.append($td2);
        					$tr2.append($fcontenttd);
        					$tr2.append($td);
        					$tr2.append($td);
        					$tr2.append($td); 

        					$listTable.append($tr1);
        					$listTable.append($tr2); 
        					
        					
        				}
        				
        			},
        			error:function(data){
        				alert("실패");			
        			}
        	 })
        }
        function cate2test(){
       	 var cate = $("#cate2").text();
       	 console.log(cate);

       	 
       	 $.ajax({
       		 	url:"<%=request.getContextPath()%>/cate.fbo",
       			type:"post",
       			data:{cate:cate},
       			success:function(data){
       				
       				 $listTable = $("#FAQTable");
       				 $listTable.html(""); //기존 글 삭제  */
       					
       				for(var key in data){
       					
       					var $tr1 = $("<tr>"); 
       					var $tr2 = $("<tr>"); 
       					var $td = $("<td>");
       					var $td1=$("<td>").text("Q");
       					var $td2=$("<td>").text("A");
       					
       					var $ftitletd = $("<td>").text(data[key].fTitle);
       					var $fcontenttd = $("<td>").text(data[key].fContent); 

       				 	$tr1.append($td1);
       					$tr1.append($ftitletd);
       					$tr1.append($td);
       					$tr1.append($td);
       					$tr1.append($td);
 
       					
       					$tr2.append($td2);
       					$tr2.append($fcontenttd);
       					$tr2.append($td);
       					$tr2.append($td);
       					$tr2.append($td); 

       					$listTable.append($tr1);
       					$listTable.append($tr2); 
       					
       					
       				}
       				
       			},
       			error:function(data){
       				alert("실패");			
       			}
       	 })
       }

        
        function cate3test(){
          	 var cate = $("#cate3").text();
          	 console.log(cate);

          	 
          	 $.ajax({
          		 	url:"<%=request.getContextPath()%>/cate.fbo",
          			type:"post",
          			data:{cate:cate},
          			success:function(data){
          				
          				 $listTable = $("#FAQTable");
          				 $listTable.html(""); //기존 글 삭제  */
          					
          				for(var key in data){
          					
          					var $tr1 = $("<tr>"); 
          					var $tr2 = $("<tr>"); 
          					var $td = $("<td>");
          					var $td1=$("<td>").text("Q");
          					var $td2=$("<td>").text("A");
          					
          					var $ftitletd = $("<td>").text(data[key].fTitle);
          					var $fcontenttd = $("<td>").text(data[key].fContent); 

          				 	$tr1.append($td1);
          					$tr1.append($ftitletd);
          					$tr1.append($td);
          					$tr1.append($td);
          					$tr1.append($td);
    
          					
          					$tr2.append($td2);
          					$tr2.append($fcontenttd);
          					$tr2.append($td);
          					$tr2.append($td);
          					$tr2.append($td); 

          					$listTable.append($tr1);
          					$listTable.append($tr2); 
          					
          					
          				}
          				
          			},
          			error:function(data){
          				alert("실패");			
          			}
          	 })
          }
        function cate4test(){
         	 var cate = $("#cate4").text();
         	 console.log(cate);

         	 
         	 $.ajax({
         		 	url:"<%=request.getContextPath()%>/cate.fbo",
         			type:"post",
         			data:{cate:cate},
         			success:function(data){
         				
         				 $listTable = $("#FAQTable");
         				 $listTable.html(""); //기존 글 삭제  */
         					
         				for(var key in data){
         					
         					var $tr1 = $("<tr>"); 
         					var $tr2 = $("<tr>"); 
         					var $td = $("<td>");
         					var $td1=$("<td>").text("Q");
         					var $td2=$("<td>").text("A");
         					
         					var $ftitletd = $("<td>").text(data[key].fTitle);
         					var $fcontenttd = $("<td>").text(data[key].fContent); 

         				 	$tr1.append($td1);
         					$tr1.append($ftitletd);
         					$tr1.append($td);
         					$tr1.append($td);
         					$tr1.append($td);
   
         					
         					$tr2.append($td2);
         					$tr2.append($fcontenttd);
         					$tr2.append($td);
         					$tr2.append($td);
         					$tr2.append($td); 

         					$listTable.append($tr1);
         					$listTable.append($tr2); 
         					
         					
         				}
         				
         			},
         			error:function(data){
         				alert("실패");			
         			}
         	 })
         }


       
        </script>
</body>
</html>
