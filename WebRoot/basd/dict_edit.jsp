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
<link href="/crms/css/style.css" rel="stylesheet" type="text/css">
<script src="./script/common.js"></script>
<script type="text/javascript">
	function update(){
		var type = document.getElementById("type").value;
		var item = document.getElementById("item").value;
		var value = document.getElementById("value").value;

		if("" == type){
			alert("类别不能为空");
			return;
		}else if("" == item){
			alert("条目不能为空");
			return;
		}else if("" == value){
			alert("值不能为空");
			return;
		}else if(confirm("您确定要保存数据吗？")){
			document.forms[0].action="dictionaryupdate";
			document.forms[0].submit();
		}
	}
	function isEdit(){
		var isEdit = document.getElementById("isEdit");
		if(isEdit.value == false){
			isEdit.fieldValue="0"; 
		}
	}
	function load(){
		document.getElementById("dict_type").value='${dict.dict_type}';
	}
</script>
</head>
<body onload="load()">

<div class="page_title">数据字典管理 > 编辑数据字典条目</div>
<div class="button_bar">
	<button class="common_button" onclick="help('');">帮助</button>
	<button class="common_button" onclick="back();">返回</button>
	<button class="common_button" onclick="update()">保存</button>  
</div>
<form action="" method="post">
<table class="query_form_table">
	<tr>
		<th>编号</th>
		<td><s:textfield name="dict_id"  value="%{#request.dict.dict_id}" readonly="true"></s:textfield></td>
		<th>类别</th>
		<td>
		<s:select id="type" name="dict_type" list="#request.list" listKey="dict_type" listValue="dict_type"></s:select>
		<span class="red_star">*</span></td>
	</tr>
	<tr>
		<th>条目</th>
		<td><s:textfield id="item" name="dict_item" value="%{#request.dict.dict_item}"></s:textfield><span class="red_star">*</span></td>
		<th>值</th>
		<td><s:textfield id="value" name="dict_value" value="%{#request.dict.dict_value}"></s:textfield><span class="red_star">*</span></td>
	</tr>	
	<tr>
		<th>是否可编辑</th>
		<td><s:checkbox id="isEdit" name="dictisEdit" value="true"></s:checkbox></td>
		<th>&nbsp;</th>
		<td>&nbsp;</td>
	</tr>
</table>
</form>
</body>
</html>