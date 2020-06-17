<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="member.model.vo.Member, javax.servlet.http.Cookie"%>
<%
	Member loginUser = (Member)request.getSession().getAttribute("loginUser");
	
	Cookie[] cookies = request.getCookies();
	if(cookies!=null&&cookies.length>0){
		for(int i = 0; i < cookies.length; i++){
			if(cookies[i].getName().equals("loginCookie")){
				if(loginUser==null){
					//자동로그인시 loginUser나 세션에 id만 들어있도록 해놨으므로
					//추후 모든건 회원 아이디(userId라는 이름의 세션값)로만 데이터를 불러오게 해야한다
					request.getSession().setAttribute("userId", cookies[i].getValue());
					loginUser = new Member();
					loginUser.setmId(cookies[i].getValue());
					System.out.println(loginUser);
				}
			}
		}
	}
%>
<html lang="ko">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
body {
	margin: 0px;
	padding: 0px;
	/* background: palevioletred; */
}

body * {
	font-family: 'Noto Sans KR', sans-serif;
	text-decoration: none;
}

/* 메뉴바 스타일 - 임의 디자인(한국에자이 참고) 추후 변경예정 */
/* 헤더 전체 설정 */
header {
	width: 100%;
	position: absolute;
	position: fixed;
	top: 0px;
	left: 0px;
	z-index: 99;
	background-color: #242424;
	border-bottom: 5px solid #b3a193;
}

header * {
	list-style: none;
}
/* 내부 설정 */
#navMenu {
	display: flex;
	/* margin: 0px;
            padding:0px; */
	margin-bottom: 0px;
	text-align: center;
	/* background-color: tomato; */
}

#navLogo {
	position: absolute;
	top: 23px;
	left: 20px;
}

#navMenu a {
	color: white;
}

#navMenu>li {
	position: relative;
	left: 25%;
	margin: 0px;
	padding: 17px 0px 17px 0px;
	font-size: 17px;
	width: 190px;
	/* background-color: darkorange; */
}

#navMenu>li>ul {
	position: absolute;
	left: -1px;
	margin: 0px;
	margin-top: 15px;
	padding: 0px;
	opacity: 0;
	transition: 0.5s;
	background-color: darkorchid;
}

#navMenu>li>ul>li {
	margin: 0px;
	padding: 0px;
	font-size: 16px;
	width: 190px;
	line-height: 0px;
	transition: 0.5s;
	background-color: #363636;
	border: 1px outset #463f39;
}

#navMenu>li>ul>li:nth-of-type(1) {
	border-top: 2px solid #b3a193;
}
/* 메뉴 호버 효과 */
#navMenu>li:hover>a {
	color: #b3a193;
}

#navMenu>li:hover>ul {
	opacity: 1;
}

#navMenu>li:hover>ul>li {
	padding: 20px 0px 20px 0px;
	line-height: 18px;
}

#navMenu>li:hover>ul>li:hover>a {
	color: #b3a193;
}

/* 반응형메뉴 설정 */
#reactMenu {
	position: absolute;
	display: none;
}

