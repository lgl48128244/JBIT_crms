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
		document.forms[0].action="custfirstPage";
		document.forms[0].submit();
	}
	function show(next){
		document.forms[0].action="custnextPage?next="+next;
		document.forms[0].submit();
	}
	function jumpto(totalPage){
		var num = document.getElementById("jump").value;
		var reg =/^[1-9]\d*$/;
		if(!reg.test(num)){
			alert("请输入正确的数字");
			return;
		}else if((num*1) > totalPage){
			alert("数字不能大于总页数");
			return;
		}
		document.forms[0].action="custnextPage?next="+num;
		document.forms[0].submit();
	}
</script>
</head>
<body>

<div class="page_title">客户信息管理</div>
<div class="button_bar">
	<button class="common_button" onclick="help('');">帮助</button>
	<button class="common_button" onclick="search()">查询</button>  
</div>
<form action="" method="post">
<table class="query_form_table">
	<tr>
		<th>客户编号</th>
		<td><s:textfield name="custno"></s:textfield></td>
		<th>名称</th>
		<td><s:textfield name="name"></s:textfield></td>
		<th>地区</th>
		<td>
		<s:select name="region" list="#request.regionList" headerKey="" headerValue="" listKey="dict_item" listValue="dict_item">
		</s:select>
		</td>
	</tr>
	<tr>
		<th>客户经理</th>
		<td><s:textfield name="custManager"></s:textfield></td>
		<th>客户等级</th>
		<td>
		<s:select name="levelLabel" list="#request.levelList" headerKey="" headerValue="" listKey="dict_item" listValue="dict_item">
		</s:select>
		</td>
		<th>　</th>
		<td>　</td>
	</tr>
</table>
</form>
<br />
<table class="data_list_table">
	<tr>
		<th>序号</th>
		<th>客户编号</th>
		<th>名称</th>
		<th>地区</th>
		<th>客户经理</th>
		<th>客户等级</th>
		<th>操作</th>
	</tr>
	<s:iterator id="cuct" value="#request.list">
	<tr>
		<td class="list_data_number"><s:property value="id"/></td>
		<td class="list_data_text"><s:property value="custno"/></td>
		<td class="list_data_text"><s:property value="name"/></td>
		<td class="list_data_text"><s:property value="region"/></td>
		<td class="list_data_text"><s:property value="custManager"/></td>
		<td class="list_data_text"><s:property value="levelLabel"/></td>
		<td class="list_data_op">
			<img onclick="to('custtoEdit?id=<s:property value="id"/>')" title="编辑" src="<%=path %>/images/bt_edit.gif" class="op_button" />
			<img onclick="to('linkmanselectAll?id=<s:property value="id"/>');" title="联系人" src="<%=path %>/images/bt_linkman.gif" class="op_button" />
			<img onclick="to('activityselectAll?id=<s:property value="id"/>');" title="交往记录" src="<%=path %>/images/bt_acti.gif" class="op_button" />
			<img onclick="to('ordersfirstPage?id=<s:property value="id"/>');" title="历史订单" src="<%=path %>/images/bt_orders.gif" class="op_button" />
			
			<img onclick="del('custdelete?id=<s:property value="id"/>');" title="删除" src="<%=path %>/images/bt_del.gif" class="op_button" />
			
		</td>
	</tr>
	</s:iterator>
	<tr>
		<th colspan="100" class="pager">
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
	转到<input id="jump" value="" size="2" />页
	<button onclick="jumpto('<s:property value="#request.totalPage"/>')">GO</button>
	</div>
	</th>
	</tr>
</table>
<s:property value="#request.mess"/>
</body>
</html>