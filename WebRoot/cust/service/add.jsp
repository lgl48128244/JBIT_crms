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
	function adds(){
		var type = document.getElementById("type").value;
		var title = document.getElementById("title").value;
		var custno = document.getElementById("custno").value;
		var custname = document.getElementById("custname").value;
		var srequest = document.getElementById("srequest").value;
		if("" == type){
			alert("服务类型不能为空");
			return;
		}else if("" == title){
			alert("概要不能为空");
			return;
		}else if("" == custno){
			alert("客户编号不能为空");
			return;
		}else if("" == custname){
			alert("客户名称不能为空");
			return;
		}else if("" == srequest){
			alert("服务请求不能为空");
			return;
		}else if(confirm("您确定要保存数据吗？")){
			alert("添加成功");
			document.forms[0].action="<%=path %>/serviceadd";
			document.forms[0].submit();
		}
	}
</script>
</head>
<body>

<div class="page_title">客户服务管理 > 服务创建</div>
<div class="button_bar">
	<button class="common_button" onclick="help('');">帮助</button>
	<button class="common_button" onclick="adds()">保存</button>  
</div>
<s:form method="post">
<table class="query_form_table">
	<tr>
		<th>编号</th>
		<td><s:textfield value="自动生成" disabled="true"></s:textfield></td>
		<th>服务类型</th>
		<td>
			<s:select id="type" name="type" list='#{"咨询":"咨询","投诉":"投诉","建议":"建议" }' headerKey="" headerValue=""
			listKey="key" listValue="value">
			</s:select><span class="red_star">*</span>
		</td>
	</tr>
	<tr>
		<th>概要</th>
		<td><s:textfield id="title" name="title"  /><span class="red_star">*</span></td>
		<th>客户编号</th>
		<td><s:textfield id="custno" name="custno"  /><span class="red_star">*</span></td>
	</tr>	
	<tr>
		<th>客户名称</th>
		<td><s:textfield id="custname" name="custname"  /><span class="red_star">*</span></td>
		<th>状态</th>
		<td>新创建</td>
	</tr>	
	<tr>
		<th>服务请求</th>
		<td colspan="3"><s:textarea id="srequest" name="srequest" rows="6" cols="50"/><span class="red_star">*</span></td>
	</tr>
	<tr>
		<th>创建人</th>
		<td><s:textfield name="creater" readonly="true" value="%{#session.user.realName}"/><span class="red_star">*</span></td>
		<th>创建时间</th>
		<td><s:textfield id="t1" name="createdate" readonly="true" /><span class="red_star">*</span></td>
	</tr>
	</table>
</s:form>
<br />
<table disabled class="query_form_table" id="table3">
	<tr>
		<th>分配给</th>
		<td>
			<select>
				<option>请选择...</option>
				<option>小明</option>
				<option>旺财</option>
				<option>球球</option>
				<option>孙小美</option>
				<option>周洁轮</option>
			</select> <span class="red_star">*</span></td>
		<th>分配时间</th>
		<td><input id="t2" name="T18" readonly size="20" /><span class="red_star">*</span></td>
	</tr>
</table>
<br />	
<table disabled class="query_form_table" id="table1">
	<tr>
		<th>服务处理</th>
		<td colspan="3"><textarea rows="6" cols="50"></textarea><span class="red_star">*</span></td>
	</tr>
	<tr>
		<th>处理人</th>
		<td><input name="T17" value="刘颖" readonly size="20" /><span class="red_star">*</span></td>
		<th>处理时间</th>
		<td><input id="t3" name="T16" readonly size="20" /><span class="red_star">*</span></td>
	</tr>
</table>
<br />
<table disabled class="query_form_table" id="table2">
	<tr>
		<th>处理结果</th>
		<td><input name="T10" size="20" /><span class="red_star">*</span></td>
		<th>满意度</th>
		<td>
			<select name="D1">
				<option>请选择...</option>
				<option>☆☆☆☆☆</option>
				<option>☆☆☆☆</option>
				<option>☆☆☆</option>
				<option>☆☆</option>
				<option>☆</option>
			</select><span class="red_star">*</span></td>
	</tr>
</table>
<script>
	setCurTime('t1');
	setCurTime('t2');
	setCurTime('t3');
</script>
</body>
</html>