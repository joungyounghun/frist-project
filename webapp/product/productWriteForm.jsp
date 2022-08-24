<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<style type="text/css">
body {
	margin: 0;
	height: 100%;
	font-family: Nanum Gothic, '나눔고딕', Helvetica, sans-serif;
}

#logo {
	cursor: pointer;
}

#header {
	padding-top: 60px;
	padding-bottom: 20px;
	text-align: center;
}

#wrapper {
	position: relative;
	height: 100%;
}

#content {
	position: absolute;
	left: 50%;
	transform: translate(-50%);
}

label {
	margin: 20px 0 10px;
	font-size: 15px;
	font-weight: 700;
}

span {
	display: block;
	width: 100%;
	height: 30px;
	position: relative;
	padding: 7px 3px 10px;
}

textarea {
	width: 90%;
	height: 15px;
	position: relative;
}

#prod_content {
	display: block;
	width: 100%;
	height: 130px;
	position: relative;
	padding: 7px 3px 10px;
}
#prod_context {
	height: 90%;
}
</style>
</head>
<body>
	<form action="../product/productWrite.do" enctype="multipart/form-data" method="post">
	<div id="header" align="center">
		<h3>상품 등록</h3>
		<input id="logo" type="button" value="메인화면" onclick="location.href='../main/index.jsp'">
		<!-- 로고 이미지 상단 - 임시방편으로 버튼으로 뒀고, 로고 이미지 들어오면 메인화면으로 이동할 수 있도록 위에 뒀습니다. 혹 재배치 필요하다 싶으면 말씀해주세요 -->
	</div>
	
	<div id="wrapper">
	<div id="content">
		<div>
			<label>상품명</label>
			<span><input type="text" name="prod_name" size="40"></span>
		</div>
		
		<div>
			<label>가격</label>
			<span><input type="text" name="prod_price" size="20"></span>
		</div>
		
		<div>
			<label>배송비</label>
			<span><textarea name="delive_price" size="20"></textarea></span>
		</div>
		
		<div>
			<label>배송유형</label>
			<span><textarea name="delive_type" size="20"></textarea></span>
		</div>
		
		<div>
			<label>상품 내용</label>
			<span id="prod_content"><textarea id="prod_context" name="prod_content" size="40"></textarea></span>
		</div>
		
		<div>
			<label>이미지 등록</label>
			<span><input type="file" name="img" size="45"></span>
		</div>
		
		<div>
			<label>수량</label>
			<span><textarea name="prod_quan" size="20"></textarea></span>
		</div>
		
		<div>
			<label>추가 상품명</label>
			<span><textarea name="add_product" size="40"></textarea></span>
		</div>
			
		<div>
			<label>상품 대분류</label>
			<span><textarea name="prod_cate1" size="40"></textarea></span>
		</div>
		
		<div>
			<label>상품 중분류</label>
			<span><textarea name="prod_cate2" size="40"></textarea></span>
		</div>
		
		<div>
			<label>상품 소분류</label>
			<span><textarea name="prod_cate3" size="40"></textarea></span>
		</div>
		
		<div>
			<span><input type="submit" value="상품등록"></span>
			<br>
		</div>
		
		<div>
			<span><input type="reset" value="다시작성"></span>
			<br>
		</div>
	</div>
	</div>
	</form>
</body>
</html>