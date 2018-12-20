<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
  <head>
     <title>系统登录</title>
     <meta name="viewport" content="width=device-width, initial-scale=1">
     
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resource/css/login.css">
    <script src="${pageContext.request.contextPath}/resource/js/jquery-1.11.3.min.js"></script>
    <script>
   /*  $(function(){
    	if(window.history&&window.history.pushState){
    		$(window).on('popstate',function(){
    			window.history.pushState('forward',null,'#');
    		});
    	}
    	window.history.pushState('forward',null,'#');
    	window.history.forward(1); 
    }) */
    
  //  javascript:window.history.forward(1); 
// 判断是登录账号和密码是否为空
function check(){
    var usercode = $("#userPhone").val();
    var password = $("#userPassword").val();
    if(usercode=="" || password==""){
    	$("#message").text("账号或密码不能为空！");
        return false;
    }
    $("#message").text("");
    return true;
}

</script>
</head>
<body >
    <div class="form">
        <form name="" action="${pageContext.request.contextPath }/login.action" method="post" onsubmit="return check()">
            <span class="form_title">系统登录</span><br>
           <span class="point_out" id="message">${msg}</span><br>
           <input type="text" placeholder="请输入手机号" name="userPhone" id="userPhone" ><br>
           <input type="password" placeholder="请输入密码" name="userPassword" id="userPassword"><br>
           <input type="submit" value="登 录" id="login">
        </form>
    </div>
</body>
</html>
