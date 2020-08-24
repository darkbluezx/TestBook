<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, shrink-to-fit=9">
<meta name="description" content="Gambolthemes">
<meta name="author" content="Gambolthemes">
<title>書果店 - 商品</title>

<!-- Favicon Icon -->
<link rel="icon" type="image/png" href="images/fav.png">

<!-- Stylesheets -->
<link
	href="https://fonts.googleapis.com/css2?family=Rajdhani:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link href='vendor/unicons-2.0.1/css/unicons.css' rel='stylesheet'>
<link href="css/style.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
<link href="css/night-mode.css" rel="stylesheet">

<!-- Vendor Stylesheets -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
<link href="vendor/OwlCarousel/assets/owl.carousel.css" rel="stylesheet">
<link href="vendor/OwlCarousel/assets/owl.theme.default.min.css"
	rel="stylesheet">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="vendor/semantic/semantic.min.css">	
</head>

<body>


<!-- <div onchange="itemhide()"> -->
<!-- <select id='bookId' onchange="books()"> -->
<%-- 		<c:forEach var='item' items='${itemConlist}'> --%>
<%-- 			<option value='${item}'>${item}</option> --%>
<%-- 		</c:forEach> --%>
<!-- 	</select> -->
<!-- </div> -->
<!-- <a href='/allbooks' >3. 書籍的JSON格式資料</a><br> -->
	
	<!-- Category Model Start-->
<!-- 	<div id="category_model" -->
<!-- 		class="header-cate-model main-gambo-model modal fade" tabindex="-1" -->
<!-- 		role="dialog" aria-modal="false"> -->
<!-- 		<div class="modal-dialog category-area" role="document"> -->
<!-- 			<div class="category-area-inner"> -->
<!-- 				<div class="modal-header"> -->
<!-- 					<button type="button" class="close btn-close" data-dismiss="modal" -->
<!-- 						aria-label="Close"> -->
<!-- 						<i class="uil uil-multiply"></i> -->
<!-- 					</button> -->
<!-- 				</div> -->
<!-- 				<div class="category-model-content modal-content"> -->
<!-- 					<div class="cate-header"> -->
<!-- 						<h4>Select Category</h4> -->
<!-- 					</div> -->
<!-- 					<ul class="category-by-cat"> -->
<!-- 						<li><a href="#" class="single-cat-item"> -->
<!-- 								<div class="icon"> -->
<!-- 									<img src="images/category/icon-1.svg" alt=""> -->
<!-- 								</div> -->
<!-- 								<div class="text">Fruits and Vegetables</div> -->
<!-- 						</a></li> -->
<!-- 						<li><a href="#" class="single-cat-item"> -->
<!-- 								<div class="icon"> -->
<!-- 									<img src="images/category/icon-2.svg" alt=""> -->
<!-- 								</div> -->
<!-- 								<div class="text">Grocery & Staples</div> -->
<!-- 						</a></li> -->
<!-- 						<li><a href="#" class="single-cat-item"> -->
<!-- 								<div class="icon"> -->
<!-- 									<img src="images/category/icon-3.svg" alt=""> -->
<!-- 								</div> -->
<!-- 								<div class="text">Dairy & Eggs</div> -->
<!-- 						</a></li> -->
<!-- 						<li><a href="#" class="single-cat-item"> -->
<!-- 								<div class="icon"> -->
<!-- 									<img src="images/category/icon-4.svg" alt=""> -->
<!-- 								</div> -->
<!-- 								<div class="text">Beverages</div> -->
<!-- 						</a></li> -->
<!-- 						<li><a href="#" class="single-cat-item"> -->
<!-- 								<div class="icon"> -->
<!-- 									<img src="images/category/icon-5.svg" alt=""> -->
<!-- 								</div> -->
<!-- 								<div class="text">Snacks</div> -->
<!-- 						</a></li> -->
<!-- 						<li><a href="#" class="single-cat-item"> -->
<!-- 								<div class="icon"> -->
<!-- 									<img src="images/category/icon-6.svg" alt=""> -->
<!-- 								</div> -->
<!-- 								<div class="text">Home Care</div> -->
<!-- 						</a></li> -->
<!-- 						<li><a href="#" class="single-cat-item"> -->
<!-- 								<div class="icon"> -->
<!-- 									<img src="images/category/icon-7.svg" alt=""> -->
<!-- 								</div> -->
<!-- 								<div class="text">Noodles & Sauces</div> -->
<!-- 						</a></li> -->
<!-- 						<li><a href="#" class="single-cat-item"> -->
<!-- 								<div class="icon"> -->
<!-- 									<img src="images/category/icon-8.svg" alt=""> -->
<!-- 								</div> -->
<!-- 								<div class="text">Personal Care</div> -->
<!-- 						</a></li> -->
<!-- 						<li><a href="#" class="single-cat-item"> -->
<!-- 								<div class="icon"> -->
<!-- 									<img src="images/category/icon-9.svg" alt=""> -->
<!-- 								</div> -->
<!-- 								<div class="text">Pet Care</div> -->
<!-- 						</a></li> -->
<!-- 					</ul> -->
<!-- 					<a href="#" class="morecate-btn"><i class="uil uil-apps"></i>More -->
<!-- 						Categories</a> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
	<!-- Category Model End-->
	<!-- Search Model Start-->
<!-- 	<div id="search_model" -->
<!-- 		class="header-cate-model main-gambo-model modal fade" tabindex="-1" -->
<!-- 		role="dialog" aria-modal="false"> -->
<!-- 		<div class="modal-dialog search-ground-area" role="document"> -->
<!-- 			<div class="category-area-inner"> -->
<!-- 				<div class="modal-header"> -->
<!-- 					<button type="button" class="close btn-close" data-dismiss="modal" -->
<!-- 						aria-label="Close"> -->
<!-- 						<i class="uil uil-multiply"></i> -->
<!-- 					</button> -->
<!-- 				</div> -->
<!-- 				<div class="category-model-content modal-content"> -->
<!-- 					<div class="search-header"> -->
<%-- 						<form action="#"> --%>
<!-- 							<input type="search" placeholder="Search for products..."> -->
<!-- 							<button type="submit"> -->
<!-- 								<i class="uil uil-search"></i> -->
<!-- 							</button> -->
<%-- 						</form> --%>
<!-- 					</div> -->
<!-- 					<div class="search-by-cat"> -->
<!-- 						<a href="#" class="single-cat"> -->
<!-- 							<div class="icon"> -->
<!-- 								<img src="images/category/icon-1.svg" alt=""> -->
<!-- 							</div> -->
<!-- 							<div class="text">Fruits and Vegetables</div> -->
<!-- 						</a> <a href="#" class="single-cat"> -->
<!-- 							<div class="icon"> -->
<!-- 								<img src="images/category/icon-2.svg" alt=""> -->
<!-- 							</div> -->
<!-- 							<div class="text">Grocery & Staples</div> -->
<!-- 						</a> <a href="#" class="single-cat"> -->
<!-- 							<div class="icon"> -->
<!-- 								<img src="images/category/icon-3.svg" alt=""> -->
<!-- 							</div> -->
<!-- 							<div class="text">Dairy & Eggs</div> -->
<!-- 						</a> <a href="#" class="single-cat"> -->
<!-- 							<div class="icon"> -->
<!-- 								<img src="images/category/icon-4.svg" alt=""> -->
<!-- 							</div> -->
<!-- 							<div class="text">Beverages</div> -->
<!-- 						</a> <a href="#" class="single-cat"> -->
<!-- 							<div class="icon"> -->
<!-- 								<img src="images/category/icon-5.svg" alt=""> -->
<!-- 							</div> -->
<!-- 							<div class="text">Snacks</div> -->
<!-- 						</a> <a href="#" class="single-cat"> -->
<!-- 							<div class="icon"> -->
<!-- 								<img src="images/category/icon-6.svg" alt=""> -->
<!-- 							</div> -->
<!-- 							<div class="text">Home Care</div> -->
<!-- 						</a> <a href="#" class="single-cat"> -->
<!-- 							<div class="icon"> -->
<!-- 								<img src="images/category/icon-7.svg" alt=""> -->
<!-- 							</div> -->
<!-- 							<div class="text">Noodles & Sauces</div> -->
<!-- 						</a> <a href="#" class="single-cat"> -->
<!-- 							<div class="icon"> -->
<!-- 								<img src="images/category/icon-8.svg" alt=""> -->
<!-- 							</div> -->
<!-- 							<div class="text">Personal Care</div> -->
<!-- 						</a> <a href="#" class="single-cat"> -->
<!-- 							<div class="icon"> -->
<!-- 								<img src="images/category/icon-9.svg" alt=""> -->
<!-- 							</div> -->
<!-- 							<div class="text">Pet Care</div> -->
<!-- 						</a> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
	<!-- Search Model End-->
	<!-- Cart Sidebar Offset Start-->
