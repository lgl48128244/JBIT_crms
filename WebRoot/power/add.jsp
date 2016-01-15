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
<link href="./css/style.css" rel="stylesheet" type="text/css">
<script src="./script/common.js"></script>
<script type="text/javascript">
	function selectAll(){
		var all = document.getElementById("all");
		var roles = document.getElementsByName("roleDesc");
		for(var i=0;i<roles.length;i++){
			if(all.checked == true){
				roles[i].checked = true;
			}else{
				roles[i].checked = false;
			}
		}
	}
	function check(){//子复选框方法
	    var inp = document.getElementsByName("roleDesc");
	    var powerinp = document.getElementById("all");
	    for(var i=0;i<inp.length;i++){
		    if(inp[i].checked==false){
			     powerinp.checked=false;//子复选框有一个没选中，全选复选框就为false
			     break;
		    }
		    if(i==inp.length-1){//如果可以遍历到最后一个，说明子复选框全部选中
		     	powerinp.checked=true;//则给全选复选框赋值true
		    }
   		}
  	}
 	function sub(){
		var no = document.getElementById("no").value;
		var roleName = document.getElementById("roleName").value;
		if("" == no){
			alert("编号不能为空");
			return;
		}else if("" == roleName){
			alert("角色名不能为空");
			return;
		}else if(confirm("您确定要保存数据？")){
			document.forms[0].submit();
		}
	}
</script>
</head>
<body>

<div class="page_title">角色管理&nbsp; &gt; 编辑角色</div>
<form method="post" action="roleadd">
<div class="button_bar">
	<button class="common_button" onclick="help('');">帮助</button>
	<button class="common_button" onclick="back();">返回</button>
	<button class="common_button" onclick="sub()">保存</button>

</div>
<table class="query_form_table">
	<tr>
		<th>编号</th>
		<td><input id="no" value=""/><span class="red_star">*</span></td>
		<th>角色名</th>
		<td><input id="roleName" name="roleName" value=""/><span class="red_star">*</span></td>
	</tr>
	<tr>
		<th>指定权限</th>
	</tr>
	<s:iterator id="power" value="#request.powerList">
	<tr>
		<td colspan="2">
		&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="powerdesc"/><input id="roleDesc" type="checkbox" name="roleDesc" value='<s:property value="url"/>' onclick="check()"/><br />
		</td>	
	</tr>
	</s:iterator>		
	<tr>
		<th>全选</th>
		<td colspan="2"><input type="checkbox" id="all" onclick="selectAll()"/></td>
	</tr>
	
</table>
</form>
</body>
</html>