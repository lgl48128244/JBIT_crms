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
 <base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css">
<script src="<%=path %>/script/common.js"></script>
<script type="text/javascript">
	function show(next){
		document.forms[0].action="<%=path %>/salesearchNextPage?next="+next;
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
		document.forms[0].action="salesearchNextPage?next="+num;
		document.forms[0].submit();
	}
	function search(){
		document.forms[0].submit();
	}
</script>
</head>
<body>
<div class="page_title">销售机会管理 </div>

 <div class="button_bar">
	<button class="common_button" onclick="to('sale/add.jsp');">新建</button>  
	<button class="common_button" onclick="search();">查询</button>  
 </div>
 <form action="salesearchFirstPage" method="post">
<table class="query_form_table">
	<tr>
		<th>客户名称</th>
		<td><s:textfield name="name"></s:textfield></td>
		<th>概要</th>
		<td><s:textfield name="resume"></s:textfield></td>
		<th>联系人</th>
		<td><s:textfield name="linkMan"></s:textfield></td>
	</tr>
	</table>
</form>
	<br/>
	<table class="data_list_table">
	<tr>
		<th>编号</th>
		<th>客户名称</th>
		<th>概要</th>
		<th>联系人</th>
		<th>联系人电话</th>
		<th>创建时间</th>
		<th>操作</th>
	</tr>
	<s:iterator id="saleChance" value="#request.list">
	<tr>
		<td class="list_data_number"><s:property value="id"/></td>
		<td class="list_data_text"><s:property value="name"/></td>
		<td class="list_data_text"><s:property value="resume"/></td>
		<td class="list_data_text"><s:property value="linkMan"/></td>
		<td class="list_data_text"><s:property value="tel"/></td>
		<td class="list_data_text"><s:date format="yyyy-MM-dd" name="createTime"/></td>
		<td class="list_data_op">
			<img onclick="to('saleappointById?id=<s:property value="id"/>&roleId=5');" title="指派" src="./images/bt_linkman.gif" class="op_button" />
			<img onclick="to('saleselectById?id=<s:property value="id"/>');" title="编辑" src="./images/bt_edit.gif" class="op_button" />
			<img onclick="del('saledelete?id=<s:property value="id"/>');" title="删除" src="./images/bt_del.gif" class="op_button" />
			
		</td>
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