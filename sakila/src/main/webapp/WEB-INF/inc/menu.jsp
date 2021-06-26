<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<div id="sidebar" class="active">
	<div class="sidebar-wrapper active">
    	<div class="sidebar-header">        	
       		<div class="row">
       			<h1>sakila video</h1>
				<h6>
					<a href="${pageContext.request.contextPath}/admin/logout">logout</a>
				</h6>
			</div>				
      	</div>
      	<div class="sidebar-menu">
			<ul class="menu">
			  <li class="sidebar-title">
			    <a class="nav-link" href="${pageContext.request.contextPath}/home">Home</a>
			  </li>
			  <li class="sidebar-title">
			    <a class="nav-link" href="${pageContext.request.contextPath}/admin/getBoardList">게시판</a>
			  </li>
			  <li class="sidebar-title">
			    <a class="nav-link" href="${pageContext.request.contextPath}/admin/getStaffList">직원목록</a>
			  </li>
			   <li class="sidebar-title">
			    <a class="nav-link" href="${pageContext.request.contextPath}/admin/getFilmList">영화목록</a>
			  </li>
			  <li class="sidebar-title">
			    <a class="nav-link" href="${pageContext.request.contextPath}/admin/getActorList">배우목록</a>
			  </li>
			  <li class="sidebar-title">
			    <a class="nav-link" href="${pageContext.request.contextPath}/admin/getCustomerList">고객관리(대여)</a>
			  </li>
			  <li class="sidebar-title">
			    <a class="nav-link" href="${pageContext.request.contextPath}/admin/getInventoryList">재고관리(반납)</a>
			  </li>
			</ul>
		</div>
	</div>
</div>