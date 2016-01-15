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
		document.forms[0].action="servicefirstPage";
		document.forms[0].submit();
	}
	function show(next){
		document.forms[0].action="<%=path %>/servicenextPage?next="+next;
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
		document.forms[0].action="<%=path %>/servicenextPage?next="+num;
		document.forms[0].submit();
	}
	
	function dispatch(sid){
		if(confirm("确定分配？")){
			var sl = document.getElementById("s"+sid);
			var hd = document.getElementById("duer");
			hd.value = sl.value;
			document.forms['f2'].action="servicedispatch?sid="+sid;
			document.forms['f2'].submit();
		}
	}
</script>
</head>
<body>

<div class="page_title">客户服务管理  / 服务处理</div>
<div class="button_bar">
	<button class="common_button" onclick="help()">帮助</button>
	<button class="common_button" onclick="search()">查询</button>  
</div>
<s:form method="post">
<table class="query_form_table" height="53">
	<tr>
		<th height="28">客户名称</th>
		<td><s:textfield name="custname"/></td>
		<th height="28">概要</th>
		<td><s:textfield name="title"/></td>
		<th height="28">服务类型</th>
		<td>
			<s:select name="type" list='#{"咨询":"咨询","投诉":"投诉","建议":"建议" }' headerKey="" headerValue=""
			listKey="key" listValue="value">
			</s:select>
		</td>
	</tr>
	<tr>
		<th height="22">创建日期</th>
		<td><s:textfield name="createdate" value=""/></td>
		<th height="22">状态</th>
		<td>
			<s:select name="status" list='#{"新创建":"新创建","已分配":"已分配","已处理":"已处理","已归档":"已归档" }' headerKey="" headerValue=""
			listKey="key" listValue="value">
			</s:select>
		</td>
	</tr>
</table>
</s:form>
<br />
<s:form name="f2" method="post">
<s:hidden name="duer" id="duer"></s:hidden>
<table class="data_list_table">
	<tr>
		<th width="">编号</th>
		<th width="15%">客户名称</th>
		<th width="20%">概要</th>
		<th width="6%">服务类型</th>
		<th>创建人</th>
		<th>创建日期</th>
		<th>状态</th>
		<th>分配给</th>
		<th>操作</th>
	</tr>
	<s:iterator id="service" value="#request.list">
	<tr>
		<td class="list_data_number"><s:property value="sid"/></td>
		<td class="list_data_text"><s:property value="custname"/></td>
		<td class="list_data_text"><s:property value="title"/></td>
		<td class="list_data_text"><s:property value="type"/></td>
		<td class="list_data_text"><s:property value="creater"/></td>
		<td class="list_data_text"><s:property value="createdate"/></td>
		<td class="list_data_text"><s:property value="status"/></td>
		<td class="list_data_text">
			<s:if test='#service.status == "新创建"'>
				<s:select name="s%{#service.sid}" id='s%{#service.sid}' list="#request.ulist"  listKey="realName" listValue="realName"></s:select>
				<button class="common_button" onclick="dispatch('<s:property value="sid"/>');">分配</button> 
			</s:if>
			<s:else>
			<s:property value="dueto"/>
			</s:else> 
		</td>
		<td class="list_data_op">
			<s:if test='#service.status == "已分配"'>
			<img onclick="to('servicetoDeal?sid=<s:property value="sid"/>');" title="服务处理" src="<%=path %>/images/bt_deal.gif" class="op_button" />  
			</s:if>
			<s:elseif test='#service.status == "已处理"'>
			<img onclick="to('servicetoBack?sid=<s:property value="sid"/>');" title="反馈处理" src="<%=path %>/images/bt_feedback.gif" class="op_button" />
			</s:elseif>
			<s:elseif test='#service.status == "已归档"'>
			<img onclick="to('servicetoDetail?sid=<s:property value="sid"/>');" title="查看" src="<%=path %>/images/bt_detail.gif" class="op_button" />
			<img onclick="del('servicedelete?sid=<s:property value="sid"/>');" title="删除" src="<%=path %>/images/bt_del.gif" class="op_button" />	
			</s:elseif>
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
</s:form>
<s:property value="#request.mess"/>
</body>
</html>