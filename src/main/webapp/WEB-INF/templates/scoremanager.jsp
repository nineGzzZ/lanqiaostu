<%@ page import="com.example.lanqiao_stu_2.dao.ScoreDao" %>
<%@ page import="com.example.lanqiao_stu_2.entity.ScoreInfo" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.lanqiao_stu_2.dao.StuDao" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.example.lanqiao_stu_2.entity.StuInfo" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2024/9/27
  Time: 10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <link rel="stylesheet" href="static/css/bootstrap.min.css" />


  <!-- 提示框 -->
  <script type="text/javascript" src="static/js/tooltips.js"></script>
  <!-- 提示框 -->

  <title>积分信息管理</title>

  <script type="text/javascript">
    $(function() {
      $( "#datepicker" ).datepicker();
    });
    $(function() {
      $( "#datepicker2" ).datepicker();
    });

  </script>

</head>

<body>

<!-- 访问路径导航 -->
<nav class="navbar navbar-default" role="navigation">
  <div class="container-fluid">
    <div class="navbar-header">
			<span class="navbar-brand">
				<a href="#">积分管理</a>&nbsp;>>&nbsp;
				<a href="#">积分信息管理</a>
			</span>
    </div>
  </div>

</nav>

<nav class="navbar navbar-default" role="navigation" style="margin-left: 60px;margin-right: 60px; margin-top:10px">
  <div class="container-fluid">
    <div class="navbar-header">
      <span class="navbar-brand">筛选</span>
    </div>

    <div>
      <form class="navbar-form navbar-left" role="search" action="#" method="post" >
        <select class="form-control" name="type_id" id="type_id">
          <option value="" selected='selected'>--请选择类型--</option>
          <option value="1">纪律考核分</option>
          <option value="2">技术考核分</option>
          <option value="3">职业能力考核分</option>
        </select>
        <div class="form-group">
          <input type="text" id="datepicker" name="time" class="form-control" placeholder="请选择日期" value="" />
        </div>
        <select class="form-control" name="stu_id" id="stu_id">
          <option value="" selected="selected">--请选择姓名--</option>

          <c:forEach items="${select1}" var="stuInfo">
            <option value="${stuInfo.getStu_id()}">${stuInfo.getStu_name()}</option>

          </c:forEach>

        </select>
        <button type="button" id="btnSelect" class="btn btn-default">查询</button>
      </form>
    </div>

  </div>
</nav>


<nav class="navbar navbar-default" role="navigation" style="margin-left: 60px;margin-right: 60px">
  <div class="container-fluid">
    <div class="navbar-header">
      <span class="navbar-brand">添加</span>
    </div>
    <div>
      <form class="navbar-form navbar-left" role="search" action="score?method=add" method="post">
        <select class="form-control" name="score_type" id="score_type">
          <option value="">--请选择类型--</option>
          <option value="1">纪律考核分</option>
          <option value="2">技术考核分</option>
          <option value="3">职业能力考核分</option>
        </select>
        <div class="form-group">
          <input type="text" id="datepicker2" class="form-control" placeholder="请选择日期" name="time" id="time" />
        </div>
        <select class="form-control" name="stu_name" id="stu_name">
          <option value="" selected="selected">--请选择姓名--</option>
          <c:forEach items="${select1}" var="stuInfo">
            <option value="${stuInfo.stu_id},${stuInfo.class_id}" name="stu_name">${stuInfo.getStu_name()}</option>
          </c:forEach>
        </select>

        <input type="text" class="form-control" placeholder="请输入描述" name="score_contents" id="score_contents" />
        <input type="text" class="form-control" placeholder="请输入分值" name="score_value" id="score_value" />


        <button type="submit" class="btn btn-default" id="btnAdd">添加</button>
      </form>
    </div>
  </div>
</nav>

<div id="content" style="margin-left: 60px;margin-right: 60px">
  <span>共有 <b>99</b> 条记录</span>
  <table border="1" cellspacing="0" cellpadding="0" class="table table-striped table-hover table-bordered">
    <tr id="theTableTitle">
      <th>序号</th>
      <th>日期</th>
      <th>姓名</th>
      <th>描述</th>
      <th>分值</th>
      <th>操作</th>
    </tr>

    <tbody id="tableData">
<c:forEach items="${select}" var="scoreInfo">
    <tr>
      <td>${scoreInfo.score_id}</td>
      <td>${scoreInfo.time}</td>
      <td>${scoreInfo.stu_name}</td>
      <td>${scoreInfo.score_contents}</td>
      <td>${scoreInfo.score_value}</td>
      <td>
        <a href="score?method=delete&score_id=${scoreInfo.getScore_id()}">[删除]</a>
        <a href="score?method=toupdate&core_id=${scoreInfo.getScore_id()}">[修改]</a>
      </td>
    </tr>
