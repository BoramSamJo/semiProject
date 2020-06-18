<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> 
안뇽??
이것은 메인페이지..ㅋㅋ
<div id = "noticeBoard" onclick="goNotice()">고객센터</div>
	
	<script>
		function goNotice(){
			location.href="<%=request.getContextPath()%>/list.bo"; 
		}
	</script>
</body>
</html>
