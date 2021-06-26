<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GET CUSTOMER</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/iconly/bold.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/app.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/favicon.svg" type="image/x-icon"> 
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
			<h1>고객 목록</h1>
			<p>고객 상세정보로 들어가 대여 기록 조회와 영화대여가 가능합니다.</p>
		</div>
	 <!-- 검색어 입력창 -->
    <form action="${pageContext.request.contextPath}/admin/getCustomerList" method="get">
        <input name="searchWord" type="text">
        <button type="submit" class="btn btn-light rounded-pill">검색</button>
    </form>
    <!-- 지점별  -->
	<div class="table-responsive">	
    <table class="table table-hover mb-0">
		<thead>
			<tr>
				<th>customerId</th>
				<th>name</th>
				<th>email</th>
				<th>storeId</th>
				<th>blackList</th>
				<th>vipList</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="c" items="${customerList}">
				<tr>
					<td>${c.customerId}</td>
					<td><a href="${pageContext.request.contextPath}/admin/getCustomerOne?customerId=${c.customerId}">${c.name}</a></td>
					<td>${c.email}</td>
					<td>${c.storeId}</td>
					<td>${c.blackList}</td>
					<td>${c.vipList}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/addCustomer">addCustomer</a>
	<nav aria-label="Page navigation example">
    <ul class="pagination pagination-primary">
        <c:if test="${currentPage > 1}">
            <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/getCustomerList?currentPage=${currentPage-1}&searchWord=${searchWord}">이전</a></li>
        </c:if>
        <c:if test="${currentPage < lastPage}">
            <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/getCustomerList?currentPage=${currentPage+1}&searchWord=${searchWord}">다음</a></li>
        </c:if>
    </ul>
    </nav>
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