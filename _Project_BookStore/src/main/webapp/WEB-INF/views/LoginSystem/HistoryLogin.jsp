<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href='${pageContext.request.contextPath}/css/styles.css'  type="text/css" />
<meta charset="UTF-8">
<title>製作表單</title>
<style>
body {
    height: 100%;
    width: 100%;
    padding: 0;
    margin: 0;
    background: url("${pageContext.request.contextPath}/images/bk.jpg");
    background-size: cover;
    background-attachment: fixed;
    background-position: center;
}

fieldset {
/*     width: 500px; */
/*     margin: 10px; */
/*     border: 1px solid blue; */
    border-radius: 15px;
    padding:30px;
    font-family: "微軟正黑體", sans-serif;
    position: fixed;
    left: 50%;
    top: 50%;
    background: rgba(0,0,0,0.5);
    color:#fff;
    transform: translate(-50%,-50%);
    width:50%;
}

.st1 {
    width: 450px;
    margin: 20px;
    padding-bottom: 10px;
    color:#fff;

.st2 {
    font-size: small;
    color:#fff;
}

.sub {
    width: 450px;
    margin: 20px;
    text-align: center;
}
</style>
</head>
<body>
<form action="<c:url value='login.do' />" method="post" enctype="multipart/form-data">
        <fieldset>
            <div class="st1">登入</div>
            <div class="st1">
                <label for="name1">姓名:</label>
                <input type="text" id="name" autofocus placeholder="王建民" autocomplete="off">
                <div id="check"></div>
                <div class="st2">(1.不可空白，2.至少兩個字以上，3.必須全部為中文字)</div>
            </div>
            <div class="st1">
                <label for="pwd">密碼:</label>
                <input type="password" id="pwd" placeholder="請輸入密碼">
                <div id="check1"></div>
                <div class="st2">1.不可空白，2.至少六個字且必須包含英文字母、數字、特殊符號[!@#$%^*]</div>
            </div>
            <div class="st1">
                <label for="date">日期:</label>
                <input type="text" id="date" placeholder="ex:2000/2/29">
                <div class="st2">格式:西元年/月/日 yyyy/MM//dd</div>
            </div>
            <div class="sub">
                <input type="submit" value="送出">
                <input type="reset" value="清除">
            </div>
        </fieldset>
    </form>
    <script>
        document.querySelector("#name").onblur = checkName;
        function checkName() {
            var chn = /[^\u4e00-\u9fa5]/;
            var theName = document.getElementById("name").value;
            if (theName == "") {
                check.innerHTML = "<img src='images/error.png'>姓名不可為空白";
            } else if (theName.length < 2) {
                check.innerHTML = "<img src='images/error.png'>至少兩個字以上";
            } else if (chn.test(theName)) {
                check.innerHTML = "<img src='images/error.png'>必須全部為中文字";
            } else {
                check.innerHTML = "<img src='images/correct.png'>正確";
            }
        }
        document.querySelector("#pwd").onblur = checkPwd;
        function checkPwd() {
            var en = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,}$/;
            var thePwd = document.getElementById("pwd").value;
            if (thePwd == "") {
                check1.innerHTML = "<img src='images/error.png'>密碼不可為空白";
            } else if (thePwd.length < 6) {
                check1.innerHTML = "<img src='images/error.png'>至少六個字";
            } else if (!en.test(thePwd)) {
                check1.innerHTML = "<img src='images/error.png'>必須包含英文字母、數字、特殊符號[!@#$%^&*]";
            } else {
                check1.innerHTML = "<img src='images/correct.png'>正確";
            }
        }
    </script>
</body>
</html>