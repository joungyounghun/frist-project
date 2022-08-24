<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
	<h3>*** 메인 화면 ***</h3>
	
<c:if test="${mem_id == null }">
	<!-- 로그인 전 -->
	<a href="../member/loginForm.do">로그인</a><br>
	<a href="../member/writeForm.do">회원가입</a><br>
</c:if>

<c:if test="${mem_id != null }">
	<!-- 로그인 후 -->
	<a href="../member/logout.do">로그아웃</a><br>
	<a href="../member/mypage.do">마이페이지</a><br>
	<a href="../member/deleteForm.do">회원탈퇴</a><br>
	<a href="../service/serviceList.do">고객센터</a><br>
</c:if>
	<a href="../notice/noticeList.do">공지사항</a><br>
	<a href="../houseboard/houseboardList.do">집들이게시판</a><br>
	<a href="../product/productList.do">상품보기</a>
</body>
</html>