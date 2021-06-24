<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>CUSTOMER ONE</title>
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
			<h1>CUSTOMER ONE</h1>
		</div>
    	<div class="table-responsive">	
    <table class="table table-hover mb-0">
        	<tbody>
            	<tr>
              		<td>customerId :</td>
            		<td>${customerOne.customerId}</td>
                </tr>
                <tr>
                   	<td>storeId :</td>
                    <td>${customerOne.storeId}</td>
                </tr>
                <tr>
                    <td>name :</td>
                    <td>${customerOne.name}</td>
                </tr>
                <tr>
                    <td>sumAmount :</td>
                    <td>${customerOne.sumAmount}</td>
                </tr>
                <tr>
                    <td>city :</td>
                    <td>${customerOne.city}</td>
                </tr>
                <tr>
                    <td>address :</td>
                    <td>${customerOne.address}</td>
                </tr>
                <tr>
                    <td>phone :</td>
                    <td>${customerOne.phone}</td>
                </tr>
                <tr>
                	<td>active :</td>
                	<td>${customerOne.active}</td>
                </tr>                       
       		</tbody>
     	</table>
     	<h3>영화 대여 기록</h3>
     	<a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/addRental?storeId=${customerOne.storeId}&customerId=${customerOne.customerId}">영화 대여</a>
     	<table class="table table-hover mb-0">
     		<tr>
     			<td>rentalId</td>
     			<td>inventoryId</td>
     			<td>title</td>
     			<td>rentalDate</td>
     			<td>returnDate</td>
     			<td>state</td>
     		</tr>
     		<c:forEach var="r" items="${rentalListByCustomer}">
     			<tr>
     				<td>${r.rentalId}</td>
     				<td>${r.inventoryId}</td>
     				<td><a href="${pageContext.request.contextPath}/admin/getFilmOne?FID=${r.FID}">${r.title}</a></td>
     				<td>${r.rentalDate}</td>
     				<td>${r.returnDate}</td>
     				<c:if test="${r.overdue == 'T'}">
     					<td>미반납일 : ${r.overdueDate} 초과</td>
     				</c:if>
     				<c:if test="${r.overdue != 'T'}">
     					<td>반납완료</td>
     				</c:if>
     			</tr>
     		</c:forEach>
     	</table>
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