/* 작은 화면일 때의 설정 */
@media only screen and (max-width: 800px) {
	#serveLogo {
		top: 20px
	}
	#serveMenuBtn {
		position: relative;
		width: 60px;
		height: 4px;
		font-size: 55px;
		padding-bottom: 86px;
		padding-right: 35px;
		padding-left: 10px;
		background-color: #d2c4b9;
	}
	.show {
		display: block;
	}
	.hide {
		display: none;
	}
	/* 메인메뉴 없애기 */
	#navMenu {
		display: none;
	}
	#navSmallLink {
		display: none;
	}
	/* 반응형메뉴 설정 */
	#serveSmallLink {
		width: 100%;
		padding: 15px 0px 15px 0px;
		background-color: #b3a193;
		text-align: center;
		color: #242424;
	}
	#serveSmallLink a {
		margin-left: 10px;
		font-size: 20px;
		font-weight: bolder;
		padding: 1% 7% 1% 7%;
		background-color: #b3a193;
		/* color: #242424; */
	}
	#reactMenu {
		position: absolute;
		top: 0px;
		left: 0px;
		width: 100%;
		display: block;
		height: 90px;
		border-bottom: 5px solid #b3a193;
		background-color: #242424;
	}
	#serveMenu {
		margin: 0px;
		padding: 0px;
		background-color: white;
		display: none;
	}
	#serveMenu>li {
		color: #242424;
		font-size: 20px;
		/* background-color: blue; */
		padding: 5px;
		text-indent: 50px;
		margin-bottom: 25px;
		margin-top: 25px;
	}
	#serveMenu>li>a {
		color: #242424;
		font-weight: bolder;
		/* background-color: red; */
	}
	#serveMenu>li>ul {
		margin: 0px;
		padding: 0px;
		opacity: 0;
		transition: 0.5s;
		/* background-color: #242424; */
	}
	#serveMenu>li>ul>li {
		color: white;
		padding: 0px;
		line-height: 0px;
		height: 0px;
		transition: 0.5s;
		/* background-color: rgb(5, 53, 53); */
	}
	#serveMenu>li>ul>li:nth-of-type(1) {
		border-top: 2px solid gray;
		color: white;
		margin-top: 10px;
		/* background-color: rgb(5, 53, 53); */
	}
	#serveMenu>li>ul>li>a {
		text-decoration: none;
		color: #242424;
		font-size: 18px;
		font-weight: 400;
	}
	#serveMenu hr {
		margin-bottom: 0px;
		width: 90%;
		border: none;
		border-bottom: 1px solid lightgray;
		margin: auto;
		margin-top: 10px;
		/* margin-bottom: 10px; */
	}
	.ulOpacity {
		opacity: 1;
	}
}

 
             /* ------------------------로그인 css-------------------------- */
            /* 전체 화면 설정 */
            /* 로그인 모달팝업으로 가는 버튼 */
            #navSmallLink{
                position: relative;
                top:0px;
                right:30px;
                text-align: right;
            }
            #navSmallLink a{
                padding:3px;
                font-size: 13px;
                color: #b3a193;
            }
            #navSmallLink a:hover{
                text-decoration: underline;
            }

            /* 로그인 모달팝업 전체 설정 */
            .modal{
                font-family: 'Noto Sans KR', sans-serif;
                position: absolute;
                position: fixed;
                display: none;
                top:0px;
                left:0px;
                z-index: 999999999;
                width: 100%; /* Full width */
                /* height: 1000px; */
                /* 화면의 크기만큼 높이가 맞춰지게 기능걸어야겠다 */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.5); /* Black w/ opacity */
                font-family: 'Noto Sans KR', sans-serif;
            }

            /* 로그인단 위치설정 위함 +  로그인레이어 전체 크기*/
            #logIn{
                position: absolute;
                width:380px;
                /* background-color: rgb(231, 139, 26); */
                margin: 0px;
                padding: 0px;
            }
            /* 로그인단 헤더 */
            #logInHeader{
                background-color: #d2c4b9;
                background-color: #d0b7b5;
                background:-webkit-linear-gradient(top, #3b3b3b,#242424);
                padding: 10px 5px 15px 15px;
                margin: 0px;
                border-top-left-radius: 5px;
                border-top-right-radius: 5px;
            }
            #logInHeader p{
                padding: 0px;
                margin: 0px;
                display: inline-block;
                color: #b3a193;
                /* color: #242424; */
                font-weight: bolder;
                font-size: 17px;;
            }
            /* 로그인 모달 팝업 Close 버튼 */
            .close {
                height: 16px;
                color: #b3a193;
                /* color: #242424; */
                position: absolute;
                top:-2px;
                right: 10px;
                font-size: 28px;
                font-weight: bold;
            }
            .close:hover,
            .close:focus {
                color: black;
                cursor: pointer;
            }

            /* 로그인단 섹션 */
            .logInSection{
                background-color: #b3a193;
                background-color: #242424;
                background-color: white;
                /* background-color: white; */
                padding: 10px;
                border-bottom-left-radius: 5px;
                border-bottom-right-radius: 5px;
            }
            /* 로그인 섹선 안 이미지 */
            .logInSection tr:nth-of-type(1) td{
				vertical-align: middle;
			}
            /* 로그인단(테이블 형태) 설정 */
            #loginT{
                vertical-align: middle;
                border-collapse: collapse;
                height: 410px;
                text-align: center;
                margin:auto;
                margin-top: 5px;
                margin-bottom: 5px;
                /* border: 1px solid rgb(230, 224, 224); */
            }
            #loginT td{margin:0px; padding-top: 0px; padding-bottom: 0px;}
            #loginT tr{height:25px;}
            /* #loginT tr:nth-of-type(1)>td{} */
            #loginT tr:nth-of-type(4){text-align: left;}

            #userIdLogIn{
                height: 35px;
            }
            #password{
                height: 35px;
            }

            /* 로그인 버튼 설정 */
            #logBtn{
                box-sizing: content-box;
                width:280px;
                height: 27px;
                background:lightgray;
                border: none;
                border-radius: 2px;
                color: rgb(97, 96, 96);
                font-weight: bolder;
                font-size: 13px;
            }

            /* 로그인상태 유지 체크박스 */
            #maintenanceLogInLabel{
                font-size: 12px;
            }
            #maintenanceLogInLabel span{
                font-size: 15px;
                color:dimgray;
                font-weight:500;
            }

            /* input태그 설정(버튼, 체크박스 제외) */
            .modal input:not([id='submit']):not([type='checkbox']){
                width:290px;
                height: 20px;
                border-radius: 2px;
                border: 1px solid rgb(172, 171, 171);
                padding: 5px;
            }

            /* 링크(a) 설정 */
            #smallInform>a{
                font-size: 10px;
                color: rgb(73, 73, 73);
                text-decoration: none;
            }

            /* 체크박스 이미지넣고 설정 */
            input[type=checkbox]:not([name='test']):not(#testAll) { display:none; }

            input[type=checkbox] + label { 
                display: inline-block; 
                cursor: pointer; 
                line-height: 22px; 
                padding-left: 25px; 
                background: url('<%=request.getContextPath()%>/img/notCheck1.png') left/30px no-repeat; 
            }
            
            #reactMenu a{
            	color:#242424;
            }
            
        /* ------------------------로그인 css 끝-------------------------- */

