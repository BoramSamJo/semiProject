<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 공통 */
html, body{
margin:0px;
}
#mainSideNav li {
	padding: 10px;
	position: relative;
	list-style-type:none;
}
#mainSideNav a {
    color:white;
    text-decoration:none;
}

/* 메인사이드바 */
#mainSideNav>ul {
	margin: 0px;
	padding:5px;
	width:190px;
/* 	background-color:blue; */
}
#mainSideNav>ul>li {
 	margin: 15px;
/* 	background-color:red; */
}

#mainSideNav ul li ul {
	margin: 0px;
	padding:0px;
/* 	background-color:yellow; */
}
#mainSideNav ul li ul li {
	opacity: 0;
	line-height: 0px;
	position: absolute;
	margin:0px;
	padding:0px;
	transition-duration: 2s;
/* 	background-color:green; */
}

#mainSideNav ul li:hover ul li {
	position: relative;
	opacity: 1;
	text-indent: 0px;
	line-height: 20px;
}
#mainSideNav ul li:hover ul li a{
	opacity: 1;
}

#mainSideNav ul li ul li a {
/* 	background-color: rgb(5, 5, 5); */
	opacity: 0;
	position: relative;
	top:10px;
	left:-10px;
	display: inline-block;
	width: 150px;
	padding: auto;
	padding-top: 8px;
	padding-bottom: 8px;
	margin: 0px;
	border-bottom: 1px solid rgb(97, 72, 3);
	text-align:center;
	line-height: 40px;
}

#mainSideNav ul li ul li a:hover {
	color: rgb(160, 119, 8);

/* 	background-color: rgb(17, 16, 16); */
}

#mainSideNavKey {
	background: -webkit-linear-gradient(left, rgb(14, 0, 0), rgb(41, 41, 40));
	position: absolute;
	width: 40px;
	height: 100px;
	border-top-right-radius: 8px;
	border-bottom-right-radius: 8px;
	right: -38px;
	z-index: 0;
}

/* fixed 돌아가기버튼 설정 */
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
	left: 1px;
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
	font-size: 14px;
	font-family: 'Noto Sans KR', sans-serif;
}
</style>

</head>
<body>
	<div id="mainSideNav">
		<div id="mainSideNavKey"></div>
		<ul id="menu">
			<li><a href="<%=request.getContextPath()%>/manageMList.bo">회원관리</a></li>
			<li><a href="">게시판관리</a>
				<ul>
					<li><a href="">공지사항</a></li>
					<li><a href="">FAQ</a></li>
					<li><a href="<%=request.getContextPath()%>/manageQList.bo">QnA</a></li>
					<li><a href="">추모게시판</a></li>
				</ul></li>
			<li><a href="">장례예약관리</a></li>
			<li><a href="">보험관리</a></li>
			<li><a href="">더할거?</a></li>
		</ul>
	</div>
	
	<aside id="reservation">
		<p>
			<a href="<%=request.getContextPath() %>/index.jsp">Home</a>
		</p>
	</aside>

<script>
	var mainSideNav = document.getElementById('mainSideNav');
	mainSideNav.style.zIndex = 999;
	mainSideNav.style.position = 'absolute';
	mainSideNav.style.position = 'fixed';
// 	mainSideNav.style.top = '100px';
	mainSideNav.style.left = '-200px';
	mainSideNav.style.listStyleType = 'none';
	mainSideNav.style.width = '200px';
	mainSideNav.style.height = '750px';
	mainSideNav.style.backgroundColor = 'black';
	mainSideNav.style.opacity = '0.8';
	mainSideNav.style.transitionProperty = 'left';
	mainSideNav.style.transitionDuration = '1s';

	//메인 사이드바 클릭이벤트
	var mainSideNavKey = document.getElementById('mainSideNavKey');
	mainSideNavKey.onmouseenter = function() {
		mainSideNav.style.left = 0;
	}

	mainSideNav.onmouseleave = function() {
		mainSideNav.style.left = '-200px';
		// mainSideNavkey.
	}
</script>
