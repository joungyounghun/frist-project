<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	if(${result > 0}) {
		alert("상품을 등록했습니다.");
		location.href = "../product/productList.do";
	} else {
		alert("상품을 등록하지 못했습니다.");
		location.href = "../product/productWriteForm.do";
	}
</script>
</head>
<body>

</body>
</html>