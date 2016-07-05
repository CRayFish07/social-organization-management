<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Login</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  <link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css">
  </head>
  
  <body style="background-image: url(imgs/bg3.jpg)">
  <br><br><br><br><br><br><br><br>
  <div class="col-xs-4 col-xs-offset-5">
    <div class="form-group">
      <label for="username" style="color: #52A124">用户名</label>
        <div class="input-group">
            <input type="text" class="form-control" id="username" placeholder="Telephone Number" required="required">
            <div class="input-group-addon"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></div>
        </div>
    </div>
    <div class="form-group">
      <label for="password" style="color: #52A124">密码</label>
        <div class="input-group">
            <input type="password" class="form-control" id="password" placeholder="Password" required="required">
            <div class="input-group-addon"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span></div>
        </div>
    </div>
    <br>
    <input type="button" value="提交"  class="btn btn-default" name="btnSubmit" id="btnSubmit"/>&nbsp;&nbsp;&nbsp;<h3 style="color: #E3E5C0" id="warnMsg"></h3>
  </div>
    
    <script type="text/javascript" src="js/jquery-2.2.4.min.js"></script>
    <script type="text/javascript" src="js/login.js"></script>
  </body>
</html>
