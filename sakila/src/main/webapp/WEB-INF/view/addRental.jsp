<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADD REMTAL</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('#amountBtn').click(function(){
		if($('#inventoryId').val() == ''){
			alert('inventoryId 입력');
		}else{
			$.ajax({
				type:'get',
				url:'/amount',
				data:{inventoryId : $('#inventoryId').val()},
				success: function(jsonData) {
					$(jsonData).each(function(index, item) {
						if(item.rating == 'NC-17'){
							alert('연령 확인이 필요합니다.');
						}
						// attr 속성추가
						$('#inventoryId').attr('readonly','readonly');
						$('#rentalDuration').append('<input type="text" name="rentalDuration" value="'+item.rentalDuration+'" readonly="readonly">');
						$('#amount').append('<input type="text" name="amount" value="'+item.amount+'" readonly="readonly">');	
						$('#rentalBtn').append('<button id="btn">대여</button>');
						$('#amountBtn').remove();
					});					
				}	
			});			
		}		
	});
	
	$('#btn').click(function(){
		$('#addForm').submit();
	});
	
	
});
</script>
</head>
<body>
	<div class="container">
		<h1>ADD RENTAL</h1>
		<form method="post" action="${pageContext.request.contextPath}/admin/addRental" id="addForm">
			<input type="hidden" name="customerId" value="${customerId}">
			<table class="table table-striped">
				<tr>
					<td>staff</td>
					<td>
						<select name="staffId" id="staffId">
							<c:forEach var="s" items="${staffList}">
								<option value="${s.SID}">${s.name}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>inventoryId</td>
					<td>
						<input type="text" name="inventoryId" id="inventoryId">
					</td>
				</tr>
				<tr>
					<td>rentalDuration</td>
					<td>
						<span id="rentalDuration"></span>
					</td>
				</tr>
				<tr>
					<td>amount</td>
					<td>
						<span id="amount"></span>
					</td>
				</tr>
			</table>		
			<button id="amountBtn" type="button">입력</button>
			<span id="rentalBtn"></span>
		</form>		
	</div>
</body>
</html>