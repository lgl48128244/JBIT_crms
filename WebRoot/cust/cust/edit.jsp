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
<script src="<%=path %>/script/common.js"></script>
<script type="text/javascript">
	function update(){
		var telreg = /^\d{3,4}-?\d{7,8}$/;
		var chieftain = document.getElementById("chieftain").value;
		var tel = document.getElementById("tel").value;
		var addr = document.getElementById("addr").value;
		var credit = document.getElementById("credit").value;
		var satisfy = document.getElementById("satisfy").value;
		var levelLabel = document.getElementById("levelLabel").value;
		var custManager = document.getElementById("custManager").value;
		var region = document.getElementById("region").value;
		var name = document.getElementById("name").value;
		if("" == chieftain){
			alert("法人不能为空");
			return;
		}else if("" == name){
			alert("客户名称不能为空");
			return;
		}else if("" == addr){
			alert("地址不能为空");
			return;
		}else if("" == credit){
			alert("信用度不能为空");
			return;
		}else if(!telreg.test(tel)){
			alert("请输入正确的电话号码");
			return;
		}else if("" == satisfy){
			alert("满意度不能为空");
			return;
		}else if("" == levelLabel){
			alert("客户等级不能为空");
			return;
		}else if("" == custManager){
			alert("客户经理不能为空");
			return;
		}else if("" == region){
			alert("地区不能为空");
			return;
		}else if(confirm("您确定要保存数据吗？")){
			document.forms[0].action="custupdate";
			document.forms[0].submit();
		}
	}
	function load(){
		document.getElementById("region").value='${custInfo.region}';
		document.getElementById("levelLabel").value='${custInfo.levelLabel}';
		document.getElementById("satisfy").value='${custInfo.satisfy}';
		document.getElementById("credit").value='${custInfo.credit}';
	}
</script>
</head>
<body onload="load()">

<div class="page_title">客户信息管理 > 编辑客户信息</div>
<div class="button_bar">
	<button class="common_button" onclick="help('');">帮助</button>
	<button class="common_button" onclick="to('linkmanselectAll?id=<s:property value="#request.custInfo.id"/>');">联系人</button>
	<button class="common_button" onclick="to('activityselectAll?id=<s:property value="#request.custInfo.id"/>');">交往记录</button>
	<button class="common_button" onclick="to('ordersfirstPage?id=<s:property value="#request.custInfo.id"/>');">历史订单</button>
	
	<button class="common_button" onclick="back();">返回</button>
	<button class="common_button" onclick="update();">保存</button>
</div>
<form action="" method="post">
<table class="query_form_table">
	<tr>
		<th>客户编号</th>
		<td><s:property value="#request.custInfo.custno"/></td>
		<s:hidden name="custno" value="%{#request.custInfo.custno}" />
		<th>名称</th>
		<td><s:textfield id="name" name="name" value="%{#request.custInfo.name}"/><span class="red_star">*</span></td>
	</tr>
	<tr>
		<th>地区</th>
		<td>
		<s:select id="region" name="region" list="#request.regionList" headerKey="" headerValue="" listKey="dict_item" listValue="dict_item">
		</s:select><span class="red_star">*</span>
		</td>
		<th>客户经理</th>
		<td><s:textfield id="custManager" name="custManager" value="%{#request.custInfo.custManager}"/><span class="red_star">*</span>
		</td>
	</tr>	
	<tr>
		<th>客户等级</th>
		<td>
		<s:select id="levelLabel" name="levelLabel" list="#request.levelList" headerKey="" headerValue="" listKey="dict_item" listValue="dict_item">
		</s:select><span class="red_star">*</span>
		</td>
		<th>　</th>
		<td>　</td>
	</tr>
	<tr>
		<th>客户满意度</th>
		<td>
		<s:select id="satisfy" name="satisfy" list="#request.satisfyList" headerKey="" headerValue="" listKey="dict_item" listValue="dict_item">
		</s:select><span class="red_star">*</span>
		</td>
		<th>客户信用度</th>
		<td>
		<s:select id="credit" name="credit" list="#request.creditList" headerKey="" headerValue="" listKey="dict_item" listValue="dict_item">
		</s:select><span class="red_star">*</span>
		</td>
	</tr>
</table>
<br />
<table class="query_form_table" id="table1">
	<tr>
		<th>地址</th>
		<td><s:textfield id="addr" name="custAddr" value="%{#request.custInfo.custAddr}"/><span class="red_star">*</span>
		</td>
		<th>邮政编码</th>
		<td><s:textfield name="zip" value="%{#request.custInfo.zip}"/></td>
	</tr>
	<tr>
		<th>电话</th>
		<td>
			<s:textfield id="tel" name="tel" value="%{#request.custInfo.tel}"/><span class="red_star">*</span></td>
		<th>传真</th>
		<td><s:textfield name="fax" value="%{#request.custInfo.fax}"/></td>
	</tr>	
	<tr>
		<th>网址</th>
		<td>
			<s:textfield name="website" value="%{#request.custInfo.website}"/>
		</td>
		<th>　</th>
		<td>　</td>
	</tr>
</table>
<br />
<table class="query_form_table" id="table2">
	<tr>
		<th>营业执照注册号</th>
		<td><s:textfield name="licence" value="%{#request.custInfo.licence}"/></td>
		<th>法人</th>
		<td><s:textfield id="chieftain" name="chieftain" value="%{#request.custInfo.chieftain}"/><span class="red_star">*</span>
		</td>
	</tr>
	<tr>
		<th>注册资金（万元）</th>
		<td><s:textfield name="bankroll" value="%{#request.custInfo.bankroll}"/></td>
		<th>年营业额</th>
		<td>
			<s:textfield name="turnover" value="%{#request.custInfo.turnover}"/>
		</td>
	</tr>	
	<tr>
		<th>开户银行</th>
		<td>
			<s:textfield name="bank" value="%{#request.custInfo.bank}"/>
		</td>
		<th>银行帐号</th>
		<td><s:textfield name="account" value="%{#request.custInfo.account}"/></td>
	</tr>
	<tr>
		<th>地税登记号</th>
		<td>
			<s:textfield name="localTax" value="%{#request.custInfo.localTax}"/></td>
		<th>国税登记号</th>
		<td><s:textfield name="nationalTax" value="%{#request.custInfo.nationalTax}"/></td>
	</tr>
	<s:hidden name="status" value="0"></s:hidden>
	<s:hidden name="id" value="%{#request.custInfo.id}"></s:hidden>
</table>
</form>
</body>
</html>