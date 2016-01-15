<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>JAVA学士后毕业项目</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css">
<script src="<%=path %>/script/common.js"></script>
</head>
<body>

<div class="page_title">客户信息管理 > 客户信息 > 联系人 </div>
<div class="button_bar">
	<button class="common_button" onclick="help('');">帮助</button>
	<button class="common_button" onclick="to('linkmantoAdd?id=<s:property value="#request.custInfo.id"/>');">新建</button>  
	<button class="common_button" onclick="back();">返回</button>
</div>
<table class="query_form_table">
	<tr>
		<th>客户编号</th>
		<td><s:property value="#request.custInfo.custno"/></td>
		<th>客户名称</th>
		<td><s:property value="#request.custInfo.name"/></td>
	</tr>
	</table>
<br />
<table class="data_list_table">
	<tr>
		<th width="15%">姓名</th>
		<th width="5%">性别</th>
		<th width="15%">职位</th>
		<th width="15%">办公电话</th>
		<th width="15%">手机</th>
		<th width="25%">备注</th>
		<th width="15%">操作</th>
	</tr>
	<s:iterator id="linkman" value="#request.list">
	<tr>
		<td class="list_data_text"><s:property value="name"/></td>
		<td class="list_data_text"><s:property value="sex"/></td>
		<td class="list_data_text"><s:property value="position"/></td>
		<td class="list_data_text"><s:property value="tel"/></td>
		<td class="list_data_text"><s:property value="mobile"/></td>
		<td class="list_data_text"><s:property value="remark"/></td>
		<td class="list_data_op">
			<img onclick="to('linkmantoUpdate?lid=<s:property value="lid"/>&id=<s:property value="#request.custInfo.id"/>');" title="编辑" src="<%=path %>/images/bt_edit.gif" class="op_button" />
			<img onclick="del('linkmandelete?lid=<s:property value="lid"/>&id=<s:property value="#request.custInfo.id"/>');" title="删除" src="<%=path %>/images/bt_del.gif" class="op_button" />	
		</td>
	</tr>
	</s:iterator>
	</table>
</body>
</html>