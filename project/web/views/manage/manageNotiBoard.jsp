<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="noticeBoard.model.vo.*, java.util.ArrayList"%>
    
    <%
    nPagenation pn = (nPagenation)request.getAttribute("pn");
   	ArrayList list = (ArrayList)request.getAttribute("list");
   
	noticeBoard nb = new noticeBoard();
	
    /* 페이징처리를 위한 변수 선언 (pn객체)*/
    int listCount = pn.getListCount();
    int currentPage = pn.getCurrentPage();
    int maxPage = pn.getMaxPage();
    int startPage = pn.getStartPage();
	int endPage = pn.getEndPage(); 
	int pageBlock =pn.getPageBlock();
	int pageCount=pn.getPageCount();

    %>
    
    <%
String word="";
   String selectBox="";
   String isSearch = (String)request.getAttribute("isSearch");
   if(isSearch==null){
      isSearch="false";
   }else{
      isSearch="true";
      word=(String)request.getAttribute("word");
      selectBox=(String)request.getAttribute("selectBox");
   }
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
                padding-top:60px;
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
                background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
                color: #242424;
                border-top-right-radius: 5px;
                border-bottom-right-radius: 5px;
                border-left: 1px solid black;
              
            }

            #headline span:nth-of-type(2):hover{
                background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
                color: #b3a193;
            }
            #headline span:nth-of-type(3):hover{
                background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
                color: #b3a193;
            }

            /* ----------검색창 영역---------- */
            #notiSection select{
                position: absolute;
                margin-top: 13.6%;
                margin-left: 16.2%;
                margin-bottom: 10px;
                height: 35px;
                border: 1px solid rgb(245,245, 245);
                border-radius:3px;
            }
            #notiSection input[type=text]{
                position: absolute;
                margin-top: 14.5%;
                margin-left: 23.7%;
                border: none;
                border-bottom: 1px solid black;
                width: 10%;
                outline: none;
            }
            #notiSection button[type=button]{
                position: absolute;
                margin-top: 14%;
                margin-left: 34%;
                width: 55px;
                height: 30px;
                border: none;
                border-radius: 4px;
                background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
                color: #242424;
            }
            #notiSection button[type=button]:hover{
                background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
                color: #b3a193;
            }
            
            /* -----------테이블 영역-----------*/
            .TableCSS1 {
                width: 75%;
                margin-top: 15%;
                margin-left: 13%;
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
         
            #notiSection button:not([id=insertBtn]):not([id=searchBtn]):not([id=forallBtn]){
                background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
                color: #242424;
                border:none;
                border-radius:2px;
                paddin:5px;
                width:25px;
                height:25px;
                font-weight:600;
            }
            #notiSection button:hover{
            	background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
                color: #b3a193;
            }
            /* 작성하기 버튼 */
            #insertBtn{
                border: none;
                border-radius: 4px;
                background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
                color: #242424;
                width:100px;
                height:40px;
                font-weight:600;
            }
			 #insertBtn:hover{
				background: -webkit-linear-gradient(top, rgb(65, 64, 64), #242424);
                color: #b3a193;
			 }
			#searchBtn{
				border: none;
                border-radius: 4px;
                background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
                color: #242424;
                width:100px;
                height:40px;
                font-weight:600;
			}
            /*---------- 반응형 ----------*/
            @media only screen and (max-width: 1100px){
                #headline{
                    display:none;
                }
                #notiSection span{
                    display: none;
                }
                #notiSection select{
                   display: none;
                }
                #notiSection input[type=search]{
                    display: none;
                }
                #notiSection button[type=submit]{
                    display: none;
                }
            }
            
            #forallBtn{
 				border: none;
                border-radius: 4px;
                background: -webkit-linear-gradient(top, #e0ccbb, #b3a193);
                color: #242424;
                width:100px;
                height:40px;
                font-weight:600;
            }

</style>
	

