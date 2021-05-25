<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>BOARD VIEW(spring mvc 방식)</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
   $(document).ready(function(){
      console.log("document ready!");
      $('#btn').click(function(){
         console.log("btn click!");
         if ($('#username').val().length < 3){
            alert('username는 3자이상 이어야 합니다');
            $('#username').focus();
         } else if ($('#commentContent').val().length < 10) {
             alert('commentContent는 10자이상 이어야 합니다');
             $('#commentContent').focus();
         } else {
             $('#commentForm').submit();
         }
      });
   });
</script>
 
</head>
<body>
<div class="container">
    <h1>BOARD VIEW</h1>
     <table class="table">
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
            				
            				<a href="${pageContext.request.contextPath}/admin/removeBoardfile?boardfileId=${f.boardfileId}&boardfileName=${f.boardfileName}&boardId=${boardMap.boardId}">파일삭제</a>
            			</div>
            		</c:forEach>
            	</td>
            </tr>
        </tbody>
    </table>
       <div>
          <a class="btn btn-default" href="${pageContext.request.contextPath}/admin/modifyBoard?boardId=${boardMap.boardId}">글수정</a>
          <a class="btn btn-default" href="${pageContext.request.contextPath}/admin/removeBoard?boardId=${boardMap.boardId}">글삭제</a>
          <a class="btn btn-default" href="${pageContext.request.contextPath}/admin/getBoardList">글목록</a>   
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
         
         <div><button class="btn btn-default" id="btn" type="button">댓글추가</button></div>
      </form>
	<!-- 댓글 목록 -->
      <table class="table">
         <c:forEach var="c" items="${commentList}">
            <tr>
               <td>${c.commentContent}</td>
               <td>${c.username}</td>
               <td>${c.insertDate}</td>
               <td><a href="${pageContext.request.contextPath}/admin/removeComment?commentId=${c.commentId}&boardId=${boardMap.boardId}"><button type="button">삭제</button></a></td>
            </tr>
         </c:forEach>
      </table>
   </div>
   
</div>
</body>
</html>