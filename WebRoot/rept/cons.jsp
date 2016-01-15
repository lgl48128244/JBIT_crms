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
	function search(){
		document.forms[0].action="reptcustType";
		document.forms[0].submit();
	}
</script>
</head>
<body>

<div class="page_title">客户构成分析</div>
<div class="button_bar">
	<button class="common_button" onclick="help('');">帮助</button>
	<button class="common_button" onclick="search()">查询</button> 
	</div>
<s:form method="post">
<table class="query_form_table">
	<tr>
		<th>报表方式</th>
		<td>
			<select name="type">
				<option value="levelLabel">按等级</option>
				<option value="credit">按信用度</option>
				<option value="satisfy">按满意度</option>
			</select>
		</td>
	<th>&nbsp;</th>
	<td>&nbsp;</td>
	</tr>
</table>
</s:form>
<br />
<table class="data_list_table">
	<tr>
		<th>编号</th>
		<th>等级</th>
		<th>客户数量</th>
	</tr>
	<s:iterator id="rept" value="#request.reptList" status="s">
	<tr>
		<td class="list_data_text"><s:property value="#s.index+1"/></td>
		<td class="list_data_text"><s:property value="levelLabel"/></td>
		<td class="list_data_text"><s:property value="status"/></td>
	</tr>
	</s:iterator>
	</table>
</body>
</html>