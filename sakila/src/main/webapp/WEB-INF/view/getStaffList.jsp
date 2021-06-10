<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>STAFF LIST</title>
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
	<h1>STAFF LIST</h1>
<form action="${pageContext.request.contextPath}/admin/getStaffList">
	    <label for="storeId">Store : </label> 
	    <select name="storeId" id="storeId">
	    	<option value="">전체</option>
	    	<option value="1">1</option>
	    	<option value="2">2</option>
	    </select>
    	<button class="btn btn-default">보기</button>
 </form>
	<table  class="table table-striped">
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
	<div>
		<a class="btn btn-default" href="${pageContext.request.contextPath}/home">돌아가기</a>
		<a class="btn btn-default" href="${pageContext.request.contextPath}/admin/addStaff">직원추가</a>
	</div>
</div>	
</body>
</html>