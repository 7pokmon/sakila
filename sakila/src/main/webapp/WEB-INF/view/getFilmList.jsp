<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FILM LIST</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$('#btn').click(function() {
			console.log("btn click!");
			$('#filmForm').submit();
		})
});
</script>
</head>
<body>
<div class="container">
	<h1>FILM LIST</h1>
	<!-- 검색 폼내용 -->
	<!-- 
		1. 카테고리별
		2. 가격별
		3. 등급별
		4. 제목 검색
		5. 페이징
	-->
	<form id="filmForm" action="${pageContext.request.contextPath}/admin/getFilmList" method="get">
		category : 
		<select name="categoryVal">
			<option value="">select category</option>
			<c:forEach var="name" items="${categoryNameList}">
				<c:if test="${name == categoryVal}">
					<option value="${name}" selected="selected">${name}</option>	<!-- 선택된 Val 검색시 선택상태로 유지 -->
				</c:if>
				<c:if test="${name != categoryVal}">
					<option value="${name}">${name}</option>
				</c:if>
			</c:forEach>
		</select>
		<!-- 가격별 -->
		price : 
		<select name="priceVal">
			<option value="">select price</option>
			<c:forEach var="name" items="${priceList}">
				<c:if test="${name == priceVal}">
					<option value="${name}" selected="selected">${name}</option>	<!-- 선택된 Val 검색시 선택상태로 유지 -->
				</c:if>
				<c:if test="${name != priceVal}">
					<option value="${name}">${name}</option>
				</c:if>
			</c:forEach>
		</select>
		<!-- 등급별 -->
		rating : 
		<select name="ratingVal">
			<option value="">select rating</option>
			<c:forEach var="name" items="${ratingList}">
				<c:if test="${name == ratingVal}">
					<option value="${name}" selected="selected">${name}</option>	<!-- 선택된 Val 검색시 선택상태로 유지 -->
				</c:if>
				<c:if test="${name != ratingVal}">
					<option value="${name}">${name}</option>
				</c:if>
			</c:forEach>
		</select>
		<!-- 검색어 입력창 -->
		<div>
			제목(${titleVal}) : 
	        <input name="titleVal" type="text">
	     	배우(${actorsVal}) : 
	        <input name="actorsVal" type="text">
	    </div>
		<button id="btn" type="button">검색</button>
	</form>

	<table  class="table table-striped">
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
        			<td><a href="${pageContext.request.contextPath}/admin/getFilmOne?FID=${f.FID}">${f.title}</a></td>
        			<td>${f.category}</td>
        			<td>${f.price}</td>
        			<td>${f.rating}</td>
        		</tr>
        	</c:forEach>
        </tbody>
	</table>
	
	 <ul class="pager">
        <c:if test="${currentPage > 1}">
            <li class="previous"><a href="${pageContext.request.contextPath}/admin/getFilmList?currentPage=${currentPage-1}&categoryVal=${categoryVal}&priceVal=${priceVal}&ratingVal=${ratingVal}&titleVal=${titleVal}&actorsVal=${actorsVal}">이전</a></li>
        </c:if>
        <c:if test="${currentPage < lastPage}">
            <li class="next"><a href="${pageContext.request.contextPath}/admin/getFilmList?currentPage=${currentPage+1}&categoryVal=${categoryVal}&priceVal=${priceVal}&ratingVal=${ratingVal}&titleVal=${titleVal}&actorsVal=${actorsVal}">다음</a></li>
        </c:if>
    </ul>
    <div>
		<a class="btn btn-default" href="${pageContext.request.contextPath}/home">돌아가기</a>
	</div>
</div>	
</body>
</html>