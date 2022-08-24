<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ezin - 공지사항</title>
</head>
<body>
	<table border="1" width="540">
		<tr align="center" bgcolor="#ffff00">
			<td width="70">글번호</td>
			<td width="100">종류</td>
			<td width="200">제목</td>
			<td>작성일시</td>			
		</tr>
		<c:forEach var="dto" items="${list}">
			<tr align="center" bgcolor="#ffffcc">
				<td>${dto.getNotice_seq()}</td>
				<td>공지사항</td>
				<td>
					<a href="../notice/noticeView.do?seq=${dto.getNotice_seq()}&pg=${pg}">
					${dto.getNotice_subject()}</a>
				</td>
				<td>${dto.getNotice_date()}</td>
			</tr>
		</c:forEach>

		<!-- 페이징 -->
		<tr>
			<td colspan="5" align="center">
			<c:if test="${startPage > 5}">
				<a class="paging" href="../notice/noticeList.do?pg=${startPage - 1}">[이전]</a>
			</c:if> 
			
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:if test="${i == pg}">
					<a class="currentPaging">[${i}]</a>
				</c:if>
				<c:if test="${i != pg}">
					<a class="paging" href="../notice/noticeList.do?pg=${i}">[${i}]</a>	
				</c:if>
			</c:forEach>
			
			<c:if test="${endPage < totalP}">
 				<a class="paging" href="../notice/noticeList.do?pg=${endPage + 1}">[다음]</a>
 			</c:if>
			</td>
		</tr>
	</table>

	<c:if test="${mem_auth == 3}">
		<a href="../notice/noticeWriteForm.do">공지 작성</a>
	</c:if>
	<a href="../main/index.jsp">메인화면</a>
</body>
</html>