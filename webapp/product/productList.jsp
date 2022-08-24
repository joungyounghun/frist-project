<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.paging {color: blue; text-decoration: none;}
.currentPaging {color: red; text-decoration: none;}

#subjectA {
	color: black;
	text-decoration: none;
}
#subjectA:hover {
	color: green;
	text-decoration: underline;
}
</style>

</head>
<body>
<table border="1" width="540">
	<c:forEach var="dto" items="${list}">
		<tr align="center" bgcolor="#ffffcc">
			<td>${dto.getProd_price()}</td>
			<td><a href="../product/productView.do?prod_num=${dto.getProd_num()}">
				<img src="../product_image/${dto.prod_img}"></a></td>
			<td><a href="../product/productView.do?prod_num=${dto.getProd_num()}">
				${dto.getProd_name()}</a></td>                        
			<td>${dto.getProd_cate1()} > ${dto.getProd_cate2()} > ${dto.getProd_cate3()}</td>
		</tr>	   
	</c:forEach>    

      <!-- 페이징 -->
      <tr>
         <td colspan="5" align="center">
         <c:if test="${startPage > 3 }">
         	<a class="paging" href="../product/productList.do?pg=${startPage - 1 }">[이전]</a>
         </c:if> 
         
         <c:forEach var="i" begin="${startPage }" end="${endPage}" step="1">
         	<c:if test="${i == pg}">
         		<a class="currentPaging">[${i}]</a>   
         	</c:if>
         	
         	<c:if test="${i != pg}">
         		<a class="paging" href="../product/productList.do?pg=${i}">[${i}]</a>   
         	</c:if>
         </c:forEach>        
            
		 <c:if test="${endPage < totalP }">
			<a class="paging" href="../product/productList.do?pg=${endPage + 1 }">[다음]</a>
		 </c:if>
         </td>
      </tr> 
   </table>
   <c:if test="${mem_auth == 2}">
		<a href="../product/productWriteForm.do">상품 등록</a>
	</c:if>
	<a href="../main/index.jsp">메인화면</a>

</body>
</html>