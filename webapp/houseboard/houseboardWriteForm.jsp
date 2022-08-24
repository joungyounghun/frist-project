<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 작성하기</title>
<script type="text/javascript" src="../script/houseboardScript.js"></script>
</head>
<body>
	<form action="../houseboard/houseboardWrite.do" 
	method="post" enctype="multipart/form-data" name="hb_frm">
		<table border="1">
			<tr>
				<td>주거형태</td>
				<td>
					<select name="house_type">
						<option value="원룸&오피스텔">원룸&오피스텔</option>
						<option value="아파트">아파트</option>
						<option value="빌라&연립">빌라&연립</option>
						<option value="단독주택">단독주택</option>
						<option value="사무공간">사무공간</option>
						<option value="상업공간">상업공간</option>
						<option value="기타">기타</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>면적</td>
				<td><input type="number" name="house_area"></td>
			</tr>
			<tr>
				<td>스타일</td>
				<td>
					<select name="house_style">
						<option value="모던">모던</option>
						<option value="미니멀&심플">미니멀&심플</option>
						<option value="내추럴">내추럴</option>
						<option value="북유럽">북유럽</option>
						<option value="빈티지&레트로">빈티지&레트로</option>
						<option value="클래식&앤틱">클래식&앤틱</option>
						<option value="프렌치&프로방스">프렌치&프로방스</option>
						<option value="러블리&로맨틱">러블리&로맨틱</option>
						<option value="인더스트리얼">인더스트리얼</option>
						<option value="한국&아시아">한국&아시아</option>
						<option value="유니크&믹스매치">유니크&믹스매치</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="house_title"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="house_content"></textarea></td>
			</tr>
			<tr>
				<td>사진 첨부</td>
				<td>
					<input type="file" value="사진 등록" name="img" onchange="imgload(this)">
					<br>
					<img id="img" width="100" height="100"/>				
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