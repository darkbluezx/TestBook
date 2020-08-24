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
<title>Gambo - Shop Grid</title>

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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<form:form method='POST' modelAttribute="bookBean"
		class='form-horizontal' enctype='multipart/form-data'>
		<div id="address_model"
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
							<h4>新增產品</h4>
						</div>
						<div class="add-address-form">
							<div class="checout-address-step">
								<div class="row">
									<div class="col-lg-12">
										<form class="">
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
															<form:input id="bookName"  path='bookName'  
																type="text" class="form-control input-md1" required="" />
																<div id="result1cc"></div>
														</div>
													</div>
													<div class="col-lg-12 col-md-12">
														<div class="form-group">
															<label class="control-label">作者與產地</label>
															<form:input id="author" path='author' name="author"
																type="text" placeholder=""
																class="form-control input-md" />
																<div id="result2cc"></div>
														</div>
													</div>
													<div class="col-lg-12 col-md-12">
														<div class="form-group">
															<label class="control-label">廠商</label>
															<div class='col-lg-10'>
																<form:select path="companyId" style="width: 200px" id='companyIN'>
																	<form:option value="-1" label="請挑選" />
																	<form:options items="${companyList}" />
																</form:select>
															</div>
														</div>
													</div>
													<div class="col-lg-12 col-md-12">
														<div class="form-group">
															<label class="control-label">類別</label>
															<div class='col-lg-10' >
																<form:select path="item" style="width: 200px" id='itemitem'>
																	<form:option value="-1" label="請挑選" />
																	<form:options items="${itemConlist}" />
																</form:select>
															</div>
														</div>
													</div>
													<div class="col-lg-6 col-md-12">
														<div class="form-group">
															<label class="control-label">價格</label>
															<form:input id="price" path='price' name="price" 
																type="text" placeholder="" pattern="^[0-9]*$" title='請輸入數字'
																class="form-control input-md"  />
																<div id="result3cc"></div>
														</div>
													</div>
													<div class="col-lg-6 col-md-12">
														<div class="form-group">
															<label class="control-label">檔案上傳</label>
															<form:input id="productImage" path="productImage"
																type='file' class="form-control input-md" />
														</div>
													</div>
													<!-- 												<div class="col-lg-6 col-md-12"> -->
													<!-- 													<div class="form-group"> -->
													<!-- 														<label class="control-label">Locality*</label> -->
													<!-- 														<input id="Locality" name="locality" type="text" placeholder="Enter City" class="form-control input-md" required=""> -->
													<!-- 													</div> -->
													<!-- 												</div> -->
													<div class="col-lg-12 col-md-12">
														<div class="form-group mb-0">
															<div class="address-btns">
																<button id="btnAdd" type='submit' class="save-btn14 hover-btn">新增</button>
															
															<div class="col-lg-1 col-md-1">											
																<div class="form-group"></div>
															</div>
														
													
																<button id="oneIn" type='button' class="save-btn14 hover-btn" >一鍵填入</button>
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
	</form:form>
	
	<!-- 快速搜索-->
	<div id="address_modelx" 
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
							<h4>快速搜索</h4>
						</div>
						<div class="add-address-form">
							<div class="checout-address-step">
								<div class="row">
									<div class="col-lg-12">
										<form class="" action='queryUpdateAllBook' method='GET'>
											<!-- Multiple Radios (inline) -->
											
											<div class="address-fieldset">
												<div class="row">
													<div class="col-lg-12 col-md-12">
														<div class="form-group">
															<label class="control-label">書名</label>
															<input id="booku"  name="booku"
																type="text" class="form-control input-md"  />
																<!-- required="" 不能為空 -->
														</div>
													</div>
													
													<div class="col-lg-12 col-md-12">
														<div class="form-group mb-0">
															<div class="address-btns">
																<button id="" type='submit' class="save-btn14 hover-btn">搜尋</button>
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

	
	
	<!-- Filter Right Sidebar Offsetl End-->
	<!-- Header Start -->
	<jsp:include page="/fragment/topMVC.jsp" />
	<!-- Header End -->
	<!-- Body Start -->
	<div class="wrapper">
		<div class="gambo-Breadcrumb">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html">Home</a></li>
								<li class="breadcrumb-item active" aria-current="page">產品管理</li>
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
								<a href='' class="filter-btn" data-toggle="modal"
									data-target="#address_model">新增</a>
									<input type="button" class="filter-btn" 
									style='margin-right: 20px' value="大量刪除" id="delete">
							</div>

							<!-- 							排序 -->
							<a href='' class="filter-btn" style='margin-right: 20px'
							data-target="#address_modelx" data-toggle="modal">快速搜索</a>

