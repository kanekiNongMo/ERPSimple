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
<title>角色管理</title>
<!-- 引入css样式文件 -->
<!-- Bootstrap Core CSS -->
<link href="<%=basePath%>resource/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="<%=basePath%>resource/css/erp.css"
	rel="stylesheet" />
</head>
<body>
	<div id="wrapper">
		<!-- 角色列表查询部分  start-->
		<div id="page-wrapper-user">
		<%-- 	<div class="panel panel-default">
				<div class="panel-body">

					<form class="form-inline" method="post"
						action="${pageContext.request.contextPath }/roleList.action">
						<div class="form-group">
							<label for="roleName">角色名称</label> <input type="text"
								class="form-control" id="roleName" value="${roleName}"
								name="roleName" />
						</div>
						<button type="submit" class="btn btn-primary">查询</button>
					</form>

				</div>
			</div> --%>

			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<a href="#" class="btn btn-primary" data-toggle="modal"
								data-target="#newRoleDialog" onclick="clearRole()">新建</a>
							角色信息列表
							<a href="#" class="btn btn-primary" style="float: right; margin-right: 34%; " onclick="showDelete()">高级设置</a>
						</div>

						<!-- /.panel-heading -->
						<div class="table-responsive">
						<table class="table table-bordered table-striped table-hover">
							<thead>
								<tr>
									<th>角色编号</th>
									<th>角色名称</th>
									<th>角色代码</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								 <c:forEach items="${ROLE}" var="role"> 
								<tr>
									<td>${role.roleId}</td>
									<td>${role.roleName}</td>
									<td>${role.roleCode}</td>
									<td><a href="#" class="btn btn-primary btn-xs"
										data-toggle="modal" data-target="#RoleEditDialog"
										onclick="editRole(${role.roleId})">修改</a> 
										
										<a href="<%=basePath%>getResByRoleId.action?roleId=${role.roleId}&roleName=${role.roleName}"
										class="btn btn-primary btn-xs"  
										>设置权限</a>
										
										
										<a href="<%=basePath%>getUserByRoleId.action?roleId=${role.roleId}&roleName=${role.roleName}"
										class="btn btn-primary btn-xs"  
										>用户角色</a>
										<%-- <a href="#"
										class="btn btn-primary btn-xs"  
										data-toggle="modal" data-target="#newRoleRes"
										onclick="setRes(${role.roleId})"
										>设置权限</a> --%>
										
										<a href="#"
										class="btn btn-danger btn-xs deleteRole"
										onclick="deleteRole(${role.roleId})"  style="display: none;" >删除</a>
										
										
										
										</td>
								</tr>
							 </c:forEach> 
							</tbody>
						</table>
						</div>
						<div class="col-md-12 text-right">
							<kaneki:page
								url="${pageContext.request.contextPath }/roleList.action" />
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
		</div>
		<!-- 角色列表查询部分  end-->
	</div>
	
