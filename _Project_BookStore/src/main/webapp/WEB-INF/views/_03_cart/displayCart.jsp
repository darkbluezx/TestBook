<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>購物清單</title>
<!-- Favicon Icon -->
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/images/fav.png">

<!-- Stylesheets -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@300;400;500;700;900&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Rajdhani:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link
	href='${pageContext.request.contextPath}/vendor/unicons-2.0.1/css/unicons.css'
	rel='stylesheet'>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/responsive.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/night-mode.css"
	rel="stylesheet">

<!-- Vendor Stylesheets -->
<link
	href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/vendor/OwlCarousel/assets/owl.carousel.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/vendor/OwlCarousel/assets/owl.theme.default.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/vendor/semantic/semantic.min.css">

<script type="text/javascript">
function qtyPlus(x,y) {
	localStorage.setItem('openleft','y');
	document.forms[0].action="<c:url value='qtyPlus?bookId=" + x +"' />" ;
	document.forms[0].method="POST";
	console.log("進入qtyPlus");
	document.forms[0].submit();
}
function qtyMinus(x,y) {
	localStorage.setItem('openleft','y');
	var valuey = document.getElementById('qty'+y).value;
	if (valuey <= 1) {
		console.log("Minus 1!");		
		console.log("document.getElementById('qty'+y).value" + document.getElementById('qty'+y).value);
		document.getElementById('qty'+y).value = 1;
		return	
	}
	document.forms[0].action="<c:url value='qtyMinus?bookId=" + x +"' />" ;
	document.forms[0].method="POST";
	console.log("進入qtyMinus");
	document.forms[0].submit();
}

