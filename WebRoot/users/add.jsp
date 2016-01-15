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
		var uname = document.getElementById("uname").value;
		var upwd = document.getElementById("upwd").value;
		var repwd = document.getElementById("repwd").value;
		var realName = document.getElementById("realName").value;
		var role = document.getElementById("role").value;

		if("" == uname){
			alert("用户名不能为空");
			return;
		}else if("" == upwd){
			alert("密码不能为空");
			return;
		}else if("" == repwd){
			alert("确认密码不能为空");
			return;
		}else if(upwd != repwd){
			alert("确认密码与密码不一致");
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
<body>

<div class="page_title">用户管理&nbsp; &gt; 新建用户</div>
<form method="post" action="useradd">
<div class="button_bar">
	<button class="common_button" onclick="help('');">帮助</button>
	<button class="common_button" onclick="back();">返回</button>
	<button class="common_button" onclick="sub();">保存</button>
</div>
<table class="query_form_table">
	<tr>
		<th>编&nbsp;&nbsp;&nbsp;&nbsp;号</th>
		<td><input readonly value="-------系统自动生成-------"/></td>
		<th>用&nbsp;户&nbsp;名</th>
		<td><input id="uname" name="uname" size="20" /><span class="red_star">*</span></td>
	</tr>
	<tr>
		<th>密&nbsp;&nbsp;&nbsp;&nbsp;码</th>
		<td><input type="password" name="upwd" id="upwd"/><span class="red_star">*</span></td>
		<th>确认密码</th>
		<td><input type="password" name="repwd" id="repwd" /><span class="red_star">*</span></td>
	</tr>
	<tr>
		<th>姓&nbsp;&nbsp;&nbsp;&nbsp;名</th>
		<td><input id="realName" name="realName"/><span class="red_star">*</span></td>
		<th>角&nbsp;&nbsp;&nbsp;&nbsp;色</th>
		<td>
			<select id="role" name="roleId">
				<option></option>
				<s:iterator id="rol" value="#request.roles">
				<option value="<s:property value="id"/>"><s:property value="roleName"/></option>
				</s:iterator>
			</select>
			<span class="red_star">*</span>
		</td>
	</tr>	
</table>
</form>
</body>
</html>