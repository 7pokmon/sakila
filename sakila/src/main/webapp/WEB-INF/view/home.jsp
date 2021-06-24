<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sakila home</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendors/iconly/bold.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/app.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/pages/auth.css">	
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/assets/images/favicon.svg"
	type="image/x-icon">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
$(document).ready(function(){
	$('#btn').click(function(){
		console.log('btn click');
		$('#loginForm').submit();
		console.log('submit');
	});
	
	let categoryX = new Array();
	let categoryY = new Array();
	
	$.ajax({
		type:'get',
		url:'${pageContext.request.contextPath}/category',
		success: function(jsonData){
			$(jsonData).each(function(index, item){
				categoryX.push(item.category);
				categoryY.push(item.sales);	
			});
			
			let categoryChart = new Chart(document.getElementById('categoryChart'),config);	
		}
		
	});
	
	let data = {
			  labels: categoryX,
			  datasets: [{
			    label: '카테고리 별 매출',
			    data: categoryY,
			    fill: false,
			    backgroundColor: [
			        'rgba(255, 99, 132, 0.2)',
			        'rgba(255, 159, 64, 0.2)',
			        'rgba(255, 205, 86, 0.2)',
			        'rgba(75, 192, 192, 0.2)',
			        'rgba(54, 162, 235, 0.2)',
			        'rgba(153, 102, 255, 0.2)',
			        'rgba(201, 203, 207, 0.2)',
			        'rgba(221, 12, 125, 0.2)',
			        'rgba(12, 66, 164, 0.2)',
			        'rgba(38, 102, 66, 0.2)',
			        'rgba(10, 20, 30, 0.2)',
			        'rgba(100, 20, 30, 0.2)',
			        'rgba(50, 20, 80, 0.2)',
			        'rgba(10, 20, 100, 0.2)',
			        'rgba(50, 200, 30, 0.2)',
			        'rgba(200, 200, 100, 0.2)'
			      ],
			      borderColor: [
			        'rgb(255, 99, 132)',
			        'rgb(255, 159, 64)',
			        'rgb(255, 205, 86)',
			        'rgb(75, 192, 192)',
			        'rgb(54, 162, 235)',
			        'rgb(153, 102, 255)',
			        'rgb(201, 203, 207)',
			        'rgb(221, 12, 125)',
			        'rgb(12, 66, 164)',
			        'rgb(38, 102, 66)',
			        'rgb(10, 20, 30)',
			        'rgb(100, 20, 30)',
			        'rgb(50, 20, 80)',
			        'rgb(10, 20, 100)',
			        'rgb(50, 200, 30)',
			        'rgb(200, 200, 100)'
			      ]
			  }]
			};
	
	const config = {
			  type: 'bar',
			  data: data,
			};
	
	let rentalX = ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'];
	let rentalY = [0,0,0,0,0,0,0,0,0,0,0,0];
	
	
	$.ajax({
		type:'get',
		url:'${pageContext.request.contextPath}/rental',
		data:{year : $('#year').val()},
		success: function(jsonData){
			$(jsonData).each(function(index, item){
				rentalY[item.month-1]=item.count;
				console.log(rentalY[item.month]);
			});
			console.log(rentalY);
			let rentalChart = new Chart(document.getElementById('rentalChart'),config2);	
		}
		
	});
	
	let data2 = {
			  labels: rentalX,
			  datasets: [{
			    label: '월별 대여 수',
			    data: rentalY,
			    borderColor: 'rgb(255, 99, 132, 0.2)',
			    fill: false			
			  }]
			};
	
	let config2 = {
			  type: 'line',
			  data: data2,
			};
	
	$('#btn').click(function(){
		rentalY = [0,0,0,0,0,0,0,0,0,0,0,0];
		
		$('#rentalChart').remove();
		$('#rentalChartSpan').append('<canvas id="rentalChart"></canvas>');
		
		if($('#year').val() != ""){
			console.log($('#year').val());
			$.ajax({
				type:'get',
				url:'${pageContext.request.contextPath}/rental',
				data:{year : $('#year').val()},
				success: function(jsonData){
					$(jsonData).each(function(index, item){
						rentalY[item.month-1]=item.count;
						console.log(rentalY[item.month]);
					});
					console.log(rentalY);
					let rentalChart = new Chart(document.getElementById('rentalChart'),config2);	
				}
				
			});
			
			let data2 = {
					  labels: rentalX,
					  datasets: [{
					    label: '월별 대여 수',
					    data: rentalY,
					    borderColor: 'rgb(255, 99, 132, 0.2)',
					    fill: false			
					  }]
					};
			
			let config2 = {
					  type: 'line',
					  data: data2,
					  beginAtZero: true
					};
		}
		
	});
	
	let paymentX = ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'];
	let paymentY = [0,0,0,0,0,0,0,0,0,0,0,0];
	
	$.ajax({
		type:'get',
		url:'${pageContext.request.contextPath}/payment',
		data:{year : $('#pyear').val()},
		success: function(jsonData){
			$(jsonData).each(function(index, item){
				paymentY[item.month-1]=item.sum;
				console.log(paymentY[item.month]);
			});
			console.log(paymentY);
			let paymentChart = new Chart(document.getElementById('paymentChart'),config3);	
		}
		
	});
	
	let data3 = {
			  labels: paymentX,
			  datasets: [{
			    label: '월별 대여 금액',
			    data: paymentY,
			    borderColor: 'rgb(75, 192, 192, 0.2)',
			    fill: false			
			  }]
			};
	
	let config3 = {
			  type: 'line',
			  data: data3,
			};
	
	$('#pbtn').click(function(){
		paymentY = [0,0,0,0,0,0,0,0,0,0,0,0];
		
		$('#paymentChart').remove();
		$('#paymentChartSpan').append('<canvas id="paymentChart"></canvas>');
		
		if($('#pyear').val() != ""){
			console.log($('#pyear').val());
			$.ajax({
				type:'get',
				url:'${pageContext.request.contextPath}/payment',
				data:{year : $('#pyear').val()},
				success: function(jsonData){
					$(jsonData).each(function(index, item){
						paymentY[item.month-1]=item.sum;
						console.log(paymentY[item.month]);
					});
					console.log(paymentY);
					let paymentChart = new Chart(document.getElementById('paymentChart'),config3);	
				}
				
			});
			
			let data3 = {
					  labels: paymentX,
					  datasets: [{
					    label: '월별 대여 금액',
					    data: paymentY,
					    borderColor: 'rgb(75, 192, 192, 0.2)',
					    fill: false			
					  }]
					};
			
			let config3 = {
					  type: 'line',
					  data: data3
					};
		}
		
	});
});	
	/*
	$(document).ready(
			function() {
				console.log("document ready!");
				
				//setup edit
				let category = [];
				let sales = [];
				$.ajax({
					url : '${pageContext.request.contextPath}/category',
					type : 'get',
					success : function(json) {
						$(json).each(function(index, item) { // 0번째 item {"rating":"G", "cnt":178}
							category.push(item.category);
							sales.push(item.sales);
						});
						// 3. chart view
						// 차트를 그리는 코드(Bar)
						var myChart = new Chart(document
								.getElementById('myChart'), config);
					}
				});

				// 1. setup
				let data = {
					//데이터 이름 labels
					labels : category,
					datasets : [ {
						label : 'category',
						// 데이터 값
						data : sales,
						// css
						backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
								'rgba(255, 159, 64, 0.2)',
								'rgba(255, 205, 86, 0.2)',
								'rgba(75, 192, 192, 0.2)',
								'rgba(54, 162, 235, 0.2)'

						],
						borderColor : [ 'rgb(255, 99, 132)',
								'rgb(255, 159, 64)', 'rgb(255, 205, 86)',
								'rgb(75, 192, 192)', 'rgb(54, 162, 235)' ],
						borderWidth : 1
					} ]
				};

				// 2. config
				const config = {
					type : 'bar',
					data : data,
					options : {
						scales : {
							y : {
								beginAtZero : true
							}
						}
					},
				};

				$('#btn').click(function() {
					console.log("btn click!");
					//$('#loginForm').submit();
				});
			});
	*/
