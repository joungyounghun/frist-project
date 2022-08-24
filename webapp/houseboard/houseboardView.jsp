<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" width="800">
		<tr>
			<td colspan="6">${dto.getHouse_title()}</td>
		</tr>
		<tr>
			<td>주거형태</td>
			<td>${dto.getHouse_type()}</td>
			<td>면적</td>
			<td>${dto.getHouse_area()}</td>
			<td>스타일</td>
			<td>${dto.getHouse_style()}</td>
		<tr>
			<td>작성일</td>
			<td colspan="3">${dto.getHouse_reg_date()}</td>
			<td>조회수</td>
			<td>${dto.getHouse_hits()}</td>
		</tr>
		<tr>
			<td colspan="6">
			<img src="../house_img/${dto.getHouse_img()}" width="500">
			<pre>${dto.getHouse_content()}</pre>
			</td>
		</tr>
	</table>
	<input type="button" value="목록" onclick="location.href='../houseboard/houseboardList.do?pg=${pg}'">
	
 	<c:if test="${mem_num == writer_num}">
	   <input type="button" value="글수정" onclick="location.href='../houseboard/houseboardModifyForm.do?hnum=${hnum}&pg=${pg}'">
	</c:if>
	<c:if test="${mem_num == writer_num || mem_auth == 3}">
		<input type="button" value="글삭제" onclick="location.href='../houseboard/houseboardDelete.do?hnum=${hnum}&pg=${pg}'">
	</c:if>
</body>
</html>