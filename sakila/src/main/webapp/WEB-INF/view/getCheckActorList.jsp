<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GET CHECK ACTOR</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

</head>
<body>
<div class="container">
	<h1>${FID} : CHECK ACTOR</h1>
	<form action="${pageContext.request.contextPath}/admin/modifyCheckActor" method="post">
		<input type="hidden" name="FID" value="${FID}">
		
		<table>
			<tr>
		     <c:forEach var="a" items="${actorList}">
			 	<c:set var="i" value="${i + 1}" />
			    	<td>
				    	<c:if test="${a.ck == 'X'}">
							<input type="checkbox" name="ck" value="${a.actorId}">
						</c:if>
						<c:if test="${a.ck == 'O'}">
							<input type="checkbox" name="ck" checked="checked" value="${a.actorId}">
						</c:if>
							<span style="color:red;">${a.name.substring(0, 1)}</span>${a.name.substring(1)}&nbsp;
					</td>	
			    	<!-- 5열 출력 -->
			    	<c:if test="${i%5 == 0 }">
			    		</tr><tr>
			    	</c:if>
		     </c:forEach>
		     </tr>
		</table>
		<button class="btn btn-default" type="submit">출연배우 수정</button>
	</form>
	
	
	
	<a class="btn btn-default" href="${pageContext.request.contextPath}/admin/getFilmOne?FID=${FID}">돌아가기</a>
</div>	
</body>
</html>