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
<title>部门管理</title>
<!-- 引入css样式文件 -->
<!-- Bootstrap Core CSS -->
<link href="<%=basePath%>resource/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="<%=basePath%>resource/css/erp.css"
	rel="stylesheet" />
</head>
<body>
	<div id="wrapper">
		<!-- 部门列表查询部分  start-->
		<div id="page-wrapper-user">
			<div class="panel panel-default">
				<div class="panel-body">

					<form class="form-inline" method="post"
						action="${pageContext.request.contextPath }/deptList.action">
						<div class="form-group">
							<label for="deptName">部门名称</label> <input type="text"
								class="form-control" id="deptName" value="${deptName}"
								name="deptName" />
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
								data-target="#newDeptDialog" onclick="clearDept()">新建</a>
							部门信息列表
						</div>

						<!-- /.panel-heading -->
						<div class="table-responsive">
						<table class="table table-bordered table-striped table-hover">
							<thead>
								<tr>
									<th>编号</th>
									<th>部门名称</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								 <c:forEach items="${page.list}" var="dept"> 
								<tr>
									<td>${dept.deptId}</td>
									<td><input value="${dept.deptName}" style="border: 0px;"  class="form-control" onkeyup="this.value=this.value.replace(/\s+/g,'');" type="text" disabled="disabled" id="${dept.deptId}"/></td>
									<td><a href="#" class="btn btn-primary btn-xs"
										onclick="editDept(${dept.deptId})">修改</a> 
										<a href="#" class="btn btn-default btn-xs"
										onclick="updateDept(${dept.deptId})" >保存</a> 
										<a href="#" class="btn btn-danger btn-xs"
										onclick="deleteDept(${dept.deptId})">删除</a></td>
								</tr>
							 </c:forEach> 
							</tbody>
						</table>
						</div>
						<div class="col-md-12 text-right">
							<kaneki:page
								url="${pageContext.request.contextPath }/deptList.action" />
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
		</div>
		<!-- 部门列表查询部分  end-->
	</div>
	<!-- 创建部门模态框 -->
	<div class="modal fade" id="newDeptDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新建部门信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="new_dept_form">
						<div class="form-group">
							<label for="dept_Name" class="col-sm-2 control-label">
								部门名称 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="dept_Name" onkeyup="this.value=this.value.replace(/\s+/g,'');"
									placeholder="部门名称" name="deptName" />
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="createDept()">创建部门</button>
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
		function findByDeptName(){
			var flag=false;
			$.ajax({url:"<%=basePath%>/findByDeptName.action",
					data:{"deptName":$("#dept_Name").val()},
					async:false,
					success:function(data){
					if(data=='1'){
						flag=true;
					}
			}
			});
			return flag;
		}
	
	
	
		//清空新建部门窗口中的数据
		function clearDept() {
			$("#dept_Name").val("");
			
		}
		// 创建部门
		function createDept() {
		if($("#dept_Name").val()==''){
			alert("部门名称不能为空！")
		}else if(findByDeptName()){
			alert("部门名称已存在！")
		}else{
		$.post("<%=basePath%>/createDept.action",
				$("#new_dept_form").serialize(), function(data) {
					if (data == "OK") {
						alert("部门创建成功！");
						window.location.reload();
					} else {
						alert("部门创建失败！");
						window.location.reload();
					}
				});
		}
			
		}
		// 通过id获取修改的部门信息
		function editDept(deptId) {
			$("#"+deptId).attr("disabled",false);
		}
		// 执行修改部门操作
		function updateDept(deptId) {
			var val=$("#"+deptId).is(":disabled");
			var deptName=$("#"+deptId).val();
			if(val){
				alert("请先修改！")
			}else{
				if(deptName==null||deptName==''){
					alert("部门名称不能为空！")
				}else if(isUpdateExistDeptByName(deptId)){
					alert("部门已存在！")
				}else{
					 $.post("<%=basePath%>/updateDept.action", 
							 {"deptId" : deptId,
						  	  "deptName" : $("#"+deptId).val()}, 
						 function(data) {
						if (data == "OK") {
							alert("部门信息更新成功！");
							$("#"+deptId).attr("disabled",true);
						} else {
							alert("部门信息更新失败！");
						}
					});   
				}
			}
		}
		function isUpdateExistDeptByName(deptId){
			var flag=false;
			$.ajax({url:"<%=basePath%>/isUpdateExistDeptByName.action",
					data:{"deptId":deptId,"deptName":$("#"+deptId).val()},
					async:false,
					success:function(data){
					if(data=='1'){
						flag=true;
					}
			}
			});
			return flag;
		}
		// 删除部门
		function deleteDept(deptId) {
			if (confirm('确实要删除该部门吗?')) {
				$.post("<%=basePath%>/deleteDept.action", {
					"deptId" : deptId
				},
					function(data) {
						if (data == "OK") {
							alert("部门删除成功！");
							window.location.reload();
						} else {
							alert("删除部门失败！");
							window.location.reload();
						}
					});
			}
		}
	</script>
</body>
</html>