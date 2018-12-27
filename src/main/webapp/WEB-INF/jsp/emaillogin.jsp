<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>进销存系统登录</title>
<meta name="keywords" content="" />
<meta name="description" content="" />

<link href="<%=basePath%>resource/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>resource/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>resource/fonts/iconic/css/material-design-iconic-font.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>resource/css/util.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>resource/css/main.css">
</head>

<body>

	<div class="limiter">
		<div class="container-login100"
			style="background-image: url('resource/images/bg-01.jpg');">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
				<form class="login100-form validate-form"
					action="${pageContext.request.contextPath }/emaillogin.action"
					method="post">
					<span class="login100-form-title p-b-49">登录</span>
					<div class=" validate-input m-b-1">
						<span class="label-input100">${msg}</span>
					</div>
					<div class="wrap-input100 validate-input m-b-23"
						data-validate="请输入QQ">
						<span class="label-input100">QQ</span> <input class="input100"
							type="text" placeholder="请输入QQ" name="QQ" id="QQ"
							autocomplete="off"> <span class="focus-input100"
							data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="请输入验证码">
						<span class="label-input100">验证码</span> <input class="input100"
							type="text"  name="code" placeholder="请输入验证码"> <span
							class="focus-input100" data-symbol="&#xf190;"></span> <input
							class="input100" id="btn" type="button" value="获取验证码"
							style="float: left; width: 330px; padding-left: 60px;">
					</div>

					<div class="text-right p-t-8 p-b-31">
						<a href="<%=basePath%>login.action">密码登录</a>
					</div>

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn">登 录</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script
		src="${pageContext.request.contextPath}/resource/js/jquery-1.9.1.min.js"
		type="text/javascript"></script>
	<script src="<%=basePath%>resource/js/main.js"></script>
	<script type="text/javascript">
	 var wait=60;
		
		function getCode(){
			var qq = /^[1-9][0-9]{4,10}$/; 
			var email=$("#QQ").val()+"@qq.com";
			 if(!qq.test($("#QQ").val())){
				 alert("请输入正确QQ！");
		        }else{
		        	alert("请稍等！");
		        	$.post("${pageContext.request.contextPath}/getCode.action",{"email":email},function(data){
		       			if(data=="OK"){
		       				alert("验证码已发送到您的QQ邮箱！");
		       			}else{
		       				alert("获取验证码失败，请稍后再试！");
		       			}
		       		});
		        }
		}
		document.getElementById("btn").onclick=function(){getCode();}
	</script>
</body>

</html>