<!-- 	<div class="bs-canvas bs-canvas-left position-fixed bg-cart h-100"> -->
<!-- 		<div class="bs-canvas-header side-cart-header p-3 "> -->
<!-- 			<div class="d-inline-block  main-cart-title"> -->
<!-- 				My Cart <span>(2 Items)</span> -->
<!-- 			</div> -->
<!-- 			<button type="button" class="bs-canvas-close close" -->
<!-- 				aria-label="Close"> -->
<!-- 				<i class="uil uil-multiply"></i> -->
<!-- 			</button> -->
<!-- 		</div> -->
<!-- 		<div class="bs-canvas-body"> -->
<!-- 			<div class="cart-top-total"> -->
<!-- 				<div class="cart-total-dil"> -->
<!-- 					<h4>Gambo Super Market</h4> -->
<!-- 					<span>$34</span> -->
<!-- 				</div> -->
<!-- 				<div class="cart-total-dil pt-2"> -->
<!-- 					<h4>Delivery Charges</h4> -->
<!-- 					<span>$1</span> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="side-cart-items"> -->
<!-- 				<div class="cart-item"> -->
<!-- 					<div class="cart-product-img"> -->
<!-- 						<img src="images/product/img-1.jpg" alt=""> -->
<!-- 						<div class="offer-badge">6% OFF</div> -->
<!-- 					</div> -->
<!-- 					<div class="cart-text"> -->
<!-- 						<h4>Product Title Here</h4> -->
<!-- 						<div class="cart-radio"> -->
<!-- 							<ul class="kggrm-now"> -->
<!-- 								<li><input type="radio" id="a1" name="cart1"> <label -->
<!-- 									for="a1">0.50</label></li> -->
<!-- 								<li><input type="radio" id="a2" name="cart1"> <label -->
<!-- 									for="a2">1kg</label></li> -->
<!-- 								<li><input type="radio" id="a3" name="cart1"> <label -->
<!-- 									for="a3">2kg</label></li> -->
<!-- 								<li><input type="radio" id="a4" name="cart1"> <label -->
<!-- 									for="a4">3kg</label></li> -->
<!-- 							</ul> -->
<!-- 						</div> -->
<!-- 						<div class="qty-group"> -->
<!-- 							<div class="quantity buttons_added"> -->
<!-- 								<input type="button" value="-" class="minus minus-btn"> -->
<!-- 								<input type="number" step="1" name="quantity" value="1" -->
<!-- 									class="input-text qty text"> <input type="button" -->
<!-- 									value="+" class="plus plus-btn"> -->
<!-- 							</div> -->
<!-- 							<div class="cart-item-price"> -->
<!-- 								$10 <span>$15</span> -->
<!-- 							</div> -->
<!-- 						</div> -->

<!-- 						<button type="button" class="cart-close-btn"> -->
<!-- 							<i class="uil uil-multiply"></i> -->
<!-- 						</button> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="cart-item"> -->
<!-- 					<div class="cart-product-img"> -->
<!-- 						<img src="images/product/img-2.jpg" alt=""> -->
<!-- 						<div class="offer-badge">6% OFF</div> -->
<!-- 					</div> -->
<!-- 					<div class="cart-text"> -->
<!-- 						<h4>Product Title Here</h4> -->
<!-- 						<div class="cart-radio"> -->
<!-- 							<ul class="kggrm-now"> -->
<!-- 								<li><input type="radio" id="a5" name="cart2"> <label -->
<!-- 									for="a5">0.50</label></li> -->
<!-- 								<li><input type="radio" id="a6" name="cart2"> <label -->
<!-- 									for="a6">1kg</label></li> -->
<!-- 								<li><input type="radio" id="a7" name="cart2"> <label -->
<!-- 									for="a7">2kg</label></li> -->
<!-- 							</ul> -->
<!-- 						</div> -->
<!-- 						<div class="qty-group"> -->
<!-- 							<div class="quantity buttons_added"> -->
<!-- 								<input type="button" value="-" class="minus minus-btn"> -->
<!-- 								<input type="number" step="1" name="quantity" value="1" -->
<!-- 									class="input-text qty text"> <input type="button" -->
<!-- 									value="+" class="plus plus-btn"> -->
<!-- 							</div> -->
<!-- 							<div class="cart-item-price"> -->
<!-- 								$24 <span>$30</span> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<button type="button" class="cart-close-btn"> -->
<!-- 							<i class="uil uil-multiply"></i> -->
<!-- 						</button> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="bs-canvas-footer"> -->
<!-- 			<div class="cart-total-dil saving-total "> -->
<!-- 				<h4>Total Saving</h4> -->
<!-- 				<span>$11</span> -->
<!-- 			</div> -->
<!-- 			<div class="main-total-cart"> -->
<!-- 				<h2>Total</h2> -->
<!-- 				<span>$35</span> -->
<!-- 			</div> -->
<!-- 			<div class="checkout-cart"> -->
<!-- 				<a href="#" class="promo-code">Have a promocode?</a> <a href="#" -->
<!-- 					class="cart-checkout-btn hover-btn">Proceed to Checkout</a> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
	<!-- Cart Sidebar Offsetl End-->
