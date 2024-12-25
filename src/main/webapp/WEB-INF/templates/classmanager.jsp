<%@ page import="com.example.lanqiao_stu_2.dao.ClassDao" %>
<%@ page import="com.example.lanqiao_stu_2.entity.ClassInfo" %>
<%@ page import="java.util.List" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>班级信息管理</title>
    <link rel="stylesheet" href="static/css/bootstrap.min.css" />
    <script type="text/javascript" src="static/js/jquery-1.8.2.min.js"></script>
    <!-- 提示框 -->
    <script type="text/javascript" src="static/js/tooltips.js"></script>
    <!-- 提示框 -->

</head>

<body>

<!-- 访问路径导航 -->
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
			<span class="navbar-brand">
				<a href="#">班级管理</a>&nbsp;>>&nbsp;
				<a href="#">班级信息管理</a>
			</span>
        </div>
    </div>

</nav>

<nav class="navbar navbar-default" role="navigation" style="margin-left: 60px;margin-right: 60px; margin-top:10px" >
    <div class="container-fluid">
        <div class="navbar-header">
            <span class="navbar-brand">添加</span>
        </div>
        <div>
            <form class="navbar-form navbar-left" role="search" method="post" action="clazz?method=add">

                <input type="text" class="form-control" placeholder="请输入班级名称" name="class_name" />
                <button type="submit" class="btn btn-default" onclick="return regVertify();">添加班级</button>
            </form>
        </div>

    </div>
</nav>

<div id="content" style="margin-left: 60px;margin-right: 60px">
    <span>共有 <b>99</b> 条记录</span>
    <table border="1" cellspacing="0" cellpadding="0" class="table table-striped table-hover table-bordered">
        <tr id="theTableTitle">
            <th>班级ID</th>
            <th>班级名称</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${classinfolist}" var="classinfolist">
        <tr>
            <td>${classinfolist.class_id}</td>
            <td>${classinfolist.class_name}</td>
            <td>
                <a href="clazz?method=delete&class_id=${classinfolist.getClass_id()}" >[删除]</a>
                <a href="clazz?method=toupdate&class_id=${classinfolist.getClass_id()}&class_name=${classinfolist.getClass_name()}">[修改]</a>
            </td>
        </tr>
        </c:forEach>


    </table>
</div>
</body>
</html>