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
<title>权限管理</title>
<!-- 引入css样式文件 -->
<!-- Bootstrap Core CSS -->
<link href="<%=basePath%>resource/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="<%=basePath%>resource/css/erp.css"
	rel="stylesheet" />
</head>
<body>
	<div id="wrapper">
		<!-- 权限列表查询部分  start-->
		<div id="page-wrapper-user">
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<a href="#" class="btn btn-primary" data-toggle="modal"
								data-target="#newResDialog" onclick="clearRes()">新建</a>
								
							权限信息列表
							<a href="#" class="btn btn-primary" style="float: right; margin-right: 3%; " onclick="showDelete()">高级设置</a>
						</div>

						<!-- /.panel-heading -->
						<div class="table-responsive">
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>权限编号</th>
									<th>权限描述</th>
									<th>URL</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								 <c:forEach items="${page.list}" var="res"> 
								<tr>
									<td>${res.resId}</td>
									<td>${res.resName}</td>
									<td>${res.url}</td>
									<td><a href="#" class="btn btn-primary btn-xs"
										data-toggle="modal" data-target="#SupEditDialog"
										onclick="editRes(${res.resId})">修改</a> <a href="#"
										class="btn btn-danger btn-xs deleteRes"
										onclick="deleteRes(${res.resId})" style="display: none;">删除</a></td>
								</tr>
							 </c:forEach> 
							</tbody>
							
						</table>
						</div>
						
						<div class="col-md-12 text-right">
							<kaneki:page
								url="${pageContext.request.contextPath }/resList.action" />
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
		</div>
		<!-- 权限列表查询部分  end-->
	</div>
	<!-- 创建权限模态框 -->
	<div class="modal fade" id="newResDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">添加权限</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="new_res_form">
						<div class="form-group">
							<label for="resName" class="col-sm-2 control-label">权限描述</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="resName"
									placeholder="权限描述" name="resName" />
							</div>
						</div>
						<div class="form-group">
							<label for="url" class="col-sm-2 control-label">URL</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="url" onkeyup="this.value=this.value.replace(/\s+/g,'');"
									placeholder="URL" name="url" />
							</div>
						</div>
						
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="createRes()">添加权限</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 修改权限模态框 -->
	<div class="modal fade" id="SupEditDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改权限</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_res_form">
						<input type="hidden" id="edit_resId" name="resId" />
						<div class="form-group">
							<label for="edit_resName" class="col-sm-2 control-label">权限描述</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_resName"
									placeholder="权限描述" name="resName" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_url" class="col-sm-2 control-label">URL</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_url" onkeyup="this.value=this.value.replace(/\s+/g,'');"
									placeholder="URL" name="url" />
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="updateRes()">保存修改</button>
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
		if($(".deleteRes").css("display")=="none"){
			$(".deleteRes").show();
		}else{
			$(".deleteRes").hide();
		}
	}
	
		function clearRes() {
			$("#resName").val("");
			$("#url").val("")
		}
		function createRes() {
			if($("#resName").val()==''){
			alert("描述不能为空！");
			}else if($("#url").val()==''){
			alert("URL不能为空！");
			}else if(isCreateResExist()){
			alert("URL已存在！");
			}else{
			$.post("<%=basePath%>/createRes.action",
				$("#new_res_form").serialize(), function(data) {
					if (data == "OK") {
						alert("添加权限成功！");
						window.location.reload();
					} else {
						alert("添加权限失败！");
						window.location.reload();
					}
				});
			}
		}
		
		function isCreateResExist(){
		var flag=false;
		$.ajax({
				type : "post",
				url : "<%=basePath%>/isCreateResExist.action",
				data : {
					"url" : $("#url").val()
				},
				async:false,
				success : function(data) {
					if(data==1){
					flag=true;
					}
				}
			});
		return flag;
		}
		function editRes(resId) {
			$.ajax({
				type : "post",
				url : "<%=basePath%>/getResById.action",
				data : {
					"resId" : resId
				},
				success : function(data) {
					$("#edit_resId").val(data.resId);
					$("#edit_resName").val(data.resName);
					$("#edit_url").val(data.url)
	
				}
			});
		}
		
		function isUpdateResExist(){
		var flag=false;
		$.ajax({
				type : "post",
				url : "<%=basePath%>/isUpdateResExist.action",
				data : {"resId":$("#edit_resId").val(),
					"url" : $("#edit_url").val()
				},
				async:false,
				success : function(data) {
					if(data==1){
					flag=true;
					}
				}
			});
		return flag;
		}
		
		function updateRes() {
		if($("#edit_resName").val()==''){
			alert("描述不能为空！");
			}else if($("#edit_url").val()==''){
			alert("URL不能为空！");
			}else if(isUpdateResExist()){
			alert("URL已存在！");
			}else{
			$.post("<%=basePath%>/updateRes.action", $("#edit_res_form").serialize(), function(data) {
				if (data == "OK") {
					alert("权限更新成功！");
					window.location.reload();
				} else {
					alert("权限更新失败！");
					window.location.reload();
				}
			});
			}
		}
		function deleteRes(resId) {
			if (confirm('确实要删除该权限吗?')) {
				$.post("<%=basePath%>/deleteRes.action", {
					"resId" : resId
				},
					function(data) {
						if (data == "OK") {
							alert("权限删除成功！");
							window.location.reload();
						} else {
							alert("删除权限失败！");
							window.location.reload();
						}
					});
			}
		}
	</script>
</body>
</html>