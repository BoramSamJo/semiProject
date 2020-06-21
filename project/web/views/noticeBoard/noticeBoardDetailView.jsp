<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="noticeBoard.model.vo.noticeBoard"%>
    
     <%noticeBoard nb1 = (noticeBoard)request.getAttribute("notiBoard");%>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        #headimg{
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
            background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
            color: #b3a193;
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
            background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
            color: #242424;
        }
        #headline span:hover{
            background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
            color: #b3a193;
        }

            /* -----------테이블 영역---------- */
            .TableCSS1 {
                width: 75%;
                margin: auto;
                margin-top: 250px;
                border-collapse: collapse;
                text-align: center;
                line-height: 1.5;
                border-top: 3px solid black;
                border-bottom: 1px solid black;
            }
            .TableCSS1 th {
                font-family: 'Noto Sans KR', sans-serif;
                line-height: 2;
                height: 30px;
                font-weight: bold;
                vertical-align: top;
                border-bottom: 1px solid black;
                background:  #d2c4b9;
            }
            .TableCSS1 td {
                font-family: 'Noto Sans KR', sans-serif;
                line-height: 2;
                width: 15%;
                height: 40px;
                vertical-align: top;
                border-bottom: 1px solid black;
            }
            /* ----------답변 영역---------- */
            /* 답변 네모틀 */
            #ForBackground{
                text-align: left;
                border: 8px solid #d2c4b9;
                border-radius: 20px;
                margin:auto;
                margin-top: 3%;
                padding: 30px;
                width: 70%;
            }
            #ForBackground p{
                font-family: 'Noto Sans KR', sans-serif;
                margin: auto;
            }
            
            /* 목록,수정,삭제 버튼 */
            #notiSection input,.deletebtn{
                font-family: 'Noto Sans KR', sans-serif;
                background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
                color: #242424;
                border: none;
                padding: 10px 25px;
                border-radius: 4px;
                margin-top: 30px;
                margin-bottom: 60px;
                font-weight: 500;
                font-size: 16px;
            }
            #notiSection input:hover,.deletebtn:hover{
                background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
                color: #b3a193;
            }
           

            /* 반응형 */
            @media only screen and (max-width: 1100px){
                #notiSection #headline{
                    display: none;
                }
                .TableCSS1 {
                margin-top: 100px;
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
</head>
<body>
	<%@include file="../common/menubar.jsp"%>

        <!--section시작-->
        <section id="notiSection">
        <!-- 고객센터 공통 상단 -->
        <div id='Backarea'>
            <img id="headimg" src="img/CS_icon4.png">
            <h1 id="notiTitle1">HYE YUM CS CENTER</h1><h3 id="notiTitle2">혜윰 고객센터</h3>
        </div>
        <form>
        <div id = 'headline'><span onclick="goNoti()">공지사항</span><span  onclick="goFAQ()">FAQ</span><span  onclick="goQNA()">QnA</span></div>
        </form>
         <!--제목 테이블-->
         <div id="wrapContent">
         	<form id="deletetest" action="<%=request.getContextPath()%>/delete.bo" method="get">
            <table class="TableCSS1">
                <tr>
                    <th>작성자</th>
                    <th>제목</th>
                    <th>작성 날짜</th><!-- 작성 날짜 -->
                </tr>
                <tr>
                    <td style="text-align: center;"><%=nb1.getMemberNo() %></td><!-- 작성자 -->
                    <td><%=nb1.getnTitle() %></td><!-- 제목 -->
                    <td style="text-align: center;"><%=nb1.getCreateDate() %></td><!-- 원래는 조회수였는데 table에 조회수 안만듦-->
                </tr>
            </table>
            <div id = "ForBackground">
                <p><%=nb1.getnContent() %></p> <!-- 내용 -->    
            </div>
        <!-- 삭제를 하여보자  -->
       <input type="hidden" value="<%=nb1.getnNo()%>" name="nno">
       <input type="hidden" value="<%=nb1.getnTitle()%>" name="ntitle"> 
       <input type="hidden" value="<%=nb1.getnContent()%>" name="ncontent">  
            </form>
            <a href="<%=request.getContextPath()%>/list.bo;"><input type="submit" value="목록"></a>
            
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
 <script src = "http://code.jquery.com/jquery-latest.min.js"></script>

	<script>
		//공지사항으로
		function goNoti(){
			location.href="<%=request.getContextPath()%>/list.bo"; 
		}
		 //FAQ로 이동
    	function goFAQ(){
			location.href="<%=request.getContextPath()%>/list.fbo"; 
		}
    
    //QNA로 이동
     function goQNA(){
			location.href="<%=request.getContextPath()%>/QnAList.bo"; 
		}
		
        // 컨텐츠내용에따라 컨텐츠박스 크기 조절되게
        $('#ForBackground').css('height', $('#ForBackground>p').height());
        
    </script> 
</body>
 
    
</html>