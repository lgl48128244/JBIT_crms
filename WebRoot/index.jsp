<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>java学士后毕业设计项目</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>

<frameset rows="85,*,40" frameborder="NO"  framespacing="0"> 
 <frame name="topFrame"  scrolling="NO"  src="top.jsp"  marginwidth="value" marginheight="value" >
 <frame name="mainFrame" noresize  src="index-ec.jsp" marginwidth="value" marginheight="value" >
 <frame src="footer.html" name="top1Frame"  scrolling="NO" noresize  marginwidth="0" marginheight="0" >
</frameset>
<noframes><body bgcolor="#FFFFFF">
<s:debug></s:debug>
</body></noframes>

</html>
