package com.example.lanqiao_stu_2.countroller;

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

@WebServlet("/index")
public class indexController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession().getAttribute("user")==null){

            Cookie[] cookies = req.getCookies();
            String user_id = null;
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if ("user_id".equals(cookie.getName())) {
                        // 获取名为 "user_id" 的 Cookie 的值
                        user_id = cookie.getValue();
                        System.out.println("用户ID: " + user_id);
                        break;
                    }
                }
            }
            //没有session就判断是否有cookie
            if(user_id != null){
                UserDao userDao = new UserDao();
                List<UserInfo> cookie = userDao.cookie_select(user_id);
                req.getSession().setAttribute("user",cookie.get(0));
                req.getRequestDispatcher("/WEB-INF/templates/index.jsp").forward(req, resp);
            }else {
                resp.getWriter().println("<script>location.href='user?method=tologin';</script>");
            }
        } else {
            req.getRequestDispatcher("/WEB-INF/templates/index.jsp").forward(req,resp);
        }
    }
}
