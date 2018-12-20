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
<title>日志管理</title>
<!-- 引入css样式文件 -->
<!-- Bootstrap Core CSS -->
<link href="<%=basePath%>resource/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="<%=basePath%>resource/css/erp.css"
	rel="stylesheet" />
</head>
<body>
	<div id="wrapper">
		<!-- 日志列表查询部分  start-->
		<div id="page-wrapper-user">
			<div class="panel panel-default">
				<div class="panel-body">

					 <form class="form-inline" method="post"
						action="${pageContext.request.contextPath }/logList.action">
						<div class="form-group">
							<label for="uFrom">操作人</label> <select class="form-control"
								id="uFrom" name="user.userId">
								<option value="">--请选择--</option>
								<c:forEach items="${USERS}" var="user">
									<option value="${user.userId}" <c:if test="${user.userId == UID}">selected</c:if> >
								    ${user.userName}
								</option>
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
							用户信息列表
						</div>

						<!-- /.panel-heading -->
						<div class="table-responsive">
						<table class="table table-bordered table-striped table-hover">
							<thead>
								<tr>
									<th>日志编号</th>
									<th>操作人</th>
									<th>所属部门</th>
									<th>操作时间</th>
									<th>操作内容</th>
									<th>操作结果</th>
								</tr>
							</thead>
							<tbody>
								 <c:forEach items="${page.list}" var="log"> 
								<tr>
									<td>${log.logId}</td>
									<td>${log.user.userName}</td>
									<td>${log.dept.deptName}</td>
									<td>${log.strtime}</td>
									<td>${log.logRecord}</td>
									<td>${log.operateresult}</td>
								</tr>
							 </c:forEach> 
							</tbody>
						</table>
						</div>
						<div class="col-md-12 text-right">
							<kaneki:page
								url="${pageContext.request.contextPath }/logList.action" />
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
		</div>
		<!-- 日志列表查询部分  end-->
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

</body>
</html>