/* fixed 예약버튼 설정 */
#reservation {
	width: 45px;
	height: 45px;
	right: 8%;
	top: 620px;
	position: relative;
	position: fixed;
	z-index: 9999999999;
	background-color: #b3a193;
	background-color: white;
	opacity: 1;
	text-align: center;
	margin: 0px;
	padding: 0px;
	border: 2px solid #b3a193;
	border-radius: 100px;
}

#reservation a {
	position: absolute;
	left: 2px;
	top: 3px;
	width: 40px;
	height: 40px;
	border-radius: 100px;
	text-indent: 2px;
	line-height: 40px;
	color: #242424;
	color: #b3a193;
	font-weight: bolder;
	text-decoration: none;
	font-size: 16px;
	font-family: 'Noto Sans KR', sans-serif;
}
</style>
<!-- 노토산스kr 폰트 가져오기 -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
</head>
<body>
	<!-- <헤더(상단 메뉴바) 시작> -->
	<!--헤더 시작-->
	<header id='nav'>
		<!-- 0. 모달 로그인 팝업 -->
		<div id="navSmallLink">
			<%if(loginUser==null){ %>
			<a id="moveToLogIn" class="TextmoveTo">로그인</a> <a class="TextmoveTo" href="<%=request.getContextPath()%>/views/member/memberJoin.jsp">회원가입</a>
			<%}else{ %>
			<a id="moveToLogOut2" class="TextmoveTo" onclick="goLogout();">로그아웃</a>
			<a class="TextmoveTo" id="moveToMyPage" href="#">마이페이지</a>
			<%} %>
			<a class="TextmoveTo" href="<%=request.getContextPath() %>/index.jsp">오시는길</a>
		</div>
		<div class="modal" id="myModal">
			<!-- 1) 로그인단 + 우측 이미지 -->
			<div id="logIn" class="">
				<div id="logInHeader">
					<p>로그인</p>
					<span class="close">&times;</span>
				</div>
				<div class="logInSection">
					<form id="loginForm">
						<table id="loginT">
							<tr>
								<td><img src="<%=request.getContextPath()%>/LOGO/LOGO3.png" width="300"
									height="100" alt=""></td>
							</tr>
							<tr>
								<td><input type="text" name="userId" id="userIdLogIn"
									placeholder="아이디" required></td>
								<!-- <td rowspan="7"> 
                                        <span id="advertisement">
                                            &nbsp;&nbsp;&nbsp;&nbsp;<img src="img/심리센터8.png" width="240px" height="270px" alt="">
                                        </span>
                                    </td> -->
							</tr>
							<tr>
								<td><input type="password" name="userPwd" id="password"
									placeholder="비밀번호" required></td>
							</tr>
							<tr>
								<td><input src="checkboxImage/비활성화상태체크박스.png"
									type="checkbox" name="maintenanceLogIn" id="maintenanceLogIn">
									<label for="maintenanceLogIn" id="maintenanceLogInLabel">&nbsp;&nbsp;<span>로그인
											상태 유지</span></label> <!-- 체크여부가져오기 위한 히든타입 태그 --> <input type="hidden"
									id="forMaintainCheck" value="false"></td>
							</tr>
							<tr>
								<td><input type="button" value="로그인" id="logBtn" disabled
									onclick="goLogin();"></td>
							</tr>
							<!-- 2) 아이디 찾기, 비번 찾기, 회원가입 링크 -->
							<tr>
								<td>
									<div id="smallInform" align='center'>
										<a href="<%=request.getContextPath()%>/views/member/mySearch.jsp" id="#">아이디 찾기 |</a> <a href="<%=request.getContextPath()%>/views/member/mySearch.jsp" id="#"><b>비밀번호
												찾기</b></a><span style="font-size: 10px; font-weight: lighter;">
											|</span> <a href="<%=request.getContextPath()%>/views/member/memberJoin.jsp">회원가입</a>
									</div>
								</td>
							</tr>
							<!-- <tr>
                                    <td >
                                        <img src="img/dog-1532627_640.png" width="300" height="100" alt="">
                                    </td>
                                </tr> -->
						</table>
					</form>
				</div>
			</div>
		</div>
		<!--상단바-->
		<ul id='navMenu'>
			<img id="navLogo" src="<%=request.getContextPath()%>/LOGO/LOGO1.png" width="130" alt="로고이미지"
				id='bigwindow_logo'>
			<!-- <img src="img/logo1.png" alt="로고이미지" id = 'smallwindow_logo'> -->
			<li><a href="#" id='first' class="colorcss">장례서비스</a>
				<ul>
					<li><a href="#">장례절차</a></li>
					<li><a href="#">장례용품</a></li>
					<li><a href="#">장례비용</a></li>
					<li><a href="#">LUCETTE</a></li>
					<li><a href="#">장례예약</a></li>
				</ul></li>
			<li><a href="#" id='second' class="colorcss">보험서비스</a>
				<ul>
					<li><a href='#'>보험소개</a></li>
					<li><a href='#'>보장내용</a></li>
					<li><a href='#'>가입안내</a></li>
				</ul></li>
			<li><a href="#" id='third' class="colorcss">혜윰스케치북</a></li>
			<li><a href="#" id='forth' class="colorcss">고객센터</a>
				<ul>
					<li><a href='#'>공지사항</a></li>
					<li><a href='#'>FAQ</a></li>
					<li><a href='<%=request.getContextPath()%>/QnAList.bo'>QnA</a></li>
				</ul></li>
			<li><a href="<%=request.getContextPath()%>/views/member/forMember.jsp" id='fifth' class="colorcss">For Member</a></li>
		</ul>


		<!-- 반응형 메뉴 -->
		<div id='reactMenu'>
			<img id="serveLogo" src="<%=request.getContextPath() %>/LOGO/LOGO1.png" width="120"
				alt="로고이미지" id='bigwindow_logo'>
			<div id="serveMenuBtn">
				<img src="<%=request.getContextPath()%>/img/noun_List_25956.png" width="90" height="90">
			</div>
			<ul id="serveMenu">
				<div id="serveSmallLink">
					<%if(loginUser==null){ %>
					<a id="moveToLogIn2" class="TextmoveTo">로그인</a> <a
						class="TextmoveTo" href="<%=request.getContextPath()%>/views/member/memberJoin.jsp">회원가입</a>
					<%}else{ %>
					<a id="moveToLogOut2" class="TextmoveTo" onclick="goLogout();">로그아웃</a>
					<a id="moveToMyPage2" class="TextmoveTo">마이페이지</a>
					<%} %>
					<a class="TextmoveTo" href="<%=request.getContextPath() %>/index.jsp">오시는길</a>
				</div>

				<li id="serve1"><a href="#">장례서비스 </a>
					<hr>
					<ul>
						<li><a href="#">장례절차</a></li>
						<li><a href="#">장례용품</a></li>
						<li><a href="#">장례비용</a></li>
						<li><a href="#">LUCETTE</a></li>
						<li><a href="#">장례예약</a></li>
					</ul></li>

				<li id="serve2"><a href="#">보험서비스</a>
					<hr>
					<ul>
						<li><a href='#'>보험소개</a></li>
						<li><a href='#'>보장내용</a></li>
						<li><a href='#'>가입안내</a></li>
					</ul></li>
				<li><a href="#"><a>혜윰스케치북</a>
						<hr></li>
				<li id="serve3"><a href="#">고객센터</a>
					<hr>
					<ul>
						<li><a href='#'>공지사항</a></li>
						<li><a href='#'>FAQ</a></li>
						<li><a href='<%=request.getContextPath()%>/QnAList.bo'>QnA</a></li>
					</ul></li>
				<li><a href="<%=request.getContextPath()%>/views/member/forMember.jsp">For Member</a>
					<hr></li>
			</ul>
		</div>
	</header>

	<!-- 예약 fixed 사이드바 와 관리자 바-->
	<%if(loginUser!=null&&request.getSession().getAttribute("userId")!=null&&request.getSession().getAttribute("userId").equals("admin")){%>
	<aside id="reservation">
		<p>
			<a href="">관리</a>
		</p>
	</aside>
	<%}else{ %>
	<aside id="reservation">
		<p>
			<a href="">예약</a>
		</p>
	</aside>
	<%}%>

	<!-- jsp 관련 스크립트 -->
	<script>
		function goLogin(){
			var userId = $('#userIdLogIn');
			var userPwd = $('#password');
			var maintainCheck = $('#forMaintainCheck');

			$.ajax({
				url:"<%=request.getContextPath()%>/login.me"
				, type:"get"
				, data:{userId:userId.val(), userPwd:userPwd.val(), maintainCheck:maintainCheck.val()}
				, success:function(data){
					if(data=='noneId'){
						alert('존재하지 않는 아이디 입니다');
						userId.focus();
					}else if(data=='successLogin'){
						alert('로그인 성공');
						//모달창은 reload가 안먹으므로 수동으로 꺼주자
						var modal = document.getElementById('myModal');
        				modal.style.display = 'none';
						
						if(modal.style.display=='none'){
							location.reload(true);
						}else{
							location.reload(true);						
						}
					}else if(data=='failLogin'){
						alert('로그인 실패');
					}
				}
				, error:function(request, status, error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			})
		}

		function goLogout(){
			$.ajax({
				url:"<%=request.getContextPath()%>/logout.me"
				, success:function(data){
					if(data=='successLogout'){
						alert('로그아웃되었습니다');
						window.location.reload(true);
					}else{
						alert('로그아웃 실패')
					}
				}
				, error:function(request, status, error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			})
		}
	</script>
	<!------------------------------------------------------------------------------------------------------------------------------------------>
	<script>
        //반응형(작은화면) MENU hover시 메뉴 나오도록
        $(document).ready(function(){
            var btn = $("#serveMenuBtn");
            var layer = $("#serveMenu");
            btn.click(function(){ 
                layer.slideToggle(
                    "slide",
                    function(){
                        if(layer.css('display')!='none'){
                            btn.css('font-weight', 'bolder').css('padding-right', '40px');
                            btn.children().prop('src', '<%=request.getContextPath()%>/img/noun_Close_52944.png').css({'width':'50', 'height':'50','padding-left':'20px', 'padding-top':'20px'});
                            //아코디언이 펴져서 스크롤 바 생기는걸로 박스가 가려지는걸 커버하기 위해 위치 조정
                            // $("#serveMenuBtn").css('right', -($('html').width()-$('#serveMenuBtn').width()-70));
                            // alert('asdf');
                        }else{
                            btn.css('font-weight', '500').css('padding-right', '40px');
                            btn.children().prop('src', '<%=request.getContextPath()%>/img/noun_List_25956.png').css({'width':'90', 'height':'90','padding-left':'0px', 'padding-top':'0px'});
                            // $("#serveMenuBtn").css('right', -($('html').width()-$('#serveMenuBtn').width()-60));
                        }
                        layer.addClass('show');
                        layer.addClass('hide')
                    },
                )
            })
            btn.click(function(){
            
            });
       
        })
       

        // 서브메뉴 크기 지정
        $('#serveMenu').css('height', $('#section2').height());
        // 반응형메뉴의 서브메뉴 각 항목 나타내고 다른항목 없애기
        $('#serveMenu>li').each(function (index, element) {
            // element == this
            $(this).click(function(){
                var otherStyle = {'padding':'0px', 'line-height':'0px', 'height':'0px'}
                $(this).children('ul').css('opacity', 1);
                $(this).find('li').css({'color':'white', 'padding':'10px', 'line-height':'30px', 'height':'30px'});
                $(this).siblings().find('li').css(otherStyle);
                $(this).siblings().children('ul').css('opacity', 0);
                $(this).children('hr').css('display', 'none');
                $(this).siblings().children('hr').css('display', 'block');
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

	<!-- 4. 로그인 모달창 동적제어 -->
	<script>
        // 로그인단 중앙으로 위치지정 - 나중에 네비바 추가되면 그거 고려해서 다시 좌표설정
        $(window).scroll(function () {
        	 var heightLogIn1 = $('body>header').height()+50;
             var heightLogIn2 = $('#reactMenu').height()+50;
             var widthLogIn = $('html').innerWidth()/2 - $('#logIn').width()/2;
             
             if($('#reactMenu').css('display')=='none'){
                 $('#logIn').css({'top':heightLogIn1, 'left':widthLogIn});
             }else{
                 $('#logIn').css({'top':heightLogIn2, 'left':widthLogIn});
             }
        });
        $(window).resize(function () { 
                
            var heightLogIn1 = $('body>header').height()+50;
            var heightLogIn2 = $('#reactMenu').height()+50;
            var widthLogIn = $('html').innerWidth()/2 - $('#logIn').width()/2;
            
            if($('#reactMenu').css('display')=='none'){
                $('#logIn').css({'top':heightLogIn1, 'left':widthLogIn});
            }else{
                $('#logIn').css({'top':heightLogIn2, 'left':widthLogIn});
            }
        });


        // 수평선 길이 설정
        $(function(){
            var logInWidth = $('#logInT').css('width');
            $('hr').css('width', logInWidth);
        })

        // 로그인 링크 클릭하면 로그인 모달팝업 띄우기(띄울때 로그인단 위치선정도)
        var moveToLogIn = document.querySelector('#moveToLogIn');
        var moveToLogIn2 = document.querySelector('#moveToLogIn2');
        var modal = document.getElementById('myModal');
        
        moveToLogIn.onclick = function(){
            modal.style.display = "block";

            var heightLogIn = $('body>header').height();
            var widthLogIn = $('html').innerWidth()/2 - $('#logIn').width()/2;
            
            $('#logIn').css({'top':heightLogIn, 'left':widthLogIn});

        };
        
        moveToLogIn2.onclick = function(){
            modal.style.display = "block";

            var heightLogIn = $('#reactMenu').height();
            var widthLogIn = $('html').innerWidth()/2 - $('#logIn').width()/2;
            
            $('#logIn').css({'top':heightLogIn, 'left':widthLogIn});

        };

        // 모달 팝업 외의 공간을 클릭하면 모달팝업 끄기
        window.onclick = function(event){
             if(event.target == modal){
                 modal.style.display = 'none';
            }
        }

        // X버튼 누르면 모달팝업 끄기
        var close = document.querySelector('.close');
        close.onclick = function() {
            modal.style.display = "none";
        }

        // 아이디/비번을 다 입력하면 로그인 버튼 활성화
        $(function(){
            $('#userIdLogIn').keyup(readyLogIn);
            $('#password').keyup(readyLogIn);
        })
        function readyLogIn(){
            if($('#userIdLogIn').val()!=''&&$('#password').val()!=''){
                $('#logBtn').prop('disabled', false).css({'background':'#b3a193', 'color':'#242424'});
            }
            if($('#userIdLogIn').val()==''||$('#password').val()==''){
                $('#logBtn').prop('disabled', true).css({'background':'lightgray', 'color':'gray'});
            }
        }

        // 체크여부에따라 체크박스 이미지(라벨) 와리가리(색바뀜)
        $('input:checkbox').each(function(index, item){
            $(this).change(function(){
                if($(this).prop('checked')==true){
                    ($(this).next().css('background-image', "url('<%=request.getContextPath()%>/checkboxImage/innerbeigeOuterblack.png')"));
                	$('input:hidden').val('true');
                }else if($(this).prop('checked')==false){
                    $(this).next().css('background-image', "url('<%=request.getContextPath()%>/img/notCheck1.png')")
                    $('input:hidden').val('false');
                }
            });
        });


        // 모달팝업의 세로길이 맞춰주는 기능
        $(function(){
            var heightAll = $('html').height();
            $('.modal').css('height',heightAll)
        
        })
        $(window).resize(function () { 
            var heightAll = $('html').height();
            $('.modal').css('height',heightAll);
        });
    </script>
</body>
</html>