<%-- 	<div class="modal fade" id="newRoleRes" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">权限设置</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="set_res_form">
						<div class="checkbox">
						<c:forEach items="${RES}" var="res">
							<label class="checkbox-inline">
								<input type="checkbox" name="res" value="${res.resId}" class="${res.resId}">${res.resName}
							</label>
						</c:forEach>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="noCheckedValue()">保存</button>
				</div>
			</div>
		</div>
	</div> --%>
	<!-- 创建角色模态框 -->
	<div class="modal fade" id="newRoleDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新建角色信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="new_role_form">
						<div class="form-group">
							<label for="role_Name" class="col-sm-2 control-label">
								角色名称 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="role_Name"
									placeholder="角色名称" name="roleName" onkeyup="this.value=this.value.replace(/\s+/g,'');"/>
							</div>
						</div>
						<div class="form-group">
							<label for="role_Code" class="col-sm-2 control-label">角色代码</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="role_Code"
									placeholder="角色代码" name="roleCode" />
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="createRole()">添加角色</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 修改角色模态框 -->
	<div class="modal fade" id="RoleEditDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改角色信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_role_form">
						<input type="hidden" id="edit_roleId" name="roleId" />
						<div class="form-group">
							<label for="edit_roleName" class="col-sm-2 control-label">角色名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_roleName" onkeyup="this.value=this.value.replace(/\s+/g,'');"
									placeholder="角色名称" name="roleName" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_roleCode" class="col-sm-2 control-label">角色代码</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_roleCode"
									placeholder="角色代码" name="roleCode" />
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="updateRole()">保存修改</button>
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
	<!-- 编写js代码 -->
	<script type="text/javascript">
	function showDelete(){
		if($(".deleteRole").css("display")=="none"){
			$(".deleteRole").show();
		}else{
			$(".deleteRole").hide();
		}
	}
	
	<%-- function setRes(roleId){
	
	$.ajax({
				type:"post",
				url:"<%=basePath%>/getResByRoleId.action",
				data:{"roleId":roleId},
				async:false,
				success:function(data){
					$.each(data,function(i,item){
							
					});
				}
			});
	
	} --%>
	
	
	
		function clearRole() {
			$("#role_Name").val("");
			$("#role_Code").val("")
		}
		function createRole() {
			if($("#role_Name").val()==''){
				alert("角色名称不能为空！");
			}else if($("#role_Code").val()==''){
				alert("角色代号不能为空！");
			}else if(isExistByRoleName()){
				alert("角色已存在");
			}else {
			$.post("<%=basePath%>/createRole.action",
				$("#new_role_form").serialize(), function(data) {
					if (data == "OK") {
						alert("添加角色成功！");
						window.location.reload();
					} else {
						alert("添加角色失败！");
						window.location.reload();
					}
				});
			}
		}
		
		function isExistByRoleName(){
		var flag=false;
			$.ajax({
				type:"post",
				url:"<%=basePath%>/isExistByRoleName.action",
				data:{"roleName":$("#role_Name").val()},
				async:false,
				success:function(data){
					if(data=='1'){
						flag=true;
					}
				}
			});
		return flag;
		}
		
		
		
		
		function editRole(roleId) {
			
			$.ajax({
				type : "post",
				url : "<%=basePath%>/getRoleById.action",
				data : {
					"roleId" : roleId
				},
				success : function(data) {
					$("#edit_roleId").val(data.roleId);
					$("#edit_roleName").val(data.roleName);
					$("#edit_roleCode").val(data.roleCode)
	
				}
			});
	}
		function isExistRole(){
		var flag=false;
			$.ajax({
				type:"post",
				url:"<%=basePath%>/isExistRole.action",
				data:{"roleId":$("#edit_roleId").val(),"roleName":$("#edit_roleName").val()},
				async:false,
				success:function(data){
					if(data=='1'){
						flag=true;
					}
				}
			});
		return flag;
		}
		
		function updateRole() {
		if($("#edit_roleName").val()==''){
				alert("角色名称不能为空！");
			}else if($("#edit_roleCode").val()==''){
				alert("角色代号不能为空！");
			}else if(isExistRole()){
				alert("角色已存在！");
			}else{
			$.post("<%=basePath%>/updateRole.action", $("#edit_role_form").serialize(), function(data) {
				if (data == "OK") {
					alert("角色信息更新成功！");
					window.location.reload();
				} else {
					alert("角色信息更新失败！");
					window.location.reload();
				}
			});
			}
		}
		function deleteRole(roleId) {
			if (confirm('确实要删除该角色吗?')) {
				$.post("<%=basePath%>/deleteRole.action", {
					"roleId" : roleId
				},
					function(data) {
						if (data == "OK") {
							alert("角色删除成功！");
							window.location.reload();
						} else {
							alert("删除角色失败！");
							window.location.reload();
						}
					});
			}
		}
	</script>
</body>
</html>