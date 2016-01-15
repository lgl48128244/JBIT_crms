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
		document.forms[0].action = "reptcustTotal";
		document.forms[0].submit();
	}
</script>
</head>
<body>

<div class="page_title">客户贡献分析</div>
<div class="button_bar">
	<button class="common_button" onclick="help('');">帮助</button>
	<button class="common_button" onclick="search()">查询</button> 
	</div>
	<s:form method="post">
<table class="query_form_table">
	<tr>
		<th>客户名称</th>
		<td><s:textfield name="cust" /></td>
		<th>年份</th>
		<td>
			<s:select name="year" list='#{"2012":"2012","2013":"2013","2014":"2014","2015":"2015","2016":"2016","2017":"2017","2018":"2018" }' headerKey="" headerValue=""
			listKey="key" listValue="value">
			</s:select>
		</td>
	</tr>
	</table>
</s:form>
<br />
<table class="data_list_table">
	<tr>
		<th>编号</th>
		<th>客户名称</th>
		<th>订单金额（元）</th>
	</tr>
	<s:iterator id="total" value="#request.orderList" status="s">
	<tr>
		<td class="list_data_number"><s:property value="#s.index+1"/></td>
		<td class="list_data_text"><s:property value="#total.custname"/></td>
		<td class="list_data_text"><s:property value="#total.status"/></td>
	</tr>
	</s:iterator>
</table>
</body>
</html>