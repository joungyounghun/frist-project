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
	<form action="OrderWrite" enctype="multipart/form-data" method="post">
		<table>
			<tr>
				<td>주문 번호</td>
				<td>${dto.getOrder_num()}</td>
			</tr>
			<tr>
				<td>주문일</td>
				<td>${dto.getOrder_date()}</td>
			</tr>
			<tr>
				<td>우편 번호</td>
				<td><input type="text" name="order_zipcode" value=""></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="order_address1" value=""></td>
				<td>나머지 주소<input type="text" name="order_address2" value=""></td>
			</tr>
			<tr>
				<td>수령자 이름</td>
				<td><input type="text" name="receiver_name" value=""></td>
			</tr>
			<tr>
				<td>수령자 전화번호</td>
				<td>
					<input type="text" name="receiver_phone1" value=""> -
					<input type="text" name="receiver_phone2" value=""> -
					<input type="text" name="receiver_phone3" value="">
				</td>
			</tr>
			<c:forEach var="dto" items="${list}" >
			<tr>
				<td>상품번호</td>
				<td>${dto.getProd_num()}</td>
			</tr>
			<tr>
				<td>주문수량</td>
				<td>${dto.getPay_quan()}</td>
			</tr>
			<tr>
				<td>주문금액</td>
				<td>${dto.getPay_price()}</td>
			</tr>
			</c:forEach>
		</table>
	
	
	</form>
</body>
</html>