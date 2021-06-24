<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>GET BOARD LIST</title>
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
			<h1>GET BOARD LIST</h1>
		</div>
    
    <div class="row">
			<div class="col-3">
				<!-- 검색어 입력창 -->
				<form action="/admin/getActorList" method="get" class="form-inline">
			        <label for="searchWord">Search Board</label>
			        <input type="text" name="searchWord" id="helperText" class="form-control" placeholder="searchWord" value="${searchWord}">
				</form>
			</div>
			<div class="col-7"></div>
			<div class="col-2">
				<a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/addBoard">add board</a>
			</div>
		</div>
	<div class="table-responsive">	
    <table class="table table-hover mb-0">
        <thead>
            <tr>
            	<th>boardId</th>
                <th>boardTitle</th>
                <th>insertDate</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="b" items="${boardList}">
                <tr>
                	<td>${b.boardId}</td>
                    <td><a href="${pageContext.request.contextPath}/admin/getBoardOne?boardId=${b.boardId}">${b.boardTitle}</a></td>
                    <td>${b.insertDate}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <nav aria-label="Page navigation example">
    <ul class="pagination pagination-primary">
        <c:if test="${currentPage > 1}">
            <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/getBoardList?currentPage=${currentPage-1}&searchWord=${searchWord}">Prev</a></li>
        </c:if>
        <c:if test="${currentPage < lastPage}">
            <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/getBoardList?currentPage=${currentPage+1}&searchWord=${searchWord}">Next</a></li>
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