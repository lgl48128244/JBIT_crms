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
	function show(next){
		document.forms[0].action="<%=path %>/ordersnextPage?next="+next;
		document.forms[0].submit();
	}
	function jumpto(totalPage){
		var num = document.getElementById("jump").value;
		var reg =/^[1-9]\d*$/;
		if(!reg.test(num)){
			alert("请输入正确的数字");
			return;
		}else if(totalPage < (num*1)){
			alert("数字不能大于总页数");
			return;
		}
		document.forms[0].action="ordersnextPage?next="+num;
		document.forms[0].submit();
	}
</script>
</head>
<body>
<div class="page_title">客户信息管理 > 客户信息 > 历史订单 </div>
<div class="button_bar">
	<button class="common_button" onclick="help()">帮助</button>  
	<button class="common_button" onclick="back()">返回</button>  
</div>
<s:form method="post">
<table class="query_form_table">
	<tr>
		<th>客户编号</th>
		<td><s:property value="#request.custInfo.custno"/></td>
		<th>客户名称</th>
		<td><s:property value="#request.custInfo.name"/></td>
	</tr>
	<s:hidden name="id" value="%{#request.custInfo.id}"/>
</table>
</s:form>
<br />
<table class="data_list_table">
	<tr>
		<th>订单编号</th>
		<th>日期</th>
		<th>送货地址</th>
		<th>状态</th>
		<th>操作</th>
	</tr>
	<s:iterator id="orders" value="#request.list">
	<tr>
		<td class="list_data_text"><s:property value="oid"/></td>
		<td class="list_data_text"><s:property value="odate"/></td>
		<td class="list_data_text"><s:property value="address"/></td>
		<td class="list_data_text">
		<s:if test="#orders.status==0">未回款</s:if>
		<s:elseif test="#orders.status==1">已回款</s:elseif>
		</td>
		<td class="list_data_op">
			<img onclick="to('ordersdetail?oid=<s:property value="oid"/>');" title="查看明细" src="<%=path %>/images/bt_detail.gif" class="op_button" /></td>
	</tr>
	</s:iterator>
		<tr>
		<th colspan="7" class="pager">

<div class="pager">

	共<s:property value="#request.total"/>条记录
	第<s:property value="#request.currentPage"/>页/共<s:property value="#request.totalPage"/>页
	<s:if test="#request.currentPage > 1">
	<a href="javascript:show('1')">第一页</a>
	<a href="javascript:show('<s:property value="#request.currentPage -1"/>')">上一页</a>
	</s:if>
	<s:if test="#request.totalPage > #request.currentPage">
	<a href="javascript:show('<s:property value="#request.currentPage +1"/>')">下一页</a>
	<a href="javascript:show('<s:property value="#request.totalPage"/>')">最后一页</a>
	</s:if>
	转到<input id="jump" size="1" />页
	<button onclick="jumpto('<s:property value="#request.totalPage"/>')">GO</button>
	</div>
	</th>
	</tr>
</table>
<s:property value="#request.mess"/>
</body>
</html>