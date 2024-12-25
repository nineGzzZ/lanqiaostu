<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2024/9/27
  Time: 10:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
<%--  enctype="multipart/form-data"  --%>
    <form id="uploadForm" action="stu?method=add" class="form-horizontal" role="form" method="post" enctype="multipart/form-data">

        <div class="form-group">
            <label for="user_id" class="col-sm-2 control-label">头像:</label>
            <div class="col-sm-10">
                <input type="file" class="form-control" name="stu_head"
                       id="stu_head" />
            </div>
        </div>
        <div class="form-group">
            <label for="user_id" class="col-sm-2 control-label">学号:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="stu_no"
                       id="stu_no" />
            </div>
        </div>
        <div class="form-group">
            <label for="user_id" class="col-sm-2 control-label">姓名:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="stu_name"
                       id="stu_name" />
            </div>
        </div>
        <div class="form-group">
            <label for="user_id" class="col-sm-2 control-label">年龄:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="stu_age"
                       id="stu_age" />
            </div>
        </div>
        <div class="form-group">
            <label for="stu_gender" class="col-sm-2 control-label">性别:</label>
            <div class="col-sm-10">
                <select class="form-control" name="stu_sex" id="stu_gender">
                    <option value="" disabled selected>--请选择性别--</option>
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="user_id" class="col-sm-2 control-label">学校:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="stu_school"
                       id="stu_school" />
            </div>
        </div>
        <div class="form-group">
            <label for="user_id" class="col-sm-2 control-label">电话:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="stu_phone"
                       id="stu_phone" />
            </div>
        </div>
        <div class="form-group">
            <label for="user_id" class="col-sm-2 control-label">班级id:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="class_id"
                       id="class_id" />
            </div>
        </div>
        <div class="form-group">
            <label for="user_id" class="col-sm-2 control-label">专业名称:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="stu_profession"
                       id="stu_profession" />
            </div>
        </div>


        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary" id="btnAdd">添&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;加</button>
                <button type="button" class="btn btn-warning"
                        onclick=" return cancel();">返&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;回</button>
            </div>
        </div>

    </form>
</div>


<script type="text/javascript">
    /**
     * 写在方法体外部的代码，它是自动执行（进入页面时就会自动执行）
     */
    //调用加载班级列表的方法
    loadClassList();



    /**
     * 添加按钮的点击事件
     */
    $("#btnAdd").click(function(){

        //发起上传文件请求
        upload();

    });


    /**
     * 上传文件的请求
     */
    function upload(){
        //要传递的数据，打包在formData对象中///
        var formData = new FormData();
        formData.append("a1", $("#stu_head")[0].files[0]);



        $.ajax({
            url: 'http://localhost:8080/LanqiaoStudentSystem_API_war_exploded/upload',
            type: 'POST',
            data: formData,
            cache: false,
            async:false,
            processData: false,
            contentType: false
        }).done(function(msg) {
            //请求并响应成功，则会进入该done方法/////
            ////后端响应的数据就是msg///
            console.log(msg);

            //再发起添加学员信息的请求
            add(msg[0]);


        }).fail(function(res) {
            ////请求失败，则会进入该fail方法/////
        });
    }


    /**
     * 定义一个方法
     */
    function cancel(){
        window.history.go(-1);
    }



    /**
     * 【定义一个方法】
     * 加载班级列表
     */
    function loadClassList(){

        $.get("http://localhost:8080/LanqiaoStudentSystem_API_war_exploded/class_select",null,function(data){
            console.log(data);

            var htmlStr = "";

            for (var i=0;i<data.length;i++) {
                //htmlStr += "<option value='班级ID'>班级名称</option>";

                var obj = data[i];
                htmlStr += "<option value='"+obj.class_id+"'>"+obj.class_name+"</option>";
            }


            //显示班级列表数据
            $("[name='class_id']").html(htmlStr);

        });

    }



    /**
     * 【定义了一个方法】
     * 添加学员
     */
    function add(headImgStr){

        //$("[name='stu_sex']   选择name='stu_sex'的标签（总共有2个，男、女）
        //:checked				选择用户选中的那一项

        //stu_no=1001&stu_name=哈哈&stu_sex=男&stu_img=&stu_phone=13800138000&stu_icno=111111&stu_birth=111111111&stu_qq=xxxxxxx&class_id=13&stu_edu=大专&stu_school=华夏
        var params = {
            stu_no:$("#stu_no").val(),
            stu_name:$("#stu_name").val(),
            stu_sex:$("[name='stu_sex']:checked").val(),
            stu_img:headImgStr,
            stu_phone:$("#stu_phone").val(),
            stu_icno:$("#stu_icno").val(),
            stu_birth:$("#datepicker").val(),
            stu_qq:$("#stu_qq").val(),
            class_id:$("[name='class_id']").val(),
            stu_edu:$("[name='stu_edu']").val(),
            stu_school:$("#stu_school").val()
        };

        $.get("http://localhost:8080/LanqiaoStudentSystem_API_war_exploded/stu?method=add",params,function(data){
            console.log(data);

            if(data.isOK){
                alert("添加成功");

                //跳转到“学生列表”页面
                //location.href = "要跳的地址页面";
                location.href = "stuinfomanager.html";

            }else{
                alert("添加失败");
            }

        });
    }




</script>

</body>
</html>
