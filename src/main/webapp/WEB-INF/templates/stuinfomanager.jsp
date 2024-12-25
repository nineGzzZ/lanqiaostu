<%@ page import="com.example.lanqiao_stu_2.dao.StuDao" %>
<%@ page import="java.util.List" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.example.lanqiao_stu_2.entity.StuInfo" %><%--
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
  <title>学员信息管理</title>

  <!-- 导入CSS，没有CSS就没有网页效果 -->
  <link rel="stylesheet" href="static/css/bootstrap.min.css" />
  <!-- 导入JS文件，没有导入jQuery的js文件就不允许使用$符号 -->
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
				<a href="#">学员管理</a>&nbsp;>>&nbsp;
				<a href="#">学员信息管理</a>
			</span>
    </div>
  </div>

</nav>

<nav class="navbar navbar-default" role="navigation" style="margin-left: 60px;margin-right: 60px; margin-top:10px" >
  <div class="container-fluid">
    <div class="navbar-header">
      <span class="navbar-brand">筛选</span>
    </div>
    <div>
      <form class="navbar-form navbar-left" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="请输入姓名" name="stu_name" />
          <select class="form-control" name="stu_sex">
            <option value="" selected="selected">--请选择性别--</option>
            <option value="男" >男</option>
            <option value="女" >女</option>
          </select>
        </div>
        <!-- type="button"   普通按钮（不会有触发表单提交效果） -->
        <!-- type="submit"   提交按钮（会触发表单提交） -->
        <!-- type="reset"    重置按钮（重置表单中的元素内容） -->
        <button type="button" class="btn btn-default" id="btnSelect">查询</button>
      </form>
    </div>

  </div>
</nav>

<nav class="navbar navbar-default" role="navigation" style="margin-left: 60px;margin-right: 60px; margin-top:10px" >
  <div class="container-fluid">
    <div class="navbar-header">
      <span class="navbar-brand">添加</span>
    </div>
    <div>
      <form class="navbar-form navbar-left" role="search" method="post" action="stu?method=toadd">
        <button type="submit" class="btn btn-default">添加学员</button>
      </form>
    </div>

  </div>
</nav>

<div id="content" style="margin-left: 60px;margin-right: 60px">
  <span>共有 <b>99</b> 条记录</span>
  <table border="1" cellspacing="0" cellpadding="0" class="table table-striped table-hover table-bordered">
    <tr id="theTableTitle">
      <th>学号</th>
      <th>姓名</th>
      <th>性别</th>
      <th>电话</th>
      <th>所属班级</th>
      <th>操作</th>
    </tr>

    <tbody id="tableData">
    <c:forEach items="${select}" var="dao">
    <tr>
      <td>${dao.getStu_no()}</td>
      <td>${dao.getStu_name()}</td>
      <td>${dao.getStu_age()}</td>
      <td>${dao.getStu_phone()}</td>
      <td>${dao.getClass_name()}</td>
      <td>
        <a href="stu?method=delete&stu_id=${dao.getStu_id()}">[删除]</a>
        <a href="stu?method=toupdate&stu_id=${dao.getStu_id()}">[修改]</a>
      </td>
    </tr>
    </c:forEach>

  </table>
</div>
<div class="footer"  style="margin-left: 60px;margin-right: 60px">
  <ul class="pagination pagination myul">

    <li class='disabled'><a>&laquo;首页</a></li>
    <li class='disabled'><a>上一页</a></li>

    <li class='active'><a href='#'>1</a></li>
    <li class=''><a href='#'>2</a></li>
    <li class=''><a href='#'>3</a></li>
    <li class=''><a href='#'>4</a></li>
    <li class=''><a href='#'>5</a></li>
    <li class=''><a href='#'>6</a></li>
    <li class=''><a href='#'>7</a></li>
    <li class=''><a href='#'>8</a></li>
    <li class=''><a href='#'>9</a></li>

    <li class=''><a href='#'>下一页 </a></li>
    <li class=''><a href='#'>末页 </a></li>

  </ul>
</div>


<script>

  ///////////写在方法外面的代码，就会自动执行/////
  loadStuList("","");   //第一次加载页面时，加载全部学员数据


  ///点击“查询”按钮时
  $("#btnSelect").click(function(){

    var name =  $("[name='stu_name']").val();
    var sex =  $("[name='stu_sex']").val();

    loadStuList(name,sex);
  });


  /**
   * 加载学员列表
   * @param {Object} name
   * @param {Object} sex
   */
  function  loadStuList(name,sex){

    var 请求参数 = {
      a1:name,
      a2:sex
    };


    $.get("http://localhost:8080/LanqiaoStudentSystem_API_war_exploded/stu?method=select",请求参数,function(data){
      console.log(data);

      /////将data的数据显示在表格内容中///
      var htmlStr = "";

      for (var i=0;i<data.length;i++) {
        htmlStr += "<tr>";
        htmlStr += "<td>"+data[i].stu_no+"</td>";
        htmlStr += "<td>"+data[i].stu_name+"</td>";
        htmlStr += "<td>"+data[i].stu_sex+"</td>";
        htmlStr += "<td>"+data[i].stu_icno+"</td>";
        htmlStr += "<td>"+data[i].stu_phone+"</td>";
        htmlStr += "<td>"+data[i].stu_birth+"</td>";
        htmlStr += "<td>"+data[i].stu_qq+"</td>";
        htmlStr += "<td>"+data[i].class_name+"</td>";
        htmlStr += "<td>";
        htmlStr += "<a href='#'>[删除]</a>";

        //跳转到修改页面时，传递一个stu_id过去
        htmlStr += "<a href='updatestu.html?abc="+data[i].stu_id+"'>[修改]</a>";

        htmlStr += "</td>";
        htmlStr += "</tr>";
      }

      $("#tableData").html(htmlStr);



    });
  }



</script>

</body>
</html>
