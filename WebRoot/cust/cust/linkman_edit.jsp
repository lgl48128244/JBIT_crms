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
<script type="text/javascript">
	function load(){
		document.getElementById("sex").value='${linkman.sex}';
	}
	function update(){
		document.forms[0].action="linkmanupdate";
		document.forms[0].submit();
	}
</script>
</head>
<body onload="load()">

<div class="page_title">客户信息管理 > 客户信息 > 联系人 > 编辑联系人</div>
<div class="button_bar">
	<button class="common_button" onclick="help('');">帮助</button>
	<button class="common_button" onclick="back();">返回</button>
	<button class="common_button" onclick="update()">保存</button>  
</div>
<s:form method="post">
<table class="query_form_table">
	<tr>
		<th>姓名</th>
		<td><s:textfield name="name" value="%{#request.linkman.name}"/><span class="red_star">*</span></td>
		<th>性别</th>
		<td>
			<s:select id="sex" name="sex" list="#{'男':'男','女':'女' }" headerKey="" headerValue="" listKey="key" listValue="value">
		</s:select>
		</td>
	</tr>
	<tr>
		<th>职位</th>
		<td><s:textfield name="position" value="%{#request.linkman.position}"/><span class="red_star">*</span></td>
		<th>办公电话</th>
		<td><s:textfield name="tel" value="%{#request.linkman.tel}"/><span class="red_star">*</span></td>
	</tr>	
	<tr>
		<th>手机</th>
		<td><s:textfield name="mobile" value="%{#request.linkman.mobile}"/></td>
		<th>备注</th>
		<td><s:textfield name="remark" value="%{#request.linkman.remark}"/></td>
	</tr>
</table>
<s:hidden name="custno" value="%{#request.custInfo.custno}"/>
<s:hidden name="custname" value="%{#request.custInfo.name}"/>
<s:hidden name="id" value="%{#request.custInfo.id}"/>
<s:hidden name="lid" value="%{#request.linkman.lid}"/>
</s:form>
</body>
</html>