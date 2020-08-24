<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, shrink-to-fit=9">
<meta name="description" content="Gambolthemes">
<meta name="author" content="Gambolthemes">
<title>我的訂單-物流資料</title>

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
<link href="${pageContext.request.contextPath}/css/step-wizard.css"
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
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<style type="text/css">
*, input, button {
	font-family: 'Roboto', 'Noto Sans TC', sans-serif !important;
}

#borderA {
	text-align: center;
	font-size: 16px;
}

#sdbaddressselectdiv {
	 display: flex; 
	 width: 50%;
}

div .row {
	margin-right: 0px;
	margin-left: 0px;
}

.cart-total-dil h4 {
    font-size: 16px;
}

.order-dtsll li {
    display: inline-block;
    vertical-align: middle;
}
.addr_name {
	padding: 10px;
}

#each_order {
	padding: 10px;
}
.btnU{
	padding: 10px;
	display: flex; 
	justify-content: center;
}
.list-caret {
	display: inline-block;
	width: 0;
	height: 0;
	margin-left: 5px;
	vertical-align: middle;
	border-top: 6px dashed;
	border-right: 6px solid transparent;
	border-left: 6px solid transparent;
}
</style>

</head>

<body>
	<!-- Category Model Start -->
	<div id="category_model" class="header-cate-model main-gambo-model modal fade" tabindex="-1" role="dialog" aria-modal="false">
        <div class="modal-dialog category-area" role="document">
            <div class="category-area-inner">
                <div class="modal-header">
                    <button type="button" class="close btn-close" data-dismiss="modal" aria-label="Close">
						<i class="uil uil-multiply"></i>
                    </button>
                </div>
                <div class="category-model-content modal-content"> 
					<div class="cate-header">
						<h4>種類選擇</h4>
					</div>
                    <ul class="category-by-cat">
						<li>
							<a href="#" class="single-cat-item">
								<div class="icon">
									<img src="images/category/icon-1.svg" alt="">
								</div>
								<div class="text"> 蔬菜水果</div>
							</a>
						</li>
						<li>
							<a href="#" class="single-cat-item">
								<div class="icon">
									<img src="images/category/icon-2.svg" alt="">
								</div>
								<div class="text"> 雜貨 </div>
							</a>
						</li>
						<li>
							<a href="#" class="single-cat-item">
								<div class="icon">
									<img src="images/category/icon-3.svg" alt="">
								</div>
								<div class="text"> 乳製品和雞蛋 </div>
							</a>
						</li>
						<li>
							<a href="#" class="single-cat-item">
								<div class="icon">
									<img src="images/category/icon-4.svg" alt="">
								</div>
								<div class="text"> 飲料 </div>
							</a>
						</li>
						<li>
							<a href="#" class="single-cat-item">
								<div class="icon">
									<img src="images/category/icon-5.svg" alt="">
								</div>
								<div class="text"> 零食 </div>
							</a>
						</li>
						<li>
							<a href="#" class="single-cat-item">
								<div class="icon">
									<img src="images/category/icon-6.svg" alt="">
								</div>
								<div class="text"> 清潔用品 </div>
							</a>
						</li>
						<li>
							<a href="#" class="single-cat-item">
								<div class="icon">
									<img src="images/category/icon-7.svg" alt="">
								</div>
								<div class="text"> 麵食 </div>
							</a>
						</li>
						<li>
							<a href="#" class="single-cat-item">
								<div class="icon">
									<img src="images/category/icon-8.svg" alt="">
								</div>
								<div class="text"> 個人護理用品 </div>
							</a>
						</li>
						<li>
							<a href="#" class="single-cat-item">
								<div class="icon">
									<img src="images/category/icon-9.svg" alt="">
								</div>
								<div class="text"> 寵物用品 </div>
							</a>
						</li>
                    </ul>
					<a href="#" class="morecate-btn"><i class="uil uil-apps"></i>更多選擇</a>
                </div>
            </div>
        </div>
    </div>
	<!-- Category Model End -->
	<!-- Search Model Start -->
	<div id="search_model" class="header-cate-model main-gambo-model modal fade" tabindex="-1" role="dialog" aria-modal="false">
        <div class="modal-dialog search-ground-area" role="document">
            <div class="category-area-inner">
                <div class="modal-header">
                    <button type="button" class="close btn-close" data-dismiss="modal" aria-label="Close">
						<i class="uil uil-multiply"></i>
                    </button>
                </div>
                <div class="category-model-content modal-content"> 
					<div class="search-header">
						<form action="#">
							<input type="search" placeholder="Search for products...">
							<button type="submit"><i class="uil uil-search"></i></button>
						</form>
					</div>
					
                </div>
            </div>
        </div>
    </div>
	<!-- Search Model End -->
	<!-- Cart Sidebar Offset Start-->
	<div class="bs-canvas bs-canvas-left position-fixed bg-cart h-100">
		<div class="bs-canvas-header side-cart-header p-3 ">
			<div class="d-inline-block  main-cart-title">
				我的購物車 <span>${Cart.itemNumber}項</span>
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
				value="${discount_sum + (ct.value.qty * ct.value.price * ct.value.discount/100)}" />
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
							<img width='60' height='80' src="<c:url value='/getPicture/${entry.value.productId}' />" />
