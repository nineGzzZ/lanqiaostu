package com.example.lanqiao_stu_2.countroller;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ckco1")
public class ckco1 extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 创建Cookie
        Cookie cookie = new Cookie("user_id", "1001");

        // 设置Cookie的最大存活时间（单位为秒），例如设置为1小时
        cookie.setMaxAge(60 * 60);

        // 设置Cookie的路径，通常设置为"/"表示整个网站都能访问该Cookie
        cookie.setPath("/");

        // 将Cookie发送到客户端浏览器
        resp.addCookie(cookie);

    }
}
