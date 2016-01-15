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
	function update(){
		var reason = document.getElementById("reason").value;
		if("" == reason){
			alert("流失原因不能为空");
			return;
		}else if(confirm("您确定要保存数据吗？")){
			document.forms[0].action="lostconfirm";
			document.forms[0].submit();
		}
	}
</script>
</head>
<body>

<div class="page_title">客户流失管理 &gt; 确认流失</div>
<div class="button_bar">
	<button class="common_button" onclick="help('');">帮助</button>
	
	<button class="common_button" onclick="back();">返回</button>
	<button class="common_button" onclick="to('losttoDelay?lostid=<s:property value="#request.custlost.lostid"/>');">暂缓流失</button>
	<button class="common_button" onclick="update()">保存</button>
</div>
<s:form method="post">
<table class="query_form_table">
	<tr>
		<th>编号</th>
		<td><s:property value="#request.custlost.lostno"/></td>
		<th>客户</th>
		<td><s:property value="#request.custlost.lostname"/></td>
	</tr>
	<tr>
		<th>客户经理</th>
		<td><s:property value="#request.custlost.lostmanager"/></td>
		<th>上次下单时间</th>
		<td>
			<s:date format="yyyy年MM月dd日" name="#request.custlost.lastorderdate"/>
		</td>
	</tr>
	<tr>
		<th>暂缓措施</th>
		<td colspan="3"><s:property value="#request.custlost.delay"/></td>
	</tr>	
	<tr>
		<th>流失原因</th>
		<td colspan="3"><s:textarea id="reason" name="reason" cols="50" rows="6"></s:textarea><span class="red_star">*</span></td>
	</tr>
	<s:hidden name="lostid" value="%{#request.custlost.lostid}"/>
	<s:hidden name="lostno" value="%{#request.custlost.lostno}"/>
	<s:hidden name="lostname" value="%{#request.custlost.lostname}"/>
	<s:hidden name="lostmanager" value="%{#request.custlost.lostmanager}"/>
	<s:hidden name="lastorderdate" value="%{#request.custlost.lastorderdate}"/>
	<s:hidden name="delay" value="%{#request.custlost.delay}"/>
	<s:hidden name="lostdate" value="%{#request.custlost.lostdate}"/>
	<s:hidden name="status" value="%{#request.custlost.status}"/>
</table>

</s:form>
<br />
</body>

</html>