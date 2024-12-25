package com.example.lanqiao_stu_2.countroller;

import cn.hutool.captcha.CircleCaptcha;
import com.example.lanqiao_stu_2.dao.UserDao;
import com.example.lanqiao_stu_2.entity.UserInfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(value = "/user")
public class UserCountroller extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String method = req.getParameter("method");
        if (method.equals("tologin")){
            tologin(req,resp);
        }else if (method.equals("login")) {
            login(req, resp);
        }else if (method.equals("exit")) {
            exit(req, resp);
        }

    }

    public void tologin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/templates/login.jsp").forward(req,resp);

    }
    public void exit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //删除session
        req.getSession().invalidate();


        //删除session
        // 创建一个与要删除的Cookie同名的Cookie
            Cookie cookie = new Cookie("user_id", ""); // 值设为空
        // 设置其最大生存时间为0，表示删除
            cookie.setMaxAge(0);
        // 设置路径，通常与原来路径一致
            cookie.setPath("/");
        // 将删除命令发送给客户端
            resp.addCookie(cookie);
        resp.getWriter().println("<script>alert('注销成功'); window.location.href='user?method=tologin';</script>");
    }

    public void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException  {
        String user_email = req.getParameter("user_email");
        String user_pwd = req.getParameter("user_pwd");
        UserDao userDao = new UserDao();
        List<UserInfo> login = userDao.login(user_email, user_pwd);

        // 获取用户输入的验证码
        String userCaptcha = req.getParameter("code");

        // 获取 session 中存储的验证码
        CircleCaptcha sessionCaptcha = (CircleCaptcha)req.getSession().getAttribute("captcha");


        if (sessionCaptcha.verify(userCaptcha)) {
            if (login!=null  && !login.isEmpty()){
                //存session
                req.getSession().setAttribute("user", login.get(0));
                resp.getWriter().println("<script>alert('登录成功'); window.location.href='index';</script>");

                //存cookie
                Cookie cookie = new Cookie("user_id",""+login.get(0).getUser_id());
                // 设置Cookie的最大存活时间（单位为秒），例如设置为1小时
                cookie.setMaxAge(60 * 60);
                // 设置Cookie的路径，通常设置为"/"表示整个网站都能访问该Cookie
                cookie.setPath("/");
                // 将Cookie发送到客户端浏览器
                resp.addCookie(cookie);

            }else {
                resp.getWriter().println("<script>alert('邮箱或密码错误');  window.location.href='user?method=tologin';</script>");
            }

        } else {
        }
            resp.getWriter().println("<script>alert('验证码错误，请重新输入！');  window.location.href='user?method=tologin';</script>");
        }




}
