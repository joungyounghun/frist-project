<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	if(${result > 0}) {
		alert("삭제되었습니다.");
		location.href = "../order/orderList.do?pg=1";
	} else {
		alert("삭제하지 못했습니다.");
		location.href = "../order/orderView.do?seq=${seq}&pg=${pg}";
	}
</script>

</head>
<body>

</body>
</html>