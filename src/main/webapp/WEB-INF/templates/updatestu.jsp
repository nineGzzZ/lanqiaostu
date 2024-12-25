<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2024/9/27
  Time: 10:22
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				<a href="#">学员管理</a>&nbsp;>>&nbsp;
				<a href="#">XXXXXXX</a>
			</span>
        </div>
    </div>

</nav>

<div class="box">
    <div id="headImg" class="box"
         style="background:url(images/-1.jpg);width:210px;height:250px;
	background-repeat:no-repeat;background-size:210px 250px;">
    </div>
    <form id="uploadForm" action="stu?method=update" class="form-horizontal"method="post" role="form" >
        <c:forEach items="${stu}" var="stu">
        <div class="form-group">
            <label for="bookLogo" class="col-sm-2 control-label">头像:</label>
            <div class="col-sm-10">
                <input type="file" class="form-control" name="stu_head"
                       id="stu_head" placeholder="${stu.stu_head}" />
                <input type="hidden" name="stu_id" value="${stu.stu_id}">
            </div>
        </div>
        <div class="form-group">
            <label for="user_id" class="col-sm-2 control-label">所属班级:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="class_name" disabled="disabled" value="${stu.class_name}" />
            </div>
        </div>
        <div class="form-group">
            <label for="user_id" class="col-sm-2 control-label">学号:</label>
            <div class="col-sm-10">

                <input type="text" class="form-control" name="stu_no"
                       id="stu_no" disabled="disabled" value="${stu.stu_no}" />

            </div>
        </div>
        <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">姓名:</label>
            <div class="col-sm-10">

                <input type="text" class="form-control" name="stu_name"
                       id="stu_name" value="${stu.stu_name}" />

            </div>
        </div>
        <div class="form-group">
            <label for="sex" class="col-sm-2 control-label">性别:</label>
            <div class="col-sm-10">
                <input type="radio" name="stu_sex" id="stu_sex_man" value="男" ${stu.stu_sex eq '男' ? 'checked' : ''} />男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="stu_sex" id="stu_sex_women" value="女" ${stu.stu_sex eq '女' ? 'checked' : ''} />女
            </div>
        </div>

        <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">年龄:</label>
            <div class="col-sm-10">

                <input type="text" class="form-control" name="stu_age"
                       id="stu_age" value="${stu.stu_age}" />

            </div>
        </div>
        <div class="form-group">
            <label for="tel" class="col-sm-2 control-label">电话:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="stu_phone" id=""
                       value="${stu.stu_phone}" />
            </div>
        </div>
        <div class="form-group">
            <label for="address" class="col-sm-2 control-label">学校:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="stu_school" id="stu_school"
                       value="${stu.stu_school}" />
            </div>
        </div>
        <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">专业:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="stu_profession"
                       id="stu_profession" value="${stu.stu_profession}" />
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
    /**
     * 当前页面，强制要求传一个学生id过来【参数名叫abc】
     */


    //加载学员信息
    loadStuInfo();

    //获取参数stu_id的值
    //var stu_id = getUrlParam("abc");
    //console.log(stu_id)


    /**
     * 修改按钮的点击事件
     */
    $("#btnUpdate").click(function(){
        update();
    });




    function cancel(){
        window.history.go(-1);
    }




    /**
     * 【定义一个方法】
     * 加载学员信息
     */
    function loadStuInfo(){

        //获取参数stu_id的值
        var stu_id = getUrlParam("abc");
        ///////////////////////////////////////

        var 请求参数 = {
            id:stu_id
        };


        //http://localhost:8080/LanqiaoStudentSystem_API_war_exploded/stu_select_id?id=97
        $.get("http://localhost:8080/LanqiaoStudentSystem_API_war_exploded/stu?method=selectById",请求参数,function(data){
            console.log(data);

            ////显示信息//////
            $("#stu_no").val(data.stu_no);					//学号
            $("#class_name").val(data.class_name);			//班级名称
            $("#stu_name").val(data.stu_name);				//姓名
            $("#stu_icno").val(data.stu_icno);				//身份证
            $("#stu_phone").val(data.stu_phone);			//电话
            $("#stu_birth").val(data.stu_birth);			//生日
            $("#stu_qq").val(data.stu_qq);					//QQ
            $("#stu_school").val(data.stu_school);			//学校

            ///“学历”的显示
            ///////下拉列表框的value值等于哪一个option选项，就会自动让其选中////
            $("#stu_edu").val(data.stu_edu);				//学历
            //$("#stu_edu").val("本科");


            ///“性别”的显示
            //data.stu_sex
            if(data.stu_sex=="男"){
                //让“男”选中
                $("#stu_sex_man").prop("checked",true);
                //让“女”不选中
                $("#stu_sex_women").prop("checked",false);
            }else{
                //让“男”不选中
                $("#stu_sex_man").prop("checked",false);
                //让“女”选中
                $("#stu_sex_women").prop("checked",true);
            }


            //显示头像
            var headImgUrl = "http://localhost:8080/LanqiaoStudentSystem_API_war_exploded/Upload/"+data.stu_img;
            $("#headImg").prop("style","background:url("+headImgUrl+");width:210px;height:250px;background-repeat:no-repeat;background-size:210px 250px;");


        });

    }



    /**
     * 【定义一个方法】
     * 修改学员信息
     */
    function update(){

        //获取参数stu_id的值
        ////////getUrlParam("参数名");/////
        var stu_id = getUrlParam("abc");

        //http://localhost:8080/LanqiaoStudentSystem_API_war_exploded/stu_update?stu_no=666&stu_name=%E5%88%98%E9%95%87&stu_sex=%E7%94%B7&stu_img=&stu_phone=110&stu_icno=xxx&stu_birth=111&stu_qq=111&class_id=13&stu_edu=%E5%A4%A7%E4%B8%93&stu_school=%E5%8D%8E%E5%A4%8F&stu_id=6
        var params = {
            // stu_no:$("#stu_no").val(),
            // class_id:$("[name='class_id']").val(),
            // stu_img:"头像",
            stu_name:$("#stu_name").val(),
            stu_sex:$("[name='stu_sex']:checked").val(),
            stu_phone:$("#stu_phone").val(),
            stu_icno:$("#stu_icno").val(),
            stu_birth:$("#stu_birth").val(),
            stu_qq:$("#stu_qq").val(),
            stu_edu:$("[name='stu_edu']").val(),
            stu_school:$("#stu_school").val(),
            //////比添加功能多了一个stu_id/////
            stu_id:stu_id
        };

        $.get("http://localhost:8080/LanqiaoStudentSystem_API_war_exploded/stu_update",params,function(data){
            console.log(data);

            if(data.isOK){
                alert("修改成功");

                //跳转到“学生列表”页面
                //location.href = "要跳的地址页面";
                location.href = "stuinfomanager.html";

            }else{
                alert("修改失败");
            }

        });


    }





</script>

</body>
</html>
