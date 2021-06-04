<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GET INVENTORY LIST</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
	<h1>INVENTORY LIST</h1>
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
	<table class="table table-striped">
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
										<a class="btn btn-default" href="${pageContext.request.contextPath}/admin/modifyRentalDate?rentalId=${i.rentalId}">반납</a>
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
	<a class="btn btn-default" href="${pageContext.request.contextPath}/admin/addInventory">addInventory</a>
	<ul class="pager">
        <c:if test="${currentPage > 1}">
            <li class="previous"><a href="${pageContext.request.contextPath}/admin/getInventoryList?currentPage=${currentPage-1}&searchWord=${searchWord}">이전</a></li>
        </c:if>
        <c:if test="${currentPage < lastPage}">
            <li class="next"><a href="${pageContext.request.contextPath}/admin/getInventoryList?currentPage=${currentPage+1}&searchWord=${searchWord}">다음</a></li>
        </c:if>
    </ul>
</div>	
</body>
</html>