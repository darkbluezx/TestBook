<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>購物清單</title>
<script type="text/javascript">
function confirmDelete(n) {
	if (confirm("確定刪除此項商品 ? ") ) {
		document.forms[0].action="<c:url value='UpdateItem.do?cmd=DEL&bookId=" + n +"' />" ;
		document.forms[0].method="POST";
		document.forms[0].submit();
	} else {
	
	}
}
function modify(key, qty) {
	var x = "newQty" + key;
	var newQty = document.getElementById(x).value;
	if  (newQty < 0 ) {
		window.alert ('數量不能小於 0');
		return ; 
	}
	if  (newQty == 0 ) {
		window.alert ("請執行刪除功能來刪除此項商品");
		document.getElementById(x).value = qty;
		return ; 
	}
	if  (newQty == qty ) {
		window.alert ("新、舊數量相同，不必修改");
		return ; 
	}
	if (confirm("確定將此商品的數量由" + qty + " 改為 " + newQty + " ? ") ) {
		document.forms[0].action="<c:url value='UpdateItem.do?cmd=MOD&bookId=" + key + "&newQty=" + newQty +"' />" ;
		document.forms[0].method="POST";
		console.log("進入update");
		document.forms[0].submit();
	} else {
		console.log("沒進入update");
		document.getElementById(x).value = qty;
	}
}
function isNumberKey(evt)
{
   var charCode = (evt.which) ? evt.which : event.keyCode
   if (charCode > 31 && (charCode < 48 || charCode > 57)){
      return false;
   }
   return true;
}
function Checkout(qty) {
	if (qty == 0)  {
		alert("無購買任何商品，不需結帳");
		return false;
	}
	if (confirm("再次確認訂單內容 ? ") ) {
		return true;
	} else {
		return false;
	}
}
function Abort() {
	if (confirm("確定放棄購物 ? ") ) {
		return true;
	} else {
		return false;
	}
}
</script>
</head>
<body>

	<div>
		<h1 align="center">購物清單</h1>
	</div>
	<div align="center">
		會員: <font color='red'>${memberBean.name}</font>
		<hr>

		<table border='1'>
			<c:choose>
				<c:when test='${Cart.itemNumber > 0 }'>
					<tr>
						<th width='100'>書籍標號</th>
						<th width='100'>書籍名稱</th>
						<th width='60'>數量</th>
						<th width='60'>單價</th>
						<th width='60'>小計</th>
						<th width="110">修改</th>
					</tr>
					<c:forEach items='${Cart.content}' var='entry'>
						<tr>
							<td align='center'>${entry.value.productId}</td>
							<td align='center'>${entry.value.productName}</td>
							<td align='right'><Input id="newQty${entry.key}"
								style="width: 28px; text-align: right" name="newQty" type="text"
								value="<fmt:formatNumber value="${entry.value.qty}" />"
								name="qty" onkeypress="return isNumberKey(event)" /></td>
							<td align='right'><fmt:formatNumber
									value="${entry.value.price}" pattern="#,###" />元</td>
							<td align='right'><fmt:formatNumber
									value="${entry.value.qty * entry.value.price}" pattern="#,###" />元</td>
							<td><Input type="button" name="update" value="修改"
								onclick="modify(${entry.key}, ${entry.value.qty})"> <Input
								type="button" name="delete" value="刪除"
								onclick="confirmDelete(${entry.key})"></td>
						</tr>
					</c:forEach>
					<c:set var="sum" value="${0}" />
					<c:forEach var='ct' items='${Cart.content}'>
						<c:set var="sum" value="${sum + (ct.value.qty * ct.value.price)}" />
					</c:forEach>
					<tr height='16'>
						<td colspan='5' align='right'>合計金額：</td>
						<td align='right'><fmt:formatNumber value="${sum}"
								pattern="#,###,###" />元</td>
						
					</tr>
					<tr>
						<td colspan='5' align='right'>營業稅：</td>
						<c:set var="VAT" value="${sum*0.05 + 0.0001}" />
						<td align='right'><fmt:formatNumber value="${VAT}"
								pattern="#,###,###" />元</td>
						
					</tr>
					<tr>
						<td colspan='5' align='right'>總計金額：</td>
						<td align='right'><fmt:formatNumber value="${sum + VAT }"
								pattern="#,###,###" />元</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td>您尚未購買任何商品</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
	<hr>
	<div align="center">
		<a href='products' style='color: red'>還要再買</a>
	</div>
	<div align="center">
		<a href='dataConfirm' style='color: red'>結帳去</a>
	</div>
	<hr>
	<form>
	<input type="hidden" name="a" />
	</form>	
	
</body>
</html>