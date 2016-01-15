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
		document.forms[0].action="lostfirstPage";
		document.forms[0].submit();
	}
	function show(next){
		document.forms[0].action="lostnextPage?next="+next;
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
		document.forms[0].action="lostnextPage?next="+num;
		document.forms[0].submit();
	}
</script>
</head>
<body>
<div class="page_title">客户流失管理</div>
<div class="button_bar">
	<button class="common_button" onclick="help('');">帮助</button>
	<button class="common_button" onclick="search()">查询</button>  
</div>
<s:form method="post">
<table class="query_form_table">
	<tr>
		<th>客户</th>
		<td><s:textfield name="lostname" /></td>
		<th>客户经理</th>
		<td><s:textfield name="lostmanager" /></td>
		<th>状态</th>
		<td>
			<s:select name="status" list='#{"预警":"预警","暂缓流失":"暂缓流失","已经流失":"已经流失" }' headerKey="" headerValue=""
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
		<th>客户</th>
		<th>客户经理</th>
		<th>上次下单时间</th>
		<th>确认流失时间</th>
		<th>状态</th>
		<th>操作</th>
	</tr>
	<s:iterator id="lost" value="#request.list">
	<tr>
		<td class="list_data_number"><s:property value="lostid"/></td>
		<td class="list_data_text"><s:property value="lostname"/></td>
		<td class="list_data_text"><s:property value="lostmanager"/></td>
		<td class="list_data_text"><s:date format="yyyy年MM月dd日" name="#lost.lastorderdate"/></td>
		<td class="list_data_text"><s:date format="yyyy年MM月dd日" name="#lost.lostdate"/></td>
		<td class="list_data_text"><s:property value="status"/></td>
		<td class="list_data_op">
			<s:if test='#lost.status == "已经流失"'>
			<img onclick="to('losttoDetail?lostid=<s:property value="lostid"/>');" title="查看" src="<%=path %>/images/bt_detail.gif" class="op_button" />
			</s:if>
			<s:else>
			<img onclick="to('losttoConfirm?lostid=<s:property value="lostid"/>');" title="确认流失" src="<%=path %>/images/bt_confirm.gif" class="op_button" />
			<img onclick="to('losttoDelay?lostid=<s:property value="lostid"/>');" title="暂缓流失" src="<%=path %>/images/bt_relay.gif" class="op_button" />
			<img onclick="to('losttoDetail?lostid=<s:property value="lostid"/>');" title="查看" src="<%=path %>/images/bt_detail.gif" class="op_button" />
			</s:else>
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