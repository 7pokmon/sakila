<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>STAFF LIST</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/iconly/bold.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/app.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/favicon.svg" type="image/x-icon">


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
			<h1>GET STAFF LIST</h1>
		</div>
<form action="${pageContext.request.contextPath}/admin/getStaffList">
	    <label for="storeId">Store : </label> 
	    <select name="storeId" id="storeId">
	    	<option value="">전체</option>
	    	<option value="1">1</option>
	    	<option value="2">2</option>
	    </select>
    	<button class="btn btn-default">보기</button>
 </form>
<div class="table-responsive">	
    <table class="table table-hover mb-0">
        <thead>
            <tr>
                <th>ID</th>
                <th>name</th>
                <th>Address</th>
                <th>zip code</th>
                <th>phone</th>
                <th>city</th>
                <th>country</th>
                <th>SID</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach var="s" items="${staffList}">
        		<tr>
        			<td>${s.ID}</td>
        			<td>${s.name}</td>
        			<td>${s.address}</td>
        			<td>${s.zipCode}</td>
        			<td>${s.phone}</td>
        			<td>${s.city}</td>
        			<td>${s.country}</td>
        			<td>${s.SID}</td>
        		</tr>
        	</c:forEach>
        </tbody>
	</table>
	</div>
	<div>
		<a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/addStaff">직원추가</a>
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