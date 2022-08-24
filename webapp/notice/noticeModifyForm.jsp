<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 수정하기</title>
<script type="text/javascript" src="../script/noticeScript.js"></script>
</head>
<body>
<form action="../notice/noticeModify.do" name="n_frm">
	<input type="hidden" name="subject_org" value="${dto.getNotice_subject()}">
	<input type="hidden" name="content_org" value="${dto.getNotice_content()}">
	<input type="hidden" name="seq" value="${seq}">
	<input type="hidden" name="pg" value="${pg}">
	<table border="1">
		<tr>
			<td>제목</td>
			<td>
				<input type="text" name="notice_subject" value="${dto.getNotice_subject()}">
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<textarea name="notice_content">${dto.getNotice_content()}</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<input type="button" value="수정하기" onclick="doModify();">
			<input type="button" value="다시 작성" onclick="reset1()">
			</td>
		</tr>
	</table>
</form>
</body>
</html>