<!-- 							<img -->
<%-- 								src="${pageContext.request.contextPath}/images/product/img-1.jpg" --%>
<!-- 								alt=""> -->
							<div class="offer-badge">
								<fmt:formatNumber value="${(100 - entry.value.discount)}"
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
									<input type="number" step="1" name="quantity" value="${entry.value.qty}" class="input-text qty text" id="quantity${status.count}"> 
									<input type="button" value="+" class="plus plus-btn" id="plus${status.count}" onclick="qtyPlus(${entry.value.productId},${status.count})">
								</div>
								<div class="cart-item-price">
									$
									<fmt:formatNumber
										value="${entry.value.price * entry.value.discount/100 }"
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
	<!-- Header Start -->
	<header class="header clearfix">
		<div class="top-header-group">
			<div class="top-header">
				<div class="res_main_logo">
					<a href="index.html"><img src="images/dark-logo-1.svg" alt=""></a>
				</div>
				<div class="main_logo" id="logo">
					<a href="index.html"><img src="images/logo.jpg" alt=""></a>
					<a href="index.html"><img class="logo-inverse" src="images/dark-logo.svg" alt=""></a>
				</div>

				<div class="search120">
					<div class="ui search">
						<form action="queryAllBook" method='GET'>
							<div class="ui left icon input swdh10">
								<input class="prompt srch10" type="text" name='book'
									placeholder="搜尋產品.."> <i
									class='uil uil-search-alt icon icon1'></i>
								<button type="submit" class="btn btn-outline-secondary">搜尋</button>
								<!-- 						//搜尋 -->
							</div>
						</form>
					</div>
				</div>
				<div class="header_right">
					<ul>
<!-- 						<li> -->
<!-- 							<a href="#" class="offer-link"><i class="uil uil-phone-alt"></i>1800-000-000</a> -->
<!-- 						</li> -->
						<li>
							<a href="offers" class="offer-link"><i class="uil uil-gift"></i>優惠活動</a>
						</li>
