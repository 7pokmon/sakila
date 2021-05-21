<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADD BOARD FILE</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
   $(document).ready(function(){
      console.log("document ready!");
      $('#btn').click(function(){
         console.log("btn click!");
         $('#addBoardfileForm').submit();
      });
   });
</script>
</head>
<body>
	<h1>파일추가</h1>
	<form id="addBoardfileForm" 
		  action="${pageContext.request.contextPath}/admin/addBoardfile" 
		  enctype="multipart/form-data"
		  method="post">
		<div>
			boardId : <input type="text" id="boardId" name="boardId" value="${boardId}" readonly="readonly">
		</div>
		<div>
			<input type="file" id="multipartFile" name="multipartFile">
		</div>
		<button id="btn" type="button">파일추가</button>
	</form>
</body>
</html>