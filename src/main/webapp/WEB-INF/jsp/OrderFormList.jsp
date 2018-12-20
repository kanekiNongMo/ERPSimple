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
<title>订单信息</title>
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
						action="${pageContext.request.contextPath }/orderFormList.action">
						<div class="form-group">
							<label for="supFrom">供应商名称</label> <select class="form-control"
								id="supFrom" name="supplier.supplierId">
								<option value="">--请选择--</option>
								<c:forEach items="${SUP}" var="sup">
									<option value="${sup.supplierId}" <c:if test="${sup.supplierId == SID}">selected</c:if> >
								    ${sup.supplierName}
								</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="typeFrom">订单类型</label> <select class="form-control"
								id="typeFrom" name="orderType">
								<option value="">--请选择--</option>
									<option value="0" <c:if test="${0==TYPE}">selected</c:if>>销售订单</option>
									<option value="1" <c:if test="${1==TYPE}">selected</c:if>>采购订单</option>
									<option value="2" <c:if test="${2==TYPE}">selected</c:if>>生产订单</option>
							</select>
						</div>
						<div class="form-group">
							<label for="statusFrom">订单状态</label> <select class="form-control"
								id="statusFrom" name="orderStatus">
								<option value="">--请选择--</option>
									<option value="0" <c:if test="${0==STATUS}">selected</c:if>>待审核</option>
									<option value="1" <c:if test="${1==STATUS}">selected</c:if>>已完成</option>
									<option value="2" <c:if test="${2==STATUS}">selected</c:if>>已取消</option>
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
							<a href="#" class="btn btn-primary" data-toggle="modal"
								data-target="#newDialog" onclick="clears()">新建</a> 订单信息列表<a href="<%=basePath%>/export.action" style="margin-left: 84%;" class="btn btn-primary">导出</a>
						</div>

						<!-- /.panel-heading -->
						<div class="table-responsive">
							<table class="table table-bordered table-striped table-hover">
								<thead>
									<tr>
										<th>订单编号</th>
										<th>供应商名称</th>
										<th>创建人</th>
										<th>创建时间</th>
										<th>审核人</th>
										<th>审核时间</th>
										<th>跟单人</th>
										<th>结束时间</th>
										<th>订单类型</th>
										<th>订单状态</th>
										<th>总数量</th>
										<th>总金额</th>
										<th>单位</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${page.list}" var="order">
										<tr>
											<th>${order.orderId}</th>
											<th>${order.supplier.supplierName}</th>
											<th>${order.creater}</th>
											<th>${order.cTime}</th>
											<th>${order.auditor}</th>
											<th>${order.aTime}</th>
											<th>${order.documentary}</th>
											<th>${order.eTime}</th>
											<th>
												<c:if test="${order.orderType==0}">销售订单</c:if>
												<c:if test="${order.orderType==1}">采购订单</c:if>
												<c:if test="${order.orderType==2}">生产订单</c:if>
											</th>
											<th>
												<c:if test="${order.orderStatus==0}">待审核</c:if>
												<c:if test="${order.orderStatus==1}">已完成</c:if>
												<c:if test="${order.orderStatus==2}">已取消</c:if>
											</th>
											<th>${order.totalQuantity}</th>
											<th>${order.aggregateAmount}</th>
											<th>元</th>
											<td><a href="#" class="btn btn-primary btn-xs"
												data-toggle="modal" data-target="#EditDialog"
												onclick="edit(${order.orderId})">修改</a> <a href="#"
												class="btn btn-danger btn-xs"
												onclick="deleteOrder(${order.orderId})">删除</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="col-md-12 text-right">
							<kaneki:page
								url="${pageContext.request.contextPath }/orderFormList.action" />
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
					<h4 class="modal-title" id="myModalLabel">新建订单</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="new_form">
						<div class="form-group">
							<label for="new_supFrom" class="col-sm-2 control-label">客户名称</label>
							<div class="col-sm-10">
								<select class="form-control" id="new_supFrom"
									name="supplier.supplierId">
									<option value="">--请选择供应商--</option>
									<c:forEach items="${SUP}" var="sup">
										<option value="${sup.supplierId}">
								    ${sup.supplierName}
								</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="new_typeFrom" class="col-sm-2 control-label">订单类型</label>
							<div class="col-sm-10">
								<select class="form-control" id="new_typeFrom"
									name="orderType">
									<option value="">--请选择--</option>
										<option value="0" >销售订单</option>
										<option value="1" >采购订单</option>
										<option value="2" >生产订单</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="new_creater" class="col-sm-2 control-label">
								创建人 </label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_creater"
									placeholder="创建人" name="creater" />
							</div>
							<label for="new_createTime" class="col-sm-2 control-label">创建时间</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="new_createTime"
									placeholder="创建时间" name="createTime" />
							</div>
						</div>
						
						<div class="form-group">
							<label for="auditor" class="col-sm-2 control-label">审核人</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="auditor"
									placeholder="审核人" name="auditor" />
							</div>
							<label for="auditTime" class="col-sm-2 control-label">审核时间</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="auditTime"
									placeholder="审核时间" name="auditTime" />
							</div>
						</div>
						<div class="form-group">
							<label for="documentary" class="col-sm-2 control-label">跟单人</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="documentary"
									placeholder="跟单人" name="documentary" />
							</div>
							<label for="endTime" class="col-sm-2 control-label">结束时间</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="endTime"
									placeholder="结束时间" name="endTime" />
							</div>
						</div>
						<div class="form-group">
							<label for="totalQuantity" class="col-sm-2 control-label">总数量</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="totalQuantity" onkeyup="value=value.replace(/[^\d]/g,'')"
									placeholder="总数量" name="totalQuantity" />
							</div>
						</div>
						<div class="form-group">
							<label for="aggregateAmount" class="col-sm-2 control-label">总金额</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="aggregateAmount"
									placeholder="总数量" name="aggregateAmount" />
							</div>
						</div>
						<div class="form-group">
							<label for="new_statusFrom" class="col-sm-2 control-label">订单状态</label>
							<div class="col-sm-10">
								<select class="form-control" id="new_statusFrom"
									name="orderStatus">
									<option value="">--请选择--</option>
									<option value="0" >待审核</option>
									<option value="1" >已完成</option>
									<option value="2" >已取消</option>
								</select>
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
					<h4 class="modal-title" id="myModalLabel">修改訂單信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_form">
						<input type="hidden" id="edit_orderId" name="orderId" />
						<div class="form-group">
							<label for="edit_supFrom" class="col-sm-2 control-label">客户名称</label>
							<div class="col-sm-10">
								<select class="form-control" id="edit_supFrom"
									name="supplier.supplierId">
									<option value="">--请选择供应商--</option>
									<c:forEach items="${SUP}" var="sup">
										<option value="${sup.supplierId}">
								    ${sup.supplierName}
								</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_typeFrom" class="col-sm-2 control-label">订单类型</label>
							<div class="col-sm-10">
								<select class="form-control" id="edit_typeFrom"
									name="orderType">
									<option value="">--请选择--</option>
										<option value="0" >销售订单</option>
										<option value="1" >采购订单</option>
										<option value="2" >生产订单</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_creater" class="col-sm-2 control-label">
								创建人 </label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="edit_creater"
									placeholder="创建人" name="creater" />
							</div>
							<label for="edit_createTime" class="col-sm-2 control-label">创建时间</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="edit_createTime"
									placeholder="创建时间" name="createTime" />
							</div>
						</div>
						
						<div class="form-group">
							<label for="edit_auditor" class="col-sm-2 control-label">审核人</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="edit_auditor"
									placeholder="审核人" name="auditor" />
							</div>
							<label for="edit_auditTime" class="col-sm-2 control-label">审核时间</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="edit_auditTime"
									placeholder="审核时间" name="auditTime" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_documentary" class="col-sm-2 control-label">跟单人</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="edit_documentary"
									placeholder="跟单人" name="documentary" />
							</div>
							<label for="edit_endTime" class="col-sm-2 control-label">结束时间</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="edit_endTime"
									placeholder="结束时间" name="endTime" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_totalQuantity" class="col-sm-2 control-label">总数量</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_totalQuantity" onkeyup="value=value.replace(/[^\d]/g,'')"
									placeholder="总数量" name="totalQuantity" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_aggregateAmount" class="col-sm-2 control-label">总金额</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_aggregateAmount"
									placeholder="总数量" name="aggregateAmount" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_statusFrom" class="col-sm-2 control-label">订单状态</label>
							<div class="col-sm-10">
								<select class="form-control" id="edit_statusFrom"
									name="orderStatus">
									<option value="">--请选择--</option>
									<option value="0" >待审核</option>
									<option value="1" >已完成</option>
									<option value="2" >已取消</option>
								</select>
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
	laydate.render({
			elem:'#new_createTime'
			,type:'datetime'
		 	,theme: '#000000'
		});
	laydate.render({
			elem:'#auditTime'
			,type:'datetime'
		 	,theme: '#000000'
		});
	laydate.render({
			elem:'#endTime'
			,type:'datetime'
		 	,theme: '#000000'
		});
	laydate.render({
			elem:'#edit_createTime'
			,type:'datetime'
		 	,theme: '#000000'
		});
	laydate.render({
			elem:'#edit_auditTime'
			,type:'datetime'
		 	,theme: '#000000'
		});
	laydate.render({
			elem:'#edit_endTime'
			,type:'datetime'
		 	,theme: '#000000'
		});
		var message = "";

	
		
		//清空新建订单窗口中的数据
		function clears() {
			$("#new_supFrom").val("");
			$("#new_typeFrom").val("");
			$("#new_creater").val("");
			$("#new_createTime").val("");
			$("#auditor").val("");
			$("#auditTime").val("");
			$("#documentary").val("");
			$("#endTime").val("");
			$("#totalQuantity").val("");
			$("#aggregateAmount").val("");
			$("#new_statusFrom").val("");
		}
		// 创建商品
		function create() {
				$.post("<%=basePath%>/addOrder.action",
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
		function edit(orderId) {
			$.ajax({
				type : "post",
				url : "<%=basePath%>/getOrderById.action",
				data : {
					"orderId" : orderId
				},
				success : function(data) {
						$("#edit_orderId").val(data.orderId);
						$("#edit_supFrom").val(data.supplier.supplierId);
						$("#edit_typeFrom").val(data.orderType);
						$("#edit_creater").val(data.creater);
						$("#edit_createTime").val(data.cTime);
						$("#edit_auditor").val(data.auditor);
						$("#edit_auditTime").val(data.aTime);
						$("#edit_documentary").val(data.documentary);
						$("#edit_endTime").val(data.eTime);
						$("#edit_totalQuantity").val(data.totalQuantity);
						$("#edit_aggregateAmount").val(data.aggregateAmount);
						$("#edit_statusFrom").val(data.orderStatus);
				}
			});
		}
		// 执行修改供应商操作
		function update() {
				$.post("<%=basePath%>/updateOrder.action", $("#edit_form").serialize(), function(data) {
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
		function deleteOrder(orderId) {
			if (confirm('确实要删除该订单吗?')) {
				$.post("<%=basePath%>/deleteOrder.action", {
					"orderId" : orderId
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