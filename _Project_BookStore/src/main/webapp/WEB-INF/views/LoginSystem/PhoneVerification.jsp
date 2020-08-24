<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>請輸入手機驗證碼</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
body {
	font-family: 微軟正黑體 !important;
}

.login-form {
	width: 340px;
	margin: 30px auto;
}

.login-form form {
	margin-bottom: 5px;
	background: white;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	padding: 30px;
}

.login-form h3 {
	margin: 20px 0 45px;
}

.login-form h4 {
	margin: 0 0 30px;
}

.form-control, .btn {
	min-height: 38px;
	border-radius: 2px;
}

.login-btn {
	font-size: 15px;
	font-weight: bold;
}
.button-group {
	text-align: center;
}


</style>
</head>
<body>
<jsp:include page="/fragment/topMVC.jsp" />
<div class="wrapper">
	<div class="login-form">
		<form action="<c:url value='SetPassword' />" method="post">
			<a href="<c:url value='CaptchaInput' />" class="glyphicon glyphicon-arrow-left"
				style="font-size: 20px; color: #f55d2c; text-decoration: none"></a>
			<h3 class="text-center">請輸入驗證碼</h3>
			<h5 class="text-center">您的驗證碼已透過SMS簡訊傳送至</h5>
			<h4 class="text-center" style="color: #f55d2c">(+886)${members.phone}</h4>

			<div class="form-group has-feedback">
				<div class="input-group">
					<input id="idcode-btn" style="width: 280px" class="form-control" placeholder="請輸入驗證碼" maxlength="6" type="text">
				</div>
				<span style="color: red; display: none;" class="tips"></span> 
				<span style="display: none;" class="glyphicon glyphicon-remove form-control-feedback"></span> 
				<span style="display: none;" class="glyphicon glyphicon-ok form-control-feedback"></span>
			</div>
			<div class="button-group" style="margin: 0 0 30px">
				<button type="button" id="loadingButton" class="btn btn-success-sm btn-block login-btn">獲取簡訊驗證碼</button>
				<button type="submit" id="submit" class="login-btn hover-btn">認證</button>
			</div>
		</form>
	</div></div>
	<script>
	
	var check = [false];

	//校验成功函数
	function success(Obj, counter) {
	    Obj.parent().parent().removeClass('has-error').addClass('has-success');
	    $('.tips').eq(counter).hide();
	    $('.glyphicon-ok').eq(counter).show();
	    $('.glyphicon-remove').eq(counter).hide();
	    check[counter] = true;

	}

	// 校验失败函数
	function fail(Obj, counter, msg) {
	    Obj.parent().parent().removeClass('has-success').addClass('has-error');
	    $('.glyphicon-remove').eq(counter).show();
	    $('.glyphicon-ok').eq(counter).hide();
	    $('.tips').eq(counter).text(msg).show();
	    check[counter] = false;
	}
	//短信验证码
	var regMsg = /111111/;
	$('.login-form').find('input').eq(0).change(function() {
	    if (true) {
	        if (regMsg.test($(this).val())) {
	            success($(this), 0);
	        } else {
	            fail($(this), 0, '簡訊驗證碼錯誤');
	        }
	    }

	});

	$('#loadingButton').click(function() {

	    if (true) {
	        $(this).removeClass('btn-primary').addClass('disabled');

	        $(this).html('<span class="red">59</span> 秒後重新獲取');
	        var secondObj = $('#loadingButton').find('span');
	        var secondObjVal = secondObj.text();

	        function secondCounter() {

	            var secondTimer = setTimeout(function() {
	                secondObjVal--;
	                secondObj.text(secondObjVal);
	                secondCounter();
	            }, 1000);
	            if (secondObjVal == 0) {
	                clearTimeout(secondTimer);
	                $('#loadingButton').text('重新獲取驗證碼');
	                $('#loadingButton').removeClass('disabled').addClass('btn-primary');

	            }
	        }

	        secondCounter();
	    }

	})

	$('#submit').click(function(e) {
	    if (!check.every(function(value) {
	            return value == true
	        })) {
	        e.preventDefault();
	        for (key in check) {
	            if (!check[key]) {
	                $('.login-form').find('input').eq(key).parent().parent().removeClass('has-success').addClass('has-error')
	            }
	        }
	    }
	});
	</script>
</body>
</html>