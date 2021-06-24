<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FILM ONE</title>
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
			<h1>FILM ONE</h1>
		</div>
	<div>
		1호점 재고량 : ${oneStore} 개
	</div>
	<div>
		2호점 재고량 : ${twoStore} 개
	</div>
	<div class="table-responsive">	
	<table class="table">
		<tr>
			<td>filmId : </td>	
			<td>${filmOne.filmId}</td>
		</tr>
		<tr>
			<td>title</td>
			<td>${filmOne.title}</td>
		</tr>
		<tr>
			<td>description : </td>	
			<td>${filmOne.description}</td>
		</tr>
		<tr>
			<td>actors : 
				<div>
					<a href="${pageContext.request.contextPath}/admin/getCheckActorList?FID=${filmOne.filmId}">modify actors</a>
				</div>
			</td>	
			<td>${filmOne.actors}</td>
		</tr>
		<tr>
			<td>releaseYear : </td>	
			<td>${filmOne.releaseYear}</td>
		</tr>
		<tr>
			<td>languageId : </td>	
			<td>${filmOne.languageId}</td>
		</tr>
		<tr>
			<td>rentalDuration : </td>	
			<td>${filmOne.rentalDuration}</td>
		</tr>
		<tr>
			<td>rentalRate : </td>	
			<td>${filmOne.rentalRate}</td>
		</tr>
		<tr>
			<td>length : </td>	
			<td>${filmOne.length}</td>
		</tr>
		<tr>
			<td>replacementCost : </td>	
			<td>${filmOne.replacementCost}</td>
		</tr>
		<tr>
			<td>rating : </td>	
			<td>${filmOne.rating}</td>
		</tr>
		<tr>
			<td>specialFeatures : </td>	
			<td>${filmOne.specialFeatures}</td>
		</tr>
		<tr>
			<td>lastUpdate : </td>	
			<td>${filmOne.lastUpdate}</td>
		</tr>
	</table>
	<a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/modifyFilm?filmId=${filmOne.filmId}">수정</a>
	<a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/removeFilm?filmId=${filmOne.filmId}">삭제</a>
	<a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/addInventory?filmId=${filmOne.filmId}">재고추가</a>
	<a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/getFilmList">돌아가기</a>
</div>
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