</head>
<body>
<%@include file="../common/managebar.jsp"%>
<%-- <%=pn %>
	<%=list %> 
	
	<%="잘나오는지 확인" %> --%>
         <!--section시작-->
        <section id="notiSection">
        <!-- 고객센터 공통 상단 -->
        <div id='Backarea'>
            <h1 id="notiTitle1">CS CENTER MANAGE</h1><h3 id="notiTitle2">고객센터 관리</h3>
        </div>
      <form id="searchformtest" name="searchform" method="get" action="<%=request.getContextPath()%>/list.bo">
        <div id = 'headline'><span onclick="goNoti()">공지사항</span><span onclick="goFAQ()">FAQ</span><span  onclick="location.href='<%=request.getContextPath()%>/manageQList.bo';">QnA</span></div>

        <!-- 검색하기 기능 -->
          <select name="selectBox" id="forselect" style="border:1px solid #b3a193">
                <option value="">카테고리 선택</option>
                <option value="ntilte">제목</option>
                <option value="ncontent">내용</option>
                <option value="ntitle_content">제목+내용</option>
            </select>
        <input type="text" name="word" id="forsearch" value="">&nbsp;
        <button type="button" onclick="searchtest123();" id="searchBtn">검색</button>
        </form>
         <!--공지사항 테이블-->
         <div>
            <table class="TableCSS1" id="testtest1">
                <tr>
                <th scope="row">번호</th>
                <th scope="row">제목</th>
                <th scope="row">작성자</th>
                <th scope="row">작성일</th>
                <!-- <th scope="row">조회</th> -->
                </tr>
                    <%if(list.isEmpty()) {%>
                <tr>
                	<td>조회된 리스트가 없습니다.</td>
                	<td></td>
                	<td></td>
                	<td></td>
                </tr>
                <%}else{%>
                	<%for(int i=0; i<list.size(); i++) {%>
                	<tr><!-- 번호/제목/작성자/작성일/조회 -->
                		<input type = "hidden" value="<%=((noticeBoard)list.get(i)).getnNo() %>">  <!-- 게시글 상세 조회 시 필요한 게시글 번호 -->
                		<td><%=((noticeBoard)list.get(i)).getnNo() %></td> <!-- 번호 -->
                		<td><%=((noticeBoard)list.get(i)).getnTitle() %></td><!--제목 -->
                		<td><%=((noticeBoard)list.get(i)).getMemberNo() %></td><!-- 작성자 -->
                		<td><%=((noticeBoard)list.get(i)).getCreateDate() %></td><!-- 작성일-->
                	</tr>
                	<%} %>
                <%} %>
            </table><br>
       <%if(pn.getListCount()==0){%>
               
            <%}else{ %>
               <%if(isSearch.equals("false")) {%>
                      <!-- 이전 페이지 -->
                     <button onclick = "location.href='<%=request.getContextPath() %>/manageNbList.bo?currentPage=<%=endPage-1 %>'"> < </button>
                       <%for(int pg = startPage; pg<=endPage; pg++){ %>
                          <%if(pg == currentPage){ %>
                             <button disabled><%=pg %></button>
                     <%}else{ %>
                             <button onclick= "location.href='<%=request.getContextPath() %>/manageNbList.bo?currentPage=<%=pg %>'"><%=pg %></button>
                          <%} %>
                       <%} %>
                       <!-- 다음 페이지 -->
                     <button onclick = "location.href='<%=request.getContextPath() %>/manageNbList.bo?currentPage=<%=startPage+1 %>'"> > </button><br><br>
                    
   
               <!-- 검색 후 -->
                    <%}else{ %> 
                     <!-- 이전 페이지 -->
                       <%for(int pg = startPage; pg<=endPage; pg++){ %>
                          <%if(pg == currentPage){ %>
                              <button disabled><%=pg %></button><br><br><br>
                     <%}else{ %>
                             <%-- <button onclick="location.href='<%=request.getContextPath() %>/search.bo?currentPage=<%=pg %>&content=<%=word %>&selectBox=<%=selectBox%>';"><%=pg %></button> --%>
                          <%} %>
                       <%} %>
                    <%}%>
                 <%}%>
                  <%if(isSearch.equals("true")){ %>
 		          <button onclick="reload();" id="forallBtn">전체보기</button>
           <%} %>
       
             <!-- 글 작성하기 insert-->
			<button id="insertBtn"onclick="location.href='views/noticeBoard/noticeBoardInsertForm.jsp'">작성하기</button>
			
			
        </div>
  
   
    </section>
    <br><br><br><br><br><br>

    <!------------------------------------------------------------------------------------------------------------------------------------------>
     <script src = "http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
    //FAQ로 이동
    function goFAQ(){
			location.href="<%=request.getContextPath()%>/manageFbList.bo"; 
		}
    
    
    //공지사항 세부사항 보는 페이지로 넘어가기
    $(function(){
 				$("#testtest1 td").mouseenter(function(){
 					$(this).parent().css({"background":"lightgray","cursor":"pointer"});
 				}).mouseout(function(){
 					$(this).parent().css({"background":"white"});
 				}).click(function(){
 					var nno = $(this).parent().children("input").val();
 					location.href="<%=request.getContextPath()%>/managedetial.nbo?nno=" + nno;
 				})
 			})   
    
    //검색
    function searchtest123(){
    	if(($("#forsearch")).val()=="" || ($("#forselect")).val()==""){
    		alert("검색어를 입력하세요");
    	}else{
    	$("#searchformtest").attr("action","<%=request.getContextPath()%>/managesearch.nbo");
    	$("#searchformtest").submit();
    	}
    }
  //검색 후 다시 돌아가기
    function reload(){
       location.href="<%=request.getContextPath()%>/manageNbList.bo";
    }

    
    

    
    </script>
        
          <!------------------------------------------------------------------------------------------------------------------------------------------>
     <script>
       
        // 서브메뉴 크기 지정
        $('#serveMenu').css('height', $('#section2').height());
        // 반응형메뉴의 서브메뉴 각 항목 나타내고 다른항목 없애기
        $('#serveMenu>li').each(function (index, element) {
            // element == this
            $(this).click(function(){
                var otherStyle = {'padding':'0px', 'line-height':'0px', 'height':'0px'}
                $(this).children('ul').css('opacity', 1);
                $(this).find('li').css({'color':'white', 'padding':'10px', 'line-height':'18px', 'height':'50px'});
                $(this).siblings().find('li').css(otherStyle);
                $(this).siblings().children('ul').css('opacity', 0);
            })
            
        });

        // 서브메뉴 버튼 위치 조정
        // alert($('html').width()-$('#serveMenuBtn').width()-10);
        $("#serveMenuBtn").css('right', -($('html').width()-$('#serveMenuBtn').width()-46));
        $(window).resize(function(){
            $("#serveMenuBtn").css('right', -($('html').width()-$('#serveMenuBtn').width()-46));
        })
        //서브로고 위치 조정
        $('#serveLogo').css('position', 'absolute').css('left', $('html').width()/2 - $('#servelogo').width()/2-65);
        $(window).resize(function(){
            $('#serveLogo').css('position', 'absolute').css('left', $('html').width()/2 - $('#servelogo').width()/2-65);
        })
        </script>

</body>
</html>