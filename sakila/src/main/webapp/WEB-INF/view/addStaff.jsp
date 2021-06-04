<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADD STAFF</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	console.log('country 목록');
	$.ajax({
		type:'get',
		url:'/country',
		success: function(jsonData) {
			$('#country').empty();
			$(jsonData).each(function(index, item) {
				$('#country').append(
					'<option value="'+item.countryId+'">'+item.country+'</option>'
				);
			});
		}
	}); // courntry 목록을 받아와서 country select 태그안에 option태그를 추가
	
	$('#country').change(function(){
		console.log('city 목록');
		$.ajax({
			type:'get',
			url:'/city',
			data:{countryId : $('#country').val()},
			success: function(jsonData) {
				$('#city').empty();
				$(jsonData).each(function(index, item) {
					$('#city').append(
						'<option value="'+item.cityId+'">'+item.city+'</option>'
					);
				});
			}
		}); // city 목록을 받아와서 city select 태그안에 option태그를 추가
	});
	// form 유효성검사 공백만 처리..
	$('#btn').click(function() {
		if ($('#firstName').val() == '') {
            alert('firstName을 입력하세요');
            $('#firstName').focus();
		} else if($('#lastName').val() == '') {
			alert('lastName을 입력하세요');
            $('#lastName').focus();
		} else if($('#email').val() == '') {
			alert('email을 입력하세요');
            $('#email').focus();
		} else if($('#password').val() == '') {
			alert('password을 입력하세요');
            $('#password').focus();
		} else if($('#username').val() == '') {
			alert('username을 입력하세요');
            $('#username').focus();
		} else if($('#city').val() == '') {
			alert('city을 입력하세요');
            $('#city').focus();
		} else if($('#address').val() == '') {
			alert('address을 입력하세요');
            $('#address').focus();
		} else if($('#district').val() == '') {
			alert('district을 입력하세요');
            $('#district').focus();
		} else if($('#postalCode').val() == '') {
			alert('postalCode을 입력하세요');
            $('#postalCode').focus();
		} else if($('#phone').val() == '') {
			alert('phone을 입력하세요');
            $('#phone').focus();
		} else {
			 $('#addForm').submit();
		}
		
	});
});
</script>
</head>
<body>
	 <div class="container">
        <h1>ADD STAFF</h1>
        <form id="addForm" action="${pageContext.request.contextPath}/admin/addStaff" method="post">    
            <table class="table table-hover">
            	<tr>
            		<td>firstName</td>
            		<td><input class="form-control" name="staff.firstName" id="firstName" type="text"></td>
            	</tr>
            	<tr>
            		<td>lastName</td>
            		<td><input class="form-control" name="staff.lastName" id="lastName" type="text"></td>
            	</tr>
            	<tr>
            		<td>picture</td>
            		<td> <input name="staff.picture" id="picture" type="file"></td>
            	</tr>
            	<tr>
            		<td>email</td>
            		<td><input class="form-control" name="staff.email" id="email" type="text"></td>
            	</tr>
            	<tr>
            		<td>password</td>
            		<td><input class="form-control" name="staff.password" id="password" type="text"></td>
            	</tr>
            	<tr>
            		<td>storeId</td>
            		<td>
            			<select name="staff.storeId" id="storeId">               	
		                	<option value="1">1</option>
		                	<option value="2">2</option>
		                </select>
            		</td>
            	</tr>
            	<tr>
            		<td>username</td>
            		<td><input class="form-control" name="staff.username" id="username" type="text"></td>
            	</tr>
            </table>
			<h3>Address</h3>
			<table class="table table-hover">
				<tr>
            		<td>select Address</td>
            		<td>
            			<select name="country" id="country" class="select"></select>
						<select name="address.cityId" id="city" class="select"></select>
						<input class="form-control" name="address.address" id="address" type="text" value="adress">
						<input class="form-control" name="address.address2" id="address2" type="text" value="adress2">
            		</td>
            	</tr>
            	<tr>
            		<td>district</td>
            		<td><input class="form-control" name="address.district" id="district" type="text"></td>
            	</tr>
            	<tr>
            		<td>postalCode</td>
            		<td><input class="form-control" name="address.postalCode" id="postalCode" type="text"></td>
            	</tr>
            	<tr>
            		<td>phone</td>
            		<td><input class="form-control" name="address.phone" id="phone" type="text"></td>
            	</tr>
			</table>
            <button id="btn" class="btn btn-secondary" type="button">add</button>
        </form>
    </div>
</body>
</html>