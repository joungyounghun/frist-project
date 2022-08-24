<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 작성하기</title>
<script type="text/javascript" src="../script/noticeScript.js"></script>
</head>
<body>
<form action="../notice/noticeWrite.do" name="n_frm">
	<table border="1">
		<tr>
			<td>제목</td>
			<td>
				<input type="text" name="notice_subject">
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<textarea name="notice_content"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<input type="button" value="글쓰기" onclick="doSubmit();">
			<input type="reset" value="다시 작성">
			</td>
		</tr>
	</table>
</form>
</body>
</html>