<!-- 	<!-- Filter Right Sidebar Offset Start--> 
<!-- 	<div class="bs-canvas bs-canvas-right position-fixed bg-cart h-100"> -->
<!-- 		<div class="bs-canvas-header side-cart-header p-3 "> -->
<!-- 			<div class="d-inline-block  main-cart-title">Filters</div> -->
<!-- 			<button type="button" class="bs-canvas-close close" -->
<!-- 				aria-label="Close"> -->
<!-- 				<i class="uil uil-multiply"></i> -->
<!-- 			</button> -->
<!-- 		</div> -->
<!-- 		<div class="bs-canvas-body filter-body"> -->
<!-- 			<div class="filter-items"> -->
<!-- 				<div class="filtr-cate-title"> -->
<!-- 					<h4>Categories</h4> -->
<!-- 				</div> -->
<!-- 				<div class="filter-item-body scrollstyle_4"> -->
<!-- 					<div class="cart-radio"> -->
<!-- 						<ul class="cte-select"> -->
<!-- 							<li><input type="radio" id="c1" name="category1"> <label -->
<!-- 								for="c1">All</label></li> -->
<!-- 							<li><input type="radio" id="c2" name="category1" checked> -->
<!-- 								<label for="c2">Vegetables & Fruits</label></li> -->
<!-- 							<li><input type="radio" id="c3" name="category1"> <label -->
<!-- 								for="c3">Grocery & Staples</label></li> -->
<!-- 							<li><input type="radio" id="c4" name="category1"> <label -->
<!-- 								for="c4">Dairy & Eggs</label></li> -->
<!-- 							<li><input type="radio" id="c5" name="category1"> <label -->
<!-- 								for="c5">Beverages</label></li> -->
<!-- 							<li><input type="radio" id="c6" name="category1"> <label -->
<!-- 								for="c6">Snacks</label></li> -->
<!-- 							<li><input type="radio" id="c7" name="category1"> <label -->
<!-- 								for="c7">Home Care</label></li> -->
<!-- 							<li><input type="radio" id="c8" name="category1"> <label -->
<!-- 								for="c8">Noodles & Sauces</label></li> -->
<!-- 							<li><input type="radio" id="c9" name="category1"> <label -->
<!-- 								for="c9">Personal Care</label></li> -->
<!-- 							<li><input type="radio" id="c10" name="category1"> <label -->
<!-- 								for="c10">Pat Care</label></li> -->
<!-- 							<li><input type="radio" id="c11" name="category1"> <label -->
<!-- 								for="c11">Mea & Seafood</label></li> -->
<!-- 							<li><input type="radio" id="c12" name="category1"> <label -->
<!-- 								for="c12">Electronics</label></li> -->
<!-- 						</ul> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="filter-items"> -->
<!-- 				<div class="filtr-cate-title"> -->
<!-- 					<h4>Brand</h4> -->
<!-- 				</div> -->
<!-- 				<div class="other-item-body scrollstyle_4"> -->
<!-- 					<div class="brand-list"> -->
<!-- 						<div class="search-by-catgory"> -->
<!-- 							<div class="ui search"> -->
<!-- 								<div class="ui left icon input swdh10"> -->
<!-- 									<input class="prompt srch10" type="text" -->
<!-- 										placeholder="Search by brand.."> <i -->
<!-- 										class="uil uil-search-alt icon icon1"></i> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="custom-control custom-checkbox pb2"> -->
<!-- 							<input type="checkbox" class="custom-control-input" id="brand_1"> -->
<!-- 							<label class="custom-control-label" for="brand_1">Brand -->
<!-- 								Name</label> -->
<!-- 						</div> -->
<!-- 						<div class="custom-control custom-checkbox pb2"> -->
<!-- 							<input type="checkbox" class="custom-control-input" id="brand_2"> -->
<!-- 							<label class="custom-control-label" for="brand_2">Brand -->
<!-- 								Name</label> -->
<!-- 						</div> -->
<!-- 						<div class="custom-control custom-checkbox pb2"> -->
<!-- 							<input type="checkbox" class="custom-control-input" id="brand_3"> -->
<!-- 							<label class="custom-control-label" for="brand_3">Brand -->
<!-- 								Name</label> -->
<!-- 						</div> -->
<!-- 						<div class="custom-control custom-checkbox pb2"> -->
<!-- 							<input type="checkbox" class="custom-control-input" id="brand_4"> -->
<!-- 							<label class="custom-control-label" for="brand_4">Brand -->
<!-- 								Name</label> -->
<!-- 						</div> -->
<!-- 						<div class="custom-control custom-checkbox pb2"> -->
<!-- 							<input type="checkbox" class="custom-control-input" id="brand_5"> -->
<!-- 							<label class="custom-control-label" for="brand_5">Brand -->
<!-- 								Name</label> -->
<!-- 						</div> -->
<!-- 						<div class="custom-control custom-checkbox pb2"> -->
<!-- 							<input type="checkbox" class="custom-control-input" id="brand_6"> -->
<!-- 							<label class="custom-control-label" for="brand_6">Brand -->
<!-- 								Name</label> -->
<!-- 						</div> -->
<!-- 						<div class="custom-control custom-checkbox pb2"> -->
<!-- 							<input type="checkbox" class="custom-control-input" id="brand_7"> -->
<!-- 							<label class="custom-control-label" for="brand_7">Brand -->
<!-- 								Name</label> -->
<!-- 						</div> -->
<!-- 						<div class="custom-control custom-checkbox pb2"> -->
<!-- 							<input type="checkbox" class="custom-control-input" id="brand_8"> -->
<!-- 							<label class="custom-control-label" for="brand_8">Brand -->
<!-- 								Name</label> -->
<!-- 						</div> -->
<!-- 						<div class="custom-control custom-checkbox pb2"> -->
<!-- 							<input type="checkbox" class="custom-control-input" id="brand_9"> -->
<!-- 							<label class="custom-control-label" for="brand_9">Brand -->
<!-- 								Name</label> -->
<!-- 						</div> -->
<!-- 						<div class="custom-control custom-checkbox pb2"> -->
<!-- 							<input type="checkbox" class="custom-control-input" id="brand_10"> -->
<!-- 							<label class="custom-control-label" for="brand_10">Brand -->
<!-- 								Name</label> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="filter-items"> -->
<!-- 				<div class="filtr-cate-title"> -->
<!-- 					<h4>Price</h4> -->
<!-- 				</div> -->
<!-- 				<div class="price-pack-item-body scrollstyle_4"> -->
<!-- 					<div class="brand-list"> -->
<!-- 						<div class="custom-control custom-checkbox pb2"> -->
<!-- 							<input type="checkbox" class="custom-control-input" id="price_1"> -->
<!-- 							<label class="custom-control-label" for="price_1">Less -->
<!-- 								than $2 <span class="webproduct">(9)</span> -->
<!-- 							</label> -->
<!-- 						</div> -->
<!-- 						<div class="custom-control custom-checkbox pb2"> -->
<!-- 							<input type="checkbox" class="custom-control-input" id="price_2"> -->
<!-- 							<label class="custom-control-label" for="price_2">$2 to -->
<!-- 								$5 <span class="webproduct">(8)</span> -->
<!-- 							</label> -->
<!-- 						</div> -->
<!-- 						<div class="custom-control custom-checkbox pb2"> -->
<!-- 							<input type="checkbox" class="custom-control-input" id="price_3"> -->
<!-- 							<label class="custom-control-label" for="price_3">$6 to -->
<!-- 								$10 <span class="webproduct">(12)</span> -->
<!-- 							</label> -->
<!-- 						</div> -->
<!-- 						<div class="custom-control custom-checkbox pb2"> -->
<!-- 							<input type="checkbox" class="custom-control-input" id="price_4"> -->
<!-- 							<label class="custom-control-label" for="price_4">$11 to -->
<!-- 								$15 <span class="webproduct">(4)</span> -->
<!-- 							</label> -->
<!-- 						</div> -->
<!-- 						<div class="custom-control custom-checkbox pb2"> -->
<!-- 							<input type="checkbox" class="custom-control-input" id="price_5"> -->
<!-- 							<label class="custom-control-label" for="price_5">$15 to -->
<!-- 								$20 <span class="webproduct">(16)</span> -->
<!-- 							</label> -->
<!-- 						</div> -->
<!-- 						<div class="custom-control custom-checkbox pb2"> -->
<!-- 							<input type="checkbox" class="custom-control-input" id="price_6"> -->
<!-- 							<label class="custom-control-label" for="price_6">$21 to -->
<!-- 								$25 <span class="webproduct">(18)</span> -->
<!-- 							</label> -->
<!-- 						</div> -->
<!-- 						<div class="custom-control custom-checkbox pb2"> -->
<!-- 							<input type="checkbox" class="custom-control-input" id="price_7"> -->
<!-- 							<label class="custom-control-label" for="price_7">More -->
<!-- 								than $25 <span class="webproduct">(25)</span> -->
<!-- 							</label> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="filter-items"> -->
<!-- 				<div class="filtr-cate-title"> -->
<!-- 					<h4>Discount</h4> -->
<!-- 				</div> -->
<!-- 				<div class="offer-item-body scrollstyle_4"> -->
<!-- 					<div class="brand-list"> -->
<!-- 						<div class="custom-control custom-checkbox pb2"> -->
<!-- 							<input type="checkbox" class="custom-control-input" id="offer_1"> -->
<!-- 							<label class="custom-control-label" for="offer_1">2% - 5% -->
<!-- 								<span class="webproduct">(9)</span> -->
<!-- 							</label> -->
<!-- 						</div> -->
<!-- 						<div class="custom-control custom-checkbox pb2"> -->
<!-- 							<input type="checkbox" class="custom-control-input" id="offer_2"> -->
<!-- 							<label class="custom-control-label" for="offer_2">6% - -->
<!-- 								10% <span class="webproduct">(5)</span> -->
<!-- 							</label> -->
<!-- 						</div> -->
<!-- 						<div class="custom-control custom-checkbox pb2"> -->
<!-- 							<input type="checkbox" class="custom-control-input" id="offer_3"> -->
<!-- 							<label class="custom-control-label" for="offer_3">11% - -->
<!-- 								15% <span class="webproduct">(11)</span> -->
<!-- 							</label> -->
<!-- 						</div> -->
<!-- 						<div class="custom-control custom-checkbox pb2"> -->
<!-- 							<input type="checkbox" class="custom-control-input" id="offer_4"> -->
<!-- 							<label class="custom-control-label" for="offer_4">16% - -->
<!-- 								25% <span class="webproduct">(27)</span> -->
<!-- 							</label> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="filter-items"> -->
<!-- 				<div class="filtr-cate-title"> -->
<!-- 					<h4>Pack Size</h4> -->
<!-- 				</div> -->
<!-- 				<div class="price-pack-item-body scrollstyle_4"> -->
<!-- 					<div class="brand-list"> -->
<!-- 						<div class="custom-control custom-checkbox pb2"> -->
<!-- 							<input type="checkbox" class="custom-control-input" id="pack_1"> -->
<!-- 							<label class="custom-control-label" for="pack_1">1 pc</label> -->
<!-- 						</div> -->
<!-- 						<div class="custom-control custom-checkbox pb2"> -->
<!-- 							<input type="checkbox" class="custom-control-input" id="pack_2"> -->
<!-- 							<label class="custom-control-label" for="pack_2">1 pc -->
<!-- 								approx. 400 to 600 gm</label> -->
<!-- 						</div> -->
<!-- 						<div class="custom-control custom-checkbox pb2"> -->
<!-- 							<input type="checkbox" class="custom-control-input" id="pack_3"> -->
<!-- 							<label class="custom-control-label" for="pack_3">1 pc -->
<!-- 								approx. 500 to 800 gm</label> -->
<!-- 						</div> -->
<!-- 						<div class="custom-control custom-checkbox pb2"> -->
<!-- 							<input type="checkbox" class="custom-control-input" id="pack_4"> -->
<!-- 							<label class="custom-control-label" for="pack_4">Combo 3 -->
<!-- 								Items</label> -->
<!-- 						</div> -->
<!-- 						<div class="custom-control custom-checkbox pb2"> -->
<!-- 							<input type="checkbox" class="custom-control-input" id="pack_5"> -->
<!-- 							<label class="custom-control-label" for="pack_5">Combo 4 -->
<!-- 								Items</label> -->
<!-- 						</div> -->
<!-- 						<div class="custom-control custom-checkbox pb2"> -->
<!-- 							<input type="checkbox" class="custom-control-input" id="pack_6"> -->
<!-- 							<label class="custom-control-label" for="pack_6">Combo 5 -->
<!-- 								Items</label> -->
<!-- 						</div> -->
<!-- 						<div class="custom-control custom-checkbox pb2"> -->
<!-- 							<input type="checkbox" class="custom-control-input" id="pack_7"> -->
<!-- 							<label class="custom-control-label" for="pack_7">2 pcs</label> -->
<!-- 						</div> -->
<!-- 						<div class="custom-control custom-checkbox pb2"> -->
<!-- 							<input type="checkbox" class="custom-control-input" id="pack_8"> -->
<!-- 							<label class="custom-control-label" for="pack_8">100 g</label> -->
<!-- 						</div> -->
<!-- 						<div class="custom-control custom-checkbox pb2"> -->
<!-- 							<input type="checkbox" class="custom-control-input" id="pack_9"> -->
<!-- 							<label class="custom-control-label" for="pack_9">200 g</label> -->
<!-- 						</div> -->
<!-- 						<div class="custom-control custom-checkbox pb2"> -->
<!-- 							<input type="checkbox" class="custom-control-input" id="pack_10"> -->
<!-- 							<label class="custom-control-label" for="pack_10">250 g</label> -->
<!-- 						</div> -->
<!-- 						<div class="custom-control custom-checkbox pb2"> -->
<!-- 							<input type="checkbox" class="custom-control-input" id="pack_11"> -->
<!-- 							<label class="custom-control-label" for="pack_11">500g</label> -->
<!-- 						</div> -->
<!-- 						<div class="custom-control custom-checkbox pb2"> -->
<!-- 							<input type="checkbox" class="custom-control-input" id="pack_12"> -->
<!-- 							<label class="custom-control-label" for="pack_12">1kg</label> -->
<!-- 						</div> -->
<!-- 						<div class="custom-control custom-checkbox pb2"> -->
<!-- 							<input type="checkbox" class="custom-control-input" id="pack_13"> -->
<!-- 							<label class="custom-control-label" for="pack_13">2kg</label> -->
<!-- 						</div> -->
<!-- 						<div class="custom-control custom-checkbox pb2"> -->
<!-- 							<input type="checkbox" class="custom-control-input" id="pack_14"> -->
<!-- 							<label class="custom-control-label" for="pack_14">3kg</label> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- Filter Right Sidebar Offsetl End--> 
	<!-- Header Start -->