function confirmDelete(n) {
	if (confirm("確定刪除此項商品 ? ") ) {
		localStorage.setItem('openleft','y');
		document.forms[0].action="<c:url value='UpdateItem.do?cmd=DEL&bookId=" + n +"&newQty=0' />" ;
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
	<!-- Cart Sidebar Offset Start-->
	<div class="bs-canvas bs-canvas-left position-fixed bg-cart h-100">
		<div class="bs-canvas-header side-cart-header p-3 ">
			<div class="d-inline-block  main-cart-title">
				My Cart <span>${Cart.itemNumber}項</span>
			</div>
			<button type="button" class="bs-canvas-close close"
				aria-label="Close">
				<i class="uil uil-multiply"></i>
			</button>
		</div>
		<c:set var="sum" value="${0}" />
		<c:set var="discount_sum" value="${0}" />
		<c:forEach var='ct' items='${Cart.content}'>
			<c:set var="sum" value="${sum + (ct.value.qty * ct.value.price)}" />
			<c:set var="discount_sum"
				value="${discount_sum + (ct.value.qty * ct.value.price * ct.value.discount)}" />
		</c:forEach>
		<c:set var="VAT" value="${cartMasterBean.divident}" />
		<div class="bs-canvas-body">
			<div class="cart-top-total">
				<div class="cart-total-dil">
					<h4>合計金額：</h4>
					<span>$<fmt:formatNumber value="${sum}" pattern="#,###,###" /></span>
				</div>
				<div class="cart-total-dil pt-2">
					<h4>折扣金額：</h4>
					<span>$<fmt:formatNumber value="${VAT}" pattern="#,###,###" /></span>
				</div>
			</div>
			<div class="side-cart-items">
				<c:forEach items='${Cart.content}' var='entry' varStatus='status'>
					<div class="cart-item">
						<div class="cart-product-img">
							<img
								src="${pageContext.request.contextPath}/images/product/img-1.jpg"
								alt="">
							<div class="offer-badge">
								<fmt:formatNumber value="${(1 - entry.value.discount)*100}"
									pattern="###" />
								%OFF
							</div>
						</div>
						<div class="cart-text">
							<h4>${entry.value.companyName} : ${entry.value.productName}</h4>
							<div>
								<c:if test="${entry.value.freeBies != null}">
									<p>滿足同出版社贈品條件</p>
								</c:if>
							</div>
<!-- 							<div class="cart-radio"> -->
<!-- 							  <ul class="kggrm-now"> -->
<!-- 								<li> -->
<!-- 									<input type="radio" id="a1" name="cart1"> -->
<!-- 									<label for="a1">0.50</label> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<input type="radio" id="a2" name="cart1"> -->
<!-- 									<label for="a2">1kg</label> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<input type="radio" id="a3" name="cart1"> -->
<!-- 									<label for="a3">2kg</label> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<input type="radio" id="a4" name="cart1"> -->
<!-- 									<label for="a4">3kg</label> -->
<!-- 								</li> -->
<!-- 							  </ul> -->
<!-- 						    </div> -->
							<div class="qty-group">
								<div class="quantity buttons_added">
									<input type="button" value="-" class="minus minus-btn" id="minus${status.count}" onclick="qtyMinus(${entry.value.productId},${status.count})">
									<input type="number" step="1" name="quantity" value="${entry.value.qty}" class="input-text qty text" id="qty${status.count}"> 
									<input type="button" value="+" class="plus plus-btn" id="plus${status.count}" onclick="qtyPlus(${entry.value.productId},${status.count})">
								</div>
								<div class="cart-item-price">
									$
									<fmt:formatNumber
										value="${entry.value.price * entry.value.discount }"
										pattern="###" />
									<span>$<fmt:formatNumber value="${entry.value.price}"
											pattern="###" /></span>
								</div>
							</div>

							<button type="button" class="cart-close-btn" onclick="confirmDelete(${entry.key})">
								<i class="uil uil-multiply"></i>
							</button>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="bs-canvas-footer">
			<div class="cart-total-dil saving-total ">
				<h4>折扣金額 :</h4>
				<span>$<fmt:formatNumber value="${sum - discount_sum + VAT}"
						pattern="#,###,###" /></span>
			</div>
			<div class="main-total-cart">
				<h2>總計金額：</h2>
				<span><fmt:formatNumber value="${discount_sum -VAT}"
						pattern="#,###,###" /></span>
			</div>
			<div class="checkout-cart">
<!-- 				<a href="#" class="promo-code">Have a promocode?</a> -->
				<a href="checkout" class="cart-checkout-btn hover-btn">結帳</a>
			</div>
		</div>
	</div>
	<!-- Cart Sidebar Offsetl End-->
	<div>
		<h1 align="center">購物清單</h1>
	</div>

	<div class="sub-header-group">
		<div class="sub-header">

			<div class="catey__icon">
				<a href="#" class="cate__btn" data-toggle="modal"
					data-target="#category_model" title="Categories"><i
					class="uil uil-apps"></i></a>
			</div>
			<div class="header_cart order-1">
				<a href="#" class="cart__btn hover-btn pull-bs-canvas-left"
					title="Cart" id="openleft"><i class="uil uil-shopping-cart-alt"></i><span>Cart</span>
					<ins>${Cart.itemNumber}</ins><i class="uil uil-angle-down"></i></a>
			</div>
			<div class="search__icon order-1">
				<a href="#" class="search__btn hover-btn" data-toggle="modal"
					data-target="#search_model" title="Search"><i
					class="uil uil-search"></i></a>
			</div>
		</div>
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
							<td><Input type="button" name="update" value="修改" onclick="modify(${entry.key}, ${entry.value.qty})"> 
								<Input type="button" name="delete" value="刪除" onclick="confirmDelete(${entry.key})"></td>
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
	<!-- Javascripts -->
	<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendor/OwlCarousel/owl.carousel.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendor/semantic/semantic.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/jquery.countdown.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/custom.js"></script>
	<script src="${pageContext.request.contextPath}/js/offset_overlay.js"></script>
	<script src="${pageContext.request.contextPath}/js/night-mode.js"></script>
	<script>
	jQuery(document).ready(function($){
		console.log(localStorage.getItem('openleft'));
		if (localStorage.getItem('openleft') == 'y') {
			$('body').prepend('<div class="bs-canvas-overlay bg-dark position-fixed w-100 h-100"></div>');
			if($(this).hasClass('pull-bs-canvas-right'))
				$('.bs-canvas-right').addClass('mr-0');
			else
				$('.bs-canvas-left').addClass('ml-0');
			return false;	
		}	
	});	
	</script>
</body>
</html>