</script>
</head>
<body>
 <!-- Log off -->
   <c:if test="${loginStaff == null}">
   <div id="auth">
        <div class="row h-100">
            <div class="col-lg-5 col-12">
                <div id="auth-left">
                    <div class="auth-logo">
                        <a href="index.html"><img src="${pageContext.request.contextPath}/assets/images/logo/logo.png" alt="Logo"></a>
                    </div>
                    <h1 class="auth-title">Log in.</h1>
                    <p class="auth-subtitle mb-5">Log in with your data that you entered during registration.</p>

                    <form id="loginForm" action="${pageContext.request.contextPath}/login" method="post">
                        <div class="form-group position-relative has-icon-left mb-4">
                            <input type="text" class="form-control form-control-xl" placeholder="Username" id="email" name="email" value="Mike@gd.com">
                            <div class="form-control-icon">
                                <i class="bi bi-person"></i>
                            </div>
                        </div>
                        <div class="form-group position-relative has-icon-left mb-4">
                            <input type="password" class="form-control form-control-xl" placeholder="Password" id="password" name="password" value="1234">
                            <div class="form-control-icon">
                                <i class="bi bi-shield-lock"></i>
                            </div>
                        </div>
                        <div class="form-check form-check-lg d-flex align-items-end">
                            <input class="form-check-input me-2" type="checkbox" value="" id="flexCheckDefault">
                            <label class="form-check-label text-gray-600" for="flexCheckDefault">
                                Keep me logged in
                            </label>
                        </div>
                        <button class="btn btn-primary btn-block btn-lg shadow-lg mt-5" id="btn" type="submit">Log in</button>
                    </form>
                    <div class="text-center mt-5 text-lg fs-4">
                        <p><a class="font-bold" href="auth-forgot-password.html">Forgot password?</a>.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-7 d-none d-lg-block">
                <div id="auth-right">

                </div>
            </div>
        </div>
    </div>
   </c:if>
		<!-- Log in -->
		<c:if test="${loginStaff != null}">
		<div id="main">
		<header class="mb-3">
			<a href="#" class="burger-btn d-block d-xl-none"> <i
				class="bi bi-justify fs-3"></i>
			</a>
		</header>

		<div class="page-heading">
			<h1>Home</h1>
		</div>
			<div>
				<!-- include -->
				<jsp:include
					page="/WEB-INF/inc/menu.jsp"></jsp:include>
			</div>
			<div class="page-content">
				<section class="row">
					<div class="col-12 col-lg-12">
		            	<div class="row">
		               		<div class="col-6 col-lg-6 col-md-6">	
								<div class="card">
									<br>
									<div class="row">
										<div class="col-1"></div>
										<div class="col-8">											
											<input type="text" name="year" id="year" class="form-control" >
										</div>
										<div class="col-3">
											<button id="btn" type="button" class="btn btn-secondary">보기</button>
										</div>
									</div>
									<br>
					 				<span id="rentalChartSpan"><canvas id="rentalChart"></canvas></span>
					 				<br>
								</div>
							</div>
							<div class="col-6 col-lg-6 col-md-6">	
								<div class="card">
									<br>
									<div class="row">
										<div class="col-1"></div>
										<div class="col-8">				
											<input type="text" name="pyear" id="pyear" class="form-control">
										</div>
										<div class="col-3">
											<button id="pbtn" type="button" class="btn btn-secondary">보기</button>
										</div>
									</div>
									<br>
					 				<span id="paymentChartSpan"><canvas id="paymentChart"></canvas></span>
					 				<br>
								</div>
							</div>
						</div>
					</div>
					<div class="card">
		 				<canvas id="categoryChart"></canvas>
					</div>
				</section>
			</div>
		</c:if>

	<script src="${pageContext.request.contextPath}/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/vendors/apexcharts/apexcharts.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/pages/dashboard.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>