</c:forEach>
    </tbody>

  </table>
</div>

<div class="footer" style="margin-left: 60px;margin-right: 60px">
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

  ///进入页面时，就要马上加载积分列表////
  loadScoreList("","","");
  ///进入页面时，就要马上加载学员列表////
  loadStuList();


  /**
   * 添加按钮的点击事件
   */
  $("#btnAdd").click(function(){
    addScore();

  });


  /**
   * 查询按钮的点击事件
   */
  $("#btnSelect").click(function(){

    //获取选择的积分类型
    var type_id = $("#type_id").val();

    //获取筛选的 日期
    var time = $("#datepicker").val();
    // if(time!=""){
    // var array = time.split("/");
    // ////      月/日/年      /////
    // ////      年-月-日      /////
    // time = array[2] + "-" + array[0] + "-" + array[1];
    // }


    //获取选择的学生ID
    var stu_id = $("#stu_id").val();
    ///////////////////////////////////



    ///加载积分列表////
    loadScoreList(type_id,time,stu_id);

  });



  /**
   * 加载积分列表
   * @param {Object} type_id	  积分类型ID
   * @param {Object} time	      日期
   * @param {Object} stu_id     学生ID
   */
  function loadScoreList(type_id,time,stu_id){

    var 请求参数 = {
      a1:type_id,
      a2:time,
      a3:stu_id
    };


    $.get("http://localhost:8080/LanqiaoStudentSystem_API_war_exploded/score?method=select",请求参数,function(data){
      console.log(data);

      /////将data的数据显示在表格内容中///
      var htmlStr = "";

      for (var i=0;i<data.length;i++) {

        htmlStr += "<tr>";
        htmlStr += "<td>"+data[i].type_value+"</td>";
        htmlStr += "<td>"+data[i].time+"</td>";
        htmlStr += "<td>"+data[i].stu_name+"</td>";
        htmlStr += "<td>"+data[i].score_contents+"</td>";

        if (data[i].score_value>0) {
          htmlStr += "<td>+"+data[i].score_value+"</td>";
        }else{
          htmlStr += "<td>"+data[i].score_value+"</td>";
        }
        htmlStr += "<td>";
        htmlStr += "<a href='#'>[删除]</a>";
        htmlStr += "<a href='updatescore.html?abc="+data[i].score_id+"'>[修改]</a>";

        htmlStr += "</td>";
        htmlStr += "</tr>";
      }

      $("#tableData").html(htmlStr);



    });

  }


  /**
   * 加载学员列表
   */
  function loadStuList(){
    $.get("http://localhost:8080/LanqiaoStudentSystem_API_war_exploded/stu?method=selectAll",null,function(data){
      console.log(data);

      /////将data的数据显示在表格内容中///
      var htmlStr = "";

      /*
      <select class="form-control" name="stu_id" id="stu_id">
        <option value="" selected="selected">--请选择姓名--</option>
        <option value="1">张全蛋</option>
        <option value="2">王尼玛</option>
        <option value="3">赵铁柱</option>
        <option value="4">芙蓉姐姐</option>
        <option value="5">凤姐</option>
      </select>
      */
      htmlStr += "<option value='' selected='selected'>--请选择姓名--</option>";
      for (var i=0;i<data.length;i++) {
        htmlStr += "<option value='"+data[i].stu_id+"'>"+data[i].stu_name+"</option>";
      }

      /////筛选---->>>  学员列表////
      $("#stu_id").html(htmlStr);
      /////添加---->>>  学员列表////
      $("#i_stu_id").html(htmlStr);

    });
  }



  /**
   * 添加积分
   */
  function addScore(){
    var type_id = $("#i_type_id").val();
    var time = $("#datepicker2").val();
    var stu_id = $("#i_stu_id").val();
    var score_contents = $("#i_score_contents").val();
    var score_value = $("#i_score_value").val();

    /////处理日期格式的转换/////
    var array = time.split("/");
    time = array[2] + "-" + array[0] + "-" + array[1];

    ////请求后端接口////
    var params = {
      score_type:type_id,
      stu_id:stu_id,
      score_value:score_value,
      score_contents:score_contents,
      time:time
    };


    show_loading();

    $.get("http://localhost:8080/LanqiaoStudentSystem_API_war_exploded/score?method=add",params,function(data){
      console.log(data);

      if(data.isOK){
        //alert("添加成功");
        //跳转到“学生列表”页面
        //location.href = "要跳的地址页面";
        //location.href = "scoremanager.html";

        show_msg("添加成功","scoremanager.html");

      }else{
        //alert("添加失败");
        show_err_msg("添加失败")
      }

    });

  }


</script>




</body>
</html>
