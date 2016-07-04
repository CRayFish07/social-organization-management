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

	<link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css">

  </head>
  
  <body style="background: url(imgs/bg1.jpg)">
    <div class="jumbotron" style="opacity: 0.8">
    <div class="container text-center">
      <h2>欢迎进入社团管理系统</h2>
      <div class="input-group col-lg-3 pull-right">
	      <input type="text" class="form-control" placeholder="请输入社员姓名" id="nameForFind">
	      <span class="input-group-btn">
	        <button class="btn btn-default" type="button" id="findByName">查询</button>
	      </span>
	    </div>
    </div>
  </div>
  <div class="container">
		<div class="row">
			<div class="col-lg-3">
				<h1>社员信息</h1>
			</div>
			<div class="col-lg-4" id="select">
				<!-- Single button -->
				<div class="row">
					<div class="btn-group" style="margin-top: 20px">
					  <button id="myDropdown" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
					    全部<span class="caret"></span>
					  </button>
					  <ul class="dropdown-menu">
					    <li><p class="lead">全部</p></li>
					    <li><p class="lead">按性别筛选</p></li>
					    <li><p class="lead">按学院筛选</p></li>
					  </ul>
					</div>

					<div class="btn-group" style="margin-top: 20px" id="second-select">
					<!--
					  <button id="myDropdown" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
					    信息科学与工程<span class="caret"></span>
					  </button>
					  <ul class="dropdown-menu">
					    <li><a href="#active">信息科学与工程</a></li>
					    <li><a href="#active">新闻与传播</a></li>
					    <li><a href="#active">经济与贸易</a></li>
					  </ul>
					  -->
					</div>
				</div>
			</div>

			<div class="col-lg-3" style="margin-top: 20px">
			<div class="row">
				<button class="btn btn-default col-lg-7" id="order">按加入时间排序&nbsp;<span class="label label-info" id="orderLabel"></span></button>
				<button class="btn btn-default col-lg-2 col-lg-offset-2" data-toggle="modal" data-target="#myModal" style="height: 34px"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></button>
				</div>
			</div>

		</div>
		<div id="active">
			<table class='table'>
			<tr>
			<th><h3><span class='label label-success'>姓名</span></h3></th>
			<th><h3><span class='label label-success'>性别</span></h3></th>
			<th><h3><span class='label label-success'>联系电话</span></h3></th>
			<th><h3><span class='label label-success'>学院</span></h3></th>
			<th><h3><span class='label label-success'>加入时间</span></h3></th>
			</tr>
<!--  
			<tr>
			<td style='font-size: large' class='bg-success'>柴方博</td>
			<td style='font-size: large' class='bg-info'>男</td>
			<td style='font-size: large' class='bg-warning'>13290967808</td>
			<td style='font-size: large' class='bg-danger'>信息科学与工程</td>
			<td style='font-size: large' class='bg-success'>2013-01-23</td>

			<td style='font-size: large'><button class='btn btn-warning btn-block' data-toggle="modal" data-target="#myModal1">更改</button></td>
			<td style='font-size: large'><button class='btn btn-danger btn-block'>删除</button></td>
			</tr>
			-->
			</table>
		</div>

  </div>
  

  <!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">新增社员信息&nbsp;&nbsp;&nbsp;<small style="color: red"></small></h4>
	      </div>
	      <div class="modal-body">
	        <div class="container-fluid text-center">
	        	<form>
						  <div class="form-group">
						    <label for="name">姓名</label>
						    <input type="text" class="form-control" id="name" placeholder="真实姓名">
						  </div>
						  <div class="form-group">
						  	<label>性别</label><br>
						    <label class="radio-inline">
								  <input type="radio" name="sex" value="男"> 男
								</label>
								<label class="radio-inline">
								  <input type="radio" name="sex" value="女"> 女
								</label>
						  </div>
						  <div class="form-group">
						    <label for="tel">联系电话</label>
						    <input type="text" class="form-control" id="tel" placeholder="手机号">
						  </div>
						  <div class="form-group">
						  	<label>学院</label><br>
						    <label class="radio-inline">
								  <input type="radio" name="academyName" value="信息科学与工程"> 信息
								</label>
								<label class="radio-inline">
								  <input type="radio" name="academyName" value="新闻与传播"> 新传
								</label>
								<label class="radio-inline">
								  <input type="radio" name="academyName" value="经济与贸易"> 经贸
								</label>
								<label class="radio-inline">
								  <input type="radio" name="academyName" value="设计艺术"> 设艺
								</label>
								<label class="radio-inline">
								  <input type="radio" name="academyName" value="化学化工"> 化工
								</label>
						  </div>
						  <div class="form-group">
						    <label for="joinTime">加入时间</label>
						    <input type="date" class="form-control" id="joinTime">
						  </div>
						</form>
	        </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="addNewMemberBtn">提交</button>
	      </div>
	    </div>
	  </div>
	</div>

<!-- Modal -->
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">更改社员信息&nbsp;&nbsp;&nbsp;<small style="color: red"></small></h4>
      </div>
      <div class="modal-body">
        <div class="container-fluid text-center">
	        	<form>
						  <div class="form-group">
						    <label for="name1">姓名</label>
						    <input type="text" class="form-control" id="name1" disabled>
						  </div>
						  <div class="form-group">
						  	<label>性别</label><br>
						    <label class="radio-inline">
								  <input type="radio" name="sex1" value="男"> 男
								</label>
								<label class="radio-inline">
								  <input type="radio" name="sex1" value="女"> 女
								</label>
						  </div>
						  <div class="form-group">
						    <label for="tel1">联系电话</label>
						    <input type="text" class="form-control" id="tel1" placeholder="手机号">
						  </div>
						  <div class="form-group">
						  	<label>学院</label><br>
						    <label class="radio-inline">
								  <input type="radio" name="academyName1" value="信息科学与工程"> 信息
								</label>
								<label class="radio-inline">
								  <input type="radio" name="academyName1" value="新闻与传播"> 新传
								</label>
								<label class="radio-inline">
								  <input type="radio" name="academyName1" value="经济与贸易"> 经贸
								</label>
								<label class="radio-inline">
								  <input type="radio" name="academyName1" value="设计艺术"> 设艺
								</label>
								<label class="radio-inline">
								  <input type="radio" name="academyName1" value="化学化工"> 化工
								</label>
						  </div>
						  <div class="form-group">
						    <label for="joinTime">加入时间</label>
						    <input type="date" class="form-control" id="joinTime1">
						  </div>
						</form>
	        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消更改</button>
        <button type="button" class="btn btn-success" id="identUpdateInfo">确认提交</button>
      </div>
    </div>
  </div>
</div>
    
    <script type="text/javascript" src="js/jquery-2.2.4.min.js"></script>
    <script src="dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/crud.js"></script>
  </body>
</html>
