<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	if(${result > 0}) {
		alert("수정되었습니다.");
		location.href = "../notice/noticeView.do?seq=${seq}&pg=${pg}";
	} else {
		alert("수정하지 못했습니다.");
		location.href = "../notice/noticeView.do?seq=${seq}&pg=${pg}";
	}
</script>
</head>
<body>

</body>
</html>