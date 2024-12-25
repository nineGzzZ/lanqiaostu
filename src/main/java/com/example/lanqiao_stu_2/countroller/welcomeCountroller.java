package com.example.lanqiao_stu_2.countroller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/welcome")
public class welcomeCountroller extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String ID = req.getParameter("ID");
        int i= Integer.parseInt(ID);

        // 第一次访问网页时，"count"没有值，所以是null
        Integer count = (Integer)req.getServletContext().getAttribute("count");
        // 如果count是null，表明是第一次访问网页；否则说明不是第一次访问
        if(count ==  null)
        {
            // 如果是第一次访问，将count赋值为1
            count = 1;
        }else
        {
            // 如果不是第一次访问，则累加一次访问次数
            count = 1 + count;
        }
        //将访问次数的变量count保存在application的属性count中，供下次访问时获取并累加
        req.getServletContext().setAttribute("count",count);
        req.getRequestDispatcher("/WEB-INF/templates/welcome.jsp").forward(req,resp);
    }
}
