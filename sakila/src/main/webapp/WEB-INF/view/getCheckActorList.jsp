<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GET CHECK ACTOR</title>
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
			<h1>${FID} : CHECK ACTOR</h1>
		</div>
	<form action="${pageContext.request.contextPath}/admin/modifyCheckActor" method="post">
		<input type="hidden" name="FID" value="${FID}">
		
		<table>
			<tr>
		     <c:forEach var="a" items="${actorList}">
			 	<c:set var="i" value="${i + 1}" />
			    	<td>
				    	<c:if test="${a.ck == 'X'}">
							<input type="checkbox" name="ck" value="${a.actorId}">
						</c:if>
						<c:if test="${a.ck == 'O'}">
							<input type="checkbox" name="ck" checked="checked" value="${a.actorId}">
						</c:if>
							<span style="color:red;">${a.name.substring(0, 1)}</span>${a.name.substring(1)}&nbsp;
					</td>	
			    	<!-- 5열 출력 -->
			    	<c:if test="${i%5 == 0 }">
			    		</tr><tr>
			    	</c:if>
		     </c:forEach>
		     </tr>
		</table>
		<button class="btn btn-primary" type="submit">출연배우 수정</button>
	</form>
</div>
</div>
<div>
	<a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/getFilmOne?FID=${FID}">돌아가기</a>
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