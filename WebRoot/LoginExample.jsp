<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body> 
    <form action="checkLogin" method="post">
    	username:<input type="text" name="username" />
    	<br>
    	password:<input type="password" name="password" />
    	<br>
    	<input type="submit" value="提交" />
    </form>
    
    <div id="testdiv">
    	username:<input type="text" name="username" />
    	password:<input type="text" name="password" />
    	<button id="btn">点击</button>
    </div>
    
   
    <br>标签登录:
    <s:form action="checkLogin" method="post">
    <s:textfield name="username" label="username" />
    <s:password name="password" label="password" />
    <s:submit value="提交"/>
    </s:form>
    
    <script type="text/javascript" src="js/jquery-2.2.4.min.js"></script>
    <script type="text/javascript" src="js/test.js"></script>
    
  </body>
</html>
