<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>書果店 - 門市管理</title>

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
<link href="css/step-wizard.css" rel="stylesheet">

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
<jsp:include page="/fragment/topMVC.jsp" />
	<!-- 新增店家  Model Start-->

	<div id="addstore" class="header-cate-model main-gambo-model modal fade" tabindex="-1" role="dialog" aria-modal="false">
		<div class="modal-dialog category-area" role="document">
			<div class="category-area-inner">
				<div class="modal-header">
					<button type="button" class="close btn-close" data-dismiss="modal" aria-label="Close">
						<i class="uil uil-multiply"></i>
					</button>
				</div>
				<div class="category-model-content modal-content">
					<div class="cate-header">
						<h4>新增門市</h4>
					</div>
					<div class="add-address-form">
						<div class="checout-address-step">
							<div class="row">
								<div class="col-lg-12">
									<form:form modelAttribute="storebean" class="form-horizontal" method="POST">
										<div class="address-fieldset">
											<div class="row">
												<div class="col-lg-6 col-md-12">
													<div class="form-group">
														<label for='area'>地區</label>
														<form:select id="storearea" class="ui fluid dropdown form-dropdown" path="area">
															<form:option value="">請挑選</form:option>
															<form:option value="北部">北部</form:option>
															<form:option value="中部">中部</form:option>
															<form:option value="東部">東部</form:option>
															<form:option value="南部">南部</form:option>
														</form:select>
													</div>
												</div>
												<div class="col-lg-6 col-md-12">
													<div class="form-group">
														<label class="control-label" for='name'>店名</label>
														<form:input id="storename" name="name" path="name" type="text"
															placeholder="Name" class="form-control input-md"
															required="" />
													</div>
												</div>
												<div class="col-lg-12 col-md-12">
													<div class="form-group">
														<label class="control-label" for='address'>地址</label>
														<form:input id="storeaddress" name="address" path="address"
															type="text" placeholder="Address"
															class="form-control input-md" required="" />
													</div>
												</div>
												<div class="col-lg-12 col-md-12">
													<div class="form-group">
														<label class="control-label" for='phone'>電話</label>
														<form:input id="storephone" name="phone" path="phone"
															type="text" placeholder="Phone"
															class="form-control input-md" />
													</div>
												</div>

												<div class="col-lg-12 col-md-12">
													<div class="form-group mb-0">
														<div class="address-btns">
															<input id="btnAdd" type="submit"
																class="save-btn14 hover-btn" value="送出" />
															<input type="button"
																class="save-btn14 hover-btn" value="一鍵新增" onclick="NewStore();" />
														</div>
													</div>
												</div>
											</div>
										</div>
									</form:form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	function NewStore() {
		var storename = document.getElementById("storename");
		storename.value = "資策"
			
		var storeaddress = document.getElementById("storeaddress");
		storeaddress.value = "台北市大安區信義路三段180號"
		
		var storephone = document.getElementById("storephone");
		storephone.value = "02-27097582"
		
// 		var storearea = document.getElementById("storearea");
// 		console.log(storearea.selectedIndex);
// 		storearea.selectedIndex = 1;
// 		console.log(storearea.selectedIndex);
		
		
	}
	</script>
	<!-- 新增店家 Model End-->

	<!-- Body Start -->
	<div class="wrapper">
		<div class="gambo-Breadcrumb">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html">Home</a></li>
								<li class="breadcrumb-item active" aria-current="page">門市管理</li>
							</ol>
						</nav>
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
								<a href="bookUpPage" class="user-item"><i	class="uil uil-box"></i>商品管理</a>
								<a href="store_manager" class="user-item active"><i class="uil uil-shop"></i>門市管理</a>
								<a href="promotion_Manager" class="user-item"><i class="uil uil-gift"></i>行銷活動管理</a>
								<a href="logistics_manager" class="user-item"><i class="uil uil-newspaper"></i>物流管理</a>
								<a href="statistics_Manager" class="user-item"><i class="uil uil-chart-bar-alt"></i>統計相關</a>
							</div>
						</div>
					</div>

					<div class="col-lg-9 col-md-8">
						<div class="dashboard-right">
							<div class="row">
								<div class="col-md-12">
									<div class="main-title-tab">
										<h4>
											<i class="uil uil-shop"></i>門市管理
										</h4>
									</div>
								</div>
								<div class="col-lg-12 col-md-12">
									<div class="pdpt-bg">
										<div class="pdpt-title">
											<h4>全部門市</h4>
										</div>
										<div class="address-body">
											<a href="" class="add-address hover-btn"
												data-toggle="modal" data-target="#addstore">新增門市</a>
											<table class="table ucp-table table-hover">
												<thead>
													<tr>
														<th style="width: 60px">ID</th>
														<th style="width: 60px;">地區</th>
														<th style="width: 60px;">店名</th>
														<th style="width: 300px;">地址</th>
														<th style="width: 120px;">電話</th>
														<th style="width: 150px;">Action</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var='store' items='${stores}' varStatus="con">
														<tr>
															<td>${con.count}</td>
															<td>${store.area}</td>
															<td>${store.name}</td>
															<td>${store.address}</td>
															<td>${store.phone}</td>
															<td class="action-btns"><a
																href=""
																class="action-btn" data-toggle="modal"
																data-target="#updatestore_model${store.storeId}"><i
																	class="uil uil-edit"></i></a> <a
																href="<spring:url value='store_manager/delete?id=${store.storeId}' />"
																class="action-btn"><i class="uil uil-trash-alt"
																	onclick="return deletecheck('${store.storeId}','${store.name}');"></i></a>
															</td>
														</tr>
														<div id="updatestore_model${store.storeId}"
															class="header-cate-model main-gambo-model modal fade"
															tabindex="-1" role="dialog" aria-modal="false">
															<div class="modal-dialog category-area" role="document">
																<div class="category-area-inner">
																	<div class="modal-header">
																		<button type="button" class="close btn-close"
																			data-dismiss="modal" aria-label="Close">
																			<i class="uil uil-multiply"></i>
																		</button>
																	</div>
																	<div class="category-model-content modal-content">
																		<div class="cate-header">
																			<h4>更新門市(店家編號:${store.storeId})</h4>
																		</div>
																		<div class="add-address-form">
																			<div class="checout-address-step">
																				<div class="row">
																					<div class="col-lg-12">
																						<form:form modelAttribute="storebean"
																							class="form-horizontal" method="POST"
																							action="store_manager/update">
																							<div class="address-fieldset">
																								<div class="row">
																									<form:input  path="storeId"
																										type="hidden" placeholder="Name" 
																										class="form-control input-md" required="" value="${store.storeId}"/>
																									<div class="col-lg-6 col-md-12">
																										<div class="form-group">
																											<label for='area'>地區</label>
																											<form:select path="area" class="">
																											<option selected style="display:none" value="${store.area}">${store.area}</option>
																											<option value="北部">北部</option>
																											<option value="中部">中部</option>
																											<option value="南部">南部</option>
																											<option value="東部">東部</option>
																											</form:select>
