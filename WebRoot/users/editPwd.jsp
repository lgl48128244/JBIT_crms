<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
<title>JAVA学士后毕业设计项目</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="./css/style.css" rel="stylesheet" type="text/css">
<script src="./script/common.js"></script>
<script type="text/javascript">
function sub(){
		var oldpwd = document.getElementById("oldpwd").value;
		var reoldpwd = document.getElementById("reoldpwd").value;
		var upwd = document.getElementById("upwd").value;
		var repwd = document.getElementById("repwd").value;
		if("" == reoldpwd){
			alert("旧密码不能为空");
			return;
		}else if("" == upwd){
			alert("新密码不能为空");
			return;
		}else if("" == repwd){
			alert("确认密码不能为空");
			return;
		}else if(upwd != repwd){
			alert("确认密码与密码不一致");
			return;
		}else if(oldpwd != reoldpwd){
			alert("旧密码错误");
			return;
		}else if(confirm("您确定要修改密码？")){
			document.forms[0].submit();
		}
	}
</script>
</head>
<body>

<div class="page_title">用户管理&nbsp; &gt; 修改密码</div>
<form method="post" action="userModifyPwd">
<div class="button_bar">
	<button class="common_button" onclick="help('');">帮助</button>
	<button class="common_button" onclick="back();">返回</button>
	<button class="common_button" onclick="sub()">修改</button>
</div>
<table class="query_form_table">

	<tr>
		<td><input type="hidden" name="id" value="<s:property value="#request.user.id"/>"/></td>
		<td><input type="hidden" name="uname" value="<s:property value="#request.user.uname"/>"/></td>
		<td><input type="hidden" name="realName" value="<s:property value="#request.user.realName"/>"/></td>
		<td><input type="hidden" name="roleId" value="<s:property value="#request.user.roleId"/>"/></td>
		<td><input type="hidden" id="oldpwd" value="<s:property value="#request.user.upwd"/>"/></td>
	</tr>
	<tr>
		<th>旧的密码</th>
		<td><input type="password" id="reoldpwd" value=""/><span class="red_star">*</span></td>
		<th>新的密码</th>
		<td><input type="password" name="upwd" id="upwd" value=""/><span class="red_star">*</span></td>
		<th>确认密码</th>
		<td><input type="password" id="repwd" value=""/><span class="red_star">*</span></td>
	</tr>	
</table>
</form>
</body>
</html>