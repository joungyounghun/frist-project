<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../script/servaScript.js"></script>
</head>
<body>
	<form action="answerWrite.do" name="a_frm">
		<input type="hidden" name="content_org" value="${dto.getAnswer_content}">
		<input type="hidden" name="answer_seq" value="${aseq}">
		<input type="hidden" name="question_seq" value="${qseq}">
		<input type="hidden" name="pg" value="${pg}">
		<h3>답변수정</h3>
		<textarea name="answer_content"></textarea>
		<input type="button" onclick="doModify();" value="입력">
	</form>
</body>
</html>