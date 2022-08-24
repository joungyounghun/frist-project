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
	<table border="1" width="450">
		<tr>
			<td colspan="4">${dto.getNotice_subject()}</td>
		</tr>
		<tr>
			<td>작성일</td>
			<td>${dto.getNotice_date()}</td>
			<td>조회수</td>
			<td>${dto.getNotice_hit()}</td>
		</tr>
		<tr>
			<td colspan="4">
			<pre>${dto.getNotice_content()}</pre>
			</td>
		</tr>
	</table>
	<input type="button" value="목록" onclick="location.href='../notice/noticeList.do?pg=${pg}'">
	
 	<c:if test="${mem_auth == 3}">
	   <input type="button" value="글수정" onclick="location.href='../notice/noticeModifyForm.do?seq=${seq}&pg=${pg}'">
	   <input type="button" value="글삭제" onclick="location.href='../notice/noticeDelete.do?seq=${seq}&pg=${pg}'">
	</c:if>
</body>
</html>