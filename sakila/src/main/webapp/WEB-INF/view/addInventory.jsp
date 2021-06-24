<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADD INVENTORY</title>
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
	$('#btn').click(function(){
		if($('#count').val() == ''){
			alert('추가할 수량을 입력하세요');
		} else {
			$('#addForm').submit();
		}
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
			<h1>ADD INVENTORY</h1>
		</div>
	<form method="post" action="${pageContext.request.contextPath}/admin/addInventory" id="addForm">
	<input type="hidden" name="filmId" value="${filmOne.filmId}">
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
				<td>actors : </td>	
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
			<tr>
				<td>storeId</td>
				<td>
					<select name="storeId">
						<option value="1">1</option>
						<option value="2">2</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>count</td>
				<td>
					<input type="text" name="count" id="count">
				</td>
			</tr>
		</table>
		<button class="btn btn-secondary" id="btn" type="button">add Inventory</button>
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