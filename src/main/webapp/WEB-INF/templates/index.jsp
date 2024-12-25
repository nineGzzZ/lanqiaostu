<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>蓝桥学员管理系统</title>
<link rel="stylesheet" type="text/css" href="static/css/style.css" />
<script type="text/javascript" src="static/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="static/js/index.js"></script>

<script type="text/javascript">
	function setRightContents(url){
		document.getElementById('rightContents').src=url;
	}

</script>
</head>

<body>
<%
	//config
	//out
	//page
	//pageContext


	//request
	//response
	//session
	//application


	//exception
%>
<div class="nav-top">
	<span>蓝桥学员管理系统</span>
    <div class="nav-topright">
        <span>您好：${sessionScope.user.user_name}</span>
        <span><a href="user?method=exit" style="color: #FFFFFF">注销</a></span>
    </div>
</div>

<div class="nav-down">

    <div class="leftmenu2">
    	<div class="menu-oc1"></div>
        <ul>
        		<li>
		            <a class="j_a_list j_a_list1"></a>
		               <div class="j_menu_list j_menu_list_first">
		                <span class="sp1"><i></i>学员管理</span>
		                   <a class="j_lista_first" href="javascript:setRightContents('stu?method=select')">学员信息管理</a>
		               </div>
		        </li>
		        <li>
		            <a class="j_a_list j_a_list2"></a>
		               <div class="j_menu_list">
		                <span class="sp2"><i></i>积分管理</span>
		                   <a href="javascript:setRightContents('score?method=select')">积分信息管理</a>
		               </div>
		        </li>
<%--		        <li>--%>
<%--		            <a class="j_a_list j_a_list3"></a>--%>
<%--		               <div class="j_menu_list">--%>
<%--		                <span class="sp3"><i></i>考勤管理</span>--%>
<%--		                   <a href="javascript:setRightContents('checkingmanager.html')">打卡记录管理</a>--%>
<%--		              </div>--%>
<%--		        </li>--%>
<%--		        <li>--%>
<%--		            <a class="j_a_list j_a_list4"></a>--%>
<%--		              <div class="j_menu_list">--%>
<%--		                <span class="sp4"><i></i>权限管理</span>--%>
<%--		                   <a href="javascript:setRightContents('usermanager.html')">用户列表管理</a>--%>
<%--		                   <a href="javascript:setRightContents('rolemanager.html')">角色列表管理</a>--%>
<%--		                   <a href="javascript:setRightContents('permissionmanager.html')">权限列表管理</a>--%>
<%--		              </div>--%>
<%--		        </li>--%>
		        <li>
		            <a class="j_a_list j_a_list5"></a>
		              <div class="j_menu_list">
		                <span class="sp5"><i></i>班级管理</span>
		                   <a href="javascript:setRightContents('clazz?method=select')">班级信息管理</a>
		              </div>
		        </li>
        </ul>

    </div>

    <div class="rightcon">
    	<div class="right_con" style="width:100%;height: 1200px">
        	<iframe src="stu?method=select" frameBorder="0" scrolling="no" width="100%" height="100%" id="rightContents">
			</iframe>
        </div>
    </div>
</div>


</body>
</html>