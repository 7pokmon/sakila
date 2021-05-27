<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
	console.log("document ready!");
	$('#btn').click(function(){
		console.log("btn click!");
		$('#loginForm').submit();
	});
});
</script>
</head>
<body>
	<h1>Home</h1>
	<!-- Log off -->
	<c:if test="${loginStaff == null}">
		<form id="loginForm" action="${pageContext.request.contextPath}/login" method="post">
			<div>
				email : 
			</div>
			<div>
				<input type="text" id="email" name="email">
			</div>
			<div>
				password : 
			</div>
			<div>
				<input type="password" id="password" name="password">
			</div>
			<div>
				<button id="btn" type="button">로그인</button>
			</div>
		</form>
	</c:if>
	<!-- Log in -->
	<c:if test="${loginStaff != null}">
		<a href="${pageContext.request.contextPath}/admin/getBoardList">게시판</a>
		<a href="${pageContext.request.contextPath}/admin/getActorList">배우정보 리스트</a>
		<a href="${pageContext.request.contextPath}/admin/getFilmList">영화목록</a>
		<a href="${pageContext.request.contextPath}/admin/getStaffList">직원리스트</a>
		<a href="${pageContext.request.contextPath}/admin/logout">로그아웃</a>
	</c:if>

</body>
</html>