<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
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
		<title>topMVC</title>
		
		<!-- Favicon Icon -->
		<link rel="icon" type="image/png" href="images/fav.png">
		
		<!-- Stylesheets -->
		<link href="https://fonts.googleapis.com/css2?family=Rajdhani:wght@300;400;500;600;700&display=swap" rel="stylesheet">
		<link href='vendor/unicons-2.0.1/css/unicons.css' rel='stylesheet'>
		<link href="css/style.css" rel="stylesheet">
		<link href="css/responsive.css" rel="stylesheet">
		<link href="css/night-mode.css" rel="stylesheet">
		<link href="css/step-wizard.css" rel="stylesheet">
		
		<!-- Vendor Stylesheets -->
		<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
		<link href="vendor/OwlCarousel/assets/owl.carousel.css" rel="stylesheet">
		<link href="vendor/OwlCarousel/assets/owl.theme.default.min.css" rel="stylesheet">
		<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="vendor/semantic/semantic.min.css">	
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</head>
<script type="text/javascript">
window.onload = function() {

	var sendData = document.getElementById("sendData2");
	   sendData.onclick = function() {
	   // 讀取欄位資料	  
	   var name = document.getElementById("memberName").value;
	   var mail = document.getElementById("mail").value;
	   var gender = document.getElementById("gender").value;
	   var birthday = document.getElementById("birthday").value;
	   var productImage = document.getElementById("productImage").value;

	   var hasError = false; // 設定判斷有無錯誤的旗標
	   var isMail =/^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	   var div0 = document.getElementById('result0c2');
	   var div1 = document.getElementById('result1c2');
	   var div2 = document.getElementById('result2c2');
	   var div3 = document.getElementById('result3c2');
	   var div4 = document.getElementById('result4c2');
	   var div5 = document.getElementById('result5c2');
	   var divResult = document.getElementById('resultMsg2');
	   if (!memberName){
	       div0.innerHTML = "<font color='red' size='-1'>請輸入你的名子</font>";
	       hasError = true;
	   } 
	   else {
	      div0.innerHTML = "";
	   }
	   if (!isMail.test(mail)) { 
		   div1.innerHTML = "<font color='red' size='-1'>不符合信箱格式</font>"; 
		   hasError = true;
	   } 
	   else { 
	       div1.innerHTML = ""; 
	   } 
	   if (!gender){
	       div2.innerHTML = "<font color='red' size='-1'>請輸入你的性別</font>";
	       hasError = true;
	   } else {
	       div2.innerHTML = "";
	   }
	   if (!birthday){
	       div3.innerHTML = "<font color='red' size='-1'>不符合生日格式</font>";
		   hasError = true;
	   } else {
	       div3.innerHTML = "";
	   }
	   if (!productImage){
	       div4.innerHTML = "<font color='red' size='-1'>不符合圖片格式</font>";
		   hasError = true;
	   } else {
	       div4.innerHTML = "";
	   }

	   if (hasError){
	       return false;
	   }
	}
	   
	   var sendData = document.getElementById("sendData3");
	   sendData.onclick = function() {
	   // 讀取欄位資料	  
	   var creditName = document.getElementById("creditName").value;
	   var creditNumber = document.getElementById("creditNumber").value;
	   var creditPincode = document.getElementById("creditPincode").value;
	   var expireMonth = document.getElementById("expireMonth").value;
	   var expireYear = document.getElementById("expireYear").value;
	   var creditcvv = document.getElementById("creditcvv").value;
	   var creditStreet = document.getElementById("creditStreet").value;

	   var hasError = false; // 設定判斷有無錯誤的旗標
	   var div0 = document.getElementById('result0c3');
	   var div1 = document.getElementById('result1c3');
	   var div2 = document.getElementById('result2c3');
	   var div3 = document.getElementById('result3c3');
	   var div4 = document.getElementById('result4c3');
	   var div5 = document.getElementById('result5c3');
	   var div6 = document.getElementById('result6c3');
	   var divResult = document.getElementById('resultMsg3');
	   if (!creditName){
	       div0.innerHTML = "<font color='red' size='-1'>請輸入持卡者姓名</font>";
	       hasError = true;
	   } 
	   else {
	      div0.innerHTML = "";
	   }
	   if (!creditNumber) { 
		   div1.innerHTML = "<font color='red' size='-1'>不符合信用卡號碼格式</font>"; 
		   hasError = true;
	   } 
	   else { 
	       div1.innerHTML = ""; 
	   } 
	   if (!creditPincode){
	       div2.innerHTML = "<font color='red' size='-1'>無效的郵遞區號</font>";
	       hasError = true;
	   } else {
	       div2.innerHTML = "";
	   }
	   if (!expireMonth){
	       div3.innerHTML = "<font color='red' size='-1'>請選擇到期月份</font>";
		   hasError = true;
	   } else {
	       div3.innerHTML = "";
	   }
	   if (!expireYear){
	       div4.innerHTML = "<font color='red' size='-1'>請選擇到期年份</font>";
		   hasError = true;
	   } else {
	       div4.innerHTML = "";
	   }
	   if (!creditcvv){
	       div5.innerHTML = "<font color='red' size='-1'>無效的CVV</font>";
		   hasError = true;
	   } else {
	       div5.innerHTML = "";
	   }
	   if (!creditStreet){
	       div6.innerHTML = "<font color='red' size='-1'>請輸入地址</font>";
		   hasError = true;
	   } else {
	       div6.innerHTML = "";
	   }
	   if (hasError){
	       return false;
	   }
	}
	   
	   var sendData = document.getElementById("sendData4");
	   sendData.onclick = function() {
	   // 讀取欄位資料	  
	   var creditName = document.getElementById("creditName1").value;
	   var creditNumber = document.getElementById("creditNumber1").value;
	   var creditPincode = document.getElementById("creditPincode1").value;
	   var expireMonth = document.getElementById("expireMonth1").value;
	   var expireYear = document.getElementById("expireYear1").value;
	   var cvv = document.getElementById("cvv1").value;
	   var creditStreet = document.getElementById("creditStreet1").value;

	   var hasError = false; // 設定判斷有無錯誤的旗標
	   var div0 = document.getElementById('result0c31');
	   var div1 = document.getElementById('result1c31');
	   var div2 = document.getElementById('result2c31');
	   var div3 = document.getElementById('result3c31');
	   var div4 = document.getElementById('result4c31');
	   var div5 = document.getElementById('result5c31');
	   var div6 = document.getElementById('result6c31');
	   var divResult = document.getElementById('resultMsg3');
	   if (!creditName){
	       div0.innerHTML = "<font color='red' size='-1'>請輸入持卡者姓名</font>";
	       hasError = true;
	   } 
	   else {
	      div0.innerHTML = "";
	   }
	   if (!creditNumber) { 
		   div1.innerHTML = "<font color='red' size='-1'>不符合信用卡號碼格式</font>"; 
		   hasError = true;
	   } 
	   else { 
	       div1.innerHTML = ""; 
	   } 
	   if (!creditPincode){
	       div2.innerHTML = "<font color='red' size='-1'>無效的郵遞區號</font>";
	       hasError = true;
	   } else {
	       div2.innerHTML = "";
	   }
	   if (!expireMonth){
	       div3.innerHTML = "<font color='red' size='-1'>請選擇到期月份</font>";
		   hasError = true;
	   } else {
	       div3.innerHTML = "";
	   }
	   if (!expireYear){
	       div4.innerHTML = "<font color='red' size='-1'>請選擇到期年份</font>";
		   hasError = true;
	   } else {
	       div4.innerHTML = "";
	   }
	   if (!cvv){
	       div5.innerHTML = "<font color='red' size='-1'>無效的CVV</font>";
		   hasError = true;
	   } else {
	       div5.innerHTML = "";
	   }
	   if (!creditStreet){
	       div6.innerHTML = "<font color='red' size='-1'>請輸入地址</font>";
		   hasError = true;
	   } else {
	       div6.innerHTML = "";
	   }
	   if (hasError){
	       return false;
	   }
	}
	   var sendData = document.getElementById("sendData");
	   sendData.onclick = function() {
	   // 讀取欄位資料	  
	   var deliveryName = document.getElementById("deliveryName").value;
	   var deliveryPhone = document.getElementById("deliveryPhone").value;
	   var deliverypincode = document.getElementById("deliverypincode").value;
	   var deliverycity = document.getElementById("deliverycity").value;
	   var deliveryregion = document.getElementById("deliveryregion").value;
	   var deliverystreet = document.getElementById("deliverystreet").value;

	   var hasError = false; // 設定判斷有無錯誤的旗標
	   var isMobile = /^(09)[0-9]{8}$/;
	   var div0 = document.getElementById('result0c');
	   var div1 = document.getElementById('result1c');
	   var div2 = document.getElementById('result2c');
	   var div3 = document.getElementById('result3c');
	   var div4 = document.getElementById('result4c');
	   var div5 = document.getElementById('result5c');
	   var divResult = document.getElementById('resultMsg');
	   if (!deliveryName){
	       div0.innerHTML = "<font color='red' size='-1'>請輸入你的名子</font>";
	       hasError = true;
	   } 
	   else {
	      div0.innerHTML = "";
	   }
	   if (!isMobile.test(deliveryPhone)) { 
		   div1.innerHTML = "<font color='red' size='-1'>不符合手機號格式</font>"; 
		   hasError = true;
	   } 
	   else { 
	       div1.innerHTML = ""; 
	   } 
	   if (!deliverypincode){
	       div2.innerHTML = "<font color='red' size='-1'>無效的郵遞區號</font>";
	       hasError = true;
	   } else {
	       div2.innerHTML = "";
	   }
	   if (!deliverycity){
	       div3.innerHTML = "<font color='red' size='-1'>請輸入城市</font>";
		   hasError = true;
	   } else {
	       div3.innerHTML = "";
	   }
	   if (!deliveryregion){
	       div4.innerHTML = "<font color='red' size='-1'>請輸入地區</font>";
		   hasError = true;
	   } else {
	       div4.innerHTML = "";
	   }
	   if (!deliverystreet){
	       div5.innerHTML = "<font color='red' size='-1'>請輸入地址</font>";
		   hasError = true;
	   } else {
	       div5.innerHTML = "";
	   }
	   if (hasError){
	       return false;
	   }
	   
	}

	var sendData = document.getElementById("sendData1");
	   sendData.onclick = function() {
	   // 讀取欄位資料	  
	   var deliveryName1 = document.getElementById("deliveryName1").value;
	   var deliveryPhone1 = document.getElementById("deliveryPhone1").value;
	   var pincode1 = document.getElementById("pincode1").value;
	   var city1 = document.getElementById("city1").value;
	   var region1 = document.getElementById("region1").value;
	   var street1 = document.getElementById("street1").value;

	   var hasError = false; // 設定判斷有無錯誤的旗標
	   var isMobile = /^(09)[0-9]{8}$/;
	   var div0 = document.getElementById('result0c1');
	   var div1 = document.getElementById('result1c1');
	   var div2 = document.getElementById('result2c1');
	   var div3 = document.getElementById('result3c1');
	   var div4 = document.getElementById('result4c1');
	   var div5 = document.getElementById('result5c1');
	   var divResult = document.getElementById('resultMsg1');
	   if (!deliveryName1){
	       div0.innerHTML = "<font color='red' size='-1'>請輸入你的名子</font>";
	       hasError = true;
	   } 
	   else {
	      div0.innerHTML = "";
	   }
	   if (!isMobile.test(deliveryPhone1)) { 
		   div1.innerHTML = "<font color='red' size='-1'>不符合手機號格式</font>"; 
		   hasError = true;
	   } 
	   else { 
	       div1.innerHTML = ""; 
	   } 
	   if (!pincode1){
	       div2.innerHTML = "<font color='red' size='-1'>無效的郵遞區號</font>";
	       hasError = true;
	   } else {
	       div2.innerHTML = "";
	   }
	   if (!city1){
	       div3.innerHTML = "<font color='red' size='-1'>請輸入城市</font>";
		   hasError = true;
	   } else {
	       div3.innerHTML = "";
	   }
	   if (!region1){
	       div4.innerHTML = "<font color='red' size='-1'>請輸入地區</font>";
		   hasError = true;
	   } else {
	       div4.innerHTML = "";
	   }
	   if (!street1){
	       div5.innerHTML = "<font color='red' size='-1'>請輸入地址</font>";
		   hasError = true;
	   } else {
	       div5.innerHTML = "";
	   }
	   if (hasError){
	       return false;
	   }
	} 
	   
}

