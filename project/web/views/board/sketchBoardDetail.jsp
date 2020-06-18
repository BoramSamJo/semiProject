<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.*, java.util.ArrayList, java.sql.Date"%>
<%
	SketchBoard sb = (SketchBoard)request.getAttribute("sb");
	Attachment at = (Attachment)request.getAttribute("at");
	ArrayList<Reply> rList = (ArrayList<Reply>)request.getAttribute("rList");
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
            margin: auto;
            margin-top: 0px;
            font-size: 50px;
            padding-top:140px;
            position: relative; 
            left:20px;
            width: 600px;
            /* background-color: violet; */
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
        #headimg{
            width: 80px;
            height: 80px;
            position: absolute;
            margin-top: 130px;
            margin-left: -380px;
        }
           
            /* ----------테이블 영역---------- */
            /*테이블 정렬*/
            .tableCss1{
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
            .tableCss1, .tableCss2, .tableCss3{
                border-collapse: collapse;
                border-top: 1px solid black;
                border-bottom: 1px solid black;
            }
            /*테이블 내부 내들 가운데 정렬*/
            .tableCss1{
                text-align: center;
            }
            #notiSection #content {
                font-family: 'Noto Sans KR', sans-serif;
                text-align: center;
            }
            
            /* 작성한 컨텐츠 영역 */
            #skContents{
                margin: auto;
                margin-top: 50px;
                margin-bottom: 50px;
                display: flex;
                width: 1050px;
                /* background-color: #d2b9d2; */
            }
            #imgContent{
                margin: auto;
            }
            #imgContent>img{
                border:3px solid #4e3c2e;
            }
            #textContent{
                margin: auto;
                /* background-color: #b3a193; */
            }
            #textContent p{
                margin: auto;
                width: 550px;
            }

            /* ----------댓글영역---------- */
            #readReply{
                margin-bottom: 30px;
            }
            #replyTable{
                width: 1100px;
                margin: auto;
                border-collapse: collapse;
            }
            #replyTable tr{
                height: 50px;
                text-indent: 30px;
            }
            #replyTable tr:nth-of-type(2n) td:nth-of-type(2)
            ,#replyTable tr:nth-of-type(2n) td:nth-of-type(3){
                text-indent: 0px;
                text-align: center;
                width: 80px;
            }
            
            #replyTable tr:nth-of-type(2n+1)
            ,#replyTable tr:nth-of-type(2n+1)
            ,#replyTable tr:nth-of-type(2n){
            	text-align: left !important;
            }
            
            #replyTable button{
                border:none;
                background:none;
                width: 100px;
            }
            #replyTable button:hover{
                text-decoration: underline;
                color: gray;
            }
            #readReply img{
                width: 33px;
                height: 30px;
                position: relative;
                top:8px;
            }
            #readReply tr:nth-of-type(2n){
                height: 30px;
            }
            #readReply tr:nth-of-type(2n) td{
                border-top: 1px solid #242424;
                padding-top: 5px;
            }
            #readReply tr:nth-of-type(2n+1){
                height: 60px;
            }
            #readReply tr:nth-of-type(2n+1) td{
                border-bottom: 1px solid #242424;
            }
            #readReply tr:nth-of-type(1){
                background-color:rgba(24, 24, 24, 0.4);
                background:-webkit-linear-gradient(top, rgba(73, 72, 72, 0.4),rgba(24, 24, 24, 0.4));
                text-indent: 10px;
            }
            #readReply tr:nth-of-type(1) td{
                height: 90px;
            }
            #readReply tr:nth-of-type(1) td span{
                font-size: 20px;
                font-weight: 600;
                position: relative;
                top:-10px;
                /* background-color: #d2c4b9; */
            }
            
            #readReply tr:nth-of-type(1) img{
                width: 50px;
                height: 50px;
                position: relative;
                top:5px;
                margin-right: 10px;
            }

             /* -----------댓글작성 영역 ----------*/
            #writeReply{
                width:1100px;
                margin: auto;
            }
            #writeReply form{
                display: flex;
            }
            #writeReply textarea{
                resize: none;
                border: 5px solid #b3a193;
                height: 100px;
                width:1000px;
                border-radius: 3px;
            }

            /* 댓글 등록버튼 */
            #replySubmit{
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
            #replySubmit:hover{
                background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
                color: #b3a193;
            }

            /* 글 목록 버튼 */
            #list{
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
            #list:hover{
                background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
                color: #b3a193;
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
        </style>
         <!-- 노토산스kr 폰트 가져오기 -->
         <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
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
                <img src="../../img/CS_icon4.png" id=headimg>
                <h1 id="notiTitle1">HEY YUM SKETCH BOOK</h1><h3 id="notiTitle2">혜윰 스케치북</h3>
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
                        <td><%=sb.getMemberNo() %></td>
                        <td><%=sb.getSbTitle() %></td>   <!--colspan하면 위에 작성자 위치가 애매해서 비워둔 테이블-->
                        <td><%=sb.getCreateDate() %></td>   
                        <td><%=sb.getCount() %></td>
                        <td>?</td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            <div id="skContents">
                                <!--강아지 사진-->
                                <%if((sb.getSbNo()) == (at.getSbNo())){ %>
                                <div id="imgContent"><img src= "<%=request.getContextPath() %>/uploadFiles/<%=at.getOriginName() %>" width=400px;></div>
                                <%} %>
                                <!--내용-->
                                <div id="textContent">
                                    <!-- 사용자가 입력한 양식대로 텍스트가 뜨게 하려면 사용자 글작성창에서 script로 처리해야함(엔터를 줄바꿈인식)-->
                                    <p>
                                        <%=sb.getSbContent() %>
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
                        <td colspan="3"><img src="../../img/talk.png">&nbsp;<span>댓글</span></td>
                    </tr>
                    <tr>
                        <td colspan="3"><img src="../../img/user.png">&nbsp;작성자1</td>
                    </tr>
				</table>
				
				<table>
                    <tr>
                        <td><textarea rows="3" cols="30" id="replyContent"></textarea></td>
                        <td><button type="submit" class="updateDeleteBtns">수정</button></td>
                        <td><button type="submit" class="updateDeleteBtns">삭제</button></td>
                    </tr>
                </table>
            </div>
            <!--댓글 작성 시 바로 연동되서 올라가도록 처리해야 됨--> 
            <div id="writeReply">
                <form>
                    <textarea rows="5" cols="160" placeholder="댓글을 남겨보세요"></textarea>
                    <button id="replySubmit">등록</button>
                </form>
            </div>
            <!--글 목록 버튼 클릭 시 화면 전환 필요함-->
            <button id="list">글 목록</button>
            
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
    

        <!------script------>
        <script>
            //목록으로 클릭 시 페이지 전환
            $(function(){
                $("#list").click(function(){
                location.href='sketchBoardList.jsp';
                })
           })
            
            $(function(){
            	$("#replySubmit").click(function(){
            		var content = $("#replyContent").val();
            		
            		$.ajax({
            			url:"<%=request.getContextPath()%>/insertReply.sb",
            			type:"post",
            			data:{content:content,},
            			success:function(data){
            				$replyView = $("#replyView");
            				$replyTable.html(""); // 기존의 댓글 삭제
            				
            				for(var key in data){
            					var $tr = $("<tr>");
            				}
            				
            			},
            			error:function(request,status,error){
                            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                        }
            		})
            	})
            })
           

        </script>
    </body>
    
    </html>