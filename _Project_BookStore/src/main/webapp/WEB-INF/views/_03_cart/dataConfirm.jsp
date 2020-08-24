<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function cancelOrder() {
		if (confirm("確定取消此份訂單 ? ")) {
			// 接收此資料的Servlet會使用 finalDecision 參數的值
			document.forms[0].finalDecision.value = "CANCEL";
			document.forms[0].action = "<c:url value='ProcessOrder.do' />";
			document.forms[0].method = "POST";
			document.forms[0].submit();
			return;
		} else {
			return;
		}
	}
	function reconfirmOrder() {
		var sa = document.getElementById('ShippingAddress').value;
		if (sa === "") {
			window.alert('出貨地址不能是空白');
			return;
		}
		if (confirm("確定送出此份訂單 ? ")) {
			// 接收此資料的Servlet會使用 finalDecision 參數的值
			document.forms[0].finalDecision.value = "ORDER";
			document.forms[0].action = "<c:url value='ProcessOrder.do' />";
			document.forms[0].method = "POST";
			document.forms[0].submit();
			return;
		} else {
			return;
		}
	}
</script>
<meta charset="UTF-8">
<title>基本資料確認</title>
</head>
<body>
	<div>
		<h1 align="center">個人資料確認</h1>
	</div>
	<div align="center">
		<FORM style="margin: 0 auto; width: 750px;"
			action="<c:url value='orderConfirm' />" method="POST">
			會員: <font color='red'>${memberBean.name}</font>
			<hr>
			出貨地址 : <Input style="background: #ECFFCD;" size="60" type="text"
				id='ShippingAddress' name="ShippingAddress" value="${memberBean.address}">
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
						</tr>
						<c:forEach items='${Cart.content}' var='entry'>
							<tr>
								<td align='center'>${entry.value.productId}</td>
								<td align='center'>${entry.value.productName}</td>
								<td align='right'>${entry.value.qty}</td>
								<td align='right'><fmt:formatNumber
										value="${entry.value.price}" pattern="#,###" />元</td>
								<td align='right'><fmt:formatNumber
										value="${entry.value.qty * entry.value.price}" pattern="#,###" />元</td>
							</tr>
						</c:forEach>
						<c:set var="sum" value="${0}" />
						<c:forEach var='ct' items='${Cart.content}'>
							<c:set var="sum" value="${sum + (ct.value.qty * ct.value.price)}" />
						</c:forEach>
						<tr height='16'>
							<td colspan='4' align='right'>合計金額：</td>
							<td align='right'><fmt:formatNumber value="${sum}"
									pattern="#,###,###" />元</td>

						</tr>
						<tr>
							<td colspan='4' align='right'>營業稅：</td>
							<c:set var="VAT" value="${sum*0.05 + 0.0001}" />
							<td align='right'><fmt:formatNumber value="${VAT}"
									pattern="#,###,###" />元</td>

						</tr>
						<tr>
							<td colspan='4' align='right'>總計金額：</td>
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
			<Input type='submit' value='資料確認'>
		</FORM>
	</div>
	<hr>
	<div align="center">
		<a href='products' style='color: red'>還要再買</a>
	</div>
	<hr>
</body>
</html>