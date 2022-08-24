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
	<table border="1">
		<tr>
			<td>주문 번호</td>
			<td>주문일</td>
			<td>우편번호</td>
			<td>주소</td>
			<td>수령인성명</td>
			<td>전화번호</td>
			<td>이메일</td>
			<td>회원번호</td>
			<td>상품번호</td>
			<td>주문수량</td>
			<td>주문금액</td>
			<td>쿠폰번호</td>
			<td>배송상태</td>
			<td>총 금액</td>
		</tr>
		
		<c:forEach var="dto" items="${list}">
			<tr>
				<td>${dto.getOrder_num()}</td>
				<td>${dto.getOrder_date()}</td>
				<td>${dto.getOrder_zipcode()}</td>
				<td>${dto.getOrder_address1()} ${dto.getOrder_address2()}</td>
				<td>${dto.getReceiver_name()}</td>
				<td>${dto.getReceiver_phone1()} - ${dto.getReceiver_phone2()} - ${dto.getReceiver_phone3()}</td>
				<td>${dto.getReceiver_email1()} @ ${dto.getReceiver_email2()}</td>
				<td>${dto.getMem_num()}</td>
				<td>${dto.getProd_num()}</td>
				<td>${dto.getPay_quan()}</td>
				<td>${dto.getPay_price()}</td>
				<td>${dto.getCoupon_num()}</td>
				<td>${dto.getDelive_type()}</td>
				<td>${dto.getPay_price()}*${dto.getPay_quan()}</td>
				
			</tr>	
		</c:forEach>
	
	</table>
</body>
</html>