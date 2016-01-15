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
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css">
<script src="./script/common.js"></script>
<script type="text/javascript">
	function search(){
		document.forms[0].action="dictionaryfirstPage";
		document.forms[0].submit();
	}
	
	function show(next){
		document.forms[0].action="dictionarynextPage?next="+next;
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
		document.forms[0].action="dictionarynextPage?next="+num;
		document.forms[0].submit();
	}
</script>
</head>
<body>

<div class="page_title">数据字典管理</div>
<div class="button_bar">
	<button class="common_button" onclick="help('');">帮助</button>
	<button class="common_button" onclick="to('dictionarytoAdd');">新建</button>
	<button class="common_button" onclick="search()">查询</button>  
</div>
<form method="post">
<table class="query_form_table">
	<tr>
		<th>类别</th>
		<td><s:textfield name="dict_type"></s:textfield></td>
		<th>条目</th>
		<td><s:textfield name="dict_item"></s:textfield></td>
		<th>值</th>
		<td><s:textfield name="dict_value"></s:textfield></td>
	</tr>
</table>
</form>
<br />
<table class="data_list_table">
	<tr>
		<th>编号</th>
		<th>类别</th>
		<th>条目</th>
		<th>值</th>
		<th>是否可编辑</th>
		<th>操作</th>
	</tr>
	<s:iterator id="dictionary" value="#request.list">
	<tr>
		<td class="list_data_number"><s:property value="dict_id"/></td>
		<td class="list_data_text"><s:property value="dict_type"/></td>
		<td class="list_data_text"><s:property value="dict_item"/></td>
		<td class="list_data_text"><s:property value="dict_value"/></td>
		<td class="list_data_text">
			<s:if test="#dictionary.dict_isEdit == 1">是</s:if>
			<s:elseif test="#dictionary.dict_isEdit == 0">否</s:elseif>
		</td>
		
		<td class="list_data_op">
			<s:if test="#dictionary.dict_isEdit == 1">
			<img onclick="to('dictionarytoedit?dict_id=<s:property value="dict_id"/>');" title="编辑" src="./images/bt_edit.gif" class="op_button" />
			<img onclick="del('dictionarydelete?dict_id=<s:property value="dict_id"/>');" title="删除" src="./images/bt_del.gif" class="op_button" />
			</s:if>
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