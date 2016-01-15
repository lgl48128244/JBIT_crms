<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>客户关系管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript">
	function logout(){
		if(confirm("确定注销吗？")){
			window.location.href="userlogout";
			if(self != top){
				window.top.location.href('login.jsp');
			}
		}
	}
</script>
</head>

<body style="border-bottom:solid 1px #666;">

<TABLE style="width:100%;">
<TR >
	<td ><img src="images/logo.gif"></td>
	<td style="font-family:黑体;font-size:33px;font-weight:bold;" align="center"> 客户关系管理系统</td>	
	<td width="25%" align="center" style="font-size:12px;" valign="bottom">当前用户：<s:property value="#session.user.realName"/>（<s:property value="#session.userRole.roleName"/>）&nbsp;&nbsp; <a href="javascript:logout()">退出系统</a> </td>
</tr>
</table>
</body>
</html>
