<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>BOARD VIEW(spring mvc 방식)</title>
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
      console.log("document ready!");
      $('#btn').click(function(){
         console.log("btn click!");
         if ($('#username').val().length < 3){
            alert('username는 3자이상 이어야 합니다');
            $('#username').focus();
         } else if ($('#commentContent').val().length < 5) {
             alert('commentContent는 5자이상 이어야 합니다');
             $('#commentContent').focus();
         } else {
             $('#commentForm').submit();
         }
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
			<h1>BOARD ONE</h1>
		</div>
     <div class="table-responsive">	
    <table class="table table-hover mb-0">
         <tbody>
            <tr>
                <td>board_id :</td>
                <td>${boardMap.boardId}</td>
            </tr>
            <tr>
                <td>board_title :</td>
                <td>${boardMap.boardTitle}</td>
            </tr>
            <tr>
            	<td>board_content :</td>
            	<td>${boardMap.boardContent}</td>
            </tr>
            <tr>
                 <td>username :</td>
                 <td>${boardMap.username}</td>
            </tr>
            <tr>
                 <td>insert_date :</td>
                 <td>${boardMap.insertDate}</td>
            </tr>
            <tr>
            	<td>boardfile :
            		<div>
            			<a href="${pageContext.request.contextPath}/admin/addBoardfile?boardId=${boardMap.boardId}">파일추가</a>
            		</div>
            	</td>
            	<!-- boardfile 두개이상 출력될경우를 대비한 반복문 -->
            	<td>
            		<c:forEach var="f" items="${boardfileList}">
            			<div>
            				<a href="${pageContext.request.contextPath}/resource/${f.boardfileName}">${f.boardfileName}</a>
            				
            				<a  href="${pageContext.request.contextPath}/admin/removeBoardfile?boardfileId=${f.boardfileId}&boardfileName=${f.boardfileName}&boardId=${boardMap.boardId}">파일삭제</a>
            			</div>
            		</c:forEach>
            	</td>
            </tr>
        </tbody>
    </table>
       <div>
          <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/modifyBoard?boardId=${boardMap.boardId}">글수정</a>
          <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/removeBoard?boardId=${boardMap.boardId}">글삭제</a>
          <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/getBoardList">글목록</a>   
       </div>
   <div>
      <!-- 댓글입력 -->
      <form action="${pageContext.request.contextPath}/admin/addComment" id= "commentForm" method = "post">
         <input type = "hidden" name = "boardId" value="${boardMap.boardId}">
         <div>
            username : <input type = "text" id = "username" name = "username">
         </div>
         <div>
            comment
            <br>
            <textarea id="commentContent" name="commentContent" rows="3" cols="80"></textarea>
         </div>
         
         <div><button class="btn btn-primary" id="btn" type="button">댓글추가</button></div>
      </form>
	<!-- 댓글 목록 -->
      <table class="table">
         <c:forEach var="c" items="${commentList}">
            <tr>
               <td>${c.commentContent}</td>
               <td>${c.username}</td>
               <td>${c.insertDate}</td>
               <td><a href="${pageContext.request.contextPath}/admin/removeComment?commentId=${c.commentId}&boardId=${boardMap.boardId}"><button class="btn btn-secondary" type="button">삭제</button></a></td>
            </tr>
         </c:forEach>
      </table>
   </div>
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
</div>
</body>
</html>