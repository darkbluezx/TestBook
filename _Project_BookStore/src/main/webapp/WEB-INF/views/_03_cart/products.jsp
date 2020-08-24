<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<script>
	localStorage.setItem('openleft','n');
</script>
<meta charset="UTF-8">
<title>Products</title>
</head>
<body>
	<div>
		<h1 align="center">產品清單</h1>
	</div>
	<hr>
	<div align="center">
		<a href='displayCart'>結帳</a>
		<c:set var="count" value="${0}" />
		<c:set var="sum" value="${0}" />
		<c:forEach var='ct' items='${Cart.content}'>
			<c:set var="sum" value="${sum + (ct.value.qty * ct.value.price)}" />
		</c:forEach>
		<table>
			<tr>
				<th>商品數量</th>
				<th>商品總價</th>
			</tr>
			<tr>
				<td>${Cart.itemNumber}</td>
				<td>${sum}</td>
			</tr>
		</table>
		<hr>
	</div>

	<div align="center">
		會員: <font color='red'>${memberBean.name}</font>
		<c:forEach var='product' items='${products}'>
			<div align="left" style="border: thin solid black; width: 400px">
				<p>ID : ${product.bookId}
				<p>書名 : ${product.bookName}</p>
				<p>價格 : ${product.price}</p>
				<p>作者 : ${product.author}</p>
				<p>出版社 : ${product.publisher}</p>
				<p>類別 : ${product.item}</p>
				<p>小類 : ${product.miniItem}</p>
								<img width='100' height='200'
									src="<c:url value='/_03_cart/RgetPicture/${product.bookId}'  />" />
				<form:form method="POST" action="BuyBook" modelAttribute="cart">
					購買數量: <select name='qty'>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
					</select>
					<!-- 這些隱藏欄位都會送到後端 -->
					<Input type='hidden' name='price' value='${product.price}'>
					<Input type='hidden' name='bookId' value='${product.bookId}'>
					<Input type='submit' value='加入購物車'>
				</form:form>
			</div>
		</c:forEach>

	</div>
	
</body>
</html>