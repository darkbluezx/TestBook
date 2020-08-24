<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>輸入驗證碼以繼續</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
	margin: 0 0 25px;
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

#ehong-code-input {
	width:42px;
	letter-spacing:2px;
	margin:0px 8px 0px 0px;
}
.ehong-idcode-val {
	position: relative;
	padding: 1px 4px 1px 4px;
	top: 0px;
	*top: -3px;
	letter-spacing: 4px;
	display: inline;
	cursor: pointer;
	font-size: 50px;
	font-family: "Courier New", Courier, monospace;
	text-decoration: none;
	font-weight: bold;
}

.ehong-idcode-val0 {
	border: solid 1px #A4CDED;
	background-color: #ECFAFB;
}

.ehong-idcode-val1 {
	border: solid 1px #A4CDED;
	background-color: #FCEFCF;
}

.ehong-idcode-val2 {
	border: solid 1px #6C9;
	background-color: #D0F0DF;
}

.ehong-idcode-val3 {
	border: solid 1px #6C9;
	background-color: #DCDDD8;
}

.ehong-idcode-val4 {
	border: solid 1px #6C9;
	background-color: #F1DEFF;
}

.ehong-idcode-val5 {
	border: solid 1px #6C9;
	background-color: #ACE1F1;
}

.ehong-code-val-tip {
	font-size: 14px;
	color: #1098EC;
 	top: 0px; 
 	*top: -3px; 
	position: relative;
	margin: 10px 0px 0px 0px;
	cursor: pointer;

</style>
</head>
<body>
<jsp:include page="/fragment/topMVC.jsp" />
<div class="wrapper">
	<div class="login-form">
		<form action="<c:url value='PhoneVerification' />" >
			<h3 class="text-center">輸入驗證碼以繼續</h3>
			<div class="form-group; text-center" style="margin: 0 0 30px">
				<div id="idcode"
					style="background: transparent; display: block; margin: auto"></div>
			</div>

			<div class="form-group has-feedback">
				<div class="input-group">
					<input id="idcode-btn" class="form-control" style="width: 280px" placeholder=" 輸入驗證碼" maxlength="4" type="text">
				</div>
				<span style="color: red; display: none;" class="tips"></span> 
				<span style="display: none;" class="glyphicon glyphicon-remove form-control-feedback"></span> 
				<span style="display: none;" class="glyphicon glyphicon-ok form-control-feedback"></span>
			</div>

			<div class="button-group">
				<a type="submit" class="btn btn-success-sm btn-block login-btn" href="<c:url value='Register' />" role="button">取消</a>
				<button id="submit" type="submit" class="login-btn hover-btn">驗證</button>
			</div>
		</form>
	</div>	</div>
	<script type="text/javascript">
		var settings = {
			e : 'idcode',
			codeType : {
				name : 'follow',
				len : 4
			}, //len是修改验证码长度的
			codeTip : '換一組驗證碼',
			inputID : 'idcode-btn' //验证元素的ID
		};

		var _set = {
			storeLable : 'codeval',
			store : '#ehong-code-input',
			codeval : '#ehong-code'
		}
		$.idcode = {
			getCode : function(option) {
				_commSetting(option);
				return _storeData(_set.storeLable, null);
			},
			setCode : function(option) {
				_commSetting(option);
				_setCodeStyle("#" + settings.e, settings.codeType.name,
						settings.codeType.len);

			},
			validateCode : function(option) {
				_commSetting(option);
				var inputV;
				if (settings.inputID) {
					inputV = $('#' + settings.inputID).val();

				} else {
					inputV = $(_set.store).val();
				}
				if (inputV.toUpperCase() == _storeData(_set.storeLable, null)
						.toUpperCase()) { //修改的不区分大小写
					return true;
				} else {
					_setCodeStyle("#" + settings.e, settings.codeType.name,
							settings.codeType.len);
					return false;
				}
			}
		};

		function _commSetting(option) {
			$.extend(settings, option);
		}

		function _storeData(dataLabel, data) {
			var store = $(_set.codeval).get(0);
			if (data) {
				$.data(store, dataLabel, data);
			} else {
				return $.data(store, dataLabel);
			}
		}

		function _setCodeStyle(eid, codeType, codeLength) {
			var codeObj = _createCode(settings.codeType.name,
					settings.codeType.len);
			var randNum = Math.floor(Math.random() * 6);
			var htmlCode = ''
			if (!settings.inputID) {
				htmlCode = '<span><input id="ehong-code-input" type="text" maxlength="4" /></span>';
			}
			htmlCode += '<div id="ehong-code" class="ehong-idcode-val ehong-idcode-val';
			htmlCode += String(randNum);
			htmlCode += '" href="#" onblur="return false" onfocus="return false" oncontextmenu="return false" >'
					+ _setStyle(codeObj)
					+ '</div>'
					+ '<div id="ehong-code-tip-ck" class="ehong-code-val-tip" onclick="$.idcode.setCode()">'
					+ settings.codeTip + '</div>';
			$(eid).html(htmlCode);
			_storeData(_set.storeLable, codeObj);
		}

		function _setStyle(codeObj) {
			var fnCodeObj = new Array();
			var col = new Array('#BF0C43', '#E69A2A', '#707F02', '#18975F',
					'#BC3087', '#73C841', '#780320', '#90719B', '#1F72D8',
					'#D6A03C', '#6B486E', '#243F5F', '#16BDB5');
			var charIndex;
			for (var i = 0; i < codeObj.length; i++) {
				charIndex = Math.floor(Math.random() * col.length);
				fnCodeObj.push('<font color="' + col[charIndex] + '">'
						+ codeObj.charAt(i) + '</font>');
			}
			return fnCodeObj.join('');
		}

		function _createCode(codeType, codeLength) {
			var codeObj;
			if (codeType == 'follow') {
				codeObj = _createCodeFollow(codeLength);
			} else if (codeType == 'calc') {
				codeObj = _createCodeCalc(codeLength);
			} else {
				codeObj = "";
			}
			return codeObj;
		}

		function _createCodeCalc(codeLength) {
			var code1, code2, codeResult;
			var selectChar = new Array('0', '1', '2', '3', '4', '5', '6', '7',
					'8', '9');
			var charIndex;
			for (var i = 0; i < codeLength; i++) {
				charIndex = Math.floor(Math.random() * selectChar.length);
				code1 += selectChar[charIndex];

				charIndex = Math.floor(Math.random() * selectChar.length);
				code2 += selectChar[charIndex];
			}
			return [ parseInt(code1), parseInt(code2),
					parseInt(code1) + parseInt(code2) ];
		}

		function _createCodeFollow(codeLength) {
			var code = "";
			var selectChar = new Array('0', '1', '2', '3', '4', '5', '6', '7',
					'8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
					'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V',
					'W', 'X', 'Y', 'Z');

			for (var i = 0; i < codeLength; i++) {
				var charIndex = Math.floor(Math.random() * selectChar.length);
				if (charIndex % 2 == 0) {
					code += selectChar[charIndex].toLowerCase();
				} else {
					code += selectChar[charIndex];
				}
			}
			return code;
		}
		var check = [ false ];

		//校验成功函数
		function success(Obj, counter) {
			Obj.parent().parent().removeClass('has-error').addClass(
					'has-success');
			$('.tips').eq(counter).hide();
			$('.glyphicon-ok').eq(counter).show();
			$('.glyphicon-remove').eq(counter).hide();
			check[counter] = true;

		}

		// 校验失败函数
		function fail(Obj, counter, msg) {
			Obj.parent().parent().removeClass('has-success').addClass(
					'has-error');
			$('.glyphicon-remove').eq(counter).show();
			$('.glyphicon-ok').eq(counter).hide();
			$('.tips').eq(counter).text(msg).show();
			check[counter] = false;
		}
		// 验证码
		$.idcode.setCode();

		$('.login-form').find('input').eq(0).change(function() {
			var IsBy = $.idcode.validateCode();
			if (IsBy) {
				success($(this), 0);
			} else {
				fail($(this), 0, '驗證碼輸入錯誤');
			}
		});
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