<!-- 	<header class="header clearfix"> -->
<!-- 		<div class="top-header-group"> -->
<!-- 			<div class="top-header"> -->
<!-- 				<div class="res_main_logo"> -->
<!-- 					<a href="index.html"><img src="images/dark-logo-1.svg" alt=""></a> -->
<!-- 				</div> -->
<!-- 				<div class="main_logo" id="logo"> -->
<!-- 					<a href="index.html"><img src="images/logo.svg" alt=""></a> <a -->
<!-- 						href="index.html"><img class="logo-inverse" -->
<!-- 						src="images/dark-logo.svg" alt=""></a> -->
<!-- 				</div> -->
<!-- 				<div class="select_location"> -->
<!-- 					<div class="ui inline dropdown loc-title"> -->
<!-- 						<div class="text"> -->
<!-- 							<i class="uil uil-location-point"></i> Gurugram -->
<!-- 						</div> -->
<!-- 						<i class="uil uil-angle-down icon__14"></i> -->
<!-- 						<div class="menu dropdown_loc"> -->
<!-- 							<div class="item channel_item"> -->
<!-- 								<i class="uil uil-location-point"></i> Gurugram -->
<!-- 							</div> -->
<!-- 							<div class="item channel_item"> -->
<!-- 								<i class="uil uil-location-point"></i> New Delhi -->
<!-- 							</div> -->
<!-- 							<div class="item channel_item"> -->
<!-- 								<i class="uil uil-location-point"></i> Bangaluru -->
<!-- 							</div> -->
<!-- 							<div class="item channel_item"> -->
<!-- 								<i class="uil uil-location-point"></i> Mumbai -->
<!-- 							</div> -->
<!-- 							<div class="item channel_item"> -->
<!-- 								<i class="uil uil-location-point"></i> Hyderabad -->
<!-- 							</div> -->
<!-- 							<div class="item channel_item"> -->
<!-- 								<i class="uil uil-location-point"></i> Kolkata -->
<!-- 							</div> -->
<!-- 							<div class="item channel_item"> -->
<!-- 								<i class="uil uil-location-point"></i> Ludhiana -->
<!-- 							</div> -->
<!-- 							<div class="item channel_item"> -->
<!-- 								<i class="uil uil-location-point"></i> Chandigrah -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->

<!-- 				<div class="search120"> -->
<!-- 					<div class="ui search"> -->
<%-- 						<form action="queryAllBook" method='GET'> --%>
<!-- 							<div class="ui left icon input swdh10"> -->
<!-- 								<input class="prompt srch10" type="text" name='book' -->
<!-- 									placeholder="Search for products.."> <i -->
<!-- 									class='uil uil-search-alt icon icon1'></i> -->
<!-- 								<button type="submit" class="btn btn-outline-secondary">Search</button> -->
<!-- 														//搜尋 -->
<!-- 							</div> -->
<%-- 						</form> --%>
<!-- 					</div> -->
<!-- 				</div> -->

