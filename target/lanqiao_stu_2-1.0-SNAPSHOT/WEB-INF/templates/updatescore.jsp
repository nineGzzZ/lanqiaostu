<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2024/9/27
  Time: 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="static/css/bootstrap.min.css" />
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>

    <!-- 提示框 -->
    <script type="text/javascript" src="static/js/tooltips.js"></script>
    <!-- 提示框 -->

    <title>管理区域</title>
    <style type="text/css">
        .box {
            width: 44%;
            margin: 50px auto;
            padding: 20px;
            padding-left: 50px;
            border: 1px #ccc dashed;
        }
    </style>


</head>

<body>
<!-- 访问路径导航 -->
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
			<span class="navbar-brand">
				<a href="#">积分管理</a>&nbsp;>>&nbsp;
				<a href="#">XXXXXXX</a>
			</span>
        </div>
    </div>

</nav>

<div class="box" style="width: 60%">
    <form action="score?method=update"method="post" class="form-horizontal" role="form">
        <c:forEach items="${score}" var="score">
        <div class="form-group">
            <label for="question" class="col-sm-2 control-label">类型：</label>
            <div class="col-sm-10">
                <select name="score_type" class="textinput" id="type_id" style="width: 180px; height: 30px">
                    <option value="1" ${score.score_type == 1 ? 'selected="selected"' : ''}>纪律考核分</option>
                    <option value="2" ${score.score_type == 2 ? 'selected="selected"' : ''}>技术考核分</option>
                    <option value="3" ${score.score_type == 3 ? 'selected="selected"' : ''}>职业技能考核分</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="user_id" class="col-sm-2 control-label">日期:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="datepicker" name="time" value="${score.time}" />
                <input type="hidden" name="score_id" value="${score.score_id}">
            </div>
        </div>
        <div class="form-group">
            <label for="question" class="col-sm-2 control-label">姓名：</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="stu_name" disabled="disabled"
                       id="stu_name" value="${score.stu_name}" />
            </div>
        </div>
        <div class="form-group">
            <label for="email" class="col-sm-2 control-label">描述:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="score_contents" id="score_contents" value="${score.score_contents}" />
            </div>
        </div>
        <div class="form-group">
            <label for="email" class="col-sm-2 control-label">分值:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="score_value" id="score_value" value="${score.score_value}" />
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary" id="btnUpdate">修&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;改</button>
                <button type="button" class="btn btn-warning"
                        onclick=" return cancel();">返&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;回</button>
            </div>
        </div>
        </c:forEach>
    </form>
</div>

<script src="MyUtil.js"></script>

<script type="text/javascript">
    function cancel(){
        window.history.go(-1);
    }


    ///加载学员列表///
    loadStuList();


    /////显示下拉列表框中所对应的value值的id////
    //$("#stu_id").val(学生id);
    //$("#type_id").val(积分类型id);


    $("#btnUpdate").click(function(){
        update();
    });


    /**
     * 加载积分详情
     * @param {Object} scId
     */
    function loadScoreInfo(scId){

        var 请求参数 = {
            sc_id:scId
        };
        $.get("http://localhost:8080/LanqiaoStudentSystem_API_war_exploded/score?method=selectById",请求参数,function(data){
            console.log(data);

            //日期
            $("#datepicker").val(data.time);

            //积分描述
            $("#score_contents").val(data.score_contents);

            //积分值
            if (data.score_value>0) {
                $("#score_value").val("+"+data.score_value);
            } else{
                $("#score_value").val(data.score_value);
            }

            //学生ID的显示
            $("#stu_id").val(data.stu_id);

            //积分类型的显示
            $("#type_id").val(data.score_type);


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

            htmlStr += "<option value='' selected='selected'>--请选择姓名--</option>";
            for (var i=0;i<data.length;i++) {
                htmlStr += "<option value='"+data[i].stu_id+"'>"+data[i].stu_name+"</option>";
            }

            /////筛选---->>>  学员列表////
            $("#stu_id").html(htmlStr);


            /////////////////////////////////////////////////////
            //////////////////加载完学员列表后，再加载积分详情///////
            /////////////////////////////////////////////////////
            var score_id = getUrlParam("abc");
            console.log("score_id is "+score_id);
            ////调用积分详情/////
            loadScoreInfo(score_id);


        });
    }


    /**
     * 修改积分数据
     */
    function update(){
        ///获取表单元素的val值
        var type_id = $("#type_id").val();
        var time = $("#datepicker").val();
        var stu_id = $("#stu_id").val();
        var score_contents = $("#score_contents").val();
        var score_value = $("#score_value").val();





    }


</script>



</body>
</html>
