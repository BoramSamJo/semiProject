<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="faqBoard.model.vo.faqBoard"%>
    
    <%faqBoard fbu = (faqBoard)request.getAttribute("fbu");%> 
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
            margin-left: 50px;
            font-size: 50px;
            padding-top:50px;
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
                margin-top: 200px;
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
            .TableCSS1 textarea{
            resize: none;
            margin-top:7px;
           
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
            /*수정하기 버튼*/
            #updatebtn{
            	font-family: 'Noto Sans KR', sans-serif;
                background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
                color: #242424;
                border: none;
                padding: 10px 25px;
                border-radius: 4px;
                margin-top: 30px;
				margin-left:-100px;
                font-weight: 500;
                font-size: 16px;
            }
            #updatebtn:hover{
                background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
                color: #b3a193;
            }
            
            /* 목록으로 돌아가기 버튼 */
            #notiSection input[type=submit]{
            	position : absolute;
                font-family: 'Noto Sans KR', sans-serif;
                background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
                color: #242424;
                border: none;
                padding: 10px 25px;
                border-radius: 4px;
                margin-top: -41.5px;
                margin-bottom: 100px;
                font-weight: 500;
                font-size: 16px;
            }
            #notiSection input[type=submit]:hover{
                background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
                color: #b3a193;
            }
           
            #notiSection input[type=text]{
            	width:300px;
            	border:none;
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

         
 </style>
</head>
<body>
	<%@include file="../common/managebar.jsp"%>
	 <!--section시작-->
        <section id="notiSection">
        <!-- 고객센터 공통 상단 -->
        <div id='Backarea'>        
            <h1 id="notiTitle1">CS CENTER MANAGER</h1><h3 id="notiTitle2">고객센터 관리</h3>
        </div>
        <form>
        <div id = 'headline'><span onclick="location.href='CS_NotiMain.html';">공지사항</span><span onclick="location.href='CS_FAQ.html';">FAQ</span><span  onclick="location.href='CS_QnA.html';">QnA</span></div>
        </form>
         <!--제목 테이블-->
         <div id="wrapContent">
         	<form id="updatetest" action="<%=request.getContextPath()%>/update.fbo" method="get">
            <table class="TableCSS1">
                <tr>
                    <th></th>
                    <th>제목</th>
                    <th></th><!-- 작성 날짜 -->
                </tr>
                <tr>
                    <td style="text-align: center;"></td>
                    <td><textarea cols="45" rows="1" name="ntitle"><%=fbu.getfTitle() %></textarea></td><!-- 제목 -->
                    <td style="text-align: center;" ></td>
                </tr>
            </table>
            <div id = "ForBackground">
                <textarea cols="160" rows="20" name="ncontent"><%=fbu.getfContent() %></textarea>
            </div>
             <input type="hidden" value="<%=fbu.getFno()%>" name="fno"> 
             <input type="hidden" value="<%=fbu.getCno()%>" name="cno"> 
             <button onclick="updatetest1213();" id="updatebtn">수정</button>
            </form>
             <a href="<%=request.getContextPath()%>/manageFbList.bo;"><input type="submit" value="목록"></a>
        </div>        
    </section><br><br><br><br><br><br><br><br>

           <script>
           	function updatetest1213(){
           		$("#updatetest").submit();
           		alert("수정이 완료 되었습니다");
           	}
          
           </script>
</body>
<script src = "http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
        // 컨텐츠내용에따라 컨텐츠박스 크기 조절되게
        $('#ForBackground').css('height', $('#ForBackground>p').height());
        
    </script> 
</body>
</html>