<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
<title>JAVA学士后毕业设计项目</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css">
<script src="<%=path %>/script/common.js"></script>
<script type="text/javascript">
	function check(){
		var proreg = /^[1-9]\d?0?$/;
		var telreg = /^\d{3,4}-?\d{7,8}$/;
		var chanceFrom = document.getElementById("chanceFrom").value;
		var name = document.getElementById("name").value;
		var probability = document.getElementById("probability").value;
		var resume = document.getElementById("resume").value;
		var linkMan = document.getElementById("linkMan").value;
		var tel = document.getElementById("tel").value;
		var chanceDesc = document.getElementById("chanceDesc").value;
		if("" == chanceFrom){
			alert("机会来源不能为空");
			return;
		}else if("" == name){
			alert("客户名称不能为空");
			return;
		}else if(!proreg.test(probability)){
			alert("请为成功概率输入正确的数字（0-100）");
			return;
		}else if("" == resume){
			alert("概要不能为空");
			return;
		}else if("" == linkMan){
			alert("联系人不能为空");
			return;
		}else if(!telreg.test(tel)){
			alert("请输入正确的电话号码");
			return;
		}else if("" == chanceDesc){
			alert("机会描述不能为空");
			return;
		}else if(confirm("您确定要保存数据吗？")){
			document.forms[0].submit();
		}
		
	}
</script>
</head>
<body>

<div class="page_title">销售机会管理&nbsp; &gt; 编辑销售机会</div>
<form method="post" action="saleupdate">
<div class="button_bar">
	<button class="common_button" onclick="help('');">帮助</button>
	<button class="common_button" onclick="back();">返回</button>
	<button class="common_button" onclick="check()">保存</button>
</div>
<table class="query_form_table">
	<tr>
		<th>编号</th>
		<td><input readonly name="id" value="<s:property value="#request.saleChance.id"/>"/></td>
		<th>机会来源</th>
		<td>
			<input id="chanceFrom" name="chanceFrom" size="20" value="<s:property value="#request.saleChance.chanceFrom"/>"/><span class="red_star">*</span></td>
	</tr>
	<tr>
		<th>客户名称</th>
		<td><input id="name" name="name" value="<s:property value="#request.saleChance.name"/>"/><span class="red_star">*</span></td>
		<th>成功机率</th>
		<td><input id="probability" name="probability" value="<s:property value="#request.saleChance.probability"/>"/><span class="red_star">*</span></td>
	</tr>	
	<tr>
		<th>概要</th>
		<td colspan="3"><input id="resume" name="resume" size="52" value="<s:property value="#request.saleChance.resume"/>"/><span class="red_star">*</span></td>
	</tr>
	<tr>
		<th>联系人</th>
		<td><input id="linkMan" name="linkMan" size="20" value="<s:property value="#request.saleChance.linkMan"/>"/><span class="red_star">*</span></td>
		<th>联系人电话</th>
		<td><input id="tel" name="tel" size="20" value="<s:property value="#request.saleChance.tel"/>"/><span class="red_star">*</span></td>
	</tr>
	<tr>
		<th>机会描述</th>
		<td colspan="3"><textarea id="chanceDesc" rows="6" cols="50" name="chanceDesc"><s:property value="#request.saleChance.chanceDesc"/></textarea><span class="red_star">*</span></td>
	</tr>
	<tr>
		<th>创建人</th>
		<td><input name="createMan" value="<s:property value="#request.saleChance.createMan"/>" readonly size="20" /></td>
		<th>创建时间</th>
		<td><input name="createTime" value="<s:date format="yyyy年MM月dd日" name="%{#request.saleChance.createTime}"/>" readonly size="20" /></td>
	</tr>
</table>
</form>
<br />
<table disabled class="query_form_table" id="table1">
	<tr>
		<th>指派给</th>
		<td>
			<select name="D1">
				<option>请选择...</option>
			</select> </td>
		<th>指派时间</th>
		<td>
			<input id="t1" name="T20" readonly size="20" /></td>
	</tr>
</table>
<script>
	setCurTime('t1');
</script>
</body>
</html>