<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
$(document).ready(function(){
	console.log("document ready!");
	
	//setup edit
	let category = [];
	let sales = [];
	$.ajax({
		url:'/category',
		type:'get',
		success:function(json){
			$(json).each(function(index, item) { // 0번째 item {"rating":"G", "cnt":178}
				category.push(item.category);
				sales.push(item.sales);
			});
			// 3. chart view
			// 차트를 그리는 코드(Bar)
			var myChart = new Chart(document.getElementById('myChart'), config);
		}
	});	

	// 1. setup
	let data = {
		//데이터 이름 labels
	  labels: category,
	  datasets: [{
	    label: 'category',
	    // 데이터 값
	    data: sales,
	    // css
	    backgroundColor: [
	      'rgba(255, 99, 132, 0.2)',
	      'rgba(255, 159, 64, 0.2)',
	      'rgba(255, 205, 86, 0.2)',
	      'rgba(75, 192, 192, 0.2)',
	      'rgba(54, 162, 235, 0.2)'
	
	    ],
	    borderColor: [
	      'rgb(255, 99, 132)',
	      'rgb(255, 159, 64)',
	      'rgb(255, 205, 86)',
	      'rgb(75, 192, 192)',
	      'rgb(54, 162, 235)'
	    ],
	    borderWidth: 1
	  }]
	};
	
	// 2. config
	const config = {
			  type: 'bar',
			  data: data,
			  options: {
			    scales: {
			      y: {
			        beginAtZero: true
			      }
			    }
			  },
			};
	
	$('#btn').click(function(){
		console.log("btn click!");
		$('#loginForm').submit();
	});
});
</script>
</head>
<body>
	
	<h1>Home</h1>
	<!-- Log off -->
	<c:if test="${loginStaff == null}">
		<form id="loginForm" action="${pageContext.request.contextPath}/login" method="post">
			<div>
				email : 
			</div>
			<div>
				<input type="text" id="email" name="email">
			</div>
			<div>
				password : 
			</div>
			<div>
				<input type="password" id="password" name="password">
			</div>
			<div>
				<button id="btn" type="button">로그인</button>
			</div>
		</form>
	</c:if>
	<!-- Log in -->
	<c:if test="${loginStaff != null}">
		<div>
		<!-- include -->
		<jsp:include page="${pageContext.request.contextPath}/WEB-INF/inc/menu.jsp"></jsp:include>
	</div>
	</c:if>
	<div>
			<canvas id="myChart"></canvas>
	</div>
</body>
</html>