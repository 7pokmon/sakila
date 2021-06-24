<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
<title>MODIFY FILM</title>
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
			<h1>MODIFY FILM</h1>
		</div>
      <form method="post" action="${pageContext.request.contextPath}/admin/modifyFilm">
         <input type="hidden" name="film.filmId" value="${filmId}">
         <table class="table table-hover">
            <tr>
            	<!-- 변경될 값 -->
               <td>title</td>
               <td>
                  <input type="text" name="film.title" id="title" class="form-control" value="${filmOne.title}">
               </td>
            </tr>
            <tr>
            	<!-- 변경될 값 -->
               <td>category</td>
               <td>
                  <select name="category.categoryId" id ="categoryId" class="form-control">
                     <c:forEach var="c" items="${categoryList}">
                        	<option value="${c.categoryId}">${c.name}</option>
                     </c:forEach>
                  </select>
               </td>
            </tr>
            <tr>
            	<!-- 변경될 값 -->
               <td>description</td>
               <td>
                  <textarea rows="5" cols="100" name="film.description" id="description" class="form-control" placeholder="${filmOne.description}"></textarea>
               </td>
            </tr>
            <tr>
               <td>releaseYear</td>
               <td>
                  <input type="text" name="film.releaseYear" id="releaseYear" class="form-control" value="${filmOne.releaseYear}"  readonly="readonly">
               </td>
            </tr>
            <tr>
               <td>language</td>
               <td>
                  <input type="text" name="film.language" id="language" class="form-control" value="${filmOne.languageId}" readonly="readonly">
               </td>
            </tr>
            <tr>
               <td>originalLanguage</td>
               <td>
                  <input type="text" name="film.originalLanguage" id="originalLanguage" class="form-control" value="${filmOne.originalLanguage}" readonly="readonly">
               </td>
            </tr>
            <tr>
               <td>rentalDuration</td>
               <td>
                  <input type="text" name="film.rentalDuration" id="rentalDuration" class="form-control" value="${filmOne.rentalDuration}" readonly="readonly">               
               </td>
            </tr>
            <tr>
               <td>rentalRate</td>
               <td>
                  <input type="text" name="film.rentalRate" id="rentalRate" class="form-control" value="${filmOne.rentalRate}" readonly="readonly">
               </td>
            </tr>
            <tr>
            	<!-- 변경될 값 -->
               <td>length</td>
               <td>
                  <input type="text" name="film.length" id="length" class="form-control" value="${filmOne.length}">
               </td>
            </tr>
            <tr>
               <td>replacementCost</td>
               <td>${filmOne.replacementCost}</td>
            </tr>
            <tr>
            	<!-- 변경될 값 -->
               <td>rating</td>
               <td>
                  <select name="film.rating" id ="rating" class="form-control">
                     <option value="G">G</option>
                     <option value="PG">PG</option>
                     <option value="PG-13">PG-13</option>
                     <option value="R">R</option>
                     <option value="NC-17">NC-17</option>
                  </select>
               </td>
            </tr>
            <tr>
               <td>specialFeatures</td>
               <td><input type="text" name="film.specialFeatures" id="rentalRate" class="form-control" value="${filmOne.specialFeatures}" readonly="readonly"></td>
            </tr>
         </table>
         
         <button id="btn" class="btn btn-secondary">등록</button>
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