<%-- 																												<form:input id="area" name="area" path="area" --%>
<%--  																												type="text" placeholder="Area" --%>
<%-- 																												class="form-control input-md" required="" value="${store.area}"/> --%>
																										</div>
																									</div>
																									<div class="col-lg-6 col-md-12">
																										<div class="form-group">
																											<label class="control-label" for='name'>店名</label>
																											<form:input id="name" name="name" path="name"
																												type="text" placeholder="Name"
																												class="form-control input-md" required="" value="${store.name}"/>
																										</div>
																									</div>
																									<div class="col-lg-12 col-md-12">
																										<div class="form-group">
																											<label class="control-label" for='address'>地址</label>
																											<form:input id="address" name="address"
																												path="address" type="text"
																												placeholder="Address"
																												class="form-control input-md" required="" value="${store.address}"/>
																										</div>
																									</div>
																									<div class="col-lg-12 col-md-12">
																										<div class="form-group">
																											<label class="control-label" for='phone'>電話</label>
																											<form:input id="phone" name="phone"
																												path="phone" type="text" placeholder="Phone"
																												class="form-control input-md" value="${store.phone}"/>
																										</div>
																									</div>

																									<div class="col-lg-12 col-md-12">
																										<div class="form-group mb-0">
																											<div class="address-btns">
																												<input id="btnAdd" type="submit"
																													class="save-btn14 hover-btn" value="送出"/>
																											</div>
																										</div>
																									</div>
																								</div>
																							</div>
																						</form:form>
																					</div>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</c:forEach>
												</tbody>
											</table>
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
	<script type="text/javascript">
		function deletecheck(storeId, name) {
			var result = confirm("確定刪除此筆資料(店家編號:" + storeId + ", 店家名稱:" + name
					+ ")?");
			if (result) {
				return true;
			}
			return false;
		}
	</script>
	<!-- Body End -->
	<!-- Javascripts -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="vendor/OwlCarousel/owl.carousel.js"></script>
	<script src="vendor/semantic/semantic.min.js"></script>
	<script src="js/jquery.countdown.min.js"></script>
	<script src="js/custom.js"></script>
	<script src="js/product.thumbnail.slider.js"></script>
	<script src="js/offset_overlay.js"></script>
	<script src="js/night-mode.js"></script>


</body>
</html>