<%-- 							<c:forEach var='item1' items='${itemConlist}'> --%>
<%-- 								<a href='${item1}' class="filter-btn" style='margin-right: 20px'>${item1}</a> --%>
<%-- 							</c:forEach> --%>



						</div>

					</div>
				</div>
				<div class="product-list-view">
					<div class="row">
						<c:forEach var='book1' items='${bookp}'>
							<div class="col-lg-3 col-md-6">
								<div class="product-item mb-30">
								<form action="deletesMore" method='GET'>
								<input value='${book1.bookId}' class="checkb" name="ids" type="checkbox">
								</form>
									<a href="<spring:url value='product?id=${book1.bookId}' />"
										class="product-img"> <img width='100' height='200'
										src="<c:url value='/getPicture/${book1.bookId}' />" />
										<div class="product-absolute-options">
											<span class=""></span> <span
												class="" title="wishlist"></span>
												
												<!-- class="like-icon" -->
										</div>
									</a>
									<div class="product-text-dt">
										<p>目前庫存:${book1.stock}本</p>
										<h4>${book1.bookName}</h4>
										<h6>${book1.item}</h6>
										<h6>${book1.companyBean.name}</h6>
										<div class="product-price">
											$${book1.price}<span></span>
										</div>
										<div class="qty-cart">


<%-- 											<a href="<spring:url value='/Update2/${book1.bookId}' />" class="add-address hover-btn" > --%>
<!-- 											<i class="uil uil-edit"></i></a> -->

											<a href='' data-toggle="modal"
											class="add-address hover-btn" data-target="#address_model${book1.bookId}">
											<i class="uil uil-edit"></i></a>

											<span class="" style='margin: auto'></span> <span
												class="quantity buttons_added" style='margin: auto'>
												<div>
													<a href='deleteBook/${book1.bookId}'
														class="add-address hover-btn"
														onclick="return (confirm('確定刪除?'))"><i
														class="uil uil-trash-alt"></i></a>
												</div>
											</span>
										</div>
									</div>
								</div>
							</div>
							<!-- 	以下是修改 -->
<form:form method='POST' modelAttribute="bookBean2" action='UpdateOneBook'
		class='form-horizontal' enctype='multipart/form-data'>
		<div id="address_model${book1.bookId}"
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
							<h4>產品修改</h4>
						</div>
						<div class="add-address-form">
							<div class="checout-address-step">
								<div class="row">
									<div class="col-lg-12">
										<form class="">
											<!-- Multiple Radios (inline) -->
											<div class="address-fieldset">
												<div class="row">
													<div class="col-lg-12 col-md-12">
														<div class="form-group">
															<label class="control-label">書名</label>
															<form:input id="bookName2" path='bookName' name="flat"
																value='${book1.bookName}' type="text" class="form-control input-md" required="" />
																<div id="result11c"></div>
														</div>
													</div>
													<div class="col-lg-12 col-md-12">
														<div class="form-group">
															<label class="control-label">作者與產地</label>
															<form:input id="author2" path='author' name="author"
																type="text" value='${book1.author}'
																class="form-control input-md" />
																<div id="result22c"></div>
														</div>
													</div>
													<div class="col-lg-12 col-md-12">
														<div class="form-group">
															<label class="control-label">廠商</label>
															<div class='col-lg-10'>
																<form:select path="companyId" style="width: 200px">
																	<form:option value="${book1.companyBean.id}" label="${book1.companyBean.name}" />
																	<form:options items="${companyList}" />
																</form:select>
															</div>
														</div>
													</div>
													<div class="col-lg-12 col-md-12">
														<div class="form-group">
															<label class="control-label">類別</label>
															<div class='col-lg-10' >
																<form:select path="item" style="width: 200px" >
																	<form:option value="${book1.item}" label='${book1.item}' />
																	<form:options  items="${itemConlist}" />
																</form:select>
															</div>
														</div>
													</div>
													<div class="col-lg-6 col-md-12">
														<div class="form-group">
															<label class="control-label">價格</label>
															<form:input id="price2" path='price' name="price"
																type="text" value='${book1.price}'
																class="form-control input-md" required="" />
																<div id="result33c"></div>
														</div>
													</div>
													<div class="col-lg-6 col-md-12" style='display:none'>
														<div class="form-group">
															<label class="control-label">編號</label>
															<form:input id="bookId" path='bookId' name="bookId"
																type="text" value='${book1.bookId}'
																class="form-control input-md" required="" />
																<div id="result44c"></div>
														</div>
													</div>
													<div class="col-lg-6 col-md-12">
														<div class="form-group">
															<label class="control-label">檔案上傳</label>
															<form:input id="productImage" path="productImage"
																type='file' class="form-control input-md" />
														</div>
													</div>
													<!-- 												<div class="col-lg-6 col-md-12"> -->
													<!-- 													<div class="form-group"> -->
													<!-- 														<label class="control-label">Locality*</label> -->
													<!-- 														<input id="Locality" name="locality" type="text" placeholder="Enter City" class="form-control input-md" required=""> -->
													<!-- 													</div> -->
													<!-- 												</div> -->
													<div class="col-lg-12 col-md-12">
														<div class="form-group mb-0">
															<div class="address-btns">
																<button id="" type='submit' class="save-btn14 hover-btn">Save</button>
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
	</form:form>
	</c:forEach>
    
	<!--     以上是修改 -->
						
