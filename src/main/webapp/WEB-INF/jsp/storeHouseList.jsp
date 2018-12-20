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
<title>仓库管理</title>
<!-- 引入css样式文件 -->
<!-- Bootstrap Core CSS -->
<link href="<%=basePath%>resource/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="<%=basePath%>resource/css/erp.css" rel="stylesheet" />
</head>
<body>
	<div id="wrapper">
		<div id="page-wrapper-user">
			<div class="panel panel-default">
				<div class="panel-body">

					<form class="form-inline" method="post"
						action="${pageContext.request.contextPath }/storeHouseList.action">
						<div class="form-group">
							<label for="storeHouseName">仓库名称：</label> <input type="text"
								class="form-control" id="storeHouseName"
								value="${StoreHouseName}" name="storeHouseName" />
						</div>
						<button type="submit" class="btn btn-primary">查询</button>
					</form>

				</div>
			</div>

			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<a href="#" class="btn btn-primary" data-toggle="modal"
								data-target="#newDialog" onclick="clears()">新建</a>
							仓库信息列表
						</div>

						<!-- /.panel-heading -->
						<div class="table-responsive">
							<table class="table table-bordered table-striped table-hover">
								<thead>
									<tr>
										<th>仓库编号</th>
										<th>管理员名称</th>
										<th>仓库名称</th>
										<th>仓库地址</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${page.list}" var="sh">
										<tr>
											<td>${sh.storeHouseId}</td>
											<td>${sh.user.userName}</td>
											<td>${sh.storeHouseName}</td>
											<td>${sh.storeHouseAddress}</td>
											<td><a href="#" class="btn btn-primary btn-xs"
												data-toggle="modal" data-target="#EditDialog"
												onclick="edit(${sh.storeHouseId})">修改</a> <a
												href="#" class="btn btn-danger btn-xs"
												onclick="deleteStoreHouse(${sh.storeHouseId})">删除</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="col-md-12 text-right">
							<kaneki:page
								url="${pageContext.request.contextPath }/storeHouseList.action" />
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
		</div>
		<!-- 供应商列表查询部分  end-->
	</div>
	<!-- 创建供应商模态框 -->
	<div class="modal fade" id="newDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新建仓库信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="new_form">
						<div class="form-group">
							<label for="userFrom" class="col-sm-2 control-label">管理员</label>
							<div class="col-sm-10">
								<select class="form-control" id="userFrom" name="user.userId">
									<option value="">--请选择--</option>
									<c:forEach items="${USER}" var="user">
										<option value="${user.userId}" >
								    ${user.userName}
								</option>
									</c:forEach>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label for="storeHouse_Name" class="col-sm-2 control-label">
								仓库名称 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="storeHouse_Name"
									placeholder="仓库名称" name="storeHouseName" />
							</div>
						</div>
						<div class="form-group">
							<label for="storeHouse_Address" class="col-sm-2 control-label">仓库地址</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="storeHouse_Address"
									placeholder="仓库地址" name="storeHouseAddress" />
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="create()">添加仓库</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 修改供应商模态框 -->
	<div class="modal fade" id="EditDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改仓库信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_form">
						<input type="hidden" id="edit_storeHouseId" name="storeHouseId" />
						<div class="form-group">
							<label for="edit_userFrom" class="col-sm-2 control-label">管理员</label>
							<div class="col-sm-10">
								<select class="form-control" id="edit_userFrom" name="user.userId">
									<option value="">--请选择--</option>
									<c:forEach items="${USER}" var="user">
										<option value="${user.userId}" >
								    ${user.userName}
								</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_storeHouseName" class="col-sm-2 control-label">仓库名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_storeHouseName"
									placeholder="仓库名称" name="storeHouseName" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_storeHouseAddress"
								class="col-sm-2 control-label">仓库地址</label>
							<div class="col-sm-10">
								<input type="text" class="form-control"
									id="edit_storeHouseAddress" placeholder="仓库地址"
									name="storeHouseAddress" />
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="update()">保存修改</button>
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
		var message="";
		
		function validateCreate(){
		var flag=true;
			if($("#userFrom").val()==''){
				message="请选择！";
			}else if($("#storeHouse_Name").val()==''){
				message="仓库名称不能为空！";
			}else if($("#storeHouse_Address").val()==''){
				message="仓库地址不能为空！";
			}else{
				flag=false;
			}
			return flag;
		}
		
		function isExistStoreHouse(){
		 var flag = false;
			$.ajax({
			type:"post",
			url:"<%=basePath%>/isExistStoreHouse.action",
			data:{"storeHouseName":$("#storeHouse_Name").val()},
			async: false,
			success : function(data) {
	 					if(data == '1'){
                           flag = true;
                        }
				}
			
			});
			return flag
			}
			
		function isExistStoreHouseByIdAndName(){
		 var flag = false;
			$.ajax({
			type:"post",
			url:"<%=basePath%>/isExistStoreHouseByIdAndName.action",
			data:{"storeHouseId":$("#edit_storeHouseId").val(),"storeHouseName":$("#edit_storeHouseName").val()},
			async: false,
			success : function(data) {
	 					if(data == '1'){
                           flag = true;
                        }
				}
			
			});
			return flag
		}
		
		function validateCreate2(){
		var flag=true;
			if($("#edit_userFrom").val()==''){
				message="请选择！";
			}else if($("#edit_storeHouseName").val()==''){
				message="仓库名称不能为空！";
			}else if($("#edit_storeHouseAddress").val()==''){
				message="仓库地址不能为空！";
			}else{
				flag=false;
			}
			return flag;
		}
		//清空新建供应商窗口中的数据
		function clears() {
			$("#userFrom").val("");
			$("#storeHouse_Name").val("");
			$("#storeHouse_Address").val("");
		}
		// 创建供应商
		function create() {
		if(validateCreate()){
			alert(message);
		}else if(isExistStoreHouse()){
			alert("仓库名称已存在");
		}else{
		$.post("<%=basePath%>/createStoreHouse.action",
				$("#new_form").serialize(), function(data) {
					if (data == "OK") {
						alert("添加仓库成功！");
						window.location.reload();
					} else {
						alert("添加仓库失败！");
						window.location.reload();
					}
				});
			}
		}
		// 通过id获取修改的供应商信息
		function edit(storeHouseId) {
			$.ajax({
				type : "post",
				url : "<%=basePath%>/getStoreHouseById.action",
				data : {
					"storeHouseId" : storeHouseId
				},
				success : function(data) {
					$("#edit_storeHouseId").val(data.storeHouseId);
					$("#edit_userFrom").val(data.user.userId)
					$("#edit_storeHouseName").val(data.storeHouseName)
					$("#edit_storeHouseAddress").val(data.storeHouseAddress)
	
				}
			});
		}
		// 执行修改供应商操作
		function update() {
		if(validateCreate2()){
			alert(message);
		}else if(isExistStoreHouseByIdAndName()){
			alert("仓库名称已存在！");
		}else{
		$.post("<%=basePath%>/updateStoreHouse.action", $("#edit_form").serialize(), function(data) {
				if (data == "OK") {
					alert("仓库信息更新成功！");
					window.location.reload();
				} else {
					alert("仓库信息更新失败！");
					window.location.reload();
				}
			});
		}
			
		}
		// 删除供应商
		function deleteStoreHouse(storeHouseId) {
			if (confirm('确实要删除该仓库吗?')) {
				$.post("<%=basePath%>/deleteStoreHouse.action", {
					"storeHouseId" : storeHouseId
				},
					function(data) {
						if (data == "OK") {
							alert("仓库删除成功！");
							window.location.reload();
						} else {
							alert("删除仓库失败！");
							window.location.reload();
						}
					});
			}
		}
	</script>
</body>
</html>