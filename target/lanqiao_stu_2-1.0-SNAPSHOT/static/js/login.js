// JavaScript Document
//支持Enter键登录
		document.onkeydown = function(e){
			if($(".bac").length==0)
			{
				if(!e) e = window.event;
				if((e.keyCode || e.which) == 13){
					var obtnLogin=document.getElementById("submit_btn")
					obtnLogin.focus();
				}
			}
		}
		
		function changeCode(){
			//带参数是为了让src中的路径每次都变化，这样才能让刷新验证码（如果每次的路径都一样，就不会再去重新请求Servlet）
			document.getElementById('captcha_img').src="verifyServlet?d="+new Date().getTime();
		}


    	$(function(){
			
			//登录按钮的点击事件
			$('#submit_btn').click(function(){
				//显示等待进度条
				show_loading();
				
				var myReg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/; //邮件正则
				var emailStr=$('#email').val();
				var pwdStr=$('#password').val();
				var captchaStr=$('#j_captcha').val();
				
				
				if(emailStr == ''){
					show_err_msg('请输入邮箱！');	
					$('#email').focus();
				}else if(!myReg.test(emailStr)){
					show_err_msg('您的邮箱格式错咯！');
					$('#email').focus();
				}else if(pwdStr == ''){
					show_err_msg('请输入密码！');
					$('#password').focus();
				}
				// else if(captchaStr == ''){
				// 	show_err_msg('请输入验证码！');
				// 	$('#j_captcha').focus();
				// }
				else{
					
					// var j_remember="-1";
					// //判断是否选中“记住登录状态”
					// if($('#j_remember').is(':checked')) {
					// 	j_remember="1";
					// }
					
					var 请求参数 = {
						username:emailStr,
						pwd:pwdStr
					};
					
					//ajax请求servlet
					$.get("http://localhost:8080/LanqiaoStudentSystem_API_war_exploded/user?method=login",请求参数,function(response){
						console.log(response);
						if(response!=null){//登录成功
						
							//保存用户ID至浏览器（cookie 或  storage）
							setCookie("user_id",response.user_id, 60*24*7);
							
						
							//跳转到index.html页面
							show_msg('登录成功咯！正在为您跳转...','index.html');
							
							// alert('登录成功咯！正在为您跳转...');
							// location.href = "index.html";
							
						}else{//登录失败
							show_err_msg('帐号或密码错误！');
							
							//alert('帐号或密码错误！');
							
						}
					});
						
				}
			});
		});