<!-- 						<li> -->
<!-- 							<a href="faq.html" class="offer-link"><i class="uil uil-question-circle"></i>Help</a> -->
<!-- 						</li> -->
<!-- 						<li> -->
<!-- 							<a href="dashboard_my_wishlist.html" class="option_links" title="Wishlist"><i class='uil uil-heart icon_wishlist'></i><span class="noti_count1">3</span></a> -->
<!-- 						</li>	 -->
						<li class="ui dropdown">
							<a href="#" class="opts_account">
							<c:if test="${ empty LoginOK && empty Admin}">
								<img src="images/avatar/img-5.jpg" alt="">
							</c:if>
							<c:if test="${! empty LoginOK && empty Admin}">
								<img src='${pageContext.request.contextPath}/getMemberImage?phone=${LoginOK.phone}'>
							</c:if>
							<c:if test="${ empty LoginOK && !empty Admin}">
								<img src="images/avatar/img-3.jpg" alt="">
							</c:if>
							
							<c:if test="${ empty LoginOK && empty Admin }">
								<span class="user__name">訪客您好</span>
							</c:if>
							<c:if test="${! empty LoginOK && empty Admin}">
								<span class="user__name">${LoginOK.name}</span>
							</c:if>
							<c:if test="${ empty LoginOK && ! empty Admin}">
								<span class="user__name">Admin</span>
							</c:if>
								<i class="uil uil-angle-down"></i>
							</a>
							<div class="menu dropdown_account">
								<c:if test="${empty LoginOK && !empty Admin}">
								<div class="night_mode_switch__btn">
									<a href="#" id="night-mode" class="btn-night-mode">
										<i class="uil uil-moon"></i> Night mode
										<span class="btn-night-mode-switch">
											<span class="uk-switch-button"></span>
										</span>
									</a>
								</div>	
								<a href="http://localhost:8080/_07_SalesPromotion/bookUpPage" class="item channel_item"><i	class="uil uil-box icon__1"></i>商品管理</a>
								<a href="http://localhost:8080/_07_SalesPromotion/store_manager" class="item channel_item"><i class="uil uil-shop icon__1"></i>門市管理</a>
								<a href="http://localhost:8080/_07_SalesPromotion/promotion_Manager" class="item channel_item"><i class="uil uil-gift icon__1"></i>行銷活動管理</a>
								<a href="http://localhost:8080/_07_SalesPromotion/logistics_manager" class="item channel_item"><i class="uil uil-newspaper icon__1"></i>物流管理</a>
								</c:if>
								<c:if test="${empty LoginOK && empty Admin}">
									<a href="<c:url value='Login' />" class="item channel_item"><i class="uil uil-lock-alt icon__1"></i>登入</a></c:if>
								<c:if test="${ ! empty LoginOK && empty Admin}">
								   <a href="<c:url value='Logout' />" class="item channel_item"><i class="uil uil-lock-alt icon__1"></i>登出</a>
								</c:if>
								<c:if test="${empty LoginOK && !empty Admin}">
								   <a href="<c:url value='LogoutAdmin' />" class="item channel_item"><i class="uil uil-lock-alt icon__1"></i>登出</a>
								</c:if>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="sub-header-group">
			<div class="sub-header">
				<div class="ui dropdown">
					<a href="#" class="category_drop hover-btn" data-toggle="modal" data-target="#category_model" title="Categories"><i class="uil uil-apps"></i><span class="cate__icon">種類選擇</span></a>
				</div>
				<nav class="navbar navbar-expand-lg navbar-light py-3">
					<div class="container-fluid">
						<button class="navbar-toggler menu_toggle_btn" type="button" data-target="#navbarSupportedContent"><i class="uil uil-bars"></i></button>
						<div class="collapse navbar-collapse d-flex flex-column flex-lg-row flex-xl-row justify-content-lg-end bg-dark1 p-3 p-lg-0 mt1-5 mt-lg-0 mobileMenu" id="navbarSupportedContent">
							<ul class="navbar-nav main_nav align-self-stretch">
								<li class="nav-item"><a href="index" class="nav-link active" title="Home">首頁</a></li>
								<li class="nav-item"><a href="bookpage" class="nav-link new_item" title="New Products">產品總覽</a></li>
								<!-- 產品頁面 -->
<!-- 								<li class="nav-item"><a href="shop_grid.html" class="nav-link" title="Featured Products">產品分類</a></li> -->
								<li class="nav-item">
									<div class="ui icon top left dropdown nav__menu">
										<a href="store_show" class="nav-link" title="Pages">門市查詢 
<!-- 										<i class="uil uil-angle-down"></i> -->
										</a>
									</div>
								</li>
								<c:if test="${!empty LoginOK && empty Admin}">
								<li class="nav-item">
									<div class="ui icon top left dropdown nav__menu">
										<a class="nav-link" title="Blog">會員資料 <i class="uil uil-angle-down"></i></a>
										<div class="menu dropdown_page">
