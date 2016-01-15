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
	function rept(){
		document.forms[0].action="reptservType";
		document.forms[0].submit();
	}
</script>
</head>
<body>

<div class="page_title">客户服务分析</div>
<div class="button_bar">
	<button class="common_button" onclick="help('');">帮助</button>
	<button class="common_button" onclick="rept()">查询</button> 
	</div>
<s:form method="post">
<table class="query_form_table">
	<tr>
		<th>年份</th>
		<td>
			<select name="year">
				<option value="">全部</option>
				<option value="2013">2013</option>
				<option value="2014">2014</option>
				<option value="2015">2015</option>
				<option value="2016">2016</option>
				<option value="2017">2017</option>
				<option value="2018">2018</option>
				<option value="2019">2019</option>
			</select>
		</td>
		<th>&nbsp;</th>
		<td>
			&nbsp;
		</td>
	</tr>
	</table>
</s:form>
<br />
<table class="data_list_table">
	<tr>
		<th>编号</th>
		<th>条目</th>
		<th>服务数量</th>
	</tr>
	<s:iterator id="serv" value="#request.reptList" status="s">
	<tr>
		<td class="list_data_number"><s:property value="#s.index+1"/></td>
		<td class="list_data_text"><s:property value="type"/></td>
		<td class="list_data_number"><s:property value="sid"/></td>
	</tr>
	</s:iterator>
	</table>
</body>
</html>