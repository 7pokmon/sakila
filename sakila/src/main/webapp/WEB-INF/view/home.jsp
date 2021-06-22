<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			<div>
			<canvas id="myChart"></canvas>
		</div>
		</div>
		</c:if>

	<script src="${pageContext.request.contextPath}/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/vendors/apexcharts/apexcharts.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/pages/dashboard.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>