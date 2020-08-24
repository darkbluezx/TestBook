<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>註冊</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<meta name="google-signin-scope" content="profile email">
 <meta name="google-signin-client_id" content="851880125562-pkm9fbj20e65jk9g71r6ttk5i894rrdj.apps.googleusercontent.com">
 <script src="https://apis.google.com/js/platform.js" async defer></script>
 
<style>
	body{
		font-family:微軟正黑體!important;
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
        margin: 0 0 25px;
    }
    .login-form .hint-text {
		color: #777;
		padding-bottom: 15px;
		text-align: center;
    }
    .form-control, .btn {
        min-height: 38px;
        border-radius: 2px;
    }
    .login-btn {       
        font-size: 15px;
        font-weight: bold;
    }
    .or-seperator {
        margin: 50px 0 10px;
        text-align: center;
        border-top: 1.5px solid #ccc;
    }
    .or-seperator i {
        padding: 0 15px;
        background: white;
        position: relative;
        top: -11px;
        z-index: 1;
    }
    .social-btn .btn {
        margin: 10px 0;
        font-size: 15px;
        text-align: left; 
        line-height: 24px;       
    }
	.social-btn .btn i {
		float: left;
		margin: 4px 15px  0 5px;
        min-width: 15px;
	}
 	.input-group-addon .fa{ 
 		font-size: 18px; 
 	} 
</style>
<!-- <script type="text/javascript"> -->
<!-- // window.onload = function() { -->
<!-- // 		document.querySelector("#phone").onblur = checkPhone; -->
		
<!-- // 		function checkPhone(){ -->
<!-- // 			var phone = document.getElementById("phone").value; -->
<!-- // 			var isMobile = /^(09)[0-9]{8}$/; -->
			
<!-- // 			if (phone == "") { -->
<!-- // 				phoneError.innerHTML = "手機註冊欄必須輸入"; -->
				
<!-- // 			} else { -->
<!-- // 				phoneError.innerHTML = ""; -->
<!-- // 			} -->
<!-- // 			if (!isMobile.test(phone)) { -->
<!-- // 				phoneError.innerHTML = "不符合手機號格式"; -->
				
<!-- // 			}else { -->
<!-- // 				phoneError.innerHTML = ""; -->
<!-- // 			} -->
<!-- // 		} -->
<!-- // } -->
<!-- </script> -->
</head>
<body>

<c:set var="funcName" value="REG" scope="session"/>
<!-- 引入共同的頁首 -->
<jsp:include page="/fragment/topMVC.jsp" />
<div class="wrapper">
<div class="login-form">
<div id="content"></div>
    <form action="<c:url value='phoneRegister' />" >
        <h3 class="text-left">註冊</h3>	      
        <div class="form-group">
        	<div class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
                <input type="text" class="form-control" id="phone" name="phone"  placeholder=" 手機號碼" /> 
            </div>
            <div id="phoneError" style="color:red; margin-top: 5px"></div> 
            <div style="color:red; margin-top: 5px"><font color="red">${MsgMap.errorPhoneEmpty}</font></div> 
            <div style="color:red; margin-top: 5px"><font color="red">${MsgMap.errorPhoneMatches}</font></div> 
            <div style="color:red; margin-top: 5px"><font color="red">${MsgMap.errorPhoneDup}</font></div> 
        	</div> 
        <div class="form-group">
            <button type="submit" class="login-btn hover-btn">下一個</button>
        </div> 
        <div class="or-seperator"><i>or</i></div>
        <div class="text-center social-btn">
        <div class="g-signin2" onclick="ClickLogin()" data-onsuccess="onSignIn" data-theme="dark"></div>
<!--             <a href="FBLogin()" class="btn btn-primary btn-block text-center"><i class="fa fa-facebook"></i> Sign in with <b>Facebook</b></a> -->
<!-- 			<a href="Dashboard_Address" class="btn btn-danger btn-block text-center"><i class="fa fa-google"></i> Sign in with <b>Google</b></a> -->
        </div>
    </form>
    <div class="hint-text medium">已經有帳號了嗎? <a href="Login" class="text-success">登入</a></div>
</div></div>

<script>

var clicked = false;
	function ClickLogin(){
		clicked=true;
	}
	
      function onSignIn(googleUser) {
    	  if(clicked){
        // 客戶端如果有需要的話可以通過profile來獲取使用者資訊
        var profile = googleUser.getBasicProfile();
        // 傳回後臺驗證，並獲取userid
        var id_token = googleUser.getAuthResponse().id_token;
        console.log("ID Token: " + id_token);
        var xhr = new XMLHttpRequest();
        xhr.open('POST', "<c:url value='googleVerify' />");
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onload = function() {
          console.log('Signed in as: ' + xhr.responseText);
          location.href = "<c:url value='/' />";
        };
        xhr.send('idtokenstr=' + id_token);
        
      }
      
      };
      function signOut() {
    	    var auth2 = gapi.auth2.getAuthInstance();
    	    auth2.signOut().then(function () {
    	      console.log('User signed out.');
    	    });
    	  }
    </script>

</body>
</html>