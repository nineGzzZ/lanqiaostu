<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2024/9/27
  Time: 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <link rel="stylesheet" href="static/css/bootstrap.min.css" />
  <script type="text/javascript" src="static/js/jquery-1.8.2.min.js"></script>
  <!-- 提示框 -->
  <script type="text/javascript" src="static/js/tooltips.js"></script>
  <!-- 提示框 -->

  <title>管理区域</title>
  <style type="text/css">
    .box {
      width: 60%;
      margin: 50px auto;
      padding: 20px;
      padding-left: 50px;
      border: 1px #ccc dashed;
    }
    .background-head{
      background-image: url(images/-1.jpg);
      background-attachment: fixed;
      background-repeat: no-repeat;
      background-size: 100%;
      height:210px;
      width:250px
    }
  </style>
</head>

<body>
<!-- 访问路径导航 -->
<nav class="navbar navbar-default" role="navigation">
  <div class="container-fluid">
    <div class="navbar-header">
			<span class="navbar-brand">
				<a href="#">班级管理</a>&nbsp;>>&nbsp;
				<a href="#">班级信息管理</a>&nbsp;>>&nbsp;
				<a href="#">修改班级</a>
			</span>
    </div>
  </div>

</nav>

<div class="box">
  <form id="uploadForm" action="clazz?method=update" method="post" role="form">
    <div class="form-group">
      <label for="user_id" class="col-sm-2 control-label">班级ID:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control"  id="class_id" disabled="disabled" value="${class_id}" />
        <input type="hidden" name="class_id" value="${class_id}" />
      </div>
    </div>
    <div class="form-group">
      <label for="user_id" class="col-sm-2 control-label">班级名称:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" name="class_name"
               id="class_name" value="${class_name} "/>
      </div>
    </div>
    <div class="form-group">
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-primary"
                onclick=" return regVertify();">修&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;改</button>
        <button type="button" class="btn btn-warning"
                onclick=" return cancel();">返&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;回</button>
      </div>
    </div>
  </form>
</div>


<script type="text/javascript">

  function cancel(){
    window.history.go(-1);
  }

</script>

</body>
</html>

