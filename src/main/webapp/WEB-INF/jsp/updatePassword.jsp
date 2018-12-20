<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>修改密码</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="<%=basePath%>resource/css/bootstrap.min.css"
	rel="stylesheet" />
<script src="<%=basePath%>resource/js/jquery-1.11.3.min.js"></script>
<script src="<%=basePath%>resource/js/bootstrap.min.js"></script>
<script src="<%=basePath%>resource/js/laydate.js"></script>
</head>

<body>
	<div id="wrapper" style=" width: 100%; height: 94%; padding-top: 8%">
		<div class="panel panel-default" style="border: 0px;">
			<div class="panel-body">
				<form class="form-horizontal" id="userInfo">
					<input type="hidden" id="user_Id" name="userId" value="${USERID}" />
					<div class="form-group">
						<label class="col-sm-2 control-label">原密码</label>
						<div class="col-sm-3">
							<input type="password" class="form-control" id="user_password"
								placeholder="原密码" name="userPassword"
								onkeyup="this.value=this.value.replace(/\s+/g,'');" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">新密码</label>
						<div class="col-sm-3">
							<input type="password" class="form-control" id="new_password_one"
								placeholder="新密码" name="userPassword"
								onkeyup="this.value=this.value.replace(/\s+/g,'');" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">确认密码</label>
						<div class="col-sm-3">
							<input type="password" class="form-control" id="new_password_two"
								placeholder="确认密码" name="userPassword"
								onkeyup="this.value=this.value.replace(/\s+/g,'');" />
						</div>
					</div>

					<div style="margin-left: 36%">
						<button type="button" class="btn btn-primary" data-dismiss="modal"
							onclick="editPassword()">修改</button>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
	function editPassword() {
		if($("#user_password").val()==''||$("#new_password_one").val()==''||$("#new_password_two").val()==''){
			alert("密码不能为空!")
		}else if ($("#new_password_one").val() != $("#new_password_two").val()) {
			alert("两次密码不一样！");
		} else if (!isOldPassword()) {
			alert("原密码错误!");
		} else {
			$.ajax({
				type : "post",
				async : false,
				url : "<%=basePath%>/updateUser.action",
				data : {
					"userId" : $("#user_Id").val(),
					"userPassword" : $("#new_password_two").val()
				},
				success : function(data) {
					if (data == "OK") {
						alert("修改密码成功！");
						window.location.reload();
					} else {
						alert("修改密码失败！");
						window.location.reload();
					}
				}
			});
		}
	}
	function isOldPassword() {
		var flag = false;
		$.ajax({
			type : "post",
			async : false,
			url : "<%=basePath%>/isOldPassword.action",
			data : {
				"userId" : $("#user_Id").val(),
				"userPassword" : $("#user_password").val()
			},
			success : function(data) {
				if (data == '1') {
					flag = true;
				}
			}
		});
		return flag;
	}
</script>
</html>

