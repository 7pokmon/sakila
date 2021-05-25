<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FILM ONE</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

</head>
<body>
<div class="container">
	<h1>FILM ONE</h1>
	<div>
		1호점 재고량 : ${oneStore} 개
	</div>
	<div>
		2호점 재고량 : ${twoStore} 개
	</div>
	<table class="table">
		<tr>
			<td>FID : </td>	
			<td>${filmOne.FID}</td>
		</tr>
		<tr>
			<td>title : </td>	
			<td>${filmOne.title}</td>
		</tr>
		<tr>
			<td>description : </td>	
			<td>${filmOne.description}</td>
		</tr>
		<tr>
			<td>category : </td>	
			<td>${filmOne.category}</td>
		</tr>
		<tr>
			<td>price : </td>	
			<td>${filmOne.price}</td>
		</tr>
		<tr>
			<td>length : </td>	
			<td>${filmOne.length}</td>
		</tr>
		<tr>
			<td>rating : </td>	
			<td>${filmOne.rating}</td>
		</tr>
		<tr>
			<td>actors : </td>	
			<td>${filmOne.actors}</td>
		</tr>
	</table>
	<a class="btn btn-default" href="${pageContext.request.contextPath}/admin/getFilmList">돌아가기</a>
</div>
</body>
</html>