function qtyPlus(x,y) {
	localStorage.setItem('openleft','y');
	document.forms[0].action="<c:url value='qtyPlus?bookId=" + x +"' />" ;
	document.forms[0].method="POST";
	console.log("進入qtyPlus");
	document.forms[0].submit();
}
function qtyMinus(x,y) {
	localStorage.setItem('openleft','y');
	var valuey = document.getElementById('quantity'+y).value;
	if (valuey <= 1) {
		console.log("Minus 1!");		
		console.log("document.getElementById('quantity'+y).value" + document.getElementById('quantity'+y).value);
		document.getElementById('quantity'+y).value = 1;
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

</script>

<body>
<c:set var='debug' value='true' scope='application' />
	<!-- Add Address Model Start -->
	<div id="address_model" class="header-cate-model main-gambo-model modal fade" tabindex="-1" role="dialog" aria-modal="false">
        <div class="modal-dialog category-area" role="document">
            <div class="category-area-inner">
                <div class="modal-header">
                    <button type="button" class="close btn-close" data-dismiss="modal" aria-label="Close">
						<i class="uil uil-multiply"></i>
                    </button>
                </div>
                <div class="category-model-content modal-content"> 
					<div class="cate-header">
						<h4>新增地址</h4>
					</div>
					<div class="add-address-form">
						<div class="checout-address-step">
							<div class="row">
								<div class="col-lg-12">												
									<form action="<c:url value='deliverySave' />" method="post">
										<div class="address-fieldset">
											<div class="row">
												<div class="col-lg-12 col-md-12">
													<div class="form-group">
													<div id='resultMsg' style="height: 18px; font-weight: bold;"></div>
														<label class="control-label">姓名</label>
														<input id="deliveryName" name="deliveryName" type="text" placeholder="姓名" class="form-control input-md" >
														<font id='result0c' style="height: 10px;"></font><br>														
													</div>
												</div>
												<div class="col-lg-6 col-md-12">
													<div class="form-group">
														<label class="control-label">手機</label>
														<input id="deliveryPhone" name="deliveryPhone" type="text" placeholder="手機" class="form-control input-md">
            											<font id='result1c' style="height: 10px;"></font><br>														
													</div>
												</div>
												<div class="col-lg-6 col-md-12">
													<div class="form-group">
														<label class="control-label">郵遞區號</label>
														<input id="deliverypincode" name="pincode" type="text" placeholder="郵遞區號" class="form-control input-md" >
														<font id='result2c' style="height: 10px;"></font><br>														
													</div>
												</div>
												<div class="col-lg-6 col-md-12">
													<div class="form-group">
														<label class="control-label">城市</label>
														<input id="deliverycity" name="city" type="text" placeholder="城市" class="form-control input-md">
														<font id='result3c' style="height: 10px;"></font><br>																
													</div>
												</div>
												<div class="col-lg-6 col-md-12">
													<div class="form-group">
														<label class="control-label">地區</label>
														<input id="deliveryregion" name="region" type="text" placeholder="地區" class="form-control input-md">
														<font id='result4c' style="height: 10px;"></font><br>																
													</div>	
												</div>
												<div class="col-lg-12 col-md-12">
													<div class="form-group">
														<label class="control-label">樓層、街/路...</label>
														<input id="deliverystreet" name="street" type="text" placeholder="區、樓層、街/路..." class="form-control input-md">
														<font id='result5c' style="height: 10px;"></font><br>															
													</div>
												</div>
												<div class="col-lg-12 col-md-12">
													<div class="form-group mb-0">
														<div class="address-btns">
															<button id='sendData' type="submit" class="save-btn14 hover-btn">儲存</button>
														</div>
														<input type="button" style="float:right" class="save-btn14 hover-btn" value="地址資料輸入二" onclick="addressData2();" />
														<input type="button" style="float:right" class="save-btn14 hover-btn" value="地址資料輸入一" onclick="addressData1();" />
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
	<!-- Add Address Model End -->
	<!-- Update Address Model Start -->
	<c:forEach var="delivery" items='${allDelivery}'>
	<div id="address_model${delivery.id}" class="header-cate-model main-gambo-model modal fade" tabindex="-1" role="dialog" aria-modal="false">
        <div class="modal-dialog category-area" role="document">
            <div class="category-area-inner">
                <div class="modal-header">
                    <button type="button" class="close btn-close" data-dismiss="modal" aria-label="Close">
						<i class="uil uil-multiply"></i>
                    </button>
                </div>
                <div class="category-model-content modal-content"> 
					<div class="cate-header">
						<h4>編輯地址</h4>
					</div>
					<div class="add-address-form">
						<div class="checout-address-step">
							<div class="row">
								<div class="col-lg-12">												
									<form method="post" action="${pageContext.request.contextPath}/1Dashboard_Address/${delivery.id}" >
										<div class="address-fieldset">
											<div class="row">
												<div class="col-lg-12 col-md-12">
													<div class="form-group">
													<div id='resultMsg1' style="height: 18px; font-weight: bold;"></div>
														<label class="control-label">姓名</label>
														<input id="deliveryName1" name="deliveryName1" type="text" value="${delivery.deliveryName}" class="form-control input-md" />
														<font id='result0c1' style="height: 10px;"></font><br>
													</div>
												</div>
												<div class="col-lg-6 col-md-12">
													<div class="form-group">
														<label class="control-label">手機</label>
														<input id="deliveryPhone1" name="deliveryPhone1" type="text" value="${delivery.deliveryPhone}" class="form-control input-md" />
            											<font id='result1c1' style="height: 10px;"></font><br>
													</div>
												</div>
												<div class="col-lg-6 col-md-12">
													<div class="form-group">
														<label class="control-label">郵遞區號</label>
														<input id="pincode1" name="pincode1" type="text" value="${delivery.pincode}" maxlength="3" class="form-control input-md" />
														<font id='result2c1' style="height: 10px;"></font><br>
													</div>
												</div>
												<div class="col-lg-6 col-md-12">
													<div class="form-group">
														<label class="control-label">城市</label>
														<input id="city1" name="city1" type="text" value="${delivery.city}" class="form-control input-md" />
														<font id='result3c1' style="height: 10px;"></font><br>	
													</div>
												</div>
												<div class="col-lg-6 col-md-12">
													<div class="form-group">
														<label class="control-label">地區</label>
														<input id="region1" name="region1" type="text" value="${delivery.region}" class="form-control input-md" />
														<font id='result4c1' style="height: 10px;"></font><br>	
													</div>	
												</div>
												<div class="col-lg-12 col-md-12">
													<div class="form-group">
														<label class="control-label">樓層、街/路...</label>
														<input id="street1" name="street1" type="text" value="${delivery.street}" class="form-control input-md" />
														<font id='result5c1' style="height: 10px;"></font><br>
													</div>
												</div>
												<div class="col-lg-12 col-md-12">
													<div class="form-group mb-0">
														<div class="address-btns">
															<button id='sendData1' type="submit" class="save-btn14 hover-btn">儲存</button>
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
    </c:forEach>
	<!-- Update Address Model End -->
	<!-- Delete Address Model Start -->
	<c:forEach var="delivery" items='${allDelivery}'>
	<div id="address_modell${delivery.id}" class="header-cate-model main-gambo-model modal fade" tabindex="-1" role="dialog" aria-modal="false">
        <div class="modal-dialog category-area" role="document">
            <div class="category-area-inner">
                <div class="modal-header">
                    <button type="button" class="close btn-close" data-dismiss="modal" aria-label="Close">
						<i class="uil uil-multiply"></i>
                    </button>
                </div>
                <div class="category-model-content modal-content"> 
					<div class="cate-header">
						<h4>刪除地址</h4>
					</div>
					<div class="add-address-form">
						<div class="checout-address-step">
							<div class="row">
								<div class="col-lg-12">												
									<form method="post" action="${pageContext.request.contextPath}/Dashboard_Address/${delivery.id}" >
										<div class="address-fieldset">
											<div class="row">
												<div class="col-lg-12 col-md-12">
													<div class="form-group">
													<div id='resultMsg1' style="height: 18px; font-weight: bold;"></div>
														<label class="control-label">姓名</label>
														<input id="deliveryName1" name="deliveryName1" type="text" value="${delivery.deliveryName}" class="form-control input-md" />
													</div>
												</div>
												<div class="col-lg-6 col-md-12">
													<div class="form-group">
														<label class="control-label">手機</label>
														<input id="deliveryPhone1" name="deliveryPhone1" type="text" value="${delivery.deliveryPhone}" class="form-control input-md" />
													</div>
												</div>
												<div class="col-lg-6 col-md-12">
													<div class="form-group">
														<label class="control-label">郵遞區號</label>
														<input id="pincode1" name="pincode1" type="text" value="${delivery.pincode}" class="form-control input-md" />
													</div>
												</div>
												<div class="col-lg-6 col-md-12">
													<div class="form-group">
														<label class="control-label">城市</label>
														<input id="city1" name="city1" type="text" value="${delivery.city}" class="form-control input-md" />
													</div>
												</div>
												<div class="col-lg-6 col-md-12">
													<div class="form-group">
														<label class="control-label">地區</label>
														<input id="region1" name="region1" type="text" value="${delivery.region}" class="form-control input-md" />	
													</div>	
												</div>
												<div class="col-lg-12 col-md-12">
													<div class="form-group">
														<label class="control-label">樓層、街/路...</label>
														<input id="street1" name="street1" type="text" value="${delivery.street}" class="form-control input-md" />	
													</div>
												</div>
												<div class="col-lg-12 col-md-12">
													<div class="form-group mb-0">
														<div class="address-btns">
															<button type="submit" class="save-btn14 hover-btn">刪除</button>
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
    </c:forEach>
    <!-- Delete Address Model End -->
    <!-- Member Model Start -->
	<div id="address_modelll" class="header-cate-model main-gambo-model modal fade" tabindex="-1" role="dialog" aria-modal="false">
        <div class="modal-dialog category-area" role="document">
            <div class="category-area-inner">
                <div class="modal-header">
                    <button type="button" class="close btn-close" data-dismiss="modal" aria-label="Close">
						<i class="uil uil-multiply"></i>
                    </button>
                </div>
                <div class="category-model-content modal-content"> 
					<div class="cate-header">
						<h4>編輯我的檔案</h4>
					</div>
					<div class="add-address-form">
						<div class="checout-address-step">
							<div class="row">
								<div class="col-lg-12">												
									<form method="post" action="<c:url value='membersSave' />" enctype='multipart/form-data'>
										<div class="address-fieldset">
											<div class="row">
											<div id="id" style="display:none" class="form-control input-md" >${members.id}</div>
											<div id = "googleId" style="display:none">${members.googleId}</div>
												<div class="col-lg-6 col-md-12">
													<div class="form-group">
													<div id='resultMsg2' style="height: 18px; font-weight: bold;"></div>
														<label class="control-label">使用者帳號</label>
														<c:if test="${! empty members.googleId}">
														<div><font>Google 帳號</font></div>
														</c:if>
														<c:if test="${ empty members.googleId}">
														<div><font>${members.phone}</font></div>
														</c:if>
													</div>
												</div>
												<div class="col-lg-6 col-md-12">
													<div class="form-group">
														<label class="control-label">姓名</label>
														<input id="memberName" name="name" type="text" value="${members.name}" class="form-control input-md" />
            											<font id='result0c2' style="height: 10px;"></font><br>
													</div>
												</div>
												<div class="col-lg-12 col-md-12">
													<div class="form-group">
														<label class="control-label">E-mail</label>
														<input id="mail" name="mail" type="text" value="${members.mail}" class="form-control input-md" />
														<font id='result1c2' style="height: 10px;"></font><br>
													</div>
												</div>
												<c:if test="${! empty members.googleId}">
												</c:if>
												<c:if test="${ empty members.googleId}">
												<div id = "user_phone" class="col-lg-6 col-md-12">
													<div class="form-group">
														<label class="control-label">手機</label>
														<div><font>${members.phone}</font></div>
														<font id='result5c2' style="height: 10px;"></font><br>	
													</div>
												</div>
												</c:if>
												<div class="col-lg-6 col-md-12">
													<div class="form-group">
														<label class="control-label">性別</label>
														<input id="gender" name="gender" type="text" value="${members.gender}" class="form-control input-md" />
														<font id='result2c2' style="height: 10px;"></font><br>	
													</div>	
												</div>
												<div class="col-lg-6 col-md-12">
													<div class="form-group">
														<label class="control-label">生日<font style="height: 10px; color:red">(yyyy-MM-dd)</font></label>
														<input id="birthday" name="birthday" type="text" value="${members.birthday}" maxlength="10" class="form-control input-md" />
														<font id='result3c2' style="height: 10px;"></font><br>	
													</div>
												</div>
												<div class="col-lg-6 col-md-12">
													<div class="form-group">
														<label class="control-label">選擇圖片</label>
														<input id="productImage" name="productImage" type='file' value="${members.fileName}" />
														<font id='result4c2' style="height: 10px;"></font><br>	
													</div>
												</div>
												<div class="col-lg-12 col-md-12">
													<div class="form-group mb-0">
														<div class="address-btns">
															<button id='sendData2'  type="submit" class="save-btn14 hover-btn">儲存</button>
														</div>
            												<input type="button" style="float:right" class="save-btn14 hover-btn" value="會員資料輸入" onclick="memberData1();" />
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
    <!-- Member Model End -->
	<!-- Add Credit Model Start -->
	<div id="Credit_model" class="header-cate-model main-gambo-model modal fade" tabindex="-1" role="dialog" aria-modal="false">
        <div class="modal-dialog category-area" role="document">
            <div class="category-area-inner">
                <div class="modal-header">
                    <button type="button" class="close btn-close" data-dismiss="modal" aria-label="Close">
						<i class="uil uil-multiply"></i>
                    </button>
                </div>
                <div class="category-model-content modal-content"> 
					<div class="cate-header">
						<h4>新增信用卡</h4>
					</div>
					<div class="add-address-form">
						<div class="checout-address-step">
							<div class="row">
								<div class="col-lg-12">												
									<form method="post" action="<c:url value='paymentSave' />" >
										<div class="address-fieldset">
											<div class="row">
												<div class="col-lg-12 col-md-12">
													<div class="form-group">
													<div id='resultMsg3' style="height: 18px; font-weight: bold;"></div>
														<label class="control-label">持卡者姓名</label>
														<input id="creditName" name="creditName" type="text" class="form-control input-md" />
														<font id='result0c3' style="height: 10px;"></font><br>
													</div>
												</div>
												<div class="col-lg-6 col-md-12">
													<div class="form-group">
														<label class="control-label">信用卡號碼</label>
														<input id="creditNumber" name="creditNumber" type="text" class="form-control input-md" />
            											<font id='result1c3' style="height: 10px;"></font><br>
													</div>
												</div>
												<div class="col-lg-6 col-md-12">
													<div class="form-group">
														<label class="control-label">郵遞區號</label>
														<input id="creditPincode" name="creditPincode" type="text" maxlength="3" class="form-control input-md" />
														<font id='result2c3' style="height: 10px;"></font><br>
													</div>
												</div>
												<div class="col-lg-4 col-md-4">
													<div class="form-group">																	
														<label class="control-label">到期月</label>
														<select class="ui fluid search dropdown form-dropdown" name="expireMonth" id="expireMonth">
															<option value="">月</option>
															<c:forEach items="${monthList}" var="monthList" varStatus="status">
																<option value = "${monthList.id}"> ${monthList.name}</option>
																
															</c:forEach>

														  </select>	
														  <font id='result3c3' style="height: 10px;"></font><br>
													</div>
												</div>
												<div class="col-lg-4 col-md-4">
													<div class="form-group">
														<label class="control-label">到期年</label>
														<div class="ui search focus">
															<div class="ui left icon input swdh11 swdh19">
																<input class="prompt srch_explore" type="text" name="expireYear" id="expireYear" maxlength="2" placeholder="YY">															
															</div>
																<font id='result4c3' style="height: 10px;"></font><br>
														</div>
													</div>
												</div>
												<div class="col-lg-4 col-md-4">
													<div class="form-group">
														<label class="control-label">CVV</label>
														<div class="ui search focus">
															<div class="ui left icon input swdh11 swdh19">
																<input class="prompt srch_explore" name="cvv" id="creditcvv" maxlength="3" placeholder="CVV">															
															</div>
																<font id='result5c3' style="height: 10px;"></font><br>
														</div>
													</div>
												</div>
												<div class="col-lg-12 col-md-12">
													<div class="form-group">
														<label class="control-label">帳單地址</label>
														<input id="creditStreet" name="creditStreet" type="text" class="form-control input-md" />
														<font id='result6c3' style="height: 10px;"></font><br>
													</div>
												</div>
												
												<div class="col-lg-12 col-md-12">
													<div class="form-group mb-0">
														<div class="address-btns">
															<button type="submit" id="sendData3" class="save-btn14 hover-btn">完成</button>
														</div>
														<input type="button" style="float:right" class="save-btn14 hover-btn" value="信用卡資料輸入二" onclick="creditData2();" />
														<input type="button" style="float:right" class="save-btn14 hover-btn" value="信用卡資料輸入一" onclick="creditData1();" />
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
    <!-- Add Credit Model End -->
	<!-- Update Credit Start -->
	<c:forEach var="payment" items='${allPayment}'>
	<div id="address_modelC${payment.id}" class="header-cate-model main-gambo-model modal fade" tabindex="-1" role="dialog" aria-modal="false">
        <div class="modal-dialog category-area" role="document">
            <div class="category-area-inner">
                <div class="modal-header">
                    <button type="button" class="close btn-close" data-dismiss="modal" aria-label="Close">
						<i class="uil uil-multiply"></i>
                    </button>
                </div>
                <div class="category-model-content modal-content"> 
					<div class="cate-header">
						<h4>編輯信用卡</h4>
					</div>
					<div class="add-address-form">
						<div class="checout-address-step">
							<div class="row">
								<div class="col-lg-12">												
									<form method="post" action="${pageContext.request.contextPath}/1Dashboard_Credit/${payment.id}" >
										<div class="address-fieldset">
											<div class="row">
												<div class="col-lg-12 col-md-12">
													<div class="form-group">
													<div id='resultMsg3' style="height: 18px; font-weight: bold;"></div>
														<label class="control-label">持卡者姓名</label>
														<input id="creditName1" name="creditName1" type="text" value="${payment.creditName}" class="form-control input-md" />
														<font id='result0c31' style="height: 10px;"></font><br>
													</div>
												</div>
												<div class="col-lg-6 col-md-12">
													<div class="form-group">
														<label class="control-label">信用卡號碼</label>
														<input id="creditNumber1" name="creditNumber1" type="text" value="${payment.creditNumber}" class="form-control input-md" />
            											<font id='result1c31' style="height: 10px;"></font><br>
													</div>
												</div>
												<div class="col-lg-6 col-md-12">
													<div class="form-group">
														<label class="control-label">郵遞區號</label>
														<input id="creditPincode1" name="creditPincode1" type="text" value="${payment.creditPincode}" maxlength="3" class="form-control input-md" />
														<font id='result2c31' style="height: 10px;"></font><br>
													</div>
												</div>
												<div class="col-lg-4 col-md-4">
													<div class="form-group">																	
														<label class="control-label">到期月</label>
														<select class="ui fluid search dropdown form-dropdown" name="expireMonth1" id="expireMonth1">
															<option value="" >月</option>
															<c:forEach items="${monthList}" var="monthList" varStatus="status">
															
															<c:if test="${monthList.id == payment.expireMonth}">
																<option value = "${monthList.id}" selected> ${monthList.name}</option>
															</c:if>
															<c:if test="${monthList.id != payment.expireMonth}">
																<option value = "${monthList.id}"> ${monthList.name}</option>
															</c:if>
															</c:forEach>
														  </select>	
														  <font id='result3c31' style="height: 10px;"></font><br>
													</div>
												</div>
												<div class="col-lg-4 col-md-4">
													<div class="form-group">
														<label class="control-label">到期年</label>
														<div class="ui search focus">
															<div class="ui left icon input swdh11 swdh19">
																<input class="prompt srch_explore" type="text" name="expireYear1" id="expireYear1" value="${payment.expireYear}" maxlength="2" placeholder="YY">															
															</div>
																<font id='result4c31' style="height: 10px;"></font><br>
														</div>
													</div>
												</div>
												<div class="col-lg-4 col-md-4">
													<div class="form-group">
														<label class="control-label">CVV</label>
														<div class="ui search focus">
															<div class="ui left icon input swdh11 swdh19">
																<input class="prompt srch_explore" name="cvv1" id="cvv1" value="${payment.cvv}" maxlength="3" placeholder="CVV">															
															</div>
																<font id='result5c31' style="height: 10px;"></font><br>
														</div>
													</div>
												</div>
												<div class="col-lg-12 col-md-12">
													<div class="form-group">
														<label class="control-label">帳單地址</label>
														<input id="creditStreet1" name="creditStreet1" type="text" value="${payment.creditStreet}" class="form-control input-md" />
														<font id='result6c31' style="height: 10px;"></font><br>
													</div>
												</div>
												
												<div class="col-lg-12 col-md-12">
													<div class="form-group mb-0">
														<div class="address-btns">
															<button type="submit" id="sendData4" class="save-btn14 hover-btn">完成</button>
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
    </c:forEach>
    <!-- Update Credit End -->
    <!-- Delete Credit Start -->
    <c:forEach var="payment" items='${allPayment}'>
	<div id="address_modelD${payment.id}" class="header-cate-model main-gambo-model modal fade" tabindex="-1" role="dialog" aria-modal="false">
        <div class="modal-dialog category-area" role="document">
            <div class="category-area-inner">
                <div class="modal-header">
                    <button type="button" class="close btn-close" data-dismiss="modal" aria-label="Close">
						<i class="uil uil-multiply"></i>
                    </button>
                </div>
                <div class="category-model-content modal-content"> 
					<div class="cate-header">
						<h4>刪除信用卡</h4>
					</div>
					<div class="add-address-form">
						<div class="checout-address-step">
							<div class="row">
								<div class="col-lg-12">												
									<form method="post" action="${pageContext.request.contextPath}/Dashboard_Credit/${payment.id}" >
										<div class="address-fieldset">
											<div class="row">
												<div class="col-lg-12 col-md-12">
													<div class="form-group">
													<div id='resultMsg3' style="height: 18px; font-weight: bold;"></div>
														<label class="control-label">持卡者姓名</label>
														<input id="creditName1" name="creditName1" type="text" value="${payment.creditName}" class="form-control input-md" />
													</div>
												</div>
												<div class="col-lg-6 col-md-12">
													<div class="form-group">
														<label class="control-label">信用卡號碼</label>
														<input id="creditNumber1" name="creditNumber1" type="text" value="${payment.creditNumber}" class="form-control input-md" />
													</div>
												</div>
												<div class="col-lg-6 col-md-12">
													<div class="form-group">
														<label class="control-label">郵遞區號</label>
														<input id="creditPincode1" name="creditPincode1" type="text" value="${payment.creditPincode}" maxlength="3" class="form-control input-md" />
													</div>
												</div>
												<div class="col-lg-4 col-md-4">
													<div class="form-group">																	
														<label class="control-label">到期月</label>
														<select class="ui fluid search dropdown form-dropdown" name="expireMonth1" id="expireMonth1">
															<option value="" >月</option>
															<c:forEach items="${monthList}" var="monthList" varStatus="status">
															
															<c:if test="${monthList.id == payment.expireMonth}">
																<option value = "${monthList.id}" selected> ${monthList.name}</option>
															</c:if>
															<c:if test="${monthList.id != payment.expireMonth}">
																<option value = "${monthList.id}"> ${monthList.name}</option>
															</c:if>
															</c:forEach>
														  </select>	
													</div>
												</div>
												<div class="col-lg-4 col-md-4">
													<div class="form-group">
														<label class="control-label">到期年</label>
														<div class="ui search focus">
															<div class="ui left icon input swdh11 swdh19">
																<input class="prompt srch_explore" type="text" name="expireYear1" id="expireYear1" value="${payment.expireYear}" maxlength="2" placeholder="YY">															
															</div>
														</div>
													</div>
												</div>
												<div class="col-lg-4 col-md-4">
													<div class="form-group">
														<label class="control-label">CVV</label>
														<div class="ui search focus">
															<div class="ui left icon input swdh11 swdh19">
																<input class="prompt srch_explore" name="cvv1" id="cvv1" value="${payment.cvv}" maxlength="3" placeholder="CVV">															
															</div>
														</div>
													</div>
												</div>
												<div class="col-lg-12 col-md-12">
													<div class="form-group">
														<label class="control-label">帳單地址</label>
														<input id="creditStreet1" name="creditStreet1" type="text" value="${payment.creditStreet}" class="form-control input-md" />
													</div>
												</div>
												<div class="col-lg-12 col-md-12">
													<div class="form-group mb-0">
														<div class="address-btns">
															<button type="submit" class="save-btn14 hover-btn">刪除</button>
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
    </c:forEach>
    <!-- Delete Credit End -->
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
					<div class="search-by-cat">
                        <a href="#" class="single-cat">
                            <div class="icon">
								<img src="images/category/icon-1.svg" alt="">
                            </div>
                            <div class="text">
                                Fruits and Vegetables
                            </div>
                        </a>
						<a href="#" class="single-cat">
							<div class="icon">
								<img src="images/category/icon-2.svg" alt="">
							</div>
							<div class="text"> Grocery & Staples </div>
						</a>
						<a href="#" class="single-cat">
							<div class="icon">
								<img src="images/category/icon-3.svg" alt="">
							</div>
							<div class="text"> Dairy & Eggs </div>
						</a>
						<a href="#" class="single-cat">
							<div class="icon">
								<img src="images/category/icon-4.svg" alt="">
							</div>
							<div class="text"> Beverages </div>
						</a>
						<a href="#" class="single-cat">
							<div class="icon">
								<img src="images/category/icon-5.svg" alt="">
							</div>
							<div class="text"> Snacks </div>
						</a>
						<a href="#" class="single-cat">
							<div class="icon">
								<img src="images/category/icon-6.svg" alt="">
							</div>
							<div class="text"> Home Care </div>
						</a>
						<a href="#" class="single-cat">
							<div class="icon">
								<img src="images/category/icon-7.svg" alt="">
							</div>
							<div class="text"> Noodles & Sauces </div>
						</a>
						<a href="#" class="single-cat">
							<div class="icon">
								<img src="images/category/icon-8.svg" alt="">
							</div>
							<div class="text"> Personal Care </div>
						</a>
						<a href="#" class="single-cat">
							<div class="icon">
								<img src="images/category/icon-9.svg" alt="">
							</div>
							<div class="text"> Pet Care </div>
						</a>
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
	<!-- Filter Right Sidebar Offset Start-->
	<div class="bs-canvas bs-canvas-right position-fixed bg-cart h-100">
		<div class="bs-canvas-header side-cart-header p-3 ">
			<div class="d-inline-block  main-cart-title">Filters</div>
			<button type="button" class="bs-canvas-close close"
				aria-label="Close">
				<i class="uil uil-multiply"></i>
			</button>
		</div>
		<div class="bs-canvas-body filter-body">
			<div class="filter-items">
				<div class="filtr-cate-title">
					<h4>Categories</h4>
				</div>
				<div class="filter-item-body scrollstyle_4">
					<div class="cart-radio">
						<ul class="cte-select">
							<li><input type="radio" id="c1" name="category1"> <label
								for="c1">All</label></li>
							<li><input type="radio" id="c2" name="category1" checked>
								<label for="c2">Vegetables & Fruits</label></li>
							<li><input type="radio" id="c3" name="category1"> <label
								for="c3">Grocery & Staples</label></li>
							<li><input type="radio" id="c4" name="category1"> <label
								for="c4">Dairy & Eggs</label></li>
							<li><input type="radio" id="c5" name="category1"> <label
								for="c5">Beverages</label></li>
							<li><input type="radio" id="c6" name="category1"> <label
								for="c6">Snacks</label></li>
							<li><input type="radio" id="c7" name="category1"> <label
								for="c7">Home Care</label></li>
							<li><input type="radio" id="c8" name="category1"> <label
								for="c8">Noodles & Sauces</label></li>
							<li><input type="radio" id="c9" name="category1"> <label
								for="c9">Personal Care</label></li>
							<li><input type="radio" id="c10" name="category1"> <label
								for="c10">Pat Care</label></li>
							<li><input type="radio" id="c11" name="category1"> <label
								for="c11">Mea & Seafood</label></li>
							<li><input type="radio" id="c12" name="category1"> <label
								for="c12">Electronics</label></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="filter-items">
				<div class="filtr-cate-title">
					<h4>Brand</h4>
				</div>
				<div class="other-item-body scrollstyle_4">
					<div class="brand-list">
						<div class="search-by-catgory">
							<div class="ui search">
								<div class="ui left icon input swdh10">
									<input class="prompt srch10" type="text"
										placeholder="Search by brand.."> <i
										class="uil uil-search-alt icon icon1"></i>
								</div>
							</div>
						</div>
						<div class="custom-control custom-checkbox pb2">
							<input type="checkbox" class="custom-control-input" id="brand_1">
							<label class="custom-control-label" for="brand_1">Brand
								Name</label>
						</div>
						<div class="custom-control custom-checkbox pb2">
							<input type="checkbox" class="custom-control-input" id="brand_2">
							<label class="custom-control-label" for="brand_2">Brand
								Name</label>
						</div>
						<div class="custom-control custom-checkbox pb2">
							<input type="checkbox" class="custom-control-input" id="brand_3">
							<label class="custom-control-label" for="brand_3">Brand
								Name</label>
						</div>
						<div class="custom-control custom-checkbox pb2">
							<input type="checkbox" class="custom-control-input" id="brand_4">
							<label class="custom-control-label" for="brand_4">Brand
								Name</label>
						</div>
						<div class="custom-control custom-checkbox pb2">
							<input type="checkbox" class="custom-control-input" id="brand_5">
							<label class="custom-control-label" for="brand_5">Brand
								Name</label>
						</div>
						<div class="custom-control custom-checkbox pb2">
							<input type="checkbox" class="custom-control-input" id="brand_6">
							<label class="custom-control-label" for="brand_6">Brand
								Name</label>
						</div>
						<div class="custom-control custom-checkbox pb2">
							<input type="checkbox" class="custom-control-input" id="brand_7">
							<label class="custom-control-label" for="brand_7">Brand
								Name</label>
						</div>
						<div class="custom-control custom-checkbox pb2">
							<input type="checkbox" class="custom-control-input" id="brand_8">
							<label class="custom-control-label" for="brand_8">Brand
								Name</label>
						</div>
						<div class="custom-control custom-checkbox pb2">
							<input type="checkbox" class="custom-control-input" id="brand_9">
							<label class="custom-control-label" for="brand_9">Brand
								Name</label>
						</div>
						<div class="custom-control custom-checkbox pb2">
							<input type="checkbox" class="custom-control-input" id="brand_10">
							<label class="custom-control-label" for="brand_10">Brand
								Name</label>
						</div>
					</div>
				</div>
			</div>
			<div class="filter-items">
				<div class="filtr-cate-title">
					<h4>Price</h4>
				</div>
				<div class="price-pack-item-body scrollstyle_4">
					<div class="brand-list">
						<div class="custom-control custom-checkbox pb2">
							<input type="checkbox" class="custom-control-input" id="price_1">
							<label class="custom-control-label" for="price_1">Less
								than $2 <span class="webproduct">(9)</span>
							</label>
						</div>
						<div class="custom-control custom-checkbox pb2">
							<input type="checkbox" class="custom-control-input" id="price_2">
							<label class="custom-control-label" for="price_2">$2 to
								$5 <span class="webproduct">(8)</span>
							</label>
						</div>
						<div class="custom-control custom-checkbox pb2">
							<input type="checkbox" class="custom-control-input" id="price_3">
							<label class="custom-control-label" for="price_3">$6 to
								$10 <span class="webproduct">(12)</span>
							</label>
						</div>
						<div class="custom-control custom-checkbox pb2">
							<input type="checkbox" class="custom-control-input" id="price_4">
							<label class="custom-control-label" for="price_4">$11 to
								$15 <span class="webproduct">(4)</span>
							</label>
						</div>
						<div class="custom-control custom-checkbox pb2">
							<input type="checkbox" class="custom-control-input" id="price_5">
							<label class="custom-control-label" for="price_5">$15 to
								$20 <span class="webproduct">(16)</span>
							</label>
						</div>
						<div class="custom-control custom-checkbox pb2">
							<input type="checkbox" class="custom-control-input" id="price_6">
							<label class="custom-control-label" for="price_6">$21 to
								$25 <span class="webproduct">(18)</span>
							</label>
						</div>
						<div class="custom-control custom-checkbox pb2">
							<input type="checkbox" class="custom-control-input" id="price_7">
							<label class="custom-control-label" for="price_7">More
								than $25 <span class="webproduct">(25)</span>
							</label>
						</div>
					</div>
				</div>
			</div>
			<div class="filter-items">
				<div class="filtr-cate-title">
					<h4>Discount</h4>
				</div>
				<div class="offer-item-body scrollstyle_4">
					<div class="brand-list">
						<div class="custom-control custom-checkbox pb2">
							<input type="checkbox" class="custom-control-input" id="offer_1">
							<label class="custom-control-label" for="offer_1">2% - 5%
								<span class="webproduct">(9)</span>
							</label>
						</div>
						<div class="custom-control custom-checkbox pb2">
							<input type="checkbox" class="custom-control-input" id="offer_2">
							<label class="custom-control-label" for="offer_2">6% -
								10% <span class="webproduct">(5)</span>
							</label>
						</div>
						<div class="custom-control custom-checkbox pb2">
							<input type="checkbox" class="custom-control-input" id="offer_3">
							<label class="custom-control-label" for="offer_3">11% -
								15% <span class="webproduct">(11)</span>
							</label>
						</div>
						<div class="custom-control custom-checkbox pb2">
							<input type="checkbox" class="custom-control-input" id="offer_4">
							<label class="custom-control-label" for="offer_4">16% -
								25% <span class="webproduct">(27)</span>
							</label>
						</div>
					</div>
				</div>
			</div>
			<div class="filter-items">
				<div class="filtr-cate-title">
					<h4>Pack Size</h4>
				</div>
				<div class="price-pack-item-body scrollstyle_4">
					<div class="brand-list">
						<div class="custom-control custom-checkbox pb2">
							<input type="checkbox" class="custom-control-input" id="pack_1">
							<label class="custom-control-label" for="pack_1">1 pc</label>
						</div>
						<div class="custom-control custom-checkbox pb2">
							<input type="checkbox" class="custom-control-input" id="pack_2">
							<label class="custom-control-label" for="pack_2">1 pc
								approx. 400 to 600 gm</label>
						</div>
						<div class="custom-control custom-checkbox pb2">
							<input type="checkbox" class="custom-control-input" id="pack_3">
							<label class="custom-control-label" for="pack_3">1 pc
								approx. 500 to 800 gm</label>
						</div>
						<div class="custom-control custom-checkbox pb2">
							<input type="checkbox" class="custom-control-input" id="pack_4">
							<label class="custom-control-label" for="pack_4">Combo 3
								Items</label>
						</div>
						<div class="custom-control custom-checkbox pb2">
							<input type="checkbox" class="custom-control-input" id="pack_5">
							<label class="custom-control-label" for="pack_5">Combo 4
								Items</label>
						</div>
						<div class="custom-control custom-checkbox pb2">
							<input type="checkbox" class="custom-control-input" id="pack_6">
							<label class="custom-control-label" for="pack_6">Combo 5
								Items</label>
						</div>
						<div class="custom-control custom-checkbox pb2">
							<input type="checkbox" class="custom-control-input" id="pack_7">
							<label class="custom-control-label" for="pack_7">2 pcs</label>
						</div>
						<div class="custom-control custom-checkbox pb2">
							<input type="checkbox" class="custom-control-input" id="pack_8">
							<label class="custom-control-label" for="pack_8">100 g</label>
						</div>
						<div class="custom-control custom-checkbox pb2">
							<input type="checkbox" class="custom-control-input" id="pack_9">
							<label class="custom-control-label" for="pack_9">200 g</label>
						</div>
						<div class="custom-control custom-checkbox pb2">
							<input type="checkbox" class="custom-control-input" id="pack_10">
							<label class="custom-control-label" for="pack_10">250 g</label>
						</div>
						<div class="custom-control custom-checkbox pb2">
							<input type="checkbox" class="custom-control-input" id="pack_11">
							<label class="custom-control-label" for="pack_11">500g</label>
						</div>
						<div class="custom-control custom-checkbox pb2">
							<input type="checkbox" class="custom-control-input" id="pack_12">
							<label class="custom-control-label" for="pack_12">1kg</label>
						</div>
						<div class="custom-control custom-checkbox pb2">
							<input type="checkbox" class="custom-control-input" id="pack_13">
							<label class="custom-control-label" for="pack_13">2kg</label>
						</div>
						<div class="custom-control custom-checkbox pb2">
							<input type="checkbox" class="custom-control-input" id="pack_14">
							<label class="custom-control-label" for="pack_14">3kg</label>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Filter Right Sidebar Offsetl End-->
	<!-- Header Start -->
	<header class="header clearfix">
		<div class="top-header-group">
			<div class="top-header">
				<div class="res_main_logo">
					<a href="index.html"><img src="images/dark-logo-1.svg" alt=""></a>
				</div>
				<div class="main_logo" id="logo">
					<a href="index.html"><img src="../images/logo.jpg" alt=""></a>
					<a href="index.html"><img class="logo-inverse" src="images/dark-logo.svg" alt=""></a>
				</div>
<!-- 				<div class="select_location"> -->
<!-- 					<div class="ui inline dropdown loc-title"> -->
<!-- 						<div class="text"> -->
<!-- 						  <i class="uil uil-location-point"></i> -->
<!-- 						  Gurugram -->
<!-- 						</div> -->
<!-- 						<i class="uil uil-angle-down icon__14"></i> -->
<!-- 						<div class="menu dropdown_loc"> -->
<!-- 							<div class="item channel_item"> -->
<!-- 								<i class="uil uil-location-point"></i> -->
<!-- 								Gurugram -->
<!-- 							</div> -->
<!-- 							<div class="item channel_item"> -->
<!-- 								<i class="uil uil-location-point"></i> -->
<!-- 								New Delhi -->
<!-- 							</div> -->
<!-- 							<div class="item channel_item"> -->
<!-- 								<i class="uil uil-location-point"></i> -->
<!-- 								Bangaluru -->
<!-- 							</div> -->
<!-- 							<div class="item channel_item"> -->
<!-- 								<i class="uil uil-location-point"></i> -->
<!-- 								Mumbai -->
<!-- 							</div> -->
<!-- 							<div class="item channel_item"> -->
<!-- 								<i class="uil uil-location-point"></i> -->
<!-- 								Hyderabad -->
<!-- 							</div> -->
<!-- 							<div class="item channel_item"> -->
<!-- 								<i class="uil uil-location-point"></i> -->
<!-- 								Kolkata -->
<!-- 							</div> -->
<!-- 							<div class="item channel_item"> -->
<!-- 								<i class="uil uil-location-point"></i> -->
<!-- 								Ludhiana -->
<!-- 							</div> -->
<!-- 							<div class="item channel_item"> -->
<!-- 								<i class="uil uil-location-point"></i> -->
<!-- 								Chandigrah -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
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
								<img src="../images/avatar/img-5.jpg" alt="">
							</c:if>
							<c:if test="${! empty LoginOK && empty Admin}">
								<img src='${pageContext.request.contextPath}/getMemberImage?phone=${LoginOK.phone}'>
							</c:if>
							<c:if test="${ empty LoginOK && !empty Admin}">
								<img src="../images/avatar/img-3.jpg" alt="">
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
<!-- 										<div class="menu dropdown_page"> -->
<!-- 											<a href="dashboard_overview.html" class="item channel_item page__links">Account</a> -->
<!-- 											<a href="about_us.html" class="item channel_item page__links">About Us</a> -->
<!-- 											<a href="shop_grid.html" class="item channel_item page__links">Shop Grid</a> -->
<!-- 											<a href="single_product_view.html" class="item channel_item page__links">Single Product View</a> -->
<!-- 											<a href="checkout.html" class="item channel_item page__links">Checkout</a> -->
<!-- 											<a href="request_product.html" class="item channel_item page__links">Product Request</a>										 -->
<!-- 											<a href="order_placed.html" class="item channel_item page__links">Order Placed</a>										 -->
<!-- 											<a href="bill.html" class="item channel_item page__links">Bill Slip</a>										 -->
<!-- 											<a href="sign_in.html" class="item channel_item page__links">Sign In</a> -->
<!-- 											<a href="sign_up.html" class="item channel_item page__links">Sign Up</a> -->
<!-- 											<a href="forgot_password.html" class="item channel_item page__links">Forgot Password</a> -->
<!-- 											<a href="store_show" class="item channel_item page__links">門市查詢</a> -->
<!-- 										</div> -->
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
<!-- 										<div class="menu dropdown_page"> -->
<!-- 											<a href="our_blog.html" class="item channel_item page__links">Our Blog</a> -->
<!-- 											<a href="blog_no_sidebar.html" class="item channel_item page__links">Our Blog Two No Sidebar</a> -->
<!-- 											<a href="blog_left_sidebar.html" class="item channel_item page__links">Our Blog with Left Sidebar</a> -->
<!-- 											<a href="blog_right_sidebar.html" class="item channel_item page__links">Our Blog with Right Sidebar</a> -->
<!-- 											<a href="blog_detail_view.html" class="item channel_item page__links">Blog Detail View</a> -->
<!-- 											<a href="blog_left_sidebar_single_view.html" class="item channel_item page__links">Blog Detail View with Sidebar</a> -->
<!-- 										</div> -->
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
<!-- 	<div class="wrapper"> -->
<!-- 		<div class="gambo-Breadcrumb"> -->
<!-- 			<div class="container"> -->
<!-- 				<div class="row"> -->
<!-- 					<div class="col-md-12"> -->
<!-- 						<nav aria-label="breadcrumb"> -->
<!-- 							<ol class="breadcrumb"> -->
<!-- 								<li class="breadcrumb-item"><a href="index.html">Home</a></li> -->
<!-- 								<li class="breadcrumb-item active" aria-current="page">User Dashboard</li> -->
<!-- 							</ol> -->
<!-- 						</nav> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="dashboard-group"> -->
<!-- 			<div class="container"> -->
<!-- 				<div class="row"> -->
<!-- 					<div class="col-lg-12"> -->
<!-- 						<div class="user-dt"> -->
<!-- 							<div class="user-img"> -->
<!-- 								<img src="images/avatar/img-5.jpg" alt=""> -->
<!-- 								<div class="img-add">													 -->
<!-- 									<input type="file" id="file"> -->
<!-- 									<label for="file"><i class="uil uil-camera-plus"></i></label> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<h4>Johe Doe</h4> -->
<!-- 							<p>+91999999999<a href="#"><i class="uil uil-edit"></i></a></p> -->
<!-- 							<div class="earn-points"><img src="images/Dollar.svg" alt="">Points : <span>20</span></div> -->

<!-- 	<!-- Body End -->
	<!-- Javascripts -->
	
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="vendor/OwlCarousel/owl.carousel.js"></script>
	<script src="vendor/semantic/semantic.min.js"></script>
	<script src="js/jquery.countdown.min.js"></script>
<!-- 	<script src="js/custom.js"></script> -->
	<script src="js/product.thumbnail.slider.js"></script>
	<script src="js/offset_overlay.js"></script>
	<script src="js/night-mode.js"></script>
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
	function memberData1() {
		var phone = document.getElementById("memberName");
		memberName.value = "王小明"
		
		var password = document.getElementById("mail");
		mail.value = "a5202241@yahoo.com.tw"
		
		var phone = document.getElementById("gender");
		gender.value = "男"
		
		var password = document.getElementById("birthday");
		birthday.value = "1990-03-26"

	}

	function creditData2() {
		var creditName = document.getElementById("creditName");
		creditName.value = "孫小美"
		
		var creditNumber = document.getElementById("creditNumber");
		creditNumber.value = "6952118867855100"
		
		var creditPincode = document.getElementById("creditPincode");
		creditPincode.value = "104"
		
		var expireMonth = document.getElementById("expireMonth");
		expireMonth.value = "十月"
		
		var expireYear = document.getElementById("expireYear");
		expireYear.value = "22"
		
		var creditcvv = document.getElementById("creditcvv");
		creditcvv.value = "703"
		
		var creditStreet = document.getElementById("creditStreet");
		creditStreet.value = "台南市永康區安平路一段"
	}

	function creditData1() {
		var creditName = document.getElementById("creditName");
		creditName.value = "王小明"
		
		var creditNumber = document.getElementById("creditNumber");
		creditNumber.value = "5122118869004788"
		
		var creditPincode = document.getElementById("creditPincode");
		creditPincode.value = "231"
		
		var expireMonth = document.getElementById("expireMonth");
		expireMonth.value = "三月"
		
		var expireYear = document.getElementById("expireYear");
		expireYear.value = "26"
		
		var creditcvv = document.getElementById("creditcvv");
		creditcvv.value = "304"
		
		var creditStreet = document.getElementById("creditStreet");
		creditStreet.value = "新北市新店區中興路一段181號"
	}


	function addressData1() {
		var deliveryName = document.getElementById("deliveryName");
		deliveryName.value = "王小明"
		
		var deliveryPhone = document.getElementById("deliveryPhone");
		deliveryPhone.value = "0970957952"
		
		var deliverypincode = document.getElementById("deliverypincode");
		deliverypincode.value = "231"
		
		var deliverycity = document.getElementById("deliverycity");
		deliverycity.value = "新北市"
		
		var deliveryregion = document.getElementById("deliveryregion");
		deliveryregion.value = "新店區"
		
		var deliverystreet = document.getElementById("deliverystreet");
		deliverystreet.value = "中興路一段181號"
		
	}

	function addressData2() {
		var deliveryName = document.getElementById("deliveryName");
		deliveryName.value = "孫小美"
		
		var deliveryPhon = document.getElementById("deliveryPhone");
		deliveryPhone.value = "0930148702"
		
		var deliverypincode = document.getElementById("deliverypincode");
		deliverypincode.value = "104"
		
		var deliverycity = document.getElementById("deliverycity");
		deliverycity.value = "台南市"
		
		var deliveryregion = document.getElementById("deliveryregion");
		deliveryregion.value = "永康區"
		
		var deliverystreet = document.getElementById("deliverystreet");
		deliverystreet.value = "安平路一段"
		
	}
	</script>
	
</body>
</html>