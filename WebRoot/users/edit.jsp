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
	function role(){
		//document.getElementById("roleId").value=<s:property value="#request.user.roleId"/>;//只支持数字
		document.getElementById("roleId").value='${user.roleId }';//必须加单引号
	}
	function sub(){
		var uname = document.getElementById("uname").value;
		var realName = document.getElementById("realName").value;
		var role = document.getElementById("role").value;

		if("" == uname){
			alert("用户名不能为空");
			return;
		}else if("" == realName){
			alert("姓名不能为空");
			return;
		}else if("" == role){
			alert("角色不能为空");
			return;
		}else if(confirm("您确定要保存数据吗？")){
			document.forms[0].submit();
		}
	}
</script>
</head>
<body onload="role()">

<div class="page_title">用户管理&nbsp; &gt; 编辑用户</div>
<form method="post" action="userupdate">
<div class="button_bar">
	<button class="common_button" onclick="help('');">帮助</button>
	<button class="common_button" onclick="back();">返回</button>
	<button class="common_button" onclick="sub()">保存</button> 
</div>
<table class="query_form_table">

	<tr>
		<th>编&nbsp;&nbsp;&nbsp;&nbsp;号</th>
		<td><input readonly name="id" value="<s:property value="#request.user.id"/>"/></td>
		<th>用&nbsp;户&nbsp;名</th>
		<td><input name="uname" id="uname" value="<s:property value="#request.user.uname"/>" /><span class="red_star">*</span></td>
	</tr>
	<tr>
		<th>姓&nbsp;&nbsp;&nbsp;&nbsp;名</th>
		<td><input name="realName" id="realName" value="<s:property value="#request.user.realName"/>"/><span class="red_star">*</span></td>
		<th>角&nbsp;&nbsp;&nbsp;&nbsp;色</th>
		<td>
			<s:select id="role" name="roleId" list="#request.roles" headerKey="" headerValue="==请选择=="
			listKey="id" listValue="roleName">
			</s:select>
			<span class="red_star">*</span>
		</td>
	</tr>
	<tr>
	<td><input name="upwd" type="hidden" value="<s:property value="#request.user.upwd"/>" /></td>
	</tr>	
</table>
</form>
</body>
</html>