<!-- 				<div class="header_right"> -->
<!-- 					<ul> -->
<!-- 						<li><a href="#" class="offer-link"><i -->
<!-- 								class="uil uil-phone-alt"></i>1800-000-000</a></li> -->
<!-- 						<li><a href="offers" class="offer-link"><i class="uil uil-gift"></i>優惠活動</a></li> -->
<!-- 						<li><a href="faq.html" class="offer-link"><i -->
<!-- 								class="uil uil-question-circle"></i>Help</a></li> -->
<!-- 						<li><a href="dashboard_my_wishlist.html" class="option_links" -->
<!-- 							title="Wishlist"><i class='uil uil-heart icon_wishlist'></i><span -->
<!-- 								class="noti_count1">3</span></a></li> -->
<!-- 						<li class="ui dropdown"><a href="#" class="opts_account"> -->
<!-- 								<img src="images/avatar/img-5.jpg" alt=""> <span -->
<!-- 								class="user__name">John Doe</span> <i class="uil uil-angle-down"></i> -->
<!-- 						</a> -->
<!-- 							<div class="menu dropdown_account"> -->
<!-- 								<div class="night_mode_switch__btn"> -->
<!-- 									<a href="#" id="night-mode" class="btn-night-mode"> <i -->
<!-- 										class="uil uil-moon"></i> Night mode <span -->
<!-- 										class="btn-night-mode-switch"> <span -->
<!-- 											class="uk-switch-button"></span> -->
<!-- 									</span> -->
<!-- 									</a> -->
<!-- 								</div> -->
<!-- 								<a href="dashboard_overview.html" class="item channel_item"><i -->
<!-- 									class="uil uil-apps icon__1"></i>Dashbaord</a> <a -->
<!-- 									href="dashboard_my_orders.html" class="item channel_item"><i -->
<!-- 									class="uil uil-box icon__1"></i>My Orders</a> <a -->
<!-- 									href="dashboard_my_wishlist.html" class="item channel_item"><i -->
<!-- 									class="uil uil-heart icon__1"></i>My Wishlist</a> <a -->
<!-- 									href="dashboard_my_wallet.html" class="item channel_item"><i -->
<!-- 									class="uil uil-usd-circle icon__1"></i>My Wallet</a>  -->
<!-- 									<a href="promotion_Manager" class="item channel_item"><i class="uil uil-location-point icon__1"> -->
<!-- 										</i>行銷活動管理 -->
<!-- 									</a> -->
<!-- 									<a -->
<!-- 									href="offers.html" class="item channel_item"><i -->
<!-- 									class="uil uil-gift icon__1"></i>Offers</a> <a href="faq.html" -->
<!-- 									class="item channel_item"><i -->
<!-- 									class="uil uil-info-circle icon__1"></i>Faq</a> <a -->
<!-- 									href="sign_in.html" class="item channel_item"><i -->
<!-- 									class="uil uil-lock-alt icon__1"></i>Logout</a> -->
<!-- 							</div></li> -->
<!-- 					</ul> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="sub-header-group"> -->
<!-- 			<div class="sub-header"> -->
<!-- 				<div class="ui dropdown"> -->
<!-- 					<a href="#" class="category_drop hover-btn" data-toggle="modal" -->
<!-- 						data-target="#category_model" title="Categories"><i -->
<!-- 						class="uil uil-apps"></i><span class="cate__icon">Select -->
<!-- 							Category</span></a> -->
<!-- 				</div> -->
<!-- 				<nav class="navbar navbar-expand-lg navbar-light py-3"> -->
<!-- 					<div class="container-fluid"> -->
<!-- 						<button class="navbar-toggler menu_toggle_btn" type="button" -->
<!-- 							data-target="#navbarSupportedContent"> -->
<!-- 							<i class="uil uil-bars"></i> -->
<!-- 						</button> -->
<!-- 						<div -->
<!-- 							class="collapse navbar-collapse d-flex flex-column flex-lg-row flex-xl-row justify-content-lg-end bg-dark1 p-3 p-lg-0 mt1-5 mt-lg-0 mobileMenu" -->
<!-- 							id="navbarSupportedContent"> -->
<!-- 							<ul class="navbar-nav main_nav align-self-stretch"> -->
<!-- 								<li class="nav-item"><a href="index.html" -->
<!-- 									class="nav-link active" title="Home">Home</a></li> -->
<!-- 								<li class="nav-item"><a href="shop_grid.html" -->
<!-- 									class="nav-link new_item" title="New Products">New Products</a></li> -->
<!-- 								<li class="nav-item"><a href="shop_grid.html" -->
<!-- 									class="nav-link" title="Featured Products">Featured -->
<!-- 										Products</a></li> -->
<!-- 								<li class="nav-item"> -->
<!-- 									<div class="ui icon top left dropdown nav__menu"> -->
<!-- 										<a class="nav-link" title="Pages">Pages <i -->
<!-- 											class="uil uil-angle-down"></i></a> -->
<!-- 										<div class="menu dropdown_page"> -->
<!-- 											<a href="dashboard_overview.html" -->
<!-- 												class="item channel_item page__links">Account</a> <a -->
<!-- 												href="about_us.html" class="item channel_item page__links">About -->
<!-- 												Us</a> <a href="shop_grid.html" -->
<!-- 												class="item channel_item page__links">Shop Grid</a> <a -->
<!-- 												href="single_product_view.html" -->
<!-- 												class="item channel_item page__links">Single Product -->
<!-- 												View</a> <a href="checkout.html" -->
<!-- 												class="item channel_item page__links">Checkout</a> <a -->
<!-- 												href="request_product.html" -->
<!-- 												class="item channel_item page__links">Product Request</a> <a -->
<!-- 												href="order_placed.html" -->
<!-- 												class="item channel_item page__links">Order Placed</a> <a -->
<!-- 												href="bill.html" class="item channel_item page__links">Bill -->
<!-- 												Slip</a> <a href="sign_in.html" -->
<!-- 												class="item channel_item page__links">Sign In</a> <a -->
<!-- 												href="sign_up.html" class="item channel_item page__links">Sign -->
<!-- 												Up</a> <a href="forgot_password.html" -->
<!-- 												class="item channel_item page__links">Forgot Password</a> <a -->
<!-- 												href="contact_us.html" class="item channel_item page__links">Contact -->
<!-- 												Us</a> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</li> -->
<!-- 								<li class="nav-item"> -->
<!-- 									<div class="ui icon top left dropdown nav__menu"> -->
<!-- 										<a class="nav-link" title="Blog">Blog <i -->
<!-- 											class="uil uil-angle-down"></i></a> -->
<!-- 										<div class="menu dropdown_page"> -->
<!-- 											<a href="our_blog.html" class="item channel_item page__links">Our -->
<!-- 												Blog</a> <a href="blog_no_sidebar.html" -->
<!-- 												class="item channel_item page__links">Our Blog Two No -->
<!-- 												Sidebar</a> <a href="blog_left_sidebar.html" -->
<!-- 												class="item channel_item page__links">Our Blog with Left -->
<!-- 												Sidebar</a> <a href="blog_right_sidebar.html" -->
<!-- 												class="item channel_item page__links">Our Blog with -->
<!-- 												Right Sidebar</a> <a href="blog_detail_view.html" -->
<!-- 												class="item channel_item page__links">Blog Detail View</a> <a -->
<!-- 												href="blog_left_sidebar_single_view.html" -->
<!-- 												class="item channel_item page__links">Blog Detail View -->
<!-- 												with Sidebar</a> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</li> -->
<!-- 								<li class="nav-item"><a href="contact_us.html" -->
<!-- 									class="nav-link" title="Contact">Contact Us</a></li> -->
<!-- 							</ul> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</nav> -->
<!-- 				<div class="catey__icon"> -->
<!-- 					<a href="#" class="cate__btn" data-toggle="modal" -->
<!-- 						data-target="#category_model" title="Categories"><i -->
<!-- 						class="uil uil-apps"></i></a> -->
<!-- 				</div> -->
<!-- 				<div class="header_cart order-1"> -->
<!-- 					<a href="#" class="cart__btn hover-btn pull-bs-canvas-left" -->
<!-- 						title="Cart"><i class="uil uil-shopping-cart-alt"></i><span>Cart</span> -->
<!-- 					<ins>2</ins><i class="uil uil-angle-down"></i></a> -->
<!-- 				</div> -->
<!-- 				<div class="search__icon order-1"> -->
<!-- 					<a href="#" class="search__btn hover-btn" data-toggle="modal" -->
<!-- 						data-target="#search_model" title="Search"><i -->
<!-- 						class="uil uil-search"></i></a> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</header> -->
	<!-- Header End -->
	<!-- Body Start --><!-- 	進階搜尋 -->
		<div id="address_model2" 
			class="header-cate-model main-gambo-model modal fade" tabindex="-1"
			role="dialog" aria-modal="false">
			<div class="modal-dialog category-area" role="document">
				<div class="category-area-inner">
					<div class="modal-header">
						<button type="button" class="close btn-close" data-dismiss="modal"
							aria-label="Close">
							<i class="uil uil-multiply"></i>
						</button>
					</div>
					<div class="category-model-content modal-content">
						<div class="cate-header">
							<h4>進階搜尋</h4>
						</div>
						<div class="add-address-form">
							<div class="checout-address-step">
								<div class="row">
									<div class="col-lg-12">
										<form class="" action='querymultiBook'>
											<!-- Multiple Radios (inline) -->
