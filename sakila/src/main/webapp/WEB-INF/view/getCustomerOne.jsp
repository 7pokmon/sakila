<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>CUSTOMER ONE</title>
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
	<h1>CUSTOMER ONE</h1>
    	<table class="table table-striped">
        	<tbody>
            	<tr>
              		<td>customerId :</td>
            		<td>${customerOne.customerId}</td>
                </tr>
                <tr>
                   	<td>storeId :</td>
                    <td>${customerOne.storeId}</td>
                </tr>
                <tr>
                    <td>name :</td>
                    <td>${customerOne.name}</td>
                </tr>
                <tr>
                    <td>sumAmount :</td>
                    <td>${customerOne.sumAmount}</td>
                </tr>
                <tr>
                    <td>city :</td>
                    <td>${customerOne.city}</td>
                </tr>
                <tr>
                    <td>address :</td>
                    <td>${customerOne.address}</td>
                </tr>
                <tr>
                    <td>phone :</td>
                    <td>${customerOne.phone}</td>
                </tr>
                <tr>
                	<td>active :</td>
                	<td>${customerOne.active}</td>
                </tr>                       
       		</tbody>
     	</table>
     	<h3>영화 대여 기록</h3>
     	<a href="${pageContext.request.contextPath}/admin/addRental?storeId=${customerOne.storeId}&customerId=${customerOne.customerId}">rental</a>
     	<table class="table table-striped">
     		<tr>
     			<td>rentalId</td>
     			<td>inventoryId</td>
     			<td>title</td>
     			<td>rentalDate</td>
     			<td>returnDate</td>
     			<td>state</td>
     		</tr>
     		<c:forEach var="r" items="${rentalListByCustomer}">
     			<tr>
     				<td>${r.rentalId}</td>
     				<td>${r.inventoryId}</td>
     				<td><a href="${pageContext.request.contextPath}/admin/getFilmOne?FID=${r.FID}">${r.title}</a></td>
     				<td>${r.rentalDate}</td>
     				<td>${r.returnDate}</td>
     				<c:if test="${r.overdue == 'T'}">
     					<td>미반납일 : ${r.overdueDate} 초과</td>
     				</c:if>
     				<c:if test="${r.overdue != 'T'}">
     					<td>반납완료</td>
     				</c:if>
     			</tr>
     		</c:forEach>
     	</table>
</div>
</body>
</html>