package com.example.lanqiao_stu_2.countroller;

import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.CircleCaptcha;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


    @WebServlet("/captcha")
    public class CaptchaController extends HttpServlet {

        @Override
        protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            response.setContentType("image/png");
            response.setHeader("Cache-Control", "no-store"); // 禁止缓存
            response.setHeader("Pragma", "no-cache");         // 禁止缓存
            response.setDateHeader("Expires", 0);              // 设置过期时间
            //定义图形验证码的长、宽、验证码字符数、干扰元素个数
            CircleCaptcha captcha = CaptchaUtil.createCircleCaptcha(450, 100, 4, 20);
            //图形验证码写出，可以写出到文件流，也可以写出到响应流
            captcha.write(response.getOutputStream());
            //将验证码对象存储在 session 中
            request.getSession().setAttribute("captcha", captcha);
        }

    }