<!-- 											<div class="form-group"> -->
<!-- 												<div class="product-radio"> -->
<!-- 													<ul class="product-now"> -->
<!-- 														<li><input type="radio" id="ad1" name="address1" -->
<!-- 															checked> <label for="ad1">Home</label></li> -->
<!-- 														<li><input type="radio" id="ad2" name="address1"> -->
<!-- 															<label for="ad2">Office</label></li> -->
<!-- 														<li><input type="radio" id="ad3" name="address1"> -->
<!-- 															<label for="ad3">Other</label></li> -->
<!-- 													</ul> -->
<!-- 												</div> -->
<!-- 											</div> -->
											<div class="address-fieldset">
												<div class="row">
													<div class="col-lg-12 col-md-12">
														<div class="form-group">
															<label class="control-label">書名</label>
															<input id="bookName"  name="bookName"
																type="text" class="form-control input-md"  />
																<div id="result1c"></div>
																<!-- required="" 不能為空 -->
														</div>
													</div>
													<div class="col-lg-12 col-md-12">
														<div class="form-group">
															<label class="control-label">作者與產地</label>
															<input id="author"  name="author"
																type="text" placeholder=""
																class="form-control input-md"  />
																<div id="result2c"></div>
																<!-- required="" 不能為空 -->
														</div>
													</div>
													<div class="col-lg-12 col-md-12">
														<div class="form-group">
															<label class="control-label">廠商</label>
															<div class='col-lg-10'>
																<select  style="width: 200px" name="company">
																	<option value="" label="請挑選" />
																	<option value="1" label="學貫行銷股份有限公司" />
																	<option value="2" label="博碩文化股份有限公司" />
																	<option value="3" label="松崗電腦圖書有限公司" />
																</select>
															</div>
														</div>
													</div>
													<div class="col-lg-12 col-md-12">
														<div class="form-group">
															<label class="control-label">類別</label>
															<div class='col-lg-10' >
																<select  style="width: 200px" name="item">
																	<option value=""  label="請挑選" />
																	<option value="蔬果" label="蔬果"/>
																	<option value="書籍" label="書籍"/>
																</select>
															</div>
														</div>
													</div>
													
													<div class="col-lg-3 col-md-3">
														<div class="form-group">
															<label class="control-label">價格</label>
															<input id="price1"  name="price1" pattern="^[0-9]*$" title='請輸入數字'
																type="text" placeholder="最低價"
																class="form-control input-md"  />
																<div id="result3c"></div>
																<!-- required="" 不能為空 -->
														</div>
													</div>
													<h1>~</h1>
													<div class="col-lg-3 col-md-3">											
														<div class="form-group">
															<label class="control-label">&nbsp</label>
															<input id="price2"  name="price2" pattern="^[0-9]*$" title='請輸入數字'
																type='text' placeholder="最高價" class="form-control input-md" />
														</div>
													</div>
													
													<div class="col-lg-12 col-md-12">
														<div class="form-group mb-0">
															<div class="address-btns">
																<button id="btnAdd" type='submit' class="save-btn14 hover-btn">開始搜尋</button>
															</div>
														</div>
													</div>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<!-- 	進階搜尋 -->
	<jsp:include page="/fragment/topMVC.jsp" />
	<div class="wrapper">
		<div class="gambo-Breadcrumb">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html">Home</a></li>
								<li class="breadcrumb-item active" aria-current="page">產品總覽</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
		<div class="all-product-grid">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="product-top-dt">
							<div class="product-left-title">
								<h2>產品總覽 </h2>
							</div >
<!-- 							排序 -->

							<div onchange="itemhide()" class="product-sort" id='bookId2' >
								<select id='bookId'   class="ui selection dropdown vchrt-dropdown">
								<option  value='請挑選'>請挑選</option>
<!-- 								<option  value='推理'>推理</option> -->
<!-- 								<option  value='程式設計'>程式設計</option> -->
<%-- 									<c:forEach var='item' items='${itemConlist}'> --%>
<%-- 										<option   id='bookId4' value='${item}'>${item}</option> --%>
<%-- 									</c:forEach> --%>
								</select>
							</div>
							
							<div class="product-left-title" style='padding-left: 290px' >
								<a href='' class="filter-btn" data-toggle="modal"
									data-target="#address_model2">進階搜尋</a>
							</div>
<!-- 							<div class="product-sort"> -->
<%-- 								<form:form method='POST' modelAttribute="bookprice" --%>
<%-- 									class='form-horizontal' enctype='multipart/form-data'> --%>
<%-- 									<form:select path="" --%>
<%-- 										onchange="location.href=this.options[this.selectedIndex].value" --%>
<%-- 										class="ui selection dropdown vchrt-dropdown"> --%>
<%-- 										<form:option value="-1" label='排序' /> --%>
<%-- 										<form:option value="價格由高到低" label='價格由高到低' /> --%>
<%-- 										<form:option value="價格由低到高" label='價格由低到高' /> --%>
<%-- 														<form:option value="" label='照價格排序' /> --%>
<%-- 															<form:options  items="${bookprice}"/> --%>
<%-- 									</form:select> --%>
<%-- 								</form:form> --%>
<!-- 							</div> -->

							<div onchange="order()" class="product-sort">
								<select id='orderIddd' class="ui selection dropdown vchrt-dropdown" >
									<option value='請挑選排序'>請挑選排序</option>
								</select>
							</div>	
							
							<!-- 							出版社 -->

							<div onchange="change()" class="product-sort">
								<select id='Publisher'
									class="ui selection dropdown vchrt-dropdown" >
									<option value='-1'>請挑選廠商</option>
								</select>
							</div>
							
<!-- 							<a href="#" class="filter-btn pull-bs-canvas-right">Filters</a> -->
						</div>
					</div>
				</div>
				<div class="product-list-view">
				<div id='somedivS'></div>
					<div id='change' class="row">
<!-- 					隱藏 -->
						<c:forEach var='book1' items='${books}'>
							<div  class="col-lg-3 col-md-6">
								<div  class="product-item mb-30">
									<a  href="<spring:url value='product?id=${book1.bookId}' />" class="product-img"> <img
										width='100' height='200'
										src="<c:url value='/getPicture/${book1.bookId}' />" />
										<div class="product-absolute-options">
											<span class="offer-badge-1">${book1.price >=500?'6':'3'}% off</span> <span
												class="" title="wishlist"></span>
												<!-- class="like-icon" -->
										</div>
									</a>
									<div class="product-text-dt">
										<p>目前庫存:${book1.stock}本</p>
										<h3>${book1.bookName}</h3>
										<h4>${book1.author}</h4>
										<h6>${book1.item}</h6>
										<h6>${book1.companyBean.name}</h6>
										<div class="product-price">
											$${book1.price}<span></span>
										</div>
										
										<div class="qty-cart">
											<div class="quantity buttons_added">
												<input type="button" value="-" class="minus minus-btn">
												<input type="number" step="1" name="quantity" value="1" class="input-text qty text" id="qty${book1.bookId}"> 
												<input type="button" value="+" class="plus plus-btn">
											</div>
											<span class="cart-icon">
											<a href="#" onclick="checkqty(${book1.bookId},${book1.price})">
											<i class="uil uil-shopping-cart-alt" ></i>
											</a>
											</span>
										</div>										
									</div>
								</div>
							</div>
						</c:forEach>
						
						<div class="col-md-12">
							<div class="more-product-btn">
								<button class="show-more-btn hover-btn"
									onclick="window.location.href = '#';">Show More</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Body End -->
	<!-- Footer Start -->
