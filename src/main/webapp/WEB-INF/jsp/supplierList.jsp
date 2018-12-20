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
<title>供应商管理</title>
<!-- 引入css样式文件 -->
<!-- Bootstrap Core CSS -->
<link href="<%=basePath%>resource/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="<%=basePath%>resource/css/erp.css"
	rel="stylesheet" />
</head>
<body>
	<div id="wrapper">
		<!-- 供应商列表查询部分  start-->
		<div id="page-wrapper-user">
			<div class="panel panel-default">
				<div class="panel-body">

					<form class="form-inline" method="post"
						action="${pageContext.request.contextPath }/supplierList.action">
						<div class="form-group">
							<label for="supplierName">供应商名称：</label> <input type="text"
								class="form-control" id="supplierName" value="${supplierName}"
								name="supplierName" />
							<label for="supplierName">供应商联系人：</label> <input type="text"
								class="form-control" id="supplierContact" value="${supplierContact}"
								name="supplierContact" />	
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
								data-target="#newSupplierDialog" onclick="clearSupplier()">新建</a>
							供应商信息列表
						</div>

						<!-- /.panel-heading -->
						<div class="table-responsive">
						<table class="table table-bordered table-striped table-hover" >
							<thead>
								<tr>
									<th>供应商编号</th>
									<th>供应商名称</th>
									<th>联系人</th>
									<th>联系电话</th>
									<th>联系地址</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								 <c:forEach items="${page.list}" var="sup"> 
								<tr>
									<td>${sup.supplierId}</td>
									<td>${sup.supplierName}</td>
									<td>${sup.supplierContact}</td>
									<td>${sup.supplierPhone}</td>
									<td>${sup.supplierAddress}</td>
									<td><a href="#" class="btn btn-primary btn-xs"
										data-toggle="modal" data-target="#SupEditDialog"
										onclick="editSupplier(${sup.supplierId})">修改</a> <a href="#"
										class="btn btn-danger btn-xs"
										onclick="deleteSupplier(${sup.supplierId})">删除</a></td>
								</tr>
							 </c:forEach> 
							</tbody>
						</table>
						</div>
						<div class="col-md-12 text-right">
							<kaneki:page
								url="${pageContext.request.contextPath }/supplierList.action" />
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
	<div class="modal fade" id="newSupplierDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新建供应商信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="new_supplier_form">
						<div class="form-group">
							<label for="supplier_Name" class="col-sm-2 control-label">
								名称 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="supplier_Name"
									placeholder="供应商名称" name="supplierName" />
							</div>
						</div>
						<div class="form-group">
							<label for="supplier_Contact" class="col-sm-2 control-label">联系人</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="supplier_Contact"
									placeholder="联系人" name="supplierContact" />
							</div>
						</div>
						<div class="form-group">
							<label for="supplier_Phone" class="col-sm-2 control-label">联系电话</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="supplier_Phone"
									placeholder="联系电话" name="supplierPhone" />
							</div>
						</div>
						<div class="form-group">
							<label for="supplier_Address" class="col-sm-2 control-label">联系地址</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="supplier_Address"
									placeholder="联系地址" name="supplierAddress" />
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="createSupplier()">添加供应商</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 修改供应商模态框 -->
	<div class="modal fade" id="SupEditDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改供应商信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_supplier_form">
						<input type="hidden" id="edit_supplierId" name="supplierId" />
						<div class="form-group">
							<label for="edit_supplierName" class="col-sm-2 control-label">名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_supplierName"
									placeholder="供应商名称" name="supplierName" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_supplierContact" class="col-sm-2 control-label">联系人</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_supplierContact"
									placeholder="联系人" name="supplierContact" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_supplierPhone" class="col-sm-2 control-label">联系电话</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_supplierPhone"
									placeholder="联系电话" name="supplierPhone" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_supplierAddress" class="col-sm-2 control-label">联系地址</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_supplierAddress"
									placeholder="联系地址" name="supplierAddress" />
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="updateSupplier()">保存修改</button>
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
		
		function validateCreateSupplier(){
		var flag=true;
			if($("#supplier_Name").val()==''){
				message="供应商名称不能为空！";
			}else if($("#supplier_Contact").val()==''){
				message="联系人不能为空！";
			}else if($("#supplier_Phone").val()==''){
				message="联系电话不能为空！";
			}else if($("#supplier_Address").val()==''){
				message="联系地址不能为空！";
			}else{
				flag=false;
			}
			return flag;
		}
		
		function validateCreateSupplier2(){
		var flag=true;
			if($("#edit_supplierName").val()==''){
				message="供应商名称不能为空！";
			}else if($("#edit_supplierContact").val()==''){
				message="联系人不能为空！";
			}else if($("#edit_supplierPhone").val()==''){
				message="联系电话不能为空！";
			}else if($("#edit_supplierAddress").val()==''){
				message="联系地址不能为空！";
			}else{
				flag=false;
			}
			return flag;
		}
		//清空新建供应商窗口中的数据
		function clearSupplier() {
			$("#supplier_Name").val("");
			$("#supplier_Contact").val("")
			$("#supplier_Phone").val("")
			$("#supplier_Address").val("")
		}
		// 创建供应商
		function createSupplier() {
		if(validateCreateSupplier()){
			alert(message);
		}else{
		$.post("<%=basePath%>/createSupplier.action",
				$("#new_supplier_form").serialize(), function(data) {
					if (data == "OK") {
						alert("添加供应商成功！");
						window.location.reload();
					} else {
						alert("添加供应商失败！");
						window.location.reload();
					}
				});
			}
		}
		// 通过id获取修改的供应商信息
		function editSupplier(supplierId) {
			$.ajax({
				type : "post",
				url : "<%=basePath%>/getSupplierById.action",
				data : {
					"supplierId" : supplierId
				},
				success : function(data) {
					$("#edit_supplierId").val(data.supplierId);
					$("#edit_supplierName").val(data.supplierName);
					$("#edit_supplierContact").val(data.supplierContact)
					$("#edit_supplierPhone").val(data.supplierPhone)
					$("#edit_supplierAddress").val(data.supplierAddress)
	
				}
			});
		}
		// 执行修改供应商操作
		function updateSupplier() {
		if(validateCreateSupplier2()){
		alert(message);
		}else{
		$.post("<%=basePath%>/updateSupplier.action", $("#edit_supplier_form").serialize(), function(data) {
				if (data == "OK") {
					alert("供应商信息更新成功！");
					window.location.reload();
				} else {
					alert("供应商信息更新失败！");
					window.location.reload();
				}
			});
		}
			
		}
		// 删除供应商
		function deleteSupplier(supplierId) {
			if (confirm('确实要删除该供应商吗?')) {
				$.post("<%=basePath%>/deleteSupplier.action", {
					"supplierId" : supplierId
				},
					function(data) {
						if (data == "OK") {
							alert("供应商删除成功！");
							window.location.reload();
						} else {
							alert("删除供应商失败！");
							window.location.reload();
						}
					});
			}
		}
	</script>
</body>
</html>