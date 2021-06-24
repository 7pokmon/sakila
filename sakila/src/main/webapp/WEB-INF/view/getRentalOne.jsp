<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RENTAL ONE</title>
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
			<h1>inventoryId ${inventoryId}번 항목 대여기록</h1>
	    	<h3>${title}</h3>
		</div>
	    	 <div class="table-responsive">	
	<table class="table table-hover mb-0">
		        <thead>
		            <tr>
		            	<th>rentalId</th>
		            	<th>rentalDate</th>
		                <th>returnDate</th>		                
		                <th>name</th>
		                <th>staffId</th>
		            </tr>
		        </thead>
		        <tbody>
		        	<c:forEach var="r" items="${rentalList}">
		                <tr>
		                	<td>${r.rentalId}</td>
		                	<td>${r.rentalDate}</td>
			            	<td>${r.returnDate}</td>			            	
			            	<td>${r.name}</td>
			            	<td>${r.staffId}</td>
		                </tr>
		          	</c:forEach>
		        </tbody>
	    	</table>
	    	<a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/getInventoryList">돌아가기</a>
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