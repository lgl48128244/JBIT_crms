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
 function total(){
 	var t1 = document.getElementById("dtl");
 	var tm = document.getElementById("money");
 	var rows = t1.rows;
 	var sum = 0;
 	for(var i=1;i<rows.length;i++){
 		var cells = rows[i].cells;
 		var cell = cells[4].innerHTML;
 		sum += Number(cell);
 	}
 	tm.innerHTML = sum;
 }
</script>
</head>
<body onload="total()">

<div class="page_title">客户信息管理 &gt; 客户信息 &gt; 历史订单 &gt; 订单明细 </div>
<div class="button_bar">
	<button class="common_button" onclick="help('');">帮助</button>
	<button class="common_button" onclick="back();">返回</button>  
</div>
<table class="query_form_table" height="59">
	<tr>
		<th>订单编号</th>
		<td><s:property value="#request.orders.oid"/></td>
		<th>日期</th>
		<td><s:date format="yyyy年MM月dd日" name="#request.orders.odate"/></td>
	</tr>
	<tr>
		<th height="28">送货地址</th>
		<td><s:property value="#request.orders.address"/></td>
		<th height="28">总金额（元）</th>
		<td id="money">55200</td>
	</tr>
	<tr>
		<th height="28">状态</th>
		<td>
		<s:if test="#request.orders.status==0">未回款</s:if>
		<s:elseif test="#request.orders.status==1">已回款</s:elseif>
		</td>
		<th height="28">&nbsp;</th>
		<td>&nbsp;</td>
	</tr>
	</table>
<br />
<table class="data_list_table" id="dtl">
	<tr>
		<th>商品</th>
		<th>数量</th>
		<th>单位</th>
		<th>单价（元）</th>
		<th>金额（元）</th>
	</tr>
	<s:iterator id="detail" value="#request.detail">
	<s:iterator id="prod" value="#request.plist">
		<s:if test="#detail.prodid == #prod.id">
	<tr>
		<td class="list_data_text"><s:property value="#prod.name"/></td>
		<td class="list_data_text"><s:property value="#detail.count"/></td>
		<td class="list_data_text"><s:property value="#detail.unit"/></td>
		<td class="list_data_text"><s:property value="#prod.price"/></td>
		<td class="list_data_text"><s:property value="#detail.total"/></td>
	</tr>
		</s:if>
		</s:iterator>
	</s:iterator>
	</table>
</body>
</html>