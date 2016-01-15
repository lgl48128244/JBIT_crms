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
<script src="<%=path %>/script/date/WdatePicker.js"></script>
<script type="text/javascript">
	function add(){
		document.forms[0].action="activityadd";
		document.forms[0].submit();
	}
</script>
</head>
<body>

<div class="page_title">客户信息管理 > 客户信息 > 交往记录 > 新建交往记录</div>
<div class="button_bar">
	<button class="common_button" onclick="help()">帮助</button>
	<button class="common_button" onclick="back()">返回</button>
	<button class="common_button" onclick="add()">保存</button>  
</div>
<s:form method="post">
<table class="query_form_table">
	<tr>
		<th>时间</th>
		<td><s:textfield name="actdate" onClick="WdatePicker()"/><span class="red_star">*</span></td>
		<th>地点</th>
		<td><s:textfield name="place" /><span class="red_star">*</span></td>
	</tr>
	<tr>
		<th>概要</th>
		<td><s:textfield name="title" /><span class="red_star">*</span></td>
		<th>备注</th>
		<td><s:textfield name="remark" /></td>
	</tr>	
	<tr>
		<th>详细信息</th>
		<td colspan="3">
			<s:textarea name="actdesc" cols="50" rows="6"></s:textarea>
		</td>
	</tr>
</table>
<s:hidden name="custno" value="%{#request.custInfo.custno}"/>
<s:hidden name="custname" value="%{#request.custInfo.name}"/>
<s:hidden name="id" value="%{#request.custInfo.id}"/>
</s:form>
</body>
</html>