<!-- 						<div class="col-lg-3 col-md-6"> -->
<!-- 							<div class="product-item mb-30"> -->
<!-- 								<a href="single_product_view.html" class="product-img"> <img -->
<!-- 									src="images/product/img-2.jpg" alt=""> -->
<!-- 									<div class="product-absolute-options"> -->
<!-- 										<span class="offer-badge-1">2% off</span> <span -->
<!-- 											class="like-icon" title="wishlist"></span> -->
<!-- 									</div> -->
<!-- 								</a> -->
<!-- 								<div class="product-text-dt"> -->
<!-- 									<p> -->
<!-- 										Available<span>(In Stock)</span> -->
<!-- 									</p> -->
<!-- 									<h4>Product Title Here</h4> -->
<!-- 									<div class="product-price"> -->
<!-- 										$10 <span>$13</span> -->
<!-- 									</div> -->
<!-- 									<div class="qty-cart"> -->
<!-- 										<div class="quantity buttons_added"> -->
<!-- 											<input type="button" value="-" class="minus minus-btn"> -->
<!-- 											<input type="number" step="1" name="quantity" value="1" -->
<!-- 												class="input-text qty text"> <input type="button" -->
<!-- 												value="+" class="plus plus-btn"> -->
<!-- 										</div> -->
<!-- 										<span class="cart-icon"><i -->
<!-- 											class="uil uil-shopping-cart-alt"></i></span> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
						
								
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Body End -->
	<!-- Footer Start -->
	
	<!-- Footer End -->

	<script>
	
        $("#delete").click(function() {
//         	if(!confirm("確定要刪除這些產品嗎？")){
//         		return ;
//         		}
            var b = confirm("確定要刪除這些產品嗎？");
            if (b) {
            	array = new Array();
            $("input[type='checkbox']:gt(0):checked").each(
            function() {array.push($(this).val());});
            if (array == 0) {
                        alert("請選擇要刪除的產品");
                        
            } else {
                     console.log(array)
                    
                    location.href = "deleteMore?ids="+ array;
                }
            };
            // if (b)成立，回傳true
            // confirm按取消,回傳false，不會執行動作
            
          
        
	
    });
	

	</script>
	<script>
	$(function(){
	 $("#oneIn").click(function() {
		 $("#bookName").val("超大甜椒");
		 $("#author").val("台灣");
		 $("#itemitem").val("蔬果");
		 $("#companyIN").val("2");
		 $("#price").val("500");
	 });
	});
	 
// 	function bookName() {
// 		var bookName = document.getElementById("bookName2");
// 		bookName.value = "admin"
		
// // 		var password = document.getElementById("password");
// // 		password.value = "12345678"
// 	}
	
	</script>
	<script>
window.onload = function() {
	   var sendDataB = document.getElementById("btnAdd");
	   sendDataB.onclick = function() {
	   // 讀取欄位資料	  
	   var bookName= document.getElementById("bookName").value;
	   var author = document.getElementById("author").value;
	   var price = document.getElementById("price").value;

	   var hasErrorBook = false; // 設定判斷有無錯誤的旗標
	   var div1b = document.getElementById('result1cc');
	   var div2b = document.getElementById('result2cc');
	   var div3b = document.getElementById('result3cc');
//	    var divResult = document.getElementById('resultMsg');
	   if (!bookName){
	       div1b.innerHTML = "<font color='red' size='2'>請輸入書名</font>";
	       hasErrorBook = true;
	   } 
	   else {
	      div1b.innerHTML = "";
	   }
	   if (!author){
	       div2b.innerHTML = "<font color='red' size='2'>請輸入作者</font>";
	       hasErrorBook = true;
	   } else {
	       div2b.innerHTML = "";
	   }
	   if (!price){
	       div3b.innerHTML = "<font color='red' size='2'>請輸入價格</font>";
	       hasErrorBook = true;
	   } else {
	       div3b.innerHTML = "";
	   }
	   if (hasErrorBook){
	       return false;
	   }
	   
	}
			
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