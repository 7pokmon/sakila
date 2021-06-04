<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADD INVENTORY</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('#btn').click(function(){
		if($('#count').val() == ''){
			alert('추가할 수량을 입력하세요');
		} else {
			$('#addForm').submit();
		}
	});
});
</script>
</head>
<body>
<div class="container">
	<h1>ADD INVENTORY</h1>
	<form method="post" action="${pageContext.request.contextPath}/admin/addInventory" id="addForm">
	<input type="hidden" name="filmId" value="${filmOne.filmId}">
		<table class="table">
			<tr>
				<td>filmId : </td>	
				<td>${filmOne.filmId}</td>
			</tr>
			<tr>
				<td>title</td>
				<td>${filmOne.title}</td>
			</tr>
			<tr>
				<td>description : </td>	
				<td>${filmOne.description}</td>
			</tr>
			<tr>
				<td>actors : </td>	
				<td>${filmOne.actors}</td>
			</tr>
			<tr>
				<td>releaseYear : </td>	
				<td>${filmOne.releaseYear}</td>
			</tr>
			<tr>
				<td>languageId : </td>	
				<td>${filmOne.languageId}</td>
			</tr>
			<tr>
				<td>rentalDuration : </td>	
				<td>${filmOne.rentalDuration}</td>
			</tr>
			<tr>
				<td>rentalRate : </td>	
				<td>${filmOne.rentalRate}</td>
			</tr>
			<tr>
				<td>length : </td>	
				<td>${filmOne.length}</td>
			</tr>
			<tr>
				<td>replacementCost : </td>	
				<td>${filmOne.replacementCost}</td>
			</tr>
			<tr>
				<td>rating : </td>	
				<td>${filmOne.rating}</td>
			</tr>
			<tr>
				<td>specialFeatures : </td>	
				<td>${filmOne.specialFeatures}</td>
			</tr>
			<tr>
				<td>lastUpdate : </td>	
				<td>${filmOne.lastUpdate}</td>
			</tr>
			<tr>
				<td>storeId</td>
				<td>
					<select name="storeId">
						<option value="1">1</option>
						<option value="2">2</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>count</td>
				<td>
					<input type="text" name="count" id="count">
				</td>
			</tr>
		</table>
		<button id="btn" type="button">add Inventory</button>
	</form>	
</div>	
</body>
</html>