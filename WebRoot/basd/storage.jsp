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
function search(){
	document.forms[0].action="storagefirstPage";
	document.forms[0].submit();
}
function show(next){
		document.forms[0].action="storagenextPage?next="+next;
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
		document.forms[0].action="storagenextPage?next="+num;
		document.forms[0].submit();
	}
</script>
</head>
<body>

<div class="page_title">产品查询</div>
<div class="button_bar">
	<button class="common_button" onclick="help('');">帮助</button>
	<button class="common_button" onclick="search()">查询</button>  
</div>
<form action="" method="post">
<table class="query_form_table">
	<tr>
		<th>产品</th>
		<td><s:textfield name="prod_name"></s:textfield></td>
		<th>仓库</th>
		<td><s:textfield name="ware_house"></s:textfield></td>
	</tr>
</table>
</form>
<br />
<table class="data_list_table">
	<tr>
		<th>序号</th>
		<th>产品</th>
		<th>仓库</th>
		<th>货位</th>
		<th>件数</th>
		<th>备注</th>
	</tr>
	<s:iterator id="stor" value="#request.list">
	<tr>
		<td class="list_data_text"><s:property value="#stor.id"/></td>
		<td class="list_data_text"><s:property value="#stor.prod_name"/></td>
		<td class="list_data_text"><s:property value="#stor.ware_house"/></td>
		<td class="list_data_text"><s:property value="#stor.ware"/></td>
		<td class="list_data_text"><s:property value="#stor.count"/></td>
		<td class="list_data_text"><s:property value="#stor.remark"/></td>		
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