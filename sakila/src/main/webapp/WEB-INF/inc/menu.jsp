<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div>
	<a href="${pageContext.request.contextPath}/admin/getBoardList">게시판</a>
	<a href="${pageContext.request.contextPath}/admin/getActorList">배우정보 리스트</a>
	<a href="${pageContext.request.contextPath}/admin/getFilmList">영화목록</a>
	<a href="${pageContext.request.contextPath}/admin/getInventoryList">재고목록</a>
	<a href="${pageContext.request.contextPath}/admin/getStaffList">직원리스트</a>
	<a href="${pageContext.request.contextPath}/admin/getCustomerList">고객리스트</a>
	<a href="${pageContext.request.contextPath}/admin/logout">로그아웃</a>
</div>