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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="./css/style.css" rel="stylesheet" type="text/css">
<script src="./script/common.js"></script>
<script type="text/javascript">
function dis(){
	//document.getElementById("assignMan").value=<s:property value="#request.saleChance.assignMan"/>;
	document.getElementById("assignMan").value='${saleChance.assignMan}'; //EL表达式必须加单引号
}
</script>
</head>
<body onload="dis()">
<div class="page_title">销售机会管理&nbsp; &gt; 指派销售机会</div>
<form method="post" action="saleupdate">
<div class="button_bar">
	<button class="common_button" onclick="help('')">帮助</button>
	<button class="common_button" onclick="back()">返回</button>
	<input type="submit" value="保存"/>
</div>
<table class="query_form_table">
	<tr>
		<th>编号</th>
		<td><input readonly name="id" value="<s:property value="#request.saleChance.id"/>"/></td>
		<th>机会来源</th>
		<td><input readonly name="chanceFrom" value="<s:property value="#request.saleChance.chanceFrom"/>"/></td>
	</tr>
	<tr>
		<th>客户名称</th>
		<td><input readonly name="name" value="<s:property value="#request.saleChance.name"/>"/></td>
		<th>成功机率（%）</th>
		<td><input readonly name="probability" value="<s:property value="#request.saleChance.probability"/>"/></td>
	</tr>	
	<tr>
		<th>概要</th>
		<td colspan="3"><input readonly name="resume" value="<s:property value="#request.saleChance.resume"/>"/></td>
	</tr>
	<tr>
		<th>联系人</th>
		<td><input readonly name="linkMan" value="<s:property value="#request.saleChance.linkMan"/>"/></td>
		<th>联系人电话</th>
		<td><input readonly name="tel" value="<s:property value="#request.saleChance.tel"/>"/></td>
	</tr>
	<tr>
		<th>机会描述</th>
		<td colspan="3"><input readonly name="ChanceDesc" value="<s:property value="#request.saleChance.ChanceDesc"/>"/></td>
	</tr>
	<tr>
		<th>创建人</th>
		<td><input readonly name="createMan" value="<s:property value="#request.saleChance.createMan"/>"/></td>
		<th>创建时间</th>
		<td><input readonly name="createTime" value="<s:date format="yyyy-MM-dd" name="#request.saleChance.createTime"/>"/></td>
	</tr>
</table>
<br />
<table class="query_form_table" id="table1">
	<tr>
		<th>指派给</th>
		<td>
			<s:select id="assignMan" name="assignMan" list="#request.roleList" headerKey="未指派" headerValue="未指派" listKey="realName" listValue="realName">
			</s:select><span class="red_star">*</span>
		</td>
		<th></th>
		<td></td>
	</tr>
</table>
</form>
</body>
</html>