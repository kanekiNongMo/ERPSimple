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
<title>库存信息</title>
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
						action="${pageContext.request.contextPath }/storeList.action">
						<div class="form-group">
							<label for="comFrom">商品名称</label> <select class="form-control"
								id="comFrom" name="commodity.commodityId">
								<option value="">--请选择--</option>
								<c:forEach items="${COMDI}" var="comdity">
									<option value="${comdity.commodityId}"
										<c:if test="${comdity.commodityId == CID}">selected</c:if>>
										${comdity.commodityName}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="houseFrom">仓库名称</label> <select class="form-control"
								id="comFrom" name="storeHouse.storeHouseId">
								<option value="">--请选择--</option>
								<c:forEach items="${HOUSES}" var="house">
									<option value="${house.storeHouseId}"
										<c:if test="${house.storeHouseId == SHNID}">selected</c:if>>
										${house.storeHouseName}</option>
								</c:forEach>
							</select>
						</div>
						<button type="submit" class="btn btn-primary">查询</button>
					</form>

				</div>
			</div>

			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<!-- <a href="#" class="btn btn-primary" data-toggle="modal"
								data-target="#newDialog" onclick="clears()">新建</a>  -->仓库信息列表
						</div>

						<!-- /.panel-heading -->
						<div class="table-responsive">
							<table class="table table-bordered table-striped table-hover">
								<thead>
									<tr>
										<th>库存编号</th>
										<th>商品编号</th>
										<th>商品名称</th>
										<th>仓库名称</th>
										<th>库存数量</th>
										<!-- <th>操作</th> -->
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${page.list}" var="store">
										<tr>
											<th>${store.storeId}</th>
											<th>${store.commodity.commodityId}</th>
											<th>${store.commodity.commodityName}</th>
											<th>${store.storeHouse.storeHouseName}</th>
											<th>${store.inventoryQuantity}</th>
											<%-- <td><a href="#" class="btn btn-primary btn-xs"
												data-toggle="modal" data-target="#EditDialog"
												onclick="edit(${store.storeId})">修改</a> <a href="#"
												class="btn btn-danger btn-xs"
												onclick="deleteCommodity(${store.storeId})">删除</a></td> --%>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="col-md-12 text-right">
							<kaneki:page
								url="${pageContext.request.contextPath }/storeList.action" />
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
		</div>
	</div>
	<%-- <div class="modal fade" id="newDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新建商品信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="new_form">
						<div class="form-group">
							<label for="new_comFrom" class="col-sm-2 control-label">商品类型</label>
							<div class="col-sm-10">
								<select class="form-control" id="new_comFrom"
									name="comType.comTypeId">
									<option value="">--请选择商品类型--</option>
									<c:forEach items="${COMTYPE}" var="comType">
										<option value="${comType.comTypeId}">
											${comType.comTypeName}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="commodity_Name" class="col-sm-2 control-label">
								商品名称 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="commodity_Name"
									placeholder="商品名称" name="commodityName" />
							</div>
						</div>
						<div class="form-group">
							<label for="placeProduction" class="col-sm-2 control-label">产地</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="placeProduction"
									placeholder="产地" name="placeProduction" />
							</div>
						</div>
						<div class="form-group">
							<label for="manufacturer" class="col-sm-2 control-label">生产厂家</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="manufacturer"
									placeholder="生产厂家" name="manufacturer" />
							</div>
						</div>
						<div class="form-group">
							<label for="purchasePrice" class="col-sm-2 control-label">进货价(元)</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="purchasePrice"
									placeholder="进货价(元)" name="purchasePrice" />
							</div>
						</div>
						<div class="form-group">
							<label for="sellingPrice" class="col-sm-2 control-label">售价(元)</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="sellingPrice"
									placeholder="售价(元)" name="sellingPrice" />
							</div>
						</div>
						<div class="form-group">
							<label for="volume" class="col-sm-2 control-label">体积(m³)</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="volume"
									placeholder="体积(m³)" name="volume" />
							</div>
						</div>
						<div class="form-group">
							<label for="minQuantity" class="col-sm-2 control-label">最小库存(件)</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="minQuantity"
									onkeyup="value=value.replace(/[^\d]/g,'')"
									placeholder="最小库存(件)" name="minQuantity" />
							</div>
						</div>
						<div class="form-group">
							<label for="maxQuantity" class="col-sm-2 control-label">最大库存(件)</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="maxQuantity"
									onkeyup="value=value.replace(/[^\d]/g,'')"
									placeholder="最大库存(件)" name="maxQuantity" />
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="create()">添加仓库</button>
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
						<input type="hidden" id="edit_commodityId" name="commodityId" />
						<div class="form-group">
							<label for="edit_comFrom" class="col-sm-2 control-label">商品类型</label>
							<div class="col-sm-10">
								<select class="form-control" id="edit_comFrom"
									name="comType.comTypeId">
									<option value="">--请选择商品类型--</option>
									<c:forEach items="${COMTYPE}" var="comType">
										<option value="${comType.comTypeId}">
											${comType.comTypeName}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_commodityName" class="col-sm-2 control-label">
								商品名称 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_commodityName"
									placeholder="商品名称" name="commodityName" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_placeProduction" class="col-sm-2 control-label">产地</label>
							<div class="col-sm-10">
								<input type="text" class="form-control"
									id="edit_placeProduction" placeholder="产地"
									name="placeProduction" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_manufacturer" class="col-sm-2 control-label">生产厂家</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_manufacturer"
									placeholder="生产厂家" name="manufacturer" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_purchasePrice" class="col-sm-2 control-label">进货价(元)</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_purchasePrice"
									placeholder="进货价(元)" name="purchasePrice" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_sellingPrice" class="col-sm-2 control-label">售价(元)</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_sellingPrice"
									placeholder="售价(元)" name="sellingPrice" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_volume" class="col-sm-2 control-label">体积(m³)</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_volume"
									placeholder="体积(m³)" name="volume" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_minQuantity" class="col-sm-2 control-label">最小库存(件)</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_minQuantity"
									onkeyup="value=value.replace(/[^\d]/g,'')"
									placeholder="最小库存(件)" name="minQuantity" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_maxQuantity" class="col-sm-2 control-label">最大库存(件)</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_maxQuantity"
									onkeyup="value=value.replace(/[^\d]/g,'')"
									placeholder="最大库存(件)" name="maxQuantity" />
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="update()">保存修改</button>
				</div>
			</div>
		</div>
	</div> --%>
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
		var message = "";

	
		function isExistCommodityByName() {
			var flag = false;
			$.ajax({
				type : "post",
				url : "<%=basePath%>/isExistCommodityByName.action",
				data : {
					"commodityName" : $("#commodity_Name").val()
				},
				async : false,
				success : function(data) {
					if (data == '1') {
						flag = true;
					}
				}
			});
			return flag
		}
	
		function isExistStoreHouseByIdAndName() {
			var flag = false;
			$.ajax({
				type : "post",
				url : "<%=basePath%>/isExistCommodityByIdAndName.action",
				data : {
					"commodityId" : $("#edit_commodityId").val(),
					"commodityName" : $("#edit_commodityName").val()
				},
				async : false,
				success : function(data) {
					if (data == '1') {
						flag = true;
					}
				}
			});
			return flag
		}
	
		
		//清空新建商品窗口中的数据
		function clears() {
			$("#new_comFrom").val("");
			$("#commodity_Name").val("");
			$("#placeProduction").val("");
			$("#manufacturer").val("");
			$("#purchasePrice").val("");
			$("#sellingPrice").val("");
			$("#volume").val("");
			$("#minQuantity").val("");
			$("#maxQuantity").val("");
		}
		// 创建商品
		function create() {
				$.post("<%=basePath%>/createCommodity.action",
					$("#new_form").serialize(), function(data) {
						if (data == "OK") {
							alert("添加商品成功！");
							window.location.reload();
						} else {
							alert("添加商品失败！");
							window.location.reload();
						}
					});
		}
		// 通过id获取修改的商品信息
		function edit(commodityId) {
			$.ajax({
				type : "post",
				url : "<%=basePath%>/getCommodityById.action",
				data : {
					"commodityId" : commodityId
				},
				success : function(data) {
					$("#edit_commodityId").val(data.commodityId);
					$("#edit_comFrom").val(data.comType.comTypeId);
					$("#edit_commodityName").val(data.commodityName);
					$("#edit_manufacturer").val(data.manufacturer);
					$("#edit_purchasePrice").val(data.purchasePrice);
					$("#edit_sellingPrice").val(data.sellingPrice);
					$("#edit_volume").val(data.volume);
					$("#edit_minQuantity").val(data.minQuantity);
					$("#edit_maxQuantity").val(data.maxQuantity);
				}
			});
		}
		// 执行修改供应商操作
		function update() {
				$.post("<%=basePath%>/updateCommodity.action", $("#edit_form").serialize(), function(data) {
					if (data == "OK") {
						alert("商品信息更新成功！");
						window.location.reload();
					} else {
						alert("商品信息更新失败！");
						window.location.reload();
					}
				});
		}
		// 删除供应商
		function deleteCommodity(commodityId) {
			if (confirm('确实要删除该库存吗?')) {
				$.post("<%=basePath%>/deleteCommodity.action", {
					"commodityId" : commodityId
				},
					function(data) {
						if (data == "OK") {
							alert("商品删除成功！");
							window.location.reload();
						} else {
							alert("删除商品失败！");
							window.location.reload();
						}
					});
			}
		}
	</script>
</body>
</html>