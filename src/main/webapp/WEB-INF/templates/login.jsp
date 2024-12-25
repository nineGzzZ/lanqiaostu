<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2024/9/27
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" class="no-js">

<head>
    <meta charset="utf-8">
    <title>蓝桥学员管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- CSS -->
    <link rel="stylesheet" href="static/css/supersized.css">
    <link rel="stylesheet" href="static/css/login.css">
    <link href="static/css/bootstrap.min.css" rel="stylesheet">

    <!-- JS -->
    <script src="static/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="static/js/jquery.form.js"></script>

    <script type="text/javascript" src="static/js/jquery-1.8.2.min.js"></script>

</head>

<body>

<div class="page-container">
    <div class="main_box">
        <div class="login_box">
            <div class="login_logo">
                <h1>蓝桥学员管理系统</h1>
            </div>


            <!-- 超级管理员登录 -->
            <div class="login_form" id="normalLogin">
                <form action="user?method=login" id="login_form" method="post">

                    <div class="form-group">
                        <label for="j_username" class="t">邮　箱：</label>
                        <input id="email" value="" name="user_email" type="text" class="form-control x319 in"
                               autocomplete="off">

                    </div>
                    <div class="form-group">
                        <label for="j_password" class="t">密　码：</label>
                        <input id="password" value="" name="user_pwd" type="password"
                               class="password form-control x319 in" />
                    </div>
                    <div class="form-group">
                        <label for="j_captcha" class="t">验证码：</label>
                        <input id="j_captcha" name="code" type="text" class="form-control x164 in" />
                        <img src="captcha" alt="验证码" id="captchaImage">

                    </div>
                    <div class="form-group">
                        <label class="t"></label>
                        <label for="j_remember" class="m">
                            <input id="j_remember" type="checkbox" value="true">&nbsp;记住登陆状态</label>
                    </div>
                    <div class="form-group space">
                        <label class="t"></label>　　
                        <button type="submit"  id="submit_btn" class="btn btn-primary btn-lg">&nbsp;登&nbsp;录&nbsp </button>
                        <input type="reset" value="&nbsp;重&nbsp;置&nbsp;" class="btn btn-default btn-lg">
                    </div>

                </form>

            </div>


        </div>

    </div>
</div>

<script src="static/js/supersized.3.2.7.min.js"></script>
<script src="static/js/supersized-init.js"></script>
<script src="static/js/scripts.js"></script>


</body>
</html>
