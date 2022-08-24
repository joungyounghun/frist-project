<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ezin - 집들이게시판</title>
</head>
<body>
	<table border="1" width="800">
		<tr align="center" bgcolor="#ffff00">
			<td width="30">번호</td>
			<td width="100">주거형태</td>
			<td width="30">면적</td>
			<td width="100">스타일</td>
			<td width="300">제목</td>
			<td>작성일시</td>		
			<td width="50">조회수</td>	
		</tr>
		<c:forEach var="dto" items="${list}">
			<tr align="center" bgcolor="#ffffcc">
				<td>${dto.getHouse_num()}</td>
				<td>${dto.getHouse_type()}</td>
				<td>${dto.getHouse_area()}</td>
				<td>${dto.getHouse_style()}</td>
				<td><a href="../houseboard/houseboardView.do?hnum=${dto.getHouse_num()}&pg=${pg}">
				${dto.getHouse_title()}</a></td>
				<td>${dto.getHouse_reg_date()}</td>
				<td>${dto.getHouse_hits()}</td>
			</tr>
		</c:forEach>

		<!-- 페이징 -->
		<tr>
			<td colspan="5" align="center">
			<c:if test="${startPage > 5}">
				<a class="paging" href="../houseboard/houseboardList.do?pg=${startPage - 1}">[이전]</a>
			</c:if> 
			
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:if test="${i == pg}">
					<a class="currentPaging">[${i}]</a>
				</c:if>
				<c:if test="${i != pg}">
					<a class="paging" href="../houseboard/houseboardList.do?pg=${i}">[${i}]</a>	
				</c:if>
			</c:forEach>
			
			<c:if test="${endPage < totalP}">
 				<a class="paging" href="../houseboard/houseboardList.do?pg=${endPage + 1}">[다음]</a>
 			</c:if>
			</td>
		</tr>
	</table>
	<c:if test="${mem_id != null}">
	<a href="../houseboard/houseboardWriteForm.do">글쓰기</a>
	</c:if>
	<a href="../main/index.jsp">메인화면</a>
</body>
</html>