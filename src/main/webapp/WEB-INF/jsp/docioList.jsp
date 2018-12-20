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
<title>商品信息</title>
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
						action="${pageContext.request.contextPath }/docioList.action">

						<div class="form-group">
							<label for="uFrom">操作人</label> <select class="form-control"
								id="uFrom" name="users.userId">
								<option value="">--请选择--</option>
								<c:forEach items="${USER}" var="use">
									<option value="${use.userId}"
										<c:if test="${use.userId == UID}">selected</c:if>>${use.userName}</option>
								</c:forEach>
							</select>
						</div>


						<div class="form-group">
							<label for="shFrom">仓库名称</label> <select class="form-control"
								id="shFrom" name="storeHouse.storeHouseId">
								<option value="">--请选择--</option>
								<c:forEach items="${SH}" var="sh">
									<option value="${sh.storeHouseId}"
										<c:if test="${sh.storeHouseId == SHID}">selected</c:if>>${sh.storeHouseName}</option>
								</c:forEach>
							</select>
						</div>

						<div class="form-group">
							<label for="commodityFrom">商品名称</label> <select
								class="form-control" id="commodityFrom"
								name="commodity.commodityId">
								<option value="">--请选择--</option>
								<c:forEach items="${COM}" var="com">
									<option value="${com.commodityId}"
										<c:if test="${com.commodityId == CID}">selected</c:if>>${com.commodityName}</option>
								</c:forEach>
							</select>
						</div>

						<div class="form-group">
							<label for="operateTypeFrom">操作类型</label> <select
								class="form-control" id="operateTypeFrom" name="operateType">
								<option value="">--请选择--</option>
								<option value="1" <c:if test="${'1' == TYPE}">selected</c:if>>入库</option>
								<option value="0" <c:if test="${'2' == TYPE}">selected</c:if>>出库</option>
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
								data-target="#newDialog" onclick="clears()">商品出入库</a> 商品库存操作明细
						</div>

						<!-- /.panel-heading -->
						<div class="table-responsive">
							<table class="table table-bordered table-striped table-hover">
								<thead>
									<tr>
										<th>明细编号</th>
										<th>操作人</th>
										<th>商品名称</th>
										<th>商品类型名称</th>
										<th>仓库名称</th>
										<th>操作时间</th>
										<th>操作类型</th>
										<th>数量</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${page.list}" var="docio">
										<tr>
											<th>${docio.cioId}</th>
											<th>${docio.users.userName}</th>
											<th>${docio.commodity.commodityName}</th>
											<th>${docio.commodity.comType.comTypeName}</th>
											<th>${docio.storeHouse.storeHouseName}</th>
											<th>${docio.time}</th>
											<th><c:if test="${docio.operateType==1}">入库</c:if> <c:if
													test="${docio.operateType==0}">出库</c:if></th>
											<th>${docio.num}</th>

										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="col-md-12 text-right">
							<kaneki:page
								url="${pageContext.request.contextPath }/docioList.action" />
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
		<div class="modal-dialog " role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">商品入库信息登记</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="new_form">
						<input type="hidden" class="form-control" name="users.userId"
							value="${USER_SESSION.userId}">
						<div class="form-group">
							<label for="new_commodityFrom" class="col-sm-2 control-label">商品名称</label>
							<div class="col-sm-10">
								<select class="form-control" id="new_commodityFrom"
									name="commodity.commodityId">
									<option value="">--请选择--</option>
									<c:forEach items="${COM}" var="com">
										<option value="${com.commodityId}">${com.commodityName}——商品编号：${com.commodityId}</option>
									</c:forEach>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label for="new_shFrom" class="col-sm-2 control-label">仓库名称</label>
							<div class="col-sm-4">
								<select class="form-control" id="new_shFrom"
									name="storeHouse.storeHouseId">
									<option value="">--请选择--</option>
									<c:forEach items="${SH}" var="sh">
										<option value="${sh.storeHouseId}">
											${sh.storeHouseName}</option>
									</c:forEach>
								</select>
							</div>
							<label for="new_operateTypeFrom" class="col-sm-2 control-label">操作类型</label>
							<div class="col-sm-4">
								<select class="form-control" id="new_operateTypeFrom"
									name="operateType">
									<option value="">--请选择--</option>
									<option value="1">入库</option>
									<option value="0">出库</option>
								</select>
							</div>
						</div>

						<div class="form-group"></div>
						<div class="form-group">
							<label for="new_num" class="col-sm-2 control-label"> 数量 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_num"
									placeholder="数量" name="num"
									onkeyup="value=value.replace(/[^\d]/g,'')" />
							</div>
						</div>
						<%-- <div class="form-group">
							<label for="userId" class="col-sm-2 control-label">
								操作人 </label>
							<div class="col-sm-10">
								
								<input type="text" class="form-control" id="userId"  disabled="disabled"
									placeholder="操作人 "  value="${USER_SESSION.userName}"/>
							</div>
						</div> --%>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="create()">确定</button>
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
		function clears() {
			$("#new_commodityFrom").val("");
			$("#new_shFrom").val("");
			$("#new_operateTypeFrom").val("");
			$("#new_num").val("");
		}
	
	
		function create() {
			if ($("#new_commodityFrom").val() == '') {
				alert("请选择商品！");
			} else if ($("#new_shFrom").val() == '') {
				alert("请选择仓库！");
			} else if ($("#new_operateTypeFrom").val() == '') {
				alert("请选择操作类型！");
			} else if ($("#new_num").val() == '') {
				alert("数量不能为空");
			} else {
				$.post("<%=basePath%>/createDoico.action",
					$("#new_form").serialize(), function(data) {
						if (data == "OK") {
							alert("入库成功！");
							window.location.reload();
						} else {
							alert("入库失败！");
							window.location.reload();
						}
					});
			}
		}
	</script>
</body>
</html>