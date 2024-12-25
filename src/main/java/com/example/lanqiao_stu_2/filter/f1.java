package com.example.lanqiao_stu_2.filter;

import com.example.lanqiao_stu_2.dao.UserDao;
import com.example.lanqiao_stu_2.entity.UserInfo;

import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

//@WebFilter("/*")
public class f1 implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;

        if (req.getRequestURI().endsWith("/user")){
            filterChain.doFilter(servletRequest,servletResponse);
            return;
        }

        if (req.getSession().getAttribute("user")==null){
            resp.setContentType("text/html;charset=UTF-8");
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
                filterChain.doFilter(servletRequest,servletResponse);
            }
        } else {
            filterChain.doFilter(servletRequest,servletResponse);
        }

    }

    @Override
    public void destroy() {

    }
}
