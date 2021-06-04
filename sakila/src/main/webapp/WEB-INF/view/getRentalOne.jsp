<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
<div class="container">
	   	<div>
	    	<h1>inventoryId ${inventoryId}번 항목 대여기록</h1>
	    	<h3>${title}</h3>
	    </div>
	    	 <table class="table table-striped">
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
	    	<a class="btn btn-default" href="${pageContext.request.contextPath}/admin/getInventoryList">돌아가기</a>
	</div>
</body>
</html>