<!-- 											<div class="night_mode_switch__btn"> -->
<!-- 												<a href="#" id="night-mode" class="btn-night-mode"> -->
<!-- 													<i class="uil uil-moon"></i> Night mode -->
<!-- 													<span class="btn-night-mode-switch"> -->
<!-- 														<span class="uk-switch-button"></span> -->
<!-- 													</span> -->
<!-- 												</a> -->
<!-- 											</div>	 -->
										
											<a href="http://localhost:8080/_07_SalesPromotion/Dashboard_PersonInfo"class="item channel_item"><i class="uil uil-apps icon__1"></i>個人檔案</a>
											<a href="http://localhost:8080/_07_SalesPromotion/Dashboard_Credit" class="item channel_item"><i class="uil uil-wallet icon__1"></i>信用卡</a>
											<a href="http://localhost:8080/_07_SalesPromotion/Dashboard_Address" class="item channel_item"><i class="uil uil-location-point icon__1"></i>地址</a>
											<a href="http://localhost:8080/_07_SalesPromotion/ordersallmain" class="item channel_item"><i class="uil uil-box icon__1"></i>訂單紀錄</a>
											<c:if test="${empty LoginOK && empty Admin}">
												<a href="<c:url value='Login' />" class="item channel_item"><i class="uil uil-lock-alt icon__1"></i>登入</a></c:if>
											<c:if test="${ ! empty LoginOK && empty Admin}">
											   <a href="<c:url value='Logout' />" class="item channel_item"><i class="uil uil-lock-alt icon__1"></i>登出</a>
											</c:if>
											<c:if test="${empty LoginOK && !empty Admin}">
											   <a href="<c:url value='LogoutAdmin' />" class="item channel_item"><i class="uil uil-lock-alt icon__1"></i>登出</a>
											</c:if>
										</div>
									</div>
								</li>	
								</c:if>
