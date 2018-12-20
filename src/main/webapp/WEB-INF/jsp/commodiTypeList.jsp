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
<title>商品类型管理</title>
<!-- 引入css样式文件 -->
<!-- Bootstrap Core CSS -->
<link href="<%=basePath%>resource/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="<%=basePath%>resource/css/erp.css"
	rel="stylesheet" />
</head>
<body>
	<div id="wrapper">
		<!-- 商品类型查询部分  start-->
		<div id="page-wrapper-user">
			<div class="panel panel-default">
				<div class="panel-body">

					<form class="form-inline" method="post"
						action="${pageContext.request.contextPath }/comtypeList.action">
						<div class="form-group">
							<label for="comTypeName">商品类型名称</label> <input type="text"
								class="form-control" id="comTypeName" value="${comTypeName}"
								name="comTypeName" />
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
								data-target="#newcomtypeDialog" onclick="clearComtype()">新建</a>
							商品类型信息列表
						</div>

						<!-- /.panel-heading -->
						<div class="table-responsive">
						<table class="table table-bordered table-striped table-hover" >
							<thead>
								<tr>
									<th>编号</th>
									<th>商品类型名称</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								 <c:forEach items="${page.list}" var="comtype"> 
								<tr>
									<td>${comtype.comTypeId}</td>
									<td><input value="${comtype.comTypeName}" style="border: 0px;"  class="form-control" onkeyup="this.value=this.value.replace(/\s+/g,'');" type="text" disabled="disabled" id="${comtype.comTypeId}"/></td>
									<td><a href="#" class="btn btn-primary btn-xs"
										onclick="editComType(${comtype.comTypeId})">修改</a> 
										<a href="#" class="btn btn-default btn-xs"
										onclick="updateComType(${comtype.comTypeId})" >保存</a> 
										<a href="#" class="btn btn-danger btn-xs"
										onclick="deleteComType(${comtype.comTypeId})">删除</a></td>
								</tr>
							 </c:forEach> 
							</tbody>
						</table>
						</div>
						<div class="col-md-12 text-right">
							<kaneki:page
								url="${pageContext.request.contextPath }/comtypeList.action" />
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
		</div>
		<!-- 商品类型列表查询部分  end-->
	</div>
	<!-- 创建商品类型模态框 -->
	<div class="modal fade" id="newcomtypeDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新建商品类型信息</h4>
				</div>
				<div class="modal-body">
					
					<form class="form-horizontal" id="new_comType_form">
						<div class="form-group">
							<label for="comType_Name" class="col-sm-2 control-label">
								类型名称 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="comType_Name" onkeyup="this.value=this.value.replace(/\s+/g,'');"
									placeholder="商品类型名称" name="comTypeName" />
							</div>
						</div>
					</form>
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="createComType()">创建商品类型</button>
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
		function findByComTypeName(){
			var flag=false;
			$.ajax({url:"<%=basePath%>/findByComTypeName.action",
					data:{"comTypeName":$("#comType_Name").val()},
					async:false,
					success:function(data){
					if(data=='1'){
						flag=true;
					}
			}
			});
			return flag;
		}
	
	
	
		//清空新建商品类型窗口中的数据
		function clearComtype() {
			$("#comType_Name").val("");
			
		}
		// 创建商品类型
		function createComType() {
		if($("#comType_Name").val()==''){
			alert("商品类型名称不能为空！")
		}else if(findByComTypeName()){
			alert("商品类型名称已存在！")
		}else{
		$.post("<%=basePath%>/createComType.action",
				$("#new_comType_form").serialize(), function(data) {
					if (data == "OK") {
						alert("商品类型创建成功！");
						window.location.reload();
					} else {
						alert("商品类型创建失败！");
						window.location.reload();
					}
				});
		}
			
		}
		// 通过id获取修改的商品类型信息
		function editComType(comTypeId) {
			$("#"+comTypeId).attr("disabled",false);
		}
		// 执行修改商品类型操作
		function updateComType(comTypeId) {
			var val=$("#"+comTypeId).is(":disabled");
			var comTypeName=$("#"+comTypeId).val();
			if(val){
				alert("请先修改！")
			}else{
				if(comTypeName==null||comTypeName==''){
					alert("商品类型名称不能为空！")
				}else if(isUpdateExistComTypeByName(comTypeId)){
					alert("商品类型已存在！")
				}else{
					 $.post("<%=basePath%>/updateComType.action", 
							 {"comTypeId" : comTypeId,
						  	  "comTypeName" : $("#"+comTypeId).val()}, 
						 function(data) {
						if (data == "OK") {
							alert("商品类型信息更新成功！");
							$("#"+comTypeId).attr("disabled",true);
						} else {
							alert("商品类型信息更新失败！");
						}
					});   
				}
			}
		}
		function isUpdateExistComTypeByName(comTypeId){
			var flag=false;
			$.ajax({url:"<%=basePath%>/isUpdateExistComTypeByName.action",
					data:{"comTypeId":comTypeId,"comTypeName":$("#"+comTypeId).val()},
					async:false,
					success:function(data){
					if(data=='1'){
						flag=true;
					}
			}
			});
			return flag;
		}
		// 删除商品类型
		function deleteComType(comTypeId) {
			if (confirm('确实要删除该商品类型吗?')) {
				$.post("<%=basePath%>/deleteComType.action", {
					"comTypeId" : comTypeId
				},
					function(data) {
						if (data == "OK") {
							alert("商品类型删除成功！");
							window.location.reload();
						} else {
							alert("删除商品类型失败！");
							window.location.reload();
						}
					});
			}
		}
	</script>
</body>
</html>