<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	if(${result > 0}) {
		alert("답변을 수정했습니다.");
	} else {
		alert("답변 수정에 실패했습니다.");
	}
	location.href = "serviceView.do?seq=${seq}&pg=${pg}";
</script>
</head>
<body>

</body>
</html>