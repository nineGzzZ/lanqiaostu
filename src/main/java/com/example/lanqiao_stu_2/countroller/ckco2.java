package com.example.lanqiao_stu_2.countroller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ckco2")
public class ckco2 extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       // 获取所有Cookies
        Cookie[] cookies = req.getCookies();
        String user_id= null;
        // 如果有Cookies
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("user_id".equals(cookie.getName())) {
                    // 获取名为 "user_id" 的 Cookie 的值
                    user_id = cookie.getValue();
                    System.out.println("用户ID: " + user_id);
                }
            }
        }
    }
}