<!-- 	<footer class="footer"> -->
<!-- 		<div class="footer-first-row"> -->
<!-- 			<div class="container"> -->
<!-- 				<div class="row"> -->
<!-- 					<div class="col-md-6 col-sm-6"> -->
<!-- 						<ul class="call-email-alt"> -->
<!-- 							<li><a href="#" class="callemail"><i -->
<!-- 									class="uil uil-dialpad-alt"></i>1800-000-000</a></li> -->
<!-- 							<li><a href="#" class="callemail"><i -->
<!-- 									class="uil uil-envelope-alt"></i>info@gambosupermarket.com</a></li> -->
<!-- 						</ul> -->
<!-- 					</div> -->
<!-- 					<div class="col-md-6 col-sm-6"> -->
<!-- 						<div class="social-links-footer"> -->
<!-- 							<ul> -->
<!-- 								<li><a href="#"><i class="fab fa-facebook-f"></i></a></li> -->
<!-- 								<li><a href="#"><i class="fab fa-twitter"></i></a></li> -->
<!-- 								<li><a href="#"><i class="fab fa-google-plus-g"></i></a></li> -->
<!-- 								<li><a href="#"><i class="fab fa-linkedin-in"></i></a></li> -->
<!-- 								<li><a href="#"><i class="fab fa-instagram"></i></a></li> -->
<!-- 								<li><a href="#"><i class="fab fa-pinterest-p"></i></a></li> -->
<!-- 							</ul> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="footer-second-row"> -->
<!-- 			<div class="container"> -->
<!-- 				<div class="row"> -->
<!-- 					<div class="col-lg-3 col-md-6 col-sm-6"> -->
<!-- 						<div class="second-row-item"> -->
<!-- 							<h4>Categories</h4> -->
<!-- 							<ul> -->
<!-- 								<li><a href="#">Fruits and Vegetables</a></li> -->
<!-- 								<li><a href="#">Grocery & Staples</a></li> -->
<!-- 								<li><a href="#">Dairy & Eggs</a></li> -->
<!-- 								<li><a href="#">Beverages</a></li> -->
<!-- 								<li><a href="#">Snacks</a></li> -->
<!-- 								<li><a href="#">Home Care</a></li> -->
<!-- 								<li><a href="#">Noodles & Sauces</a></li> -->
<!-- 								<li><a href="#">Personal Care</a></li> -->
<!-- 								<li><a href="#">Pet Care</a></li> -->
<!-- 								<li><a href="#">Meat & Seafood</a></li> -->
<!-- 								<li><a href="#">Electronics</a></li> -->
<!-- 							</ul> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="col-lg-3 col-md-6 col-sm-6"> -->
<!-- 						<div class="second-row-item"> -->
<!-- 							<h4>Useful Links</h4> -->
<!-- 							<ul> -->
<!-- 								<li><a href="about_us.html">About US</a></li> -->
<!-- 								<li><a href="shop_grid.html">Featured Products</a></li> -->
<!-- 								<li><a href="offers.html">Offers</a></li> -->
<!-- 								<li><a href="our_blog.html">Blog</a></li> -->
<!-- 								<li><a href="faq.html">Faq</a></li> -->
<!-- 								<li><a href="career.html">Careers</a></li> -->
<!-- 								<li><a href="contact_us.html">Contact Us</a></li> -->
<!-- 							</ul> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="col-lg-3 col-md-6 col-sm-6"> -->
<!-- 						<div class="second-row-item"> -->
<!-- 							<h4>Top Cities</h4> -->
<!-- 							<ul> -->
<!-- 								<li><a href="#">Gurugram</a></li> -->
<!-- 								<li><a href="#">New Delhi</a></li> -->
<!-- 								<li><a href="#">Bangaluru</a></li> -->
<!-- 								<li><a href="#">Mumbai</a></li> -->
<!-- 								<li><a href="#">Hyderabad</a></li> -->
<!-- 								<li><a href="#">Kolkata</a></li> -->
<!-- 								<li><a href="#">Ludhiana</a></li> -->
<!-- 								<li><a href="#">Chandigrah</a></li> -->
<!-- 							</ul> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="col-lg-3 col-md-6 col-sm-6"> -->
<!-- 						<div class="second-row-item-app"> -->
<!-- 							<h4>Download App</h4> -->
<!-- 							<ul> -->
<!-- 								<li><a href="#"><img class="download-btn" -->
<!-- 										src="images/download-1.svg" alt=""></a></li> -->
<!-- 								<li><a href="#"><img class="download-btn" -->
<!-- 										src="images/download-2.svg" alt=""></a></li> -->
<!-- 							</ul> -->
<!-- 						</div> -->
<!-- 						<div class="second-row-item-payment"> -->
<!-- 							<h4>Payment Method</h4> -->
<!-- 							<div class="footer-payments"> -->
<!-- 								<ul id="paypal-gateway" class="financial-institutes"> -->
<!-- 									<li class="financial-institutes__logo"><img alt="Visa" -->
<!-- 										title="Visa" src="images/footer-icons/pyicon-6.svg"></li> -->
<!-- 									<li class="financial-institutes__logo"><img alt="Visa" -->
<!-- 										title="Visa" src="images/footer-icons/pyicon-1.svg"></li> -->
<!-- 									<li class="financial-institutes__logo"><img -->
<!-- 										alt="MasterCard" title="MasterCard" -->
<!-- 										src="images/footer-icons/pyicon-2.svg"></li> -->
<!-- 									<li class="financial-institutes__logo"><img -->
<!-- 										alt="American Express" title="American Express" -->
<!-- 										src="images/footer-icons/pyicon-3.svg"></li> -->
<!-- 									<li class="financial-institutes__logo"><img alt="Discover" -->
<!-- 										title="Discover" src="images/footer-icons/pyicon-4.svg"> -->
<!-- 									</li> -->
<!-- 								</ul> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="second-row-item-payment"> -->
<!-- 							<h4>Newsletter</h4> -->
<!-- 							<div class="newsletter-input"> -->
<!-- 								<input id="email" name="email" type="text" -->
<!-- 									placeholder="Email Address" class="form-control input-md" -->
<!-- 									required=""> -->
<!-- 								<button class="newsletter-btn hover-btn" type="submit"> -->
<!-- 									<i class="uil uil-telegram-alt"></i> -->
<!-- 								</button> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="footer-last-row"> -->
<!-- 			<div class="container"> -->
<!-- 				<div class="row"> -->
<!-- 					<div class="col-md-12"> -->
<!-- 						<div class="footer-bottom-links"> -->
<!-- 							<ul> -->
<!-- 								<li><a href="about_us.html">About</a></li> -->
<!-- 								<li><a href="contact_us.html">Contact</a></li> -->
<!-- 								<li><a href="privacy_policy.html">Privacy Policy</a></li> -->
<!-- 								<li><a href="term_and_conditions.html">Term & -->
<!-- 										Conditions</a></li> -->
<!-- 								<li><a href="refund_and_return_policy.html">Refund & -->
<!-- 										Return Policy</a></li> -->
<!-- 							</ul> -->
<!-- 						</div> -->
<!-- 						<div class="copyright-text"> -->
<!-- 							<i class="uil uil-copyright"></i>Copyright 2020 <b>Gambolthemes</b> -->
<!-- 							. All rights <a href="http://www.bootstrapmb.com" title="">researved</a> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</footer> -->
	<!-- Footer End -->
	<script>
	<!-- 	<div id='detail'></div> -->
		
		
// 		var selectElement = document.getElementById('Publisher');  // 取出select標籤
// 		var bookarea = document.getElementById('bookarea');     // 取出書籍資料的div標籤
// 		var detail = document.getElementById('detail');     // 取出書籍資料的div標籤
// 		var xhr = new XMLHttpRequest();        	// 讀取書籍表格內的書籍資料
// 		var xhr2 = new XMLHttpRequest();		// 讀取單一書籍的資料
// 		// 存放所有出版社名稱與主鍵值，每一名稱與主鍵值放入一個陣列，將此陣列放入(push)陣列companyData中
// 		var companyData = [];						
// 		xhr.onreadystatechange = function() {
// 			if (xhr.readyState == 4 && xhr.status == 200) {
// 				var publishers = JSON.parse(xhr.responseText);
// 				for (var i = 0; i < publishers.length; i++) {
// 					// 每一本書的書名與主鍵值放入一個陣列
// 					var publisher = [ publishers[i].name, publishers[i].id ];
// 					// 在將此陣列放入(push)陣列companyData中
// 					companyData.push(publisher);
// 				}
// 		        // 將companyData內的資料全部移植到select標籤中
// 				for (var i = 0; i < companyData.length; i++) {
// 					var option = new Option(companyData[i][0], "" + companyData[i][1]);
// 					selectElement.options[selectElement.options.length] = option;
// 				}
// 			}
// 		}
		
// 		xhr.open("GET", "<c:url value='/allPublishers' />", true);
// 		xhr.send();
// 		// 定義select標籤的change事件處理函數
// 		selectElement.onchange = function(){
// 			xhr2.onreadystatechange = function() {
// 				if (xhr2.readyState == 4 && xhr2.status == 200) {
// 					displayPageBooks(xhr2.responseText);
// 				}
// 			}
// 			//使用者挑選的書籍之主鍵值是存放在selectElement.options[selectElement.selectedIndex].value中
// 			var publisherId = selectElement.options[ selectElement.selectedIndex ].value;
// 			// 定義open方法
// 			xhr2.open("GET", "<c:url value='/getBooksByPubllisher'/>" + "?publisherId=" + publisherId, true);
// 			// 送出請求
// 			xhr2.send();
					 
// 		}
		
