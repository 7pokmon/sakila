<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FILM LIST</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendors/iconly/bold.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/app.css">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/assets/images/favicon.svg"
	type="image/x-icon">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>
	<div id="main">
		<div>
			<!-- include -->
			<jsp:include page="/WEB-INF/inc/menu.jsp"></jsp:include>
		</div>
		<header class="mb-3">
			<a href="#" class="burger-btn d-block d-xl-none"> <i
				class="bi bi-justify fs-3"></i>
			</a>
		</header>
		<div class="row" id="table-hover-row">
			<div class="card">
				<div class="page-heading">
					<h1>영화 목록</h1>
					<p>영화 상세정보로 들어가 배우수정 및 재고추가를 할수있습니다.</p>
				</div>
				<!-- 검색 폼내용 -->
				<!-- 
		1. 카테고리별
		2. 가격별
		3. 등급별
		4. 제목 검색
		5. 페이징
	-->
				<form id="filmForm"
					action="${pageContext.request.contextPath}/admin/getFilmList"
					method="get" class="form-inline">
					<select name="categoryVal" class="custom-select" id="categoryVal">
						<option value="">category</option>
						<c:forEach var="c" items="${categoryNameList}">
							<c:if test="${c.name == categoryVal}">
								<option value="${c.name}" selected="selected">${c.name}</option>
								<!-- 선택된 Val 검색시 선택상태로 유지 -->
							</c:if>
							<c:if test="${c.name != categoryVal}">
								<option value="${c.name}">${c.name}</option>
							</c:if>
						</c:forEach>
					</select>
					<!-- 가격별 -->
					<select name="priceVal" class="custom-select" id="priceVal">
						<option value="">price</option>
						<c:forEach var="name" items="${priceList}">
							<c:if test="${name == priceVal}">
								<option value="${name}" selected="selected">${name}</option>
								<!-- 선택된 Val 검색시 선택상태로 유지 -->
							</c:if>
							<c:if test="${name != priceVal}">
								<option value="${name}">${name}</option>
							</c:if>
						</c:forEach>
					</select>
					<!-- 등급별 -->
					<select name="ratingVal" class="custom-select" id="ratingVal">
						<option value="">rating</option>
						<c:forEach var="name" items="${ratingList}">
							<c:if test="${name == ratingVal}">
								<option value="${name}" selected="selected">${name}</option>
								<!-- 선택된 Val 검색시 선택상태로 유지 -->
							</c:if>
							<c:if test="${name != ratingVal}">
								<option value="${name}">${name}</option>
							</c:if>
						</c:forEach>
					</select>
					<!-- 검색어 입력창 -->
					<div class="col-sm-1">
						<label>title :</label>
					</div>
					<div class="col-sm-2">
						<input type="text" name="titleVal" class="form-control">
					</div>
					<div class="col-sm-1"></div>
					<div class="col-sm-1">
						<!-- 배우 검색 공간 -->
						<label>actor :</label>
					</div>
					<div class="col-sm-2">
						<input type="text" name="actorsVal" class="form-control">
					</div>

					<div class="col-sm-1">
						<!-- 버튼 공간 -->
						<button class="btn btn-secondary">검색</button>
					</div>

				</form>

				<div class="table-responsive">
					<table class="table table-hover mb-0">
						<thead>
							<tr>
								<th>FID</th>
								<th>title</th>
								<th>category</th>
								<th>price</th>
								<th>rating</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="f" items="${filmList}">
								<tr>
									<td>${f.FID}</td>
									<td><a
										href="${pageContext.request.contextPath}/admin/getFilmOne?FID=${f.FID}">${f.title}</a></td>
									<td>${f.category}</td>
									<td>${f.price}</td>
									<td>${f.rating}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div>
						<a class="btn btn-primary"
							href="${pageContext.request.contextPath}/admin/addFilm">영화추가</a>
					</div>
					<nav aria-label="Page navigation example">
						<ul class="pagination pagination-primary">
							<c:if test="${currentPage > 1}">
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/admin/getFilmList?currentPage=${currentPage-1}&categoryVal=${categoryVal}&priceVal=${priceVal}&ratingVal=${ratingVal}&titleVal=${titleVal}&actorsVal=${actorsVal}">이전</a></li>
							</c:if>
							<c:if test="${currentPage < lastPage}">
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/admin/getFilmList?currentPage=${currentPage+1}&categoryVal=${categoryVal}&priceVal=${priceVal}&ratingVal=${ratingVal}&titleVal=${titleVal}&actorsVal=${actorsVal}">다음</a></li>
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