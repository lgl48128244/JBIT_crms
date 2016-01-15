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

<div class="page_title">销售机会管理&nbsp; &gt; 新建销售机会</div>
<form method="post" action="saleadd">
<div class="button_bar">
	<button class="common_button" onclick="help('');">帮助</button>
	<button class="common_button" onclick="back();">返回</button>
	<button class="common_button" onclick="check()">保存</button>
</div>
<table class="query_form_table">
	<tr>
		<th>编号</th>
		<td><input disabled="disabled" value="系统自动生成"/></td>
		<th>机会来源</th>
		<td><s:textfield id="chanceFrom" name="chanceFrom"/><span class="red_star">*</span></td>
	</tr>
	<tr>
		<th>客户名称</th>
		<td><s:textfield id="name" name="name" /><span class="red_star">*</span></td>
		<th>成功机率</th>
		<td><s:textfield id="probability" name="probability" /><span class="red_star">*</span></td>
	</tr>	
	<tr>
		<th>概要</th>
		<td colspan="3"><s:textfield id="resume" name="resume" /><span class="red_star">*</span></td>
	</tr>
	<tr>
		<th>联系人</th>
		<td><s:textfield id="linkMan" name="linkMan" /><span class="red_star">*</span></td>
		<th>联系人电话</th>
		<td><s:textfield id="tel" name="tel" /><span class="red_star">*</span></td>
	</tr>
	<tr>
		<th>机会描述</th>
		<td colspan="3"><s:textarea id="chanceDesc" name="chanceDesc"></s:textarea><span class="red_star">*</span></td>
	</tr>
	<tr>
		<th>创建人</th>
		<td><s:textfield name="createMan" value="%{#session.user.realName}" readonly="true"/></td>
		<th></th>
		<td></td>
	</tr>
</table>
</form>
</body>
</html>