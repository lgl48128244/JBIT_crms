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
<script src="<%=path %>/script/date/WdatePicker.js"></script>
<script type="text/javascript">
	function planAdd(){
		var time = document.getElementById("time").value;
		var planContent = document.getElementById("planContent").value;
		if("" == time){
			alert("日期不能为空");
			return;
		}else if("" == planContent){
			alert("计划项不能为空");
			return;
		}else if(confirm("您确定要保存数据吗？")){
			document.forms['f2'].action="planadd";
			document.forms['f2'].submit();
		}
	}
</script>
</head>
<body>

<div class="page_title">客户开发计划 &gt; 制定计划</div>
<div class="button_bar">
	<button class="common_button" onclick="help('');">帮助</button>
	<button class="common_button" onclick="to('plantoDoPlan?chanceId=<s:property value="#request.chance.id"/>');">执行计划</button>
	<button class="common_button" onclick="back();">返回</button>
</div>
<table class="query_form_table">
	<tr>
		<th>编号</th>
		<td><s:property value="#request.chance.id"/></td>
		<th>机会来源</th>
		<td><s:property value="#request.chance.chanceFrom"/></td>
	</tr>
	<tr>
		<th>客户名称</th>
		<td><s:property value="#request.chance.name"/></td>
		<th>成功机率（%）</th>
		<td><s:property value="#request.chance.probability"/></td>
	</tr>	
	<tr>
		<th>概要</th>
		<td colspan="3"><s:property value="#request.chance.resume"/></td>
	</tr>
	<tr>
		<th>联系人</th>
		<td><s:property value="#request.chance.linkMan"/></td>
		<th>联系人电话</th>
		<td><s:property value="#request.chance.tel"/></td>
	</tr>
	<tr>
		<th>机会描述</th>
		<td colspan="3"><s:property value="#request.chance.chanceDesc"/></td>
	</tr>
	<tr>
		<th>创建人</th>
		<td><s:property value="#request.chance.createMan"/></td>
		<th>创建时间</th>
		<td>
		<s:date format="yyyy-MM-dd" name="#request.chance.createTime"></s:date>
		</td>
	</tr>
	<tr>
		<th>指派给</th>
		<td><s:property value="#request.chance.assignMan"/></td>
		<th>指派时间</th>
		<td><s:date format="yyyy-MM-dd" name="#request.chance.assignTime"></s:date></td>
	</tr>
</table>
<br />
<table class="data_list_table" id="table1">
	<tr>
		<th width="150px">日期</th>
		<th height="31">计划项</th>
		<th height="31">操作</th>
	</tr>
	<s:iterator id="plan" value="#request.planList">
	<tr>
		<td class="list_data_text" height="24"><s:date format="yyyy-MM-dd" name="#plan.time"/></td>
		<td class="list_data_text" height="24"><s:property value="planContent"/></td>
		<td class="list_data_text" height="24">
		<button class="common_button" onclick="del('plandelete?planId=<s:property value="planId"/>&chanceId=<s:property value="#request.chance.id"/>');">删除</button>
		</td>	
	</tr>
	</s:iterator>
</table>

<form name="f2" action="" method="post">
<div class="button_bar">
	<button class="common_button" onclick="planAdd()">保存</button>
</div>
<table class="query_form_table" id="table2">
	<tr>
		<th>日期</th>
		<td><s:textfield id="time" name="time" onClick="WdatePicker()"/><span class="red_star">*</span></td>
		<th>计划项</th>
		<td>
			<s:textfield id="planContent" name="planContent" /><span class="red_star">*</span>
		</td>
		<s:hidden name="chanceId" value="%{#request.chance.id}" />
	</tr>
</table>
</form>
</body>
</html>