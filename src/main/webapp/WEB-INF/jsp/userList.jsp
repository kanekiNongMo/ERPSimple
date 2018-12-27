<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="kaneki" uri="http://kaneki.com/common/"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>进销存系统管理</title>
<!-- 引入css样式文件 -->
<!-- Bootstrap Core CSS -->
<link href="<%=basePath%>resource/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="<%=basePath%>resource/css/erp.css" rel="stylesheet" />
</head>
<body>
	<div id="wrapper">
		<!-- 用户列表查询部分  start-->
		<div id="page-wrapper-user">
			<div class="panel panel-default">
				<div class="panel-body">

					<form class="form-inline" method="post"
						action="${pageContext.request.contextPath }/userList.action">
						<div class="form-group">
							<label for="userName">用户名称</label> <input type="text"
								class="form-control" id="userName" value="${userName}"
								name="userName" />
						</div>
						<button type="submit" class="btn btn-primary">查询</button>
					</form>

				</div>
			</div>

			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<a href="#" class="btn btn-primary" id="del">删除</a> 用户信息列表
							<a href="#" class="btn btn-primary" data-toggle="modal"
								style="float: right; margin-right: 10%;"
								data-target="#newUserDialog" onclick="clearUser()">新建</a>
						</div>

						<!-- /.panel-heading -->
						<div class="table-responsive">
							<table class="table table-bordered table-striped table-hover">
								<thead>
									<tr>
										<th><input type="checkbox" id="all"/></th>
										<th>编号</th>
										<th>用户名称</th>
										<th>性别</th>
										<th>年龄</th>
										<th>住址</th>
										<th>手机</th>
										<th>QQ</th>
										<th>部門名称</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${page.list}" var="user">
										<tr>
											<th><input type="checkbox" name='id'
												value="${user.userId}" /></th>
											<td>${user.userId}</td>
											<td>${user.userName}</td>
											<td>${user.userSex}</td>
											<td>${user.age}</td>
											<td>${user.userAddress}</td>
											<td>${user.userPhone}</td>
											<td>${user.QQ}</td>
											<th>${user.dept.deptName}</th>
											<td><a href="#" class="btn btn-primary btn-xs"
												data-toggle="modal" data-target="#UserEditDialog"
												onclick="editUser(${user.userId})">修改</a> <a href="#"
												class="btn btn-danger btn-xs"
												onclick="deleteUser(${user.userId})">注销</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="col-md-12 text-right">
							<kaneki:page
								url="${pageContext.request.contextPath }/userList.action" />
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
		</div>
		<!-- 用户列表查询部分  end-->
	</div>
	<!-- 创建用户模态框 -->
	<div class="modal fade" id="newUserDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新建用户信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="new_user_form">
						<div class="form-group">
							<label for="user_Name" class="col-sm-2 control-label">
								用户名称 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="user_Name"
									placeholder="用户名称" name="userName"
									onkeyup="this.value=this.value.replace(/\s+/g,'');" />
							</div>
						</div>
						<div class="form-group">
							<label for="user_Password" class="col-sm-2 control-label">用户密码</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="user_Password"
									placeholder="用户密码" name="userPassword"
									onkeyup="this.value=this.value.replace(/\s+/g,'');" />
							</div>
						</div>
						<div class="form-group">
							<label for="user_Sex" class="col-sm-2 control-label">性别</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="user_Sex"
									placeholder="性别" name="userSex" />
							</div>
						</div>
						<div class="form-group">
							<label for="user_Birthday" class="col-sm-2 control-label">出生年月</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="user_Birthday"
									placeholder="出生年月" name="userBirthday" />
							</div>
						</div>
						<div class="form-group">
							<label for="user_Address" class="col-sm-2 control-label">联系地址</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="user_Address"
									onkeyup="this.value=this.value.replace(/\s+/g,'');"
									placeholder="联系地址" name="userAddress" />
							</div>
						</div>
						<div class="form-group">
							<label for="user_Phone" class="col-sm-2 control-label">电话</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="user_Phone"
									placeholder="电话" name="userPhone" />
							</div>
						</div>

						<div class="form-group">
							<label for="customerFrom" class="col-sm-2 control-label">所属部门</label>
							<div class="col-sm-10">
								<select class="form-control" id="deptFrom" name="dept.deptId">
									<option value="">--请选择--</option>
									<c:forEach items="${DEPTS}" var="dept">
										<option value="${dept.deptId}">${dept.deptName}</option>
									</c:forEach>
								</select>
							</div>
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick=createUser()>创建用户</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 修改用户模态框 -->
	<div class="modal fade" id="UserEditDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改用户信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_user_form">
						<input type="hidden" id="edit_userId" name="userId" />
						<div class="form-group">
							<label for="edit_userName" class="col-sm-2 control-label">用户名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_userName"
									onkeyup="this.value=this.value.replace(/\s+/g,'');"
									placeholder="用户名称" name="userName" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_userSex" class="col-sm-2 control-label">性别</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_userSex"
									placeholder="性别" name="userSex" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_userBirthday" class="col-sm-2 control-label">出生年月</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_userBirthday"
									placeholder="出生年月" name="userBirthday" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_userAddress" class="col-sm-2 control-label">联系地址</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_userAddress"
									onkeyup="this.value=this.value.replace(/\s+/g,'');"
									placeholder="联系地址" name="userAddress" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_userPhone" class="col-sm-2 control-label">电话</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_userPhone"
									placeholder="电话" name="userPhone" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_deptFrom" class="col-sm-2 control-label">所属部门</label>
							<div class="col-sm-10">
								<select class="form-control" id="edit_deptFrom"
									name="dept.deptId">
									<option value="">--请选择--</option>
									<c:forEach items="${DEPTS}" var="dept">
										<option value="${dept.deptId}">${dept.deptName}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="updateUser()">保存修改</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 引入js文件 -->
	<!-- jQuery -->
	<script src="<%=basePath%>resource/js/jquery-1.11.3.min.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="<%=basePath%>resource/js/bootstrap.min.js"></script>
	<!-- Metis Menu Plugin JavaScript -->
	<script src="<%=basePath%>resource/js/metisMenu.min.js"></script>
	<!-- DataTables JavaScript -->
	<script src="<%=basePath%>resource/js/jquery.dataTables.min.js"></script>
	<script src="<%=basePath%>resource/js/dataTables.bootstrap.min.js"></script>
	<script src="<%=basePath%>resource/js/laydate.js"></script>
	<!-- 编写js代码 -->
	<script type="text/javascript">
		
		/* var data=[];
		for(var i = 0; i < 8; i++){
			var id = $('td:nth-child(1)').eq(i).html();
			var pid = $('td:nth-child(2)').eq(i).html();
			var url = $('td:nth-child(3)').eq(i).html();
			var icon = $('td:nth-child(4)').eq(i).html();
			var name = $('td:nth-child(5)').eq(i).html();
			data.push({
				id:id,
				pid:pid,
				url:url,
				icon:icon,
				name:name
			});
		} */
		var  message="";
		//添加日期插件
		laydate.render({
			elem:'#edit_userBirthday'
		 	,theme: '#000000'
		});
		laydate.render({
			elem:'#user_Birthday'
		 	,theme: '#000000'
		});
	
		//清空新建用户窗口中的数据
		function clearUser() {
			$("#user_Name").val("");
			$("#user_Password").val("");
			$("#user_Sex").val("");
			$("#user_Birthday").val("");
			$("#user_Address").val("");
			$("#user_Phone").val("");
		}
		
		// 通过id获取修改的用户信息
		function editUser(userId) {
			$.ajax({
				type : "post",
				url : "<%=basePath%>/getUserById.action",
				data : {
					"userId" : userId
				},
				success : function(data) {
					$("#edit_userId").val(data.userId);
					$("#edit_userName").val(data.userName);
					$("#edit_userSex").val(data.userSex);
					$("#edit_userBirthday").val(data.age);
					$("#edit_userAddress").val(data.userAddress);
					$("#edit_userPhone").val(data.userPhone);
					$("#edit_deptFrom").val(data.dept.deptId);
					
				}
			});
		}
		// 执行修改用户操作
		
		function updateUser() {
		//alert($("#edit_user_form").serialize());
			if(!vailPhone2()){
				alert(message);
			}else{
				$.post("<%=basePath%>/updateUser.action", $("#edit_user_form").serialize(), function(data) {
					if (data == "OK") {
						alert("用户信息更新成功！");
						window.location.reload();
					} else {
						alert("用户信息更新失败！");
						window.location.reload();
					}
				});
			}
		}
		
		function vailPhone2(){
            var phone = $("#edit_userPhone").val();
            var flag = false;
         	
            var myreg = /^(((13[0-9]{1})|(14[0-9]{1})|(17[0]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-9]{1}))+\d{8})$/;   
            if($("#edit_userName").val()==''){
            	message = "用户名不能为空！";
            }else if($("#edit_userSex").val() == ''){
                message = "性别不能为空！";
            }else if(!($("#edit_userSex").val() == "男"||$("#edit_userSex").val() == "女")){
                message = "性别不正确！";
            }else if($("#edit_userBirthday").val() == ''){
                message = "出生年月不能为空！";
            }else if($("#edit_userAddress").val() == ''){
                message = "地址不能为空！";
            }else if(phone == ''){
                message = "手机号码不能为空！";
            }else if(phone.length !=11){
                message = "请输入有效的手机号码！";
            }else if(!myreg.test(phone)){
                message = "请输入有效的手机号码！";
            }else if(!checkPhoneIsExist2()){
                message = "该手机号码已经被绑定！";
            } else{
                    flag = true;
            }
            return flag;
         }
		
		function checkPhoneIsExist2(){
			var userId=$("#edit_userId").val();
            var userPhone = $("#edit_userPhone").val();
            var flag2 = false;
            jQuery.ajax(
               { url: "<%=basePath%>/exceptOneselfPhone.action",
                   data:{"userId":userId,"userPhone":userPhone},
                        type:"post",
                        async: false,
                        success:function(data) {
                        if(data == '1'){
                            flag2 = true;
                        }
                    }
           });
           return flag2;
        } 
		
		
		
		
		
		
		// 删除用户
		function deleteUser(userId) {
			if (confirm('确实要注销该用户吗?')) {
				$.post("<%=basePath%>/deleteUser.action", {
					"userId" : userId
				},
					function(data) {
						if (data == "OK") {
							alert("用户注销成功！");
							window.location.reload();
						} else {
							alert("该用户不能注销！");
							window.location.reload();
						}
					});
			}
		}
		
		
		// 创建客户
		
		function createUser() {
			if(!vailPhone()){
				alert(message);
			}else{
				 $.ajax({
					type : "post",
					 async: false,
					url : "<%=basePath%>/createUser.action",
					data : $("#new_user_form").serialize(),
					success : function(data) {
						if (data == "OK") {
							alert("添加用户成功！");
							window.location.reload();
						} else {
							alert("添加用户失败！");
							window.location.reload();
						}
					}
				}); 
			}
		}
		
		
		//验证手机号
        function vailPhone(){
            var phone = $("#user_Phone").val();
            var flag = false;
            var myreg = /^(((13[0-9]{1})|(14[0-9]{1})|(17[0]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-9]{1}))+\d{8})$/;   
            if($("#user_Name").val()==''){
            	message = "用户名不能为空！";
            }else if($("#user_Password").val() == ''){
                message = "密码不能为空！";
            }else if($("#user_Sex").val() == ''){
                message = "性别不能为空！";
            }else if(!($("#user_Sex").val() == "男"||$("#user_Sex").val() == "女")){
                message = "性别不正确！";
            }else if($("#user_Birthday").val() == ''){
                message = "出生年月不能为空！";
            }else if($("#user_Address").val() == ''){
                message = "地址不能为空！";
            }else if(phone == ''){
                message = "手机号码不能为空！";
            }else if(phone.length !=11){
                message = "请输入有效的手机号码！";
            }else if(!myreg.test(phone)){
                message = "请输入有效的手机号码！";
            }else if(checkPhoneIsExist()){
                message = "该手机号码已经被绑定！";
            }else if($("#deptFrom").val()==''){
            	message = "部门不能为空！";
            }
            else{
                    flag = true;
            }
            return flag;
         }
		
      //验证手机号是否存在
         function checkPhoneIsExist(){
            var userPhone = $("#user_Phone").val();
            var flag2 = false;
            jQuery.ajax(
               { url: "<%=basePath%>/existsPhone.action",
                   data:{"userPhone":userPhone},
                        type:"post",
                        async: false,
                        success:function(data) {
                        if(data == '1'){
                            flag2 = true;
                        }
                    }
           });
           return flag2;
        } 
      
       //批量删除
         var oall=document.getElementById("all");
       	var oid=document.getElementsByName("id");
       	oall.onclick=function(){
       		for(var i=0;i<oid.length;i++){
       			oid[i].checked=oall.checked;
       		}	
       	};
       	for(var i=0;i<oid.length;i++){
       		oid[i].onclick=function(){
       			for(var j=0;j<oid.length;j++){
       				if(oid[j].checked==false){
       					oall.checked=false;
       					break;
       				}else{
       					oall.checked=true;
       				}
       			}
       		}
       		
       	}
       	
       	$("#del").click(function(){
       		if (confirm('确实要删除吗?')) {
       		var ids="";
       		var n=0;
       		for(var i=0;i<oid.length;i++){
       			if(oid[i].checked==true){
       				var id=oid[i].value;
       				if(n==0){
       					ids+="ids="+id;
       				}else{
       					ids+="&ids="+id;
       				}
       				n++;
       			}
       		}
       		//alert(ids);
       		if(ids==""){
       			alert("请选择！");
       		}else{
       		$.post("<%=basePath%>/deleteAllUser.action",ids,function(data){
       			if(data=="OK"){
       				alert("删除成功！");
       				window.location.reload();
       			}else{
       				alert("删除失败！");
       				window.location.reload();
       			}
       		});}}
       	});
       
      /* if(!flag){
           //提示错误效果
                $("#phoneDiv").removeClass().addClass("ui-form-item has-error");
                $("#phoneP").html("");
                $("#phoneP").html("<i class=\"icon-error ui-margin-

right10\">&nbsp;<\/i>"+message);
                $("#user_Phone").focus();
            }else{
                       //提示正确效果
                $("#phoneDiv").removeClass().addClass("ui-form-item has-success");
                $("#phoneP").html("");
                $("#phoneP").html("<i class=\"icon-success ui-margin-

right10\">&nbsp;<\/i>该手机号码可用");
            } */

	</script>
</body>
</html>