<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GET INVENTORY LIST</title>
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
			<h1>GET INVENTORY LIST</h1>
		</div>
	<!-- 검색어 입력창 -->
    <form action="/admin/getInventoryList" method="get">
        <label for="searchWord">검색어(제목) :</label> 
        <input name="searchWord" type="text">
        <button type="submit">검색</button>
    </form>
    <form action="${pageContext.request.contextPath}/admin/getInventoryList">
	    <label for="StoreId">Store : </label> 
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
                <th>inventoryId</th>
                <th>storeId</th>
                <th>title</th>
                <th>rentalRate</th>
		        <th>rating</th>
		        <th>반납</th>	
		        <th>연체</th>
            </tr>
        </thead>
        <tbody>
        	<!-- 연제중인 inventory 빨간색 -->
        	<c:forEach var="i" items="${inventoryList}">
        		<c:if test="${i.returnDate == 'T'}">
			                <tr style="color:red">
			                	<td>${i.inventoryId}</td>
			                	<td>${i.storeId}</td>
			                	<td>
			                		${i.title}
			                		<a href="${pageContext.request.contextPath}/admin/getFilmOne?FID=${i.filmId}" style="color:red">[filmInfo]</a>
			                		<a href="${pageContext.request.contextPath}/admin/getRentalOne?inventoryId=${i.inventoryId}&title=${i.title}" style="color:red">[rentalInfo]</a>
			                	</td>								
								<td>${i.rentalRate}</td>
								<td>${i.rating}</td>
								<td>
									<c:if test="${i.rentalDate != 'T'}">
										<a class="btn btn-default" href="${pageContext.request.contextPath}/admin/modifyRentalDate?rentalId=${i.rentalId}&amount=${i.rentalRate}&overdue=${i.overdue}">반납</a>
									</c:if>
								</td>
								<td>${i.overdue}</td>
			                </tr>
			            </c:if>
			            <c:if test="${i.returnDate != 'T'}">
			                <tr>
			                	<td>${i.inventoryId}</td>
			                	<td>${i.storeId}</td>
			                	<td>
			                		${i.title}
			                		<a href="${pageContext.request.contextPath}/admin/getFilmOne?FID=${i.filmId}">[filmInfo]</a>
			                		<a href="${pageContext.request.contextPath}/admin/getRentalOne?inventoryId=${i.inventoryId}&title=${i.title}">[rentalInfo]</a>
			                	</td>								
								<td>${i.rentalRate}</td>
								<td>${i.rating}</td>
								<td></td>
								<td></td>
			                </tr>
			            </c:if>
        	</c:forEach>
        </tbody>
	</table>
	<a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/addInventory">addInventory</a>
	<ul class="pager">
        <c:if test="${currentPage > 1}">
            <li class="previous"><a href="${pageContext.request.contextPath}/admin/getInventoryList?currentPage=${currentPage-1}&searchWord=${searchWord}">이전</a></li>
        </c:if>
        <c:if test="${currentPage < lastPage}">
            <li class="next"><a href="${pageContext.request.contextPath}/admin/getInventoryList?currentPage=${currentPage+1}&searchWord=${searchWord}">다음</a></li>
        </c:if>
    </ul>
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