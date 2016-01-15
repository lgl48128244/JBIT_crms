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
	function subback(sid){
		if(confirm("确定提交？")){
			document.forms[0].action="serviceback?sid="+sid;
			document.forms[0].submit();
		}
	}
</script>
</head>
<body>

<div class="page_title">客户服务管理 &gt; 反馈服务</div>
<div class="button_bar">
	<button class="common_button" onclick="help()">帮助</button>
	<button class="common_button" onclick="back()">返回</button> 
	<button class="common_button" onclick="subback('<s:property value="#request.service.sid"/>')">保存</button>  
</div>
<s:form method="post">
<table class="query_form_table">
	<tr>
		<th>编号</th>
		<td><s:property value="#request.service.sid"/></td>
		<th>服务类型</th>
		<td><s:property value="#request.service.type"/></td>
	</tr>
	<tr>
		<th>概要</th>
		<td colspan="3"><s:property value="#request.service.title"/></td>
	</tr>	
	<tr>
		<th>客户</th>
		<td><s:property value="#request.service.custname"/></td>
		<th>状态</th>
		<td><s:property value="#request.service.status"/></td>
	</tr>	
	<tr>
		<th>服务请求</th>
		<td colspan="3"><s:property value="#request.service.srequest"/><br>
　</td>
	</tr>
	<tr>
		<th>创建人</th>
		<td><s:property value="#request.service.creater"/></td>
		<th>创建时间</th>
		<td><s:property value="#request.service.createdate"/></td>
	</tr>
	</table>
<br />
<table class="query_form_table" id="table3">
	<tr>
		<th>分配给</th>
		<td><s:property value="#request.service.dueto"/></td>
		<th>分配时间</th>
		<td><s:date format="yyyy年MM月dd日" name="%{#request.service.duetime}"/></td>
	</tr>
</table>
<br />	
<table class="query_form_table" id="table1">
	<tr>
		<th>服务处理</th>
		<td colspan="3"><s:property value="#request.service.sdeal"/></td>
	</tr>
	<tr>
		<th>处理人</th>
		<td><s:property value="#request.service.dealer"/></td>
		<th>处理时间</th>
		<td><s:date format="yyyy年MM月dd日" name="%{#request.service.dealdate}"/></td>
	</tr>
</table>
<br />
<table class="query_form_table" id="table2">
	<tr>
		<th>处理结果</th>
		<td><s:textfield name="sresult" /><span class="red_star">*</span></td>
		<th>满意度</th>
		<td>
			<s:select name="ssatisfy" list='#{"☆☆☆☆☆":"☆☆☆☆☆","☆☆☆☆":"☆☆☆☆","☆☆☆":"☆☆☆","☆☆":"☆☆","☆":"☆" }' headerKey="" headerValue=""
			listKey="key" listValue="value">
			</s:select><span class="red_star">*</span></td>
	</tr>
</table>
</s:form>
</body>
</html>