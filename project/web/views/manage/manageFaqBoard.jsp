<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="faqBoard.model.vo.*,java.util.ArrayList"%>
    
    <%-- <%faqBoard fb = (faqBoard)request.getAttribute("faqBoard"); %>  --%><!-- 0620 -->
    
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
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
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
        /* ----------고객센터 관리자 공통 상단 -----------*/
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
			margin: auto;
			margin-top: 0px;
			font-size: 50px;
			padding-top: 40px;
			position: relative;
			width: 600px;
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
         
        /*  #notiSection select{
             position: relative;
             top:380px;
             left:-230px;
             z-index: 100;
         } */
         #notiSection input[type=text]{
            position: absolute;
            top:0px;
            left:200px;
            position:absolute;
            left:1100px;
            margin-top:510px;
            border: none;
            border-bottom: 1px solid black;
            width: 11%;
            outline: none;
        }
        #notiSection button[type=button]{
        	border:none;
            position: absolute;
            top:500px;
            left:1280px;
            width: 75px; 
            height: 40px;
            border-radius: 4px;
            border:none;
            background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
            color: #242424;
        }
         button:not([id="searchBtn"]){
            background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
            color: #242424;
            border:none;
            border-radius:2px;
            padding:10px;
            font-weight:600;
        }
        button:hover{
            background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
            color: #b3a193;
        }
        #notiSection button[type=button]:hover{
            background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
            color: #b3a193;
        }
        #notiSection button:not([id=insertBtn]):not([id=searchBtn]){
                background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
                color: #242424;
                border:none;
                border-radius:2px;
                padding:0px;
                width:25px;
                height:25px;
                font-weight:600;
            }
            #notiSection button:hover{
            	background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
                color: #b3a193;
            }
        #faqselectBox{
        	 position: absolute;
             margin-top: 18%;
             margin-left: 15.3%;
             margin-bottom: 10px;
             height: 35px;
             border: 1px solid #b3a193;
             border-radius:3px;
             width:100px;
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
            top:300px;
            font-family: 'Noto Sans KR', sans-serif;
            table-layout:fixed;
            width: 79%;
            margin: auto;
            border-collapse: collapse;
            line-height: 1.5;
            border-top: 3px solid black;
            border-bottom: 1px solid black;
            text-align: center;
            margin-top: 0px;
        }
        .TableCSS2 th {
                font-family: 'Noto Sans KR', sans-serif;
                line-height: 3;
                height: 40px;
                font-weight: bold;
                vertical-align: top;
                border-bottom: 1px solid black;
                background:  #d2c4b9;
                
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
             
            }
#searchBtn:hover{
padding:0px;
}
#searchBtn:hover{
 background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
 color: #b3a193;
}

</style>
</head>
<body>
<%@include file="../common/managebar.jsp"%>
		<section id="notiSection">
        <%-- <%=fpn %>
        <%=list %> --%>
            <div id='Backarea'>
                <h1 id="notiTitle1">CS CENTER MANAGE</h1><h3 id="notiTitle2">고객센터 관리</h3>
            </div>
            <form  id="searchformtest"  name="searchform" method="get" action="<%=request.getContextPath()%>/managesearch.fbo">
           
                <div id = 'headline'><span onclick="goNoti()">공지사항</span><span onclick="goFAQ()">FAQ</span><span  onclick="goQNA()" >QnA</span></div>
              
             <select name="selectBox" id="faqselectBox">
             	<option value="">카테고리 선택</option>
                <option value="ntitle">제목</option>
                <option value="ncontent">내용</option>       
            </select> 
        <input type="text" id = "forsearch" name="word" value="">&nbsp;
        <button type="button" onclick="searchtest123();" id="searchBtn" style="width:60px; height:30px;">검색</button>
         </form>

            <div>
           
            	<!-- FAQ테이블 -->
                <table class="TableCSS2" id="FAQTable" cellspacing="0" cellpadding="0" border="0" >

					<tr>
					<th></th>
					<th colspan="2">제목</th>
					<th>작성일</th>
					</tr>
                	<%if(list.isEmpty()){ %>
                		<tr>
                			<td colspan="4">조회된 리스트가 없습니다.</td>
                		</tr>
                	<%}else{ %>
                		<%for(int i=0; i<list.size();i++) {%>
                  
                    <tr>
 					<input type="hidden" value="<%=((faqBoard)list.get(i)).getFno() %>" name="fno" id="fnotest1"><!-- 넘길 FAQ글 번호 --> 
					<input type="hidden" value="<%=((faqBoard)list.get(i)).getCno() %>" name="cno" id="cnotest"><!-- 넘길 카테고리  번호 --> 
                        <td class='init'>Q</td>       
                        <td class="second"><%=((faqBoard)list.get(i)).getfTitle() %></td><!-- 제목 -->
                        <td></td>
                        <td><%=((faqBoard)list.get(i)).getCreateDate() %></td>
                    </tr> 
                    <%} %>
                    <%} %>
                       
                 </table>
                 <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                
                 <!-- 이전 페이지 -->
            <button onclick = "location.href='<%=request.getContextPath() %>/manageFbList.bo?currentPage=<%=endPage-1 %>'"> < </button>
            <!-- 페이지 목록 -->
           <%for(int p=startPage; p<=endPage; p++) {%>
                 <%if (p==currentPage) {%>
               <button disabled><%=p %></button>
               <%}else{ %>
               <button onclick= "location.href='<%=request.getContextPath() %>/manageFbList.bo?currentPage=<%=p %>'"><%=p %></button>
               <%} %>
            <%} %> 
           
            <!-- 다음 페이지 -->
            <button onclick = "location.href='<%=request.getContextPath() %>/manageFbList.bo?currentPage=<%=startPage+1 %>'"> > </button><br><br>
            
            <!-- 글 작성하기 insert 관리자만 가능하도록 나중에 추가 -->     
            <button id="insertBtn"onclick="location.href='views/faqBoard/faqBoardInsertForm.jsp'">작성하기</button>
            </div>
        </section>
        <br><br><br><br><br><br><br>

 

        <!------------------------------------------------------------------------------------------------------------------------------------------>
       <script>
      		function goNoti(){
      			location.href="<%=request.getContextPath()%>/manageNbList.bo"; 
      		}
      		function goQNA(){
      			location.href="<%=request.getContextPath()%>/manageQList.bo"; 
      		}
      		
       </script>
       <script>
       $(function(){
			$("#FAQTable td").mouseenter(function(){
				$(this).parent().css({"background":"lightgray","cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"background":"white"});
			}).click(function(){
				 var fno = $("#fnotest1").val();
		         var cno = $("#cnotest").val();
		         location.href="<%=request.getContextPath()%>/managedetail.fbo?fno=" + fno +"&cno="+cno; 
				
			})
		})
		
		function goDetail(fno, cno){
				var fno =fno;
				var cno =cno
				if($('#FAQTable td').text()=='조회된 리스트가 없습니다.'){
					return;
				}
				location.href="<%=request.getContextPath()%>/managedetail.fbo?fno=" + fno +"&cno="+cno; 
       }
       </script>
       <script>

       
       
       </script>
       
       <script>
       //검색하기
           function searchtest123(){
    		if(($("#faqselectBox")).val()=="" || ($("#forsearch")).val()==""){
    			alert("검색어를 입력하세요");
    		}else{
    	$("#searchformtest").submit();
    			
    		}
    }
       

     
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

        </script>
        

</body>
</html>