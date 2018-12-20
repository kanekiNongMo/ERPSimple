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
<title>订单详情信息</title>
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
						action="${pageContext.request.contextPath }/orderDetailsList.action">
						<div class="form-group">
							<label for="commodityName">商品名称</label> <input type="text"
								class="form-control" id="commodityName" value="${CNAME}"
								name="commodity.commodityName" />
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
								data-target="#newDialog" onclick="clears()">新建</a> 订单明细列表
						</div>

						<!-- /.panel-heading -->
						<div class="table-responsive">
							<table class="table table-bordered table-striped table-hover">
								<thead>
									<tr>
										<th>订单明细编号</th>
										<th>商品名称</th>
										<th>订单编号</th>
										<th>单价</th>
										<th>单位</th>
										<th>订单数量</th>
										<th>剩余</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${page.list}" var="orderDetails">
										<tr>
											<th>${orderDetails.orderDetailsId}</th>
											<th>${orderDetails.commodity.commodityName}</th>
											<th>${orderDetails.order.orderId}</th>
											<th>${orderDetails.unitPrice}</th>
											<th>元</th>
											<th>${orderDetails.orderQuantity}</th>
											<th>${orderDetails.surplus}</th>
											<td><a href="#" class="btn btn-primary btn-xs"
												data-toggle="modal" data-target="#EditDialog"
												onclick="edit(${orderDetails.orderDetailsId})">修改</a> <a href="#"
												class="btn btn-danger btn-xs"
												onclick="deleteOrderDetails(${orderDetails.orderDetailsId})">删除</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="col-md-12 text-right">
							<kaneki:page
								url="${pageContext.request.contextPath }/orderDetailsList.action" />
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
		</div>
	</div>
	<div class="modal fade" id="newDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">订单明细</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="new_form">
						<div class="form-group">
							<label for="new_comFrom" class="col-sm-2 control-label">商品名称</label>
							<div class="col-sm-10">
								<select class="form-control" id="new_comFrom"
									name="commodity.commodityId">
									<option value="">--请选择--</option>
									<c:forEach items="${COM}" var="com">
										<option value="${com.commodityId}">
											编号：${com.commodityId}——${com.commodityName}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="new_ofFrom" class="col-sm-2 control-label">订单编号</label>
							<div class="col-sm-10">
								<select class="form-control" id="new_ofFrom" name="order.orderId">
									<option value="">--请选择--</option>
									<c:forEach items="${OF}" var="of">
										<option value="${of.orderId}">
											${of.orderId}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="unitPrice" class="col-sm-2 control-label">
								单价</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="unitPrice"
									placeholder="单价" name="unitPrice" />
							</div>
						</div>

						<div class="form-group">
							<label for="orderQuantity" class="col-sm-2 control-label">订单数量</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="orderQuantity"
									placeholder="订单数量" name="orderQuantity" />
							</div>
						</div>
						<div class="form-group">
							<label for="surplus" class="col-sm-2 control-label">剩余</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="surplus"
									placeholder="剩余" name="surplus" />
							</div>

						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="create()">确定</button>
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
						<input type="hidden" id="edit_orderDetailsId" name="orderDetailsId" />
						<div class="form-group">
							<label for="edit_comFrom" class="col-sm-2 control-label">商品名称</label>
							<div class="col-sm-10">
								<select class="form-control" id="edit_comFrom"
									name="commodity.commodityId">
									<option value="">--请选择--</option>
									<c:forEach items="${COM}" var="com">
										<option value="${com.commodityId}">
											编号：${com.commodityId}——${com.commodityName}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_ofFrom" class="col-sm-2 control-label">订单编号</label>
							<div class="col-sm-10">
								<select class="form-control" id="edit_ofFrom" name="order.orderId">
									<option value="">--请选择--</option>
									<c:forEach items="${OF}" var="of">
										<option value="${of.orderId}">
											${of.orderId}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_unitPrice" class="col-sm-2 control-label">
								单价</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_unitPrice"
									placeholder="单价" name="unitPrice" />
							</div>
						</div>

						<div class="form-group">
							<label for="edit_orderQuantity" class="col-sm-2 control-label">订单数量</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_orderQuantity"
									placeholder="订单数量" name="orderQuantity" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_surplus" class="col-sm-2 control-label">剩余</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_surplus"
									placeholder="剩余" name="surplus" />
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
		var message = "";
	
	
	
		//清空新建订单窗口中的数据
		function clears() {
			$("#new_comFrom").val("");
			$("#new_ofFrom").val("");
			$("#unitPrice").val("");
			$("#orderQuantity").val("");
			$("#surplus").val("");
		}
		// 创建商品
		function create() {
		alert($("#new_form").serialize());
			$.post("<%=basePath%>/addOrderDetails.action",
				$("#new_form").serialize(), function(data) {
					if (data == "OK") {
						alert("添加订单成功！");
						window.location.reload();
					} else {
						alert("添加订单失败！");
						window.location.reload();
					}
				});
		}
		// 通过id获取修改的商品信息
		function edit(orderDetailsId) {
			$.ajax({
				type : "post",
				url : "<%=basePath%>/getOrderDetailsById.action",
				data : {
					"orderDetailsId" : orderDetailsId
				},
				success : function(data) {
					$("#edit_orderDetailsId").val(data.orderDetailsId);
					$("#edit_comFrom").val(data.commodity.commodityId);
					$("#edit_ofFrom").val(data.order.orderId);
					$("#edit_unitPrice").val(data.unitPrice);
					$("#edit_orderQuantity").val(data.orderQuantity);
					$("#edit_surplus").val(data.surplus);
				
				}
			});
		}
		// 执行修改供应商操作
		function update() {
		alert($("#edit_form").serialize());
			$.post("<%=basePath%>/updateOrderDetails.action", $("#edit_form").serialize(), function(data) {
				if (data == "OK") {
					alert("订单信息更新成功！");
					window.location.reload();
				} else {
					alert("订单信息更新失败！");
					window.location.reload();
				}
			});
		}
		// 删除供应商
		function deleteOrderDetails(orderDetailsId) {
			if (confirm('确实要删除该订单吗?')) {
				$.post("<%=basePath%>/deleteOrderDetails.action", {
					"orderDetailsId" : orderDetailsId
				},
					function(data) {
						if (data == "OK") {
							alert("订单删除成功！");
							window.location.reload();
						} else {
							alert("删除订单失败！");
							window.location.reload();
						}
					});
			}
		}
	</script>
</body>
</html>