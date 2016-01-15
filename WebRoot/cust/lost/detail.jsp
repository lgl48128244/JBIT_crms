<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>JAVA学士后毕业设计项目</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css">
<script src="<%=path %>/script/common.js"></script>
</head>
<body>

<div class="page_title">客户流失管理 &gt; 流失列表</div>
<div class="button_bar">
	<button class="common_button" onclick="help('');">帮助</button>
	<button class="common_button" onclick="back();">返回</button>
</div>
<table class="query_form_table">
	<tr>
		<th>编号</th>
		<td><s:property value="#request.custlost.lostno"/></td>
		<th>客户</th>
		<td><s:property value="#request.custlost.lostname"/></td>
	</tr>
	<tr>
		<th>客户经理</th>
		<td><s:property value="#request.custlost.lostmanager"/></td>
		<th>上次下单时间</th>
		<td>
			<s:date format="yyyy年MM月dd日" name="#request.custlost.lastorderdate"/>
		</td>
	</tr>
	<tr>
		<th>暂缓措施</th>
		<td colspan="3">${custlost.delay }</td>
	</tr>	
	<tr>
		<th>流失原因</th>
		<td colspan="3"><s:property value="#request.custlost.reason"/></td>
	</tr>
	<tr>
		<th>状态</th>
		<td><s:property value="#request.custlost.status"/></td>
		<th>流失时间</th>
		<td>
			<s:date format="yyyy年MM月dd日" name="#request.custlost.lostdate"/>
		</td>
	</tr>
</table>

<br />
</body>

</html>