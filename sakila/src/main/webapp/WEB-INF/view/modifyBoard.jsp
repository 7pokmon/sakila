<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>BOARD VIEW(spring mvc 방식)</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/iconly/bold.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/app.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/favicon.svg" type="image/x-icon">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
	console.log("document ready!");
	$('#btn').click(function(){
		console.log("btn click!");
		// 폼 유효성 검사
		$('#modifyForm').submit();
	});
});
</script>
</head>
<body>
	<div id="main">
		<div>
			<!-- include -->
			<jsp:include
				page="/WEB-INF/inc/menu.jsp"></jsp:include>
		</div>
		<header class="mb-3">
			<a href="#" class="burger-btn d-block d-xl-none"> <i
				class="bi bi-justify fs-3"></i>
			</a>
		</header>
		<div class="row" id="table-hover-row">
		<div class="card">
		<div class="page-heading">
			<h1>BOARD MODIFY</h1>
		</div>
		<form id="modifyForm" action="${pageContext.request.contextPath}/admin/modifyBoard" method="post">
			<table class="table">
				<tbody>
					<tr>
						<td>boardId :</td>
						<td><input type="text" id="boardId" name="boardId" value="${boardMap.boardId}" readonly="readonly"></td>
					</tr>
					<tr>
						<td>boardTitle :</td>
						<td>
							<input type="text" id="boardTitle" name="boardTitle" value="${boardMap.boardTitle}">
						</td>
					</tr>
					<tr>
						<td>boardPw :</td>
						<td>
							<input type="password" id="boardPw" name="boardPw">
						</td>
					</tr>
					<tr>
						<td>boardContent :</td>
						<td>
							<textarea id="boardContent" name="boardContent" rows="5" cols="80">${boardMap.boardContent}</textarea>
						</td>
					</tr>
					<tr>
						<td>username :</td>
						<td>${boardMap.username}</td>
					</tr>
					<tr>
						<td>insertDate :</td>
						<td>${boardMap.insertDate}</td>
					</tr>
				</tbody>
			</table>
			<button class="btn btn-secondary" id="btn" type="button">수정</button>
		</form>
	</div>
	</div>
	</div>
<script
		src="${pageContext.request.contextPath}/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/vendors/apexcharts/apexcharts.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/pages/dashboard.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>