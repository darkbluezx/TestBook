<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Google註冊</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
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
        background: #f7f7f7;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;
    }
    .login-form h3 {
        margin: 0 0 25px;
    }
    img{
		width: 100px; 
		border-radius: 50%;
	}
	
    .form-control, .btn {
        min-height: 38px;
        border-radius: 2px;
    }
    
    .login-btn {       
        font-size: 15px;
        font-weight: bold;
    }
    
	.input-group-addon .fa{
		font-size: 18px;
	}
	.button-group {
		text-align: right;
	}
</style>
</head>
<body>
<div class="login-form">
    <form action="/examples/actions/confirmation.php" method="post">
        <h3 class="text-left">使用Google註冊</h3>	
        <div style="margin:0 0 30px">
        	<img src="../images/默認頭像.png${默認頭像}"  style="display:block; margin:auto">
        </div>      
        <div class="form-group">
        	<div class="input-group">
                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                <input type="text" class="form-control" name="username" placeholder=" Email${Email}" required="required">
            </div>
        </div>
		<div class="form-group">
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                <input type="password" class="form-control" name="password" placeholder=" 密碼" required="required">
            </div>
            <span class="help-block">請填寫此欄位</span>
        </div>   

        <div class="button-group">
        	<a type="submit" class="btn btn-success-sm btn-lg login-btn" href="Login.jsp" role="button">取消</a>
            <button type="submit" class="btn btn-success btn-lg login-btn">註冊</button>
        </div>
    </form>
</div>
</body>
</html>