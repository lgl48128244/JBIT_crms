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
		document.forms[0].action="reptfirstPage";
		document.forms[0].submit();
	}
	function show(next){
		document.forms[0].action="reptnextPage?next="+next;
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
		document.forms[0].action="reptnextPage?next="+num;
		document.forms[0].submit();
	}
</script>

</head>
<body>

<div class="page_title">客户流失分析</div>
<div class="button_bar">
	<button class="common_button" onclick="back()">返回</button>
	<button class="common_button" onclick="search()">查询</button> 
	</div>
	<s:form>
	<table class="query_form_table" border="0" cellPadding="3" cellSpacing="0">
		<tr>
		<th>客户名称</th>
		<td><s:textfield name="lostname" value=""/></td>
		<th>客户经理</th>
		<td><s:textfield name="lostmanager" value=""/></td>
					
		</tr>
	</table>
</s:form>
		<br />
<table class="data_list_table">
	<tr>
		<th height="28">编号</th>
		<th height="28">年份</th>
		<th height="28">客户</th>
		<th height="28">客户经理</th>
		<th height="28">流失原因</th>
	</tr>
	<s:iterator id="lost" value="#request.list">
	<tr>
		<td class="list_data_number" height="27"><s:property value="lostid"/></td>
		<td class="list_data_text" height="27"><s:date format="yyyy" name="%{#lost.lostdate}" /></td>
		<td class="list_data_text" height="27"><s:property value="lostname"/></td>
		<td class="list_data_text" height="27"><s:property value="lostmanager"/></td>
		<td class="list_data_text" height="27"><s:property value="reason"/></td>
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