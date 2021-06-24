<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>ADD BOARD</title>
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
$(document).ready(function() {
    $('#addButton').click(function() {
        
    	// 파일들중 하나라도 첨부되지 않으면 ck = true;
    	let ck = false;
        let boardfile = $('.boardfile'); // 배열
        // break키워드 사용을 위해 for반복문 사용 <-- boardfile.each()메서드 사용 X
		for(let item of boardfile) {
			if($(item).val() == '') {
				ck = true;
				console.log('첨부되지 않은 파일이 있습니다.');
				break;
			}
		}
        
    	if(ck) { // if(ck == true)
    		alert('첨부되지 않은 파일이 있습니다.');
    	} else if ($('#boardPw').val().length < 4) {
            alert('boardPw는 4자이상 이어야 합니다');
            $('#boardPw').focus();
        } else if ($('#boardTitle').val() == '') {
            alert('boardTitle을 입력하세요');
            $('#boardTitle').focus();
        } else if ($('#boardContent').val() == '') {
            alert('boardContent을 입력하세요');
            $('#boardContent').focus();
        } else if ($('#staffId').val() == '') {
            alert('staffId을 입력하세요');
            $('#staffId').focus();
        } else {
            $('#addForm').submit();
        }
    });
    
    // #inputFile에 input type="file" 마지막에 추가
    $('#addFileBtn').click(function(){
    	console.log('#addFileBtn click!');
    	$('#inputFile').append('<input type="file" name="boardfile" class="boardfile">');
    });
    
 	// #inputFile에 input type="file" 마지막 태그를 삭제
	$('#delFileBtn').click(function(){
		console.log('#delFileBtn click!');	
		$('#inputFile').children().last().remove();
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
			<h1>ADD BOARD</h1>
		</div>
        <form id="addForm"
            action="${pageContext.request.contextPath}/admin/addBoard" 
            method="post"
            enctype="multipart/form-data">
            <div>
            	<button class="btn btn-primary" id="addFileBtn" type="button">파일추가</button>
            	<button class="btn btn-primary" id="delFileBtn" type="button">파일삭제</button>
            </div>
            <div id="inputFile">
            </div>
            <div class="form-group">
                <label for="boardPw">boardPw :</label> <input class="form-control"
                    name="board.boardPw" id="boardPw" type="password" />
            </div>
            <div class="form-group">
                <label for="boardPw">boardTitle :</label> <input
                    class="form-control" name="board.boardTitle" id="boardTitle" type="text" />
            </div>
            <div class="form-group">
                <label for="boardContent">boardContent :</label>
                <textarea class="form-control" name="board.boardContent" id="boardContent"
                    rows="5" cols="50"></textarea>
            </div>
            <div class="form-group">
                <label for="staffId">staffId :</label> <input
                    class="form-control" name="board.staffId" id="staffId" type="text" />
            </div>
            <div>
                <input class="btn btn-primary" id="addButton" type="button" value="글입력" />
                <input class="btn btn-primary" type="reset" value="초기화" />
                <a class="btn btn-primary"  href="${pageContext.request.contextPath}/admin/getBoardList">글목록</a>
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