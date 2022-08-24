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
			<td>장바구니 번호</td>
			<td>상품 번호</td>
			<td>상품 명</td>
			<td>가격</td>
			<td>갯수</td>
		</tr>

		<c:forEach var="dto" items="${list}">
			<tr>
				<td>${dto.getCart_num()}</td>
				<td>${dto.getProd_num()}</td>
				<td>${dto.getProd_name()}</td>
				<td>${dto.getProd_price()}</td>
				<td>${dto.getCart_quan()}</td>
			</tr>
		</c:forEach>

		<!-- 페이징 -->
		<tr>
			<td colspan="5" align="center"><c:if test="${startPage > 3 }">
					<a class="paging" href="cartList.do?pg=${startPage - 1 }">[이전]</a>
				</c:if> <c:forEach var="i" begin="${startPage }" end="${endPage}" step="1">
					<c:if test="${i == pg}">
						<a class="currentPaging">[${i}]</a>
					</c:if>

					<c:if test="${i != pg}">
						<a class="paging" href="cartList.do?pg=${i}">[${i}]</a>
					</c:if>
				</c:forEach> <c:if test="${endPage < totalP }">
					<a class="paging" href="cartList.do?pg=${endPage + 1 }">[다음]</a>
				</c:if></td>
		</tr>

	</table>
</body>
</html>