<!-- 								<li class="nav-item"><a href="contact_us.html" class="nav-link" title="Contact">Contact Us</a></li> -->
							</ul>
						</div>
					</div>
				</nav>
				<div class="catey__icon">
					<a href="#" class="cate__btn" data-toggle="modal" data-target="#category_model" title="Categories"><i class="uil uil-apps"></i></a>
				</div>
				<div class="header_cart order-1">
					<a href="#" class="cart__btn hover-btn pull-bs-canvas-left" title="Cart" id="openleft"><i class="uil uil-shopping-cart-alt"></i><span>購物車</span>
					<ins>${Cart.itemNumber}</ins><i class="uil uil-angle-down"></i></a>
				</div>
				<div class="search__icon order-1">
					<a href="#" class="search__btn hover-btn" data-toggle="modal" data-target="#search_model" title="Search"><i class="uil uil-search"></i></a>
				</div>
			</div>
		</div>
	</header>
	<!-- Header End -->
	<!-- Body Start -->
	<div class="wrapper">
	<div class="gambo-Breadcrumb">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="http://localhost:8080/_07_SalesPromotion/index">Home</a></li>
							<li class="breadcrumb-item" ><a href="http://localhost:8080/_07_SalesPromotion/ordersallmain">我的訂單</a></li>
							<li class="breadcrumb-item active" aria-current="page">物流資料</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<div class="dashboard-group">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="user-dt">
						<div class="user-img">
							<c:if test="${ empty LoginOK && empty Admin}">
								<img src="images/avatar/img-5.jpg" alt="">
							</c:if>
							<c:if test="${! empty LoginOK }">
								<img src='${pageContext.request.contextPath}/getMemberImage?phone=${LoginOK.phone}'>
							</c:if>
							<c:if test="${ empty LoginOK && !empty Admin}">
								<img src="images/avatar/img-3.jpg" alt="">
							</c:if>
								<div class="img-add">													
								</div>
							</div>
							<h4> ${LoginOK.name}</h4>
							<p> ${LoginOK.phone}</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-4">
						<div class="left-side-tabs">
							<div class="dashboard-left-links">
								<a href="http://localhost:8080/_07_SalesPromotion/Dashboard_PersonInfo" class="user-item"><i class="uil uil-apps"></i>個人檔案</a>
								<a href="http://localhost:8080/_07_SalesPromotion/Dashboard_Credit" class="user-item"><i class="uil uil-wallet"></i>信用卡</a>
								<a href="http://localhost:8080/_07_SalesPromotion/Dashboard_Address" class="user-item"><i class="uil uil-location-point"></i>地址</a>
								<a href="http://localhost:8080/_07_SalesPromotion/ordersallmain" class="user-item active"><i class="uil uil-box"></i>訂購紀錄</a>
								<a href="<c:url value='Logout' />" class="user-item"><i class="uil uil-exit"></i>登出</a>
							</div>
						</div>
					</div>
				<div class="col-lg-9 col-md-8">
					<div class="dashboard-right">
						<div class="row">
							<div class="col-md-12">
								
								<div class="col-lg-12 col-md-12">
									<div id="orderall" class="tab-pane fade in active">

										<div class="pdpt-bg" style="margin-top: 0px;">
											<div class="order-body10">
												<ul class="order-dtsll">
													<li>
														<div class="order-dt-img">
															<img
																src="${pageContext.request.contextPath}/images/logo.jpg"
																alt="">
														</div>
													</li>
													<li >
														<div class="order-dt47" >
															<h4 style=" font-size: 18px;">
															訂單編號${ShippingDataBean.orderBean.orderNo}的物流資料</h4>
														</div>
													</li>
												</ul>
											</div>

											<div class="total-dt">
												<div class="total-checkout-group">
													<div class="cart-total-dil">
														<h4>物流編號</h4>
														<span>${ShippingDataBean.orderBean.shippingNo}</span>
													</div>
												</div>
												<div class="total-checkout-group">
													<div class="cart-total-dil">
														<h4>運送地址</h4>
														<span id="sdbaddress">${ShippingDataBean.address}</span>
													</div>
												</div>


												<div class="total-checkout-group">
													<div class="cart-total-dil">
														<h4>運送方式</h4>
														<c:choose>
															<c:when test="${ShippingDataBean.shippingMethod == '01'}">
																<span  id="sdbshippingmethod" value="${ShippingDataBean.shippingMethod}">宅配到家</span>
															</c:when>
															<c:when test="${ShippingDataBean.shippingMethod == '02'}">
																<span  id="sdbshippingmethod" value="${ShippingDataBean.shippingMethod}">到店取貨</span>
															</c:when>
														</c:choose>
													</div>
												</div>

												<div class="total-checkout-group" 
												style="padding: 20px 20px;border-bottom: 1px solid #efefef;">
													<div class="cart-total-dil">
														<h4>運送狀態</h4>
														<c:choose>
															<c:when test="${ShippingDataBean.shippingStatus == null}">
																<span   id="sdbshippingstatus">尚未發貨</span>
															</c:when>
															<c:when test="${ShippingDataBean.shippingStatus == '01'}">
																<span   id="sdbshippingstatus">書果倉儲準備中...</span>
															</c:when>
															<c:when test="${ShippingDataBean.shippingStatus == '02'}">
																<span   id="sdbshippingstatus">書果物流運送中...</span>
															</c:when>
															<c:when test="${ShippingDataBean.shippingStatus == '03'}">
																<span   id="sdbshippingstatus">已送達地點</span>
															</c:when>
														</c:choose>
													</div>
												</div>

												<c:choose>
													<c:when test="${ShippingDataBean.shippingStatus == null && ShippingDataBean.orderNo_sort < 3}">
														<div class="btnU" id="sdbformdiv">
															<button type="button" class="btn btn-primary" id="sdbformON" style="font-size: 16px;">
															修改物流資料</button>
														</div>
													</c:when>
													<c:otherwise>
															<div class="btnU" id="backordermain">
																<a	href="http://localhost:8080/_07_SalesPromotion/ordersallmain"
																	class="btn btn-primary" style="font-size: 16px;"
																	id="backorderbtn"> 回訂單主頁</a>
															</div>
														</c:otherwise>
												</c:choose>

											</div>


												<fieldset id="each_order" style="display: none;">
													<form method="POST">
														<div class="containersdbform">

															<div class="row form-group" style="margin-bottom: 0px;">
																<h4 id='addr' class="addr_name">運送地址：</h4>
																<input id="address" name="address" type="text"
																			class="form-control" value=""
																			placeholder="${ShippingDataBean.address}"
																			style="margin: 0 10px;">
															</div>

															<div class="row">
																<input type="hidden" id="shippingNo"
																	value="${ShippingDataBean.orderBean.shippingNo}" />
															</div>

															<div class="row">
																<input type="hidden" id="shippingStatus"
																	value="${ShippingDataBean.shippingStatus}" />
															</div>

															<div class="row">
																<input type="hidden" id="orderNo"
																	value="${ShippingDataBean.orderBean.orderNo}" />
															</div>

															<div class="btnU">
																<input type="button" id="sdbformsubmit"
																	class="btn btn-primary" value="送出"
																	style="font-size: 16px;">
															</div>
															
															<div class="btnU">
																<input type="button" id="fastinsert"
																	class="btn btn-primary" value="一鍵輸入"
																	style="font-size: 16px;">
															</div>
														</div>
													</form>
												</fieldset>

												<div class="btnU" id="backordermain" style="display: none;">
													<a href="http://localhost:8080/_07_SalesPromotion/ordersallmain" 
													class="btn btn-primary" style="font-size: 16px;" id="backorderbtn">
													回訂單主頁</a>
												</div>

											</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- Body End -->


	<!-- Javascripts -->
	<script type="text/javascript">
        $( document ).ready(function() {
            if ($("#sdbformON").length > 0) {
                alert("出貨或修改超過2次就無法更改了喔!");
            }
            
        });
    </script>
	
	
	<script type="text/javascript">
		$( document ).ready(function() {
			$("#fastinsert").click(function() {
				$("#address").val("台北市大安區信義路三段153號");
			});
		});
	</script>
	
	<script type="text/javascript">
		$( document ).ready(function() {
			$("#sdbformON").click(function() {
				$("#each_order").show();
				$("#fastinsert").show();				
				$("#sdbformdiv").hide();
			});
		});
	</script>
	
	<script>
	$( document ).ready(function() {
		$("#sdbformsubmit").click(function() {
				$.ajax({
					//contentType: "application/json; charset=utf-8",
					type: "POST", 
	            	url: "<c:url value='/shippingdatachange/${ShippingDataBean.orderBean.orderNo}' />", 
	            	//dataType: "json",  data: "formData"才要
	            	data: { 			//傳送表單資料
	            		orderNo: $("#orderNo").val(), 
	            		shippingNo: $("#shippingNo").val(),
	            		address: $("#address").val(), 
	            		shippingStatus: $("#shippingStatus").val(), 
	            	},
	            	success: function(data) {
	            		alert("修改成功");
	            		$("#sdbaddress").html(data.address);
	            		$("#orderNo").val(data.orderNo);
	            		$("#shippingNo").val(data.shippingNo);
	            		$("#shippingStatus").val(data.shippingStatus);
	            		
	            		$("#each_order").hide();
	    				$("#sdbformsubmit").hide();
	    				$("#backordermain").show();	    				
	            	},
	            	error: function(data) {
	            		var obj = JSON.parse(data.responseText);
	            		alert(obj.errormsg);
	           		 }
				})	
				
		});
	});		
	</script>
	
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
	<script
		src="${pageContext.request.contextPath}/js/product.thumbnail.slider.js"></script>
	<script src="${pageContext.request.contextPath}/js/offset_overlay.js"></script>
	<script src="${pageContext.request.contextPath}/js/night-mode.js"></script>
</body>
</html>