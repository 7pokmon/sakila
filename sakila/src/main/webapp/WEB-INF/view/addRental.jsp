<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADD REMTAL</title>
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
<script>
$(document).ready(function(){
	$('#amountBtn').click(function(){
		if($('#inventoryId').val() == ''){
			alert('inventoryId 입력');
		}else{
			$.ajax({
				type:'get',
				url:'${pageContext.request.contextPath}/amount',
				data:{inventoryId : $('#inventoryId').val()},
				success: function(jsonData) {
					$(jsonData).each(function(index, item) {
						if(item.rating == 'NC-17'){
							alert('연령 확인이 필요합니다.');
						}
						// attr 속성추가
						$('#inventoryId').attr('readonly','readonly');
						$('#title').append('<input type="text" name="title" value="'+item.title+'" readonly="readonly">');
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
			<h1>ADD RENTAL</h1>
		</div>
		<form method="post" action="${pageContext.request.contextPath}/admin/addRental" id="addForm">
			<input type="hidden" name="customerId" value="${customerId}">
    	<div class="table-responsive">	
    <table class="table table-hover mb-0">
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
					<td>title</td>
					<td>
						<span id="title"></span>
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
			</div>
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