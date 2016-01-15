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
</head>
<body>

<div class="page_title">客户开发计划 &gt; 执行计划</div>
<div class="button_bar">
	<button class="common_button" onclick="help('');">帮助</button>
	<button class="common_button" onclick="alert('开发失败，已归档。');window.location.href='planupdateFail?chanceId=<s:property value="#request.chance.id"/>';">终止开发</button>
	<button class="common_button" onclick="back();">返回</button>
	<button class="common_button" onclick="to('plantoAdd?chanceId=<s:property value="#request.chance.id"/>');">制定计划</button>
	<button class="common_button" onclick="alert('用户开发成功，已添加新客户记录。');window.location.href='planupdateSuccess?chanceId=<s:property value="#request.chance.id"/>';">开发成功</button>

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
		<th width="10%">日期</th>
		<th width="30%">计划</th>
		<th width="30%">操作</th>
		<th width="30%">执行效果</th>
	</tr>
	<s:iterator id="plan" value="#request.planList">
	<tr>
		<td class="list_data_text" height="24"><s:date format="yyyy-MM-dd" name="#plan.time"/></td>
		<td class="list_data_text" height="24"><s:property value="planContent"/></td>
			<s:form action="planupdate" method="post">
				<td class="list_data_text"><s:textfield name="result" />
				<s:hidden name="planId" value="%{#plan.planId}"/>
				<s:hidden name="chanceId" value="%{#request.chance.id}"/>
				<input type="submit" value="保存"/>
				</td>
			</s:form>
		<td class="list_data_text" height="24"><s:property value="result"/></td>	
	</tr>
	</s:iterator>
	</table>
</body>
</html>