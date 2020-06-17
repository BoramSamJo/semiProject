<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	body{
		background:url('<%=request.getContextPath() %>/images/city1.PNG') no-repeat;
		background-size:cover;
	}
	
	
	#loginBtn input, #memberJoinBtn, #logoutBtn, #myPage{
		display:inline-block;
		verticla-align:middle;
		text-align:center;
		background:orangered;
		color:white;
		height:25px;
		width:100px;
		border-radius:5px;
	}
	#memberJoinBtn {
		background:yellowgreen;
	}
	#loginBtn:hover, #changeInfo:hover, #logoutBtn:hover, #memberJoinBtn:hover, #myPage:hover{
		cursor:pointer;
	}
	.loginArea > form, #userInfo {
		float:right;
	}
	#logout, #myPage {
		background:orangered;
		color:white;
		text-decoration:none;
		border-radius:5px;
	}
	#myPage {
		background:yellowgreen;
	}
	
	.wrap {
		background:black;
		width:100%;
		height:50px;
	}
	.menu {
		background:black;
		color:white;
		text-align:center;
		vertical-align:middle;
		width:150px;
		height:50px;
		display:table-cell;
	}
	.nav {
		width:600px;
		margin-left:auto;
		margin-right:auto;
	}
	.menu:hover {
		background:darkgray;
		color:orangered;
		font-weight:bold;
		cursor:pointer;
	}
</style>

<body>

	<form id="loginForm" action="<%=request.getContextPath()%>/user.me " mathod="get">
		<table>
			<tr>
				<td><label>ID : </label></td>
				<td><input type="text" name="userId" id="userId"></td>
			</tr>
			<tr>
				<td colspan="2"><button  onclick="loginBtn();">로그인</td>
			</tr>
		</table>
	</form>
</body>
</html>