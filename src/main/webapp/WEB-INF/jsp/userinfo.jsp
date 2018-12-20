<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>个人信息</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="<%=basePath%>resource/css/bootstrap.min.css" rel="stylesheet" />
	<script src="<%=basePath%>resource/js/jquery-1.11.3.min.js"></script>
	<script src="<%=basePath%>resource/js/bootstrap.min.js"></script>
	<script src="<%=basePath%>resource/js/laydate.js"></script>
  </head>
  
  <body>
	<div id="wrapper" style=" width: 100%; height: 94%; padding-top: 8%">
		<div class="panel panel-default" style="border: 0px;">
			<div class="panel-body">
				<form class="form-horizontal" id="imageUser">
					<div style="margin-left: 18%">
						<img id="base_avatar"
							src="<%=basePath%>images/Screenshot_20170812-203925_01.png" alt="头像"
							width="100" height="104"> <span class="" data-toggle="modal"
							data-target="#userImage">修改</span> | <span id="" class=" ">删除</span>
					</div>
				</form>
				<form class="form-horizontal" id="userInfo">
					<input type="hidden" id="user_Id" name="userId"
						value="${USER.userId}" />
					<div class="form-group">
						<label class="col-sm-2 control-label">姓名</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="user_Name"
								disabled="disabled" value="${USER.userName}" placeholder="用户名称"
								name="userName"
								onkeyup="this.value=this.value.replace(/\s+/g,'');" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">出生年月</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="user_Birthday"
								placeholder="出生年月" disabled="disabled" value="${USER.age}"
								name="userBirthday" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">性别</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="user_Sex"
								disabled="disabled" value="${USER.userSex}" placeholder="性别"
								name="userSex" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">联系电话</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="user_Phone"
								disabled="disabled" value="${USER.userPhone}" placeholder="电话"
								name="userPhone" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">联系地址</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="user_Address"
								onkeyup="this.value=this.value.replace(/\s+/g,'');"
								disabled="disabled" value="${USER.userAddress}"
								placeholder="联系地址" name="userAddress" />
						</div>
					</div>
					<div style="margin-left: 32%">
						<button type="button" class="btn btn-primary" data-dismiss="modal"
							onclick="edit()">修改</button>
						<button type="button" class="btn btn-primary"
							onclick="updateUser()">保存</button>
					</div>
				</form>
			</div>
		</div>
	</div>


<div class="modal fade" id="userImage" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">上传用户头像</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" onsubmit="return uploadUserImage()"  action="${pageContext.request.contextPath }/uploadImage.action" method="post" enctype="multipart/form-data">
						<div class="form-group">
						<input type="hidden" id="user_Id_image" name="userId"
						value="${USER.userId}" />
						<input type="file" name="userImage" id="file" multiple="multiple" />
						</div>
						
							<button type="submit" class="btn btn-default" onclick="uploadUserImage()">上传</button>
							<button type="button" class="btn btn-primary"
								data-dismiss="modal">取消</button>
						
					</form>
				</div>

			</div>
		</div>
	</div>

</body>
 
</html>
 <script type="text/javascript">
 var message="";
 laydate.render({
			elem:'#user_Birthday'
		 	,theme: '#000000'
		});
	function edit(){
		$("input").attr("disabled",false);
	}
	function updateUser(){
			if(!vailPhone()){
				alert(message);
			}else{
			$.post("<%=basePath%>/updateUser.action", $("#userInfo").serialize(), function(data) {
					if (data == "OK") {
						alert("用户信息更新成功！");
						$("input").attr("disabled",true);
					} else {
						alert("用户信息更新失败！");
						$("input").attr("disabled",true);
					}
				});
			
		
		}
	}
	
	    function vailPhone(){
            var phone = $("#user_Phone").val();
            var flag = false;
            var myreg = /^(((13[0-9]{1})|(14[0-9]{1})|(17[0]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-9]{1}))+\d{8})$/;   
            if($("#user_Name").val()==''){
            	message = "用户名不能为空！";
            }else if($("#user_Sex").val() == ''){
                message = "性别不能为空！";
            }else if(!($("#user_Sex").val() == "男"||$("#user_Sex").val() == "女")){
                message = "性别不正确！";
            }else if($("#user_Birthday").val() == ''){
                message = "出生年月不能为空！";
            }else if($("#user_Address").val() == ''){
                message = "地址不能为空！";
            }else if(phone == ''){
                message = "手机号码不能为空！";
            }else if(phone.length !=11){
                message = "请输入有效的手机号码！";
            }else if(!myreg.test(phone)){
                message = "请输入有效的手机号码！";
            }else if(!checkPhoneIsExist2()){
                message = "该手机号码已经被绑定！";
            }else if($("#deptFrom").val()==''){
            	message = "部门不能为空！";
            }
            else{
                    flag = true;
            }
            return flag;
         }	
         
         
         function checkPhoneIsExist2(){
			var userId=$("#user_Id").val();
            var userPhone = $("#user_Phone").val();
            var flag2 = false;
            jQuery.ajax(
               { url: "<%=basePath%>/exceptOneselfPhone.action",
                   data:{"userId":userId,"userPhone":userPhone},
                        type:"post",
                        async: false,
                        success:function(data) {
                        if(data == '1'){
                            flag2 = true;
                        }
                    }
           });
           return flag2;
        } 
         
         function uploadUserImage(){
        	 if($("#file").val()==''){
        		 alert("请上传图片");
        		 return false;
        	 }
        	 return true;
         }
</script>