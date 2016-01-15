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

<div class="page_title">客户信息管理 &gt; 客户信息 &gt; 交往记录</div>
<div class="button_bar">
	<button class="common_button" onclick="help('');">帮助</button>
	<button class="common_button" onclick="to('activitytoAdd?id=<s:property value="#request.custInfo.id"/>');">新建</button>  
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
		<th width="232">时间</th>
		<th>地点</th>
		<th>概要</th>
		<th>详细信息</th>
		<th>备注</th>
		<th>操作</th>
	</tr>
	<s:iterator id="activity" value="#request.list" >
	<tr>
		<td class="list_data_text" width="230"><s:date format="yyyy年MM月dd日" name="actdate"/></td>
		<td class="list_data_text"><s:property value="place"/></td>
		<td class="list_data_text"><s:property value="title"/></td>
		<td class="list_data_text"><s:property value="actdesc"/></td>
		<td class="list_data_text"><s:property value="remark"/></td>
		<td class="list_data_op">
			<img onclick="to('activitytoUpdate?aid=<s:property value="aid"/>&id=<s:property value="#request.custInfo.id"/>');" title="编辑" src="<%=path %>/images/bt_edit.gif" class="op_button" />
			<img onclick="del('activitydelete?aid=<s:property value="aid"/>&id=<s:property value="#request.custInfo.id"/>');" title="删除" src="<%=path %>/images/bt_del.gif" class="op_button" />
			
		</td>
	</tr>
	</s:iterator>
	</table>
</body>
</html>