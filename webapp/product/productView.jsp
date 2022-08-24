<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" width="450">
	<tr>
		<td>
			<font size="5">${dto.prod_name}</font><br>
			<font size="2">${dto.prod_cate1} > ${dto.prod_cate2} > ${dto.prod_cate3}</font>
		</td>
	</tr>
	      
	<tr align="center">
		<td><img src="../product_image/${dto.prod_img}"></td>
	</tr>
	<tr>
		<td colspan="4">
			<font size="3">${dto.prod_price}원</font><br>
			<font size="1">${dto.delive_type} 배송 / 배송비 ${dto.delive_price}원</font>
		</td>
	</tr>
	<c:if test="${dto.add_product != null}">
		<tr>
			<td>지금 주문하시면 ${dto.add_product}를 추가로 드려요!</td>
	    </tr>
    </c:if>
      
      <tr>
         <td colspan="3" valign="top" height="200">
            <pre>${dto.getProd_content() }</pre>
         </td>
      </tr>      
  	</table>
  	
	<input type="button" value="목록" onclick="location.href='productList.do?pg=${pg}'">
	<c:if test="${mem_auth == 3 || mem_num == dto.mem_num}">
		<a href="../product/productDelete.do?seq=${dto.prod_num}&pg=${pg}">상품 삭제</a>
	</c:if>
	<c:if test="${mem_auth == 1}">
		<input type="button" value="장바구니 담기" onclick="location.href='../cart/cartAdd.do'">
	</c:if>
</body>
</html>