// 		function displayPageBooks(responseText){
// 			var mapData = JSON.parse(responseText);
// 			var books = mapData.books;
// 			var books = JSON.parse(responseText);
// 			var content = "<div class='row'>";		
// 			for(var i=0; i < books.length; i++){
// 				content += "<div class='col-lg-3 col-md-6'>"+
// 						   "<div class='product-item mb-30'>"+
// 				"<a class='product-img'> " + 
// 				"<img width='100' height='200' src='<c:url value='" +  books[i].imageData + "' />' />" +
// 					"<div class='product-absolute-options'>"+
// 						"<span class='offer-badge-1'>6% off</span> <span" +
// 							"class='like-icon' title='wishlist'></span>"+
// 					"</div>"+
// 				"</a>"+
// 				"<div class='product-text-dt'>"+
// 					"<p>目前庫存:" + books[i].bean.stock + "本</p>"+
// 					"<h4>" + books[i].bean.bookName + "</h4>"+
// 					"<div class='product-price'>"+
// 						"$"+ books[i].bean.price +"<span>$15</span>"+
// 					"</div>"+
// 					"<div class='qty-cart'>"+
// 						"<div class='quantity buttons_added'>"+
// 							"<input type='button' value='-' class='minus minus-btn'>"+
// 							"<input type='number' step='1' name='quantity' value='1'" +
// 								"class='input-text qty text'> <input type='button'" +
// 								" value='+' class='plus plus-btn'>"+
// 						"</div>"+
// 						"<span class='cart-icon'><i class='uil uil-shopping-cart-alt'></i></span>"+
// 					"</div>"+
// 				"</div>"+
// 			"</div>"
// 			content +="</div>";
// 			}
// 			var divs = document.getElementById("somedivS");
// 			divs.innerHTML = content;
// 			//對應"somedivS"的所在位置
// 		}
		

	</script>

		<script>
	
	var item = document.getElementById('bookId');
	var orderIddd = document.getElementById('orderIddd');
	var selectElement = document.getElementById('Publisher');  // 取出select標籤
	var xhr = new XMLHttpRequest();        	// 讀取書籍表格內的書籍資料
	var xhr2 = new XMLHttpRequest();	
	var xhr3 = new XMLHttpRequest();	// 讀取單一書籍的資料
	var xhr4 = new XMLHttpRequest();
	// 存放所有出版社名稱與主鍵值，每一名稱與主鍵值放入一個陣列，將此陣列放入(push)陣列companyData中
	var companyData = [];	
		
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var publishers = JSON.parse(xhr.responseText);
			for (var i = 0; i < publishers.length; i++) {
				// 每一本書的書名與主鍵值放入一個陣列
				var publisher = [ publishers[i].name, publishers[i].id ];
				// 在將此陣列放入(push)陣列companyData中
				companyData.push(publisher);
			}
	        // 將companyData內的資料全部移植到select標籤中
			for (var i = 0; i < companyData.length; i++) {
				var option = new Option(companyData[i][0], "" + companyData[i][1]);
				selectElement.options[selectElement.options.length] = option;
			}
		
		}
	}
	
	var itemData = ["書籍","蔬果"];
	for (var i = 0; i < itemData.length; i++) {
		var option = new Option(itemData[i]);
		item.options[item.options.length] = option;
	}
	
	var orderData = ["價格由高到低","價格由低到高"];
	for (var i = 0; i < orderData.length; i++) {
		var orderoption = new Option(orderData[i]);
		orderIddd.options[orderIddd.options.length] = orderoption;
	}
	
	xhr.open("GET", "<c:url value='/allPublishers' />", true);
	xhr.send();
	// 定義select標籤的change事件處理函數
	selectElement.onchange = function(){
		xhr2.onreadystatechange = function() {
			if (xhr2.readyState == 4 && xhr2.status == 200) {
				books(xhr2.responseText);
			}
		}
		//使用者挑選的書籍之主鍵值是存放在selectElement.options[selectElement.selectedIndex].value中
		var publisherId = selectElement.options[ selectElement.selectedIndex ].value;
		// 定義open方法
		var item2 = item.options[ item.selectedIndex ].value;
		var order2 = orderIddd.options[ orderIddd.selectedIndex ].value;
		xhr2.open("GET", "<c:url value='/bookCategory/" + item2 + "/" + order2 +"'/>"+  "?publisherId=" + publisherId, true);
		// 送出請求
		xhr2.send();
		console.log("publisherId=" + publisherId )
		console.log("item=" + item2)
		console.log("order=" + order2)
		}
	
	
	item.onchange = function(){
		xhr3.onreadystatechange = function() {
			if (xhr3.readyState == 4 && xhr3.status == 200) {
				books(xhr3.responseText);
			}
		}
		//使用者挑選的書籍之主鍵值是存放在selectElement.options[selectElement.selectedIndex].value中
		var publisherId = selectElement.options[ selectElement.selectedIndex ].value;
// 		var item = document.getElementById('bookId').value;
		// 定義open方法
		var item2 = item.options[ item.selectedIndex ].value;
		var order2 = orderIddd.options[ orderIddd.selectedIndex ].value;
		xhr3.open("GET", "<c:url value='/bookCategory/" + item2 + "/" + order2 +  "?publisherId=" + publisherId+"'/>", true);
		// 送出請求
		xhr3.send();
		console.log("publisherId=" + publisherId )
		console.log("item=" + item2)
		console.log("order=" + order2)
				 
	}
	
	orderIddd.onchange = function(){
		xhr4.onreadystatechange = function() {
			if (xhr4.readyState == 4 && xhr4.status == 200) {
				books(xhr4.responseText);
			}
		}
		//使用者挑選的書籍之主鍵值是存放在selectElement.options[selectElement.selectedIndex].value中
		var publisherId = selectElement.options[ selectElement.selectedIndex ].value;
// 		var item = document.getElementById('bookId').value;
		// 定義open方法
		var item2 = item.options[ item.selectedIndex ].value;
		var order2 = orderIddd.options[ orderIddd.selectedIndex ].value;
		xhr4.open("GET", "<c:url value='/bookCategory/" + item2 + "/" + order2 +  "?publisherId=" + publisherId+"'/>", true);
		// 送出請求
		xhr4.send();
		console.log("publisherId=" + publisherId )
		console.log("item=" + item2)
		console.log("order=" + order2)
				 
	}
	
	
	function books(responseText) {
// 		var mapData = JSON.parse(responseText);
// 			var books = mapData.books;
// 			var books = JSON.parse(responseText);
		
// 		var mapData = JSON.parse(xhr.responseText);
// 			var books = mapData.books;
			var books = JSON.parse(responseText);
			var content = "<div class='row'>";
			
			for(var i=0; i < books.length; i++){
				var beverage = (books[i].bean.price >= 500) ? "6" : "3";
				content += "<div class='col-lg-3 col-md-6'>"+
						   "<div class='product-item mb-30'>"+
				"<a class='product-img'> " + 
				"<img width='100' height='200' src='<c:url value='" +  books[i].imageData + "' />' />" +
					"<div class='product-absolute-options'>"+
						"<span class='offer-badge-1'>"+beverage+"% off</span> <span" +
							"class='like-icon' title='wishlist'></span>"+
					"</div>"+
				"</a>"+
				"<div class='product-text-dt'>"+
					"<p>目前庫存:" + books[i].bean.stock + "本</p>"+
					"<h4>" + books[i].bean.bookName + "</h4>"+
					"<h6>" + books[i].bean.item + "</h6>"+
					"<h6>" + books[i].bean.companyBean.name + "</h6>"+
					"<div class='product-price'>"+
						"$"+ books[i].bean.price +"<span>$15</span>"+
					"</div>"+
					"<div class='qty-cart'>"+
						"<div class='quantity buttons_added'>"+
							"<input type='button' value='-' class='minus minus-btn'>"+
							"<input type='number' step='1' name='quantity' value='1'" +
								"class='input-text qty text'> <input type='button'" +
								" value='+' class='plus plus-btn'>"+
						"</div>"+
						"<span class='cart-icon'>" +
						"<a href='#' onclick='checkqty("+ books[i].bean.bookId +"," + books[i].bean.price +")'>" +
						"<i class='uil uil-shopping-cart-alt'></i></a></span>"+
					"</div>"+
				"</div>"+
			"</div>"
			content +="</div>";
			}
			var divs = document.getElementById("somedivS");
			divs.innerHTML = content;
// 			console.log(mapData);
// 			console.log(books)

// 			<span class="cart-icon">
// 			<a href="#" onclick="checkqty(${book1.bookId},${book1.price})">
// 			<i class="uil uil-shopping-cart-alt" ></i>
// 			</a>
// 			</span>

		}
	
	

	

	</script>
	<script>
	function change() {
			$('#change').hide(); 
// 			$('#bookId').get(0).selectedIndex = 1 ;
// 			$("#bookId").val("請挑選");
// 			document.getElementById("bookId").value = "請挑選";
// 		document.getElementById(change).style.display="none";
// 			console.log($('#bookId').get(0).selectedIndex );
	}

	function itemhide() {
			$('#change').hide(); 
// 		document.getElementById(change).style.display="none";
	}
	
	function order() {
		$('#change').hide(); 
//		document.getElementById(change).style.display="none";
}
	
	</script>
	<script>
		function checkqty(bookId,price) {
			var qty = document.getElementById('qty'+bookId).value;
			document.forms[0].action="<c:url value='BuyBook?bookId=" + bookId + "&qty=" + qty + "&price= " + price + "' />" ;
			document.forms[0].method="POST";
			document.forms[0].submit();
		}
	</script>
	<!-- Javascripts -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="vendor/OwlCarousel/owl.carousel.js"></script>
	<script src="vendor/semantic/semantic.min.js"></script>
	<script src="js/jquery.countdown.min.js"></script>
	<script src="js/custom.js"></script>
	<script src="js/offset_overlay.js"></script>
	<script src="js